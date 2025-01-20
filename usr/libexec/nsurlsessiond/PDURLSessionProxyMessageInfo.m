@interface PDURLSessionProxyMessageInfo
- (PBCodable)message;
- (PDURLSessionProxyMessageInfo)initWithMessage:(id)a3 type:(unsigned __int16)a4;
- (unsigned)type;
- (void)setMessage:(id)a3;
- (void)setType:(unsigned __int16)a3;
@end

@implementation PDURLSessionProxyMessageInfo

- (void).cxx_destruct
{
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setMessage:(id)a3
{
}

- (PBCodable)message
{
  return (PBCodable *)objc_getProperty(self, a2, 16, 1);
}

- (PDURLSessionProxyMessageInfo)initWithMessage:(id)a3 type:(unsigned __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDURLSessionProxyMessageInfo;
  v8 = [(PDURLSessionProxyMessageInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_message, a3);
    v9->_type = a4;
  }

  return v9;
}

@end