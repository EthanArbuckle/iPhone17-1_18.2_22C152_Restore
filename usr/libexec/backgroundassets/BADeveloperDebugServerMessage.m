@interface BADeveloperDebugServerMessage
+ (BOOL)supportsSecureCoding;
+ (Class)classForMessageOperation:(int64_t)a3;
- (BADeveloperDebugServerMessage)initWithCoder:(id)a3;
- (BADeveloperDebugServerMessage)initWithMessageOperation:(int64_t)a3;
- (BOOL)versionSupported;
- (NSString)unsupportedVersionFailureMessage;
- (int64_t)messageOperation;
- (void)encodeWithCoder:(id)a3;
- (void)setMessageOperation:(int64_t)a3;
- (void)setUnsupportedVersionFailureMessage:(id)a3;
- (void)setVersionSupported:(BOOL)a3;
@end

@implementation BADeveloperDebugServerMessage

- (BADeveloperDebugServerMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BADeveloperDebugServerMessage;
  v5 = [(BADeveloperDebugMessage *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_messageOperation = (int64_t)[v4 decodeIntegerForKey:@"BAServerMessageOperation"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BADeveloperDebugServerMessage;
  id v4 = a3;
  [(BADeveloperDebugMessage *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:-[BADeveloperDebugServerMessage messageOperation](self, "messageOperation", v5.receiver, v5.super_class) forKey:@"BAServerMessageOperation"];
}

- (BADeveloperDebugServerMessage)initWithMessageOperation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BADeveloperDebugServerMessage;
  result = [(BADeveloperDebugMessage *)&v5 init];
  if (result) {
    result->_messageOperation = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)classForMessageOperation:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (int64_t)messageOperation
{
  return self->_messageOperation;
}

- (void)setMessageOperation:(int64_t)a3
{
  self->_messageOperation = a3;
}

- (BOOL)versionSupported
{
  return self->_versionSupported;
}

- (void)setVersionSupported:(BOOL)a3
{
  self->_versionSupported = a3;
}

- (NSString)unsupportedVersionFailureMessage
{
  return self->_unsupportedVersionFailureMessage;
}

- (void)setUnsupportedVersionFailureMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end