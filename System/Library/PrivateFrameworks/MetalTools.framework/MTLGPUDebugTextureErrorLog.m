@interface MTLGPUDebugTextureErrorLog
- (id)description;
- (int)errorReason;
- (unsigned)actualTextureType;
- (unsigned)expectedTextureType;
- (void)setActualTextureType:(unsigned __int8)a3;
- (void)setErrorReason:(int)a3;
- (void)setExpectedTextureType:(unsigned __int8)a3;
@end

@implementation MTLGPUDebugTextureErrorLog

- (id)description
{
  int errorReason = self->_errorReason;
  if (errorReason)
  {
    if (errorReason == 3)
    {
      v5 = MTLTextureStringFromType((MTLTextureType)self->_expectedTextureType);
      v4 = (__CFString *)[NSString stringWithFormat:@"Invalid texture type %@ bound to shader, expected %@,", MTLTextureStringFromType((MTLTextureType)self->_actualTextureType), v5];
    }
    else if (errorReason == 2)
    {
      v4 = @"MTLResourceUsage flags mismatch or missing for texture";
    }
    else
    {
      v4 = @"<unknown>";
    }
  }
  else
  {
    v4 = @"Null texture access";
  }
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v7, [(MTLGPUDebugGPULog *)self function]);
  return (id)[NSString stringWithFormat:@"%@ executing %@\n%@\n", v4, -[MTLGPUDebugGPULog functionDescription](self, "functionDescription"), -[MTLGPUDebugGPULog locationDescription](self, "locationDescription")];
}

- (int)errorReason
{
  return self->_errorReason;
}

- (void)setErrorReason:(int)a3
{
  self->_int errorReason = a3;
}

- (unsigned)expectedTextureType
{
  return self->_expectedTextureType;
}

- (void)setExpectedTextureType:(unsigned __int8)a3
{
  self->_expectedTextureType = a3;
}

- (unsigned)actualTextureType
{
  return self->_actualTextureType;
}

- (void)setActualTextureType:(unsigned __int8)a3
{
  self->_actualTextureType = a3;
}

@end