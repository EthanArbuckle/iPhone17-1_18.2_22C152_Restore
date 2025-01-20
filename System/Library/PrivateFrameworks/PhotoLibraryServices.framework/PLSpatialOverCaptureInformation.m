@interface PLSpatialOverCaptureInformation
- (NSString)spatialOverCaptureGroupIdentifier;
- (NSString)spatialOverCaptureLivePhotoPairingIdentifier;
- (void)setSpatialOverCaptureGroupIdentifier:(id)a3;
- (void)setSpatialOverCaptureLivePhotoPairingIdentifier:(id)a3;
@end

@implementation PLSpatialOverCaptureInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialOverCaptureLivePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_spatialOverCaptureGroupIdentifier, 0);
}

- (void)setSpatialOverCaptureLivePhotoPairingIdentifier:(id)a3
{
}

- (NSString)spatialOverCaptureLivePhotoPairingIdentifier
{
  return self->_spatialOverCaptureLivePhotoPairingIdentifier;
}

- (void)setSpatialOverCaptureGroupIdentifier:(id)a3
{
}

- (NSString)spatialOverCaptureGroupIdentifier
{
  return self->_spatialOverCaptureGroupIdentifier;
}

@end