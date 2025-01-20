@interface MRIDSCompanionMessage
- (BOOL)replyWithData:(id)a3 priority:(int64_t)a4;
- (MRIDSCompanionMessage)initWithID:(id)a3 data:(id)a4;
- (NSData)data;
- (NSNumber)messageID;
@end

@implementation MRIDSCompanionMessage

- (MRIDSCompanionMessage)initWithID:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRIDSCompanionMessage;
  v8 = [(MRIDSCompanionMessage *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    messageID = v8->_messageID;
    v8->_messageID = (NSNumber *)v9;

    uint64_t v11 = [v7 copy];
    data = v8->_data;
    v8->_data = (NSData *)v11;
  }
  return v8;
}

- (BOOL)replyWithData:(id)a3 priority:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[MRIDSCompanionConnection sharedManager];
  LOBYTE(a4) = [v7 _sendMessage:v6 type:0 destination:0 session:0 options:0 priority:a4 replyID:self->_messageID response:0];

  return a4;
}

- (NSData)data
{
  return self->_data;
}

- (NSNumber)messageID
{
  return self->_messageID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end