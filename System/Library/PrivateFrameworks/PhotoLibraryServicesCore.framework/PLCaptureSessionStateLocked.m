@interface PLCaptureSessionStateLocked
- (NSString)sessionIdentifier;
- (PLCaptureSessionStateLocked)initWithSessionIdentifier:(id)a3;
- (id)description;
@end

@implementation PLCaptureSessionStateLocked

- (void).cxx_destruct
{
}

- (NSString)sessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PLCaptureSessionStateLocked(%@)", self->_sessionIdentifier];
}

- (PLCaptureSessionStateLocked)initWithSessionIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLCaptureSessionState.m", 85, @"Invalid parameter not satisfying: %@", @"sessionIdentifier != nil" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PLCaptureSessionStateLocked;
  v6 = [(PLCaptureSessionState *)&v12 initWithType:2];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    sessionIdentifier = v6->_sessionIdentifier;
    v6->_sessionIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

@end