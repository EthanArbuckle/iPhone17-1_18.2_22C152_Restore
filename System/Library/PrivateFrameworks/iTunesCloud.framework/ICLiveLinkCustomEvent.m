@interface ICLiveLinkCustomEvent
- (ICLiveLinkCustomEvent)initWithLocalizedMessage:(id)a3;
- (NSString)localizedMessage;
- (id)description;
@end

@implementation ICLiveLinkCustomEvent

- (void).cxx_destruct
{
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ICLiveLinkCustomEvent: %p localizedMessage=\"%@\">", self, self->_localizedMessage];
}

- (ICLiveLinkCustomEvent)initWithLocalizedMessage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLiveLinkCustomEvent;
  v5 = [(ICLiveLinkCustomEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    localizedMessage = v5->_localizedMessage;
    v5->_localizedMessage = (NSString *)v6;
  }
  return v5;
}

@end