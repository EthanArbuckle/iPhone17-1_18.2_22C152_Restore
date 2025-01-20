@interface ICLiveLinkQueueEventContentUpdatedMessage
- (ICLiveLinkQueueEventContentUpdatedMessage)initWithLocalizedTitle:(id)a3 localizedMessage:(id)a4;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (id)description;
@end

@implementation ICLiveLinkQueueEventContentUpdatedMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ICLiveLinkQueueEventContentUpdatedMessage: %p localizedTitle=\"%@\" localizedMessage=\"%@\">", self, self->_localizedTitle, self->_localizedMessage];
}

- (ICLiveLinkQueueEventContentUpdatedMessage)initWithLocalizedTitle:(id)a3 localizedMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICLiveLinkQueueEventContentUpdatedMessage;
  v8 = [(ICLiveLinkQueueEventContentUpdatedMessage *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    localizedTitle = v8->_localizedTitle;
    v8->_localizedTitle = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    localizedMessage = v8->_localizedMessage;
    v8->_localizedMessage = (NSString *)v11;
  }
  return v8;
}

@end