@interface MFDADraftMessage
- (MFDADraftMessage)initWithMailMessage:(id)a3 clientID:(unint64_t)a4;
- (id)bcc;
- (id)body;
- (id)cc;
- (id)clientID;
- (id)date;
- (id)from;
- (id)messageIDHeader;
- (id)replyTo;
- (id)serverID;
- (id)subject;
- (id)to;
- (int)bodyType;
- (void)setClientID:(unint64_t)a3;
@end

@implementation MFDADraftMessage

- (MFDADraftMessage)initWithMailMessage:(id)a3 clientID:(unint64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFDADraftMessage;
  v8 = [(MFDADraftMessage *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_message, a3);
    id v10 = [NSString alloc];
    v11 = [(MFMailMessage *)v9->_message messageData];
    uint64_t v12 = [v10 initWithData:v11 encoding:4];
    bodyData = v9->_bodyData;
    v9->_bodyData = (NSString *)v12;

    v9->_clientID = a4;
    v14 = v9;
  }

  return v9;
}

- (id)messageIDHeader
{
  return (id)[(MFMailMessage *)self->_message messageIDHeader];
}

- (id)to
{
  return (id)[(MFMailMessage *)self->_message to];
}

- (id)cc
{
  return (id)[(MFMailMessage *)self->_message cc];
}

- (id)bcc
{
  return (id)[(MFMailMessage *)self->_message bcc];
}

- (id)from
{
  return (id)[(MFMailMessage *)self->_message senders];
}

- (id)replyTo
{
  return 0;
}

- (id)date
{
  return (id)[(MFMailMessage *)self->_message dateSent];
}

- (id)subject
{
  v2 = [(MFMailMessage *)self->_message subject];
  v3 = [v2 subjectString];

  return v3;
}

- (id)body
{
  return self->_bodyData;
}

- (id)clientID
{
  unint64_t clientID = self->_clientID;
  if (clientID)
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", clientID);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setClientID:(unint64_t)a3
{
  self->_unint64_t clientID = a3;
}

- (id)serverID
{
  if (([(MFMailMessage *)self->_message messageFlags] & 0x100000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    v3 = [(MFMailMessage *)self->_message remoteID];
    v4 = (void *)[v3 copy];
  }
  return v4;
}

- (int)bodyType
{
  return 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end