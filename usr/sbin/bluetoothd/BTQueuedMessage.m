@interface BTQueuedMessage
- (BTQueuedMessage)init;
- (BTQueuedMessage)initWithCoder:(id)a3;
- (BTQueuedMessage)initWithMsg:(unsigned __int16)a3 arguments:(id)a4;
- (NSDictionary)arguments;
- (unsigned)msgId;
- (void)encodeWithCoder:(id)a3;
- (void)setArguments:(id)a3;
- (void)setMsgId:(unsigned __int16)a3;
@end

@implementation BTQueuedMessage

- (BTQueuedMessage)init
{
  return [(BTQueuedMessage *)self initWithMsg:0 arguments:0];
}

- (BTQueuedMessage)initWithMsg:(unsigned __int16)a3 arguments:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BTQueuedMessage;
  v8 = [(BTQueuedMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_msgId = a3;
    objc_storeStrong((id *)&v8->_arguments, a4);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_msgId forKey:@"message"];
  [v4 encodeObject:self->_arguments forKey:@"arguments"];
}

- (BTQueuedMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BTQueuedMessage *)self init];
  if (v5)
  {
    v5->_msgId = (unsigned __int16)[v4 decodeInt64ForKey:@"message"];
    uint64_t v6 = [v4 decodeObjectForKey:@"arguments"];
    arguments = v5->_arguments;
    v5->_arguments = (NSDictionary *)v6;
  }
  return v5;
}

- (unsigned)msgId
{
  return self->_msgId;
}

- (void)setMsgId:(unsigned __int16)a3
{
  self->_msgId = a3;
}

- (NSDictionary)arguments
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setArguments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end