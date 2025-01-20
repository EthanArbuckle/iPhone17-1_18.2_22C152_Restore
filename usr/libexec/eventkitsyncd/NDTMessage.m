@interface NDTMessage
- (NDTMessage)initWithData:(id)a3;
- (NDTMessage)initWithFile:(id)a3;
- (NSData)data;
- (NSString)msgType;
- (NSString)path;
- (NSString)responseIdentifier;
- (void)setData:(id)a3;
- (void)setMsgType:(id)a3;
- (void)setPath:(id)a3;
- (void)setResponseIdentifier:(id)a3;
@end

@implementation NDTMessage

- (NDTMessage)initWithFile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDTMessage;
  v6 = [(NDTMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_path, a3);
  }

  return v7;
}

- (NDTMessage)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDTMessage;
  v6 = [(NDTMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)msgType
{
  return self->_msgType;
}

- (void)setMsgType:(id)a3
{
}

- (NSString)responseIdentifier
{
  return self->_responseIdentifier;
}

- (void)setResponseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseIdentifier, 0);
  objc_storeStrong((id *)&self->_msgType, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end