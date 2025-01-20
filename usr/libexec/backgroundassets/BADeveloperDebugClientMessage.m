@interface BADeveloperDebugClientMessage
+ (BOOL)supportsSecureCoding;
+ (Class)classForMessageOperation:(int64_t)a3;
- (BADeveloperDebugClientMessage)initWithCoder:(id)a3;
- (BADeveloperDebugClientMessage)initWithMessageOperation:(int64_t)a3;
- (int64_t)messageOperation;
- (void)encodeWithCoder:(id)a3;
- (void)setMessageOperation:(int64_t)a3;
@end

@implementation BADeveloperDebugClientMessage

- (BADeveloperDebugClientMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BADeveloperDebugClientMessage;
  v5 = [(BADeveloperDebugMessage *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_messageOperation = (int64_t)[v4 decodeIntegerForKey:@"BAClientMessageOperation"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BADeveloperDebugClientMessage;
  id v4 = a3;
  [(BADeveloperDebugMessage *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:-[BADeveloperDebugClientMessage messageOperation](self, "messageOperation", v5.receiver, v5.super_class) forKey:@"BAClientMessageOperation"];
}

- (BADeveloperDebugClientMessage)initWithMessageOperation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BADeveloperDebugClientMessage;
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
  if ((unint64_t)(a3 - 1) > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_opt_class();
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

@end