import Foundation

extension Service {
    open class WindowCovering: Service {
        // Required Characteristics
        public let currentPosition: GenericCharacteristic<UInt8>
        public let positionState: GenericCharacteristic<Enums.PositionState>
        public let targetPosition: GenericCharacteristic<UInt8>

        // Optional Characteristics
        public let currentHorizontalTiltAngle: GenericCharacteristic<Int>?
        public let targetHorizontalTiltAngle: GenericCharacteristic<Int>?
        public let name: GenericCharacteristic<String>?
        public let obstructionDetected: GenericCharacteristic<Bool>?
        public let holdPosition: GenericCharacteristic<Bool?>?
        public let currentVerticalTiltAngle: GenericCharacteristic<Int>?
        public let targetVerticalTiltAngle: GenericCharacteristic<Int>?

        public init(characteristics: [AnyCharacteristic] = []) {
            var unwrapped = characteristics.map { $0.wrapped }
            currentPosition = getOrCreateAppend(
                type: .currentPosition,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.currentPosition() })
            positionState = getOrCreateAppend(
                type: .positionState,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.positionState() })
            targetPosition = getOrCreateAppend(
                type: .targetPosition,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.targetPosition() })
            currentHorizontalTiltAngle = get(type: .currentHorizontalTiltAngle, characteristics: unwrapped)
            targetHorizontalTiltAngle = get(type: .targetHorizontalTiltAngle, characteristics: unwrapped)
            name = get(type: .name, characteristics: unwrapped)
            obstructionDetected = get(type: .obstructionDetected, characteristics: unwrapped)
            holdPosition = get(type: .holdPosition, characteristics: unwrapped)
            currentVerticalTiltAngle = get(type: .currentVerticalTiltAngle, characteristics: unwrapped)
            targetVerticalTiltAngle = get(type: .targetVerticalTiltAngle, characteristics: unwrapped)
            super.init(type: .windowCovering, characteristics: unwrapped)
        }
    }
}