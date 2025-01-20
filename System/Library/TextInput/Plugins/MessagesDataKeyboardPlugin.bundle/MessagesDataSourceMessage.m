@interface MessagesDataSourceMessage
- (BOOL)fromMe;
- (MessagesDataSourceMessage)initWithDate:(id)a3 recipient:(id)a4 body:(id)a5;
- (NSDate)dateSent;
- (NSString)body;
- (NSString)description;
- (NSString)guid;
- (NSString)recipient;
- (unint64_t)rowID;
- (void)dealloc;
- (void)setFromMe:(BOOL)a3;
- (void)setGuid:(id)a3;
- (void)setRowID:(unint64_t)a3;
@end

@implementation MessagesDataSourceMessage

- (MessagesDataSourceMessage)initWithDate:(id)a3 recipient:(id)a4 body:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MessagesDataSourceMessage;
  v8 = [(MessagesDataSourceMessage *)&v10 init];
  if (v8)
  {
    v8->_dateSent = (NSDate *)[a3 copy];
    v8->_recipient = (NSString *)[a4 copy];
    v8->_body = (NSString *)[a5 copy];
  }
  return v8;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@,%p,%@,%d,%d,%@>"], self->_dateSent, self->_body, self->_recipient, self->_fromMe, self->_rowID, self->_guid);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MessagesDataSourceMessage;
  [(MessagesDataSourceMessage *)&v3 dealloc];
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)recipient
{
  return self->_recipient;
}

- (BOOL)fromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (unint64_t)rowID
{
  return self->_rowID;
}

- (void)setRowID:(unint64_t)a3
{
  self->_rowID = a3;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

@end