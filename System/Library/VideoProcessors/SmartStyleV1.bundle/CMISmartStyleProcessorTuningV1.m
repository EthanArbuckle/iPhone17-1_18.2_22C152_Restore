@interface CMISmartStyleProcessorTuningV1
- (float)personMaskDilatedMaskVal;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPersonMaskDilatedMaskVal:(float)a3;
@end

@implementation CMISmartStyleProcessorTuningV1

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[CMISmartStyleProcessorTuningV1 allocWithZone:a3] init];
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = self->_personMaskDilatedMaskVal;
    [(CMISmartStyleProcessorTuningV1 *)v4 setPersonMaskDilatedMaskVal:v5];
  }
  return v6;
}

- (float)personMaskDilatedMaskVal
{
  return self->_personMaskDilatedMaskVal;
}

- (void)setPersonMaskDilatedMaskVal:(float)a3
{
  self->_personMaskDilatedMaskVal = a3;
}

@end