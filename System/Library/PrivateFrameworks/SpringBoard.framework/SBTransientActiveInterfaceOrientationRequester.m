@interface SBTransientActiveInterfaceOrientationRequester
- (NSString)reason;
- (SBTransientActiveInterfaceOrientationRequester)initWithOrientation:(int64_t)a3 andReason:(id)a4;
- (int64_t)orientation;
@end

@implementation SBTransientActiveInterfaceOrientationRequester

- (SBTransientActiveInterfaceOrientationRequester)initWithOrientation:(int64_t)a3 andReason:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBTransientActiveInterfaceOrientationRequester;
  v8 = [(SBTransientActiveInterfaceOrientationRequester *)&v13 init];
  if (v8)
  {
    if (!v7)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:v8 file:@"SpringBoard.m" lineNumber:7828 description:@"A reason is required to create a SBTransientActiveInterfaceOrientationRequester."];
    }
    v8->_orientation = a3;
    uint64_t v9 = [v7 copy];
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;
  }
  return v8;
}

- (NSString)reason
{
  return self->_reason;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
}

@end