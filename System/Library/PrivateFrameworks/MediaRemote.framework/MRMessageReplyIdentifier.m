@interface MRMessageReplyIdentifier
- (id)reply;
- (unint64_t)messageNumber;
- (void)setMessageNumber:(unint64_t)a3;
- (void)setReply:(id)a3;
@end

@implementation MRMessageReplyIdentifier

- (unint64_t)messageNumber
{
  return self->_messageNumber;
}

- (void)setMessageNumber:(unint64_t)a3
{
  self->_messageNumber = a3;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (void).cxx_destruct
{
}

@end