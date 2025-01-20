@interface MTLLegacySVTextureErrorLog
- (id)description;
- (int)errorReason;
- (void)setErrorReason:(int)a3;
@end

@implementation MTLLegacySVTextureErrorLog

- (id)description
{
  int errorReason = self->_errorReason;
  v4 = @"<unknown>";
  if (errorReason == 2) {
    v4 = @"Texture usage flags mismatch";
  }
  if (errorReason) {
    v5 = v4;
  }
  else {
    v5 = @"Null texture access";
  }
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v7, [(MTLLegacySVGPULog *)self function]);
  return (id)[NSString stringWithFormat:@"%@ executing %@\n", v5, -[MTLLegacySVGPULog locationDescription](self, "locationDescription")];
}

- (int)errorReason
{
  return self->_errorReason;
}

- (void)setErrorReason:(int)a3
{
  self->_int errorReason = a3;
}

@end