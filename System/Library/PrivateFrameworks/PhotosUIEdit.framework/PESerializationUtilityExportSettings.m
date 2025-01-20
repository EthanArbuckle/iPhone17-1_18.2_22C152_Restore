@interface PESerializationUtilityExportSettings
- (BOOL)applyVideoOrientationAsMetadata;
- (NUScalePolicy)scalePolicy;
- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3;
- (void)setScalePolicy:(id)a3;
@end

@implementation PESerializationUtilityExportSettings

- (void).cxx_destruct
{
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

@end