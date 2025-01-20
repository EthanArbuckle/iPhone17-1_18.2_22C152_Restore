@interface BAAppStoreProgressInfoDescriptor
+ (BOOL)supportsSecureCoding;
- (BAAppStoreProgressInfoDescriptor)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (int64_t)countOfBytesExpectedToReceive;
- (int64_t)countOfBytesReceived;
- (int64_t)progressState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BAAppStoreProgressInfoDescriptor

- (BAAppStoreProgressInfoDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BAAppStoreProgressInfoDescriptor;
  v5 = [(BAAppStoreProgressInfoDescriptor *)&v7 init];
  if (v5)
  {
    v5->_progressState = (int64_t)[v4 decodeIntegerForKey:@"_progressState"];
    v5->_countOfBytesReceived = (int64_t)[v4 decodeInt64ForKey:@"_countOfBytesReceived"];
    v5->_countOfBytesExpectedToReceive = (int64_t)[v4 decodeInt64ForKey:@"_countOfBytesExpectedToReceive"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:-[BAAppStoreProgressInfoDescriptor progressState](self, "progressState") forKey:@"_progressState"];
  [v4 encodeInt64:-[BAAppStoreProgressInfoDescriptor countOfBytesReceived](self, "countOfBytesReceived") forKey:@"_countOfBytesReceived"];
  [v4 encodeInt64:-[BAAppStoreProgressInfoDescriptor countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive") forKey:@"_countOfBytesExpectedToReceive"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BAAppStoreProgressInfoDescriptor *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (id v5 = [(BAAppStoreProgressInfoDescriptor *)v4 progressState],
          v5 == (id)[(BAAppStoreProgressInfoDescriptor *)self progressState])
      && (id v6 = [(BAAppStoreProgressInfoDescriptor *)v4 countOfBytesReceived],
          v6 == (id)[(BAAppStoreProgressInfoDescriptor *)self countOfBytesReceived]))
    {
      id v7 = [(BAAppStoreProgressInfoDescriptor *)v4 countOfBytesExpectedToReceive];
      BOOL v8 = v7 == (id)[(BAAppStoreProgressInfoDescriptor *)self countOfBytesExpectedToReceive];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3 = [(BAAppStoreProgressInfoDescriptor *)self progressState];
  int64_t v4 = [(BAAppStoreProgressInfoDescriptor *)self countOfBytesReceived];
  return v3
       + 16
       * ([(BAAppStoreProgressInfoDescriptor *)self countOfBytesExpectedToReceive] + v4);
}

- (int64_t)progressState
{
  return self->_progressState;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

@end