@interface VSWebAuthenticationViewModel
- (NSURL)sourceURL;
- (VSMessageQueue)messagesFromWeb;
- (VSMessageQueue)messagesToWeb;
- (VSWebAuthenticationViewModel)init;
- (void)configureWithRequest:(id)a3;
- (void)setSourceURL:(id)a3;
@end

@implementation VSWebAuthenticationViewModel

- (VSWebAuthenticationViewModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSWebAuthenticationViewModel;
  v2 = [(VSViewModel *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSMessageQueue);
    messagesToWeb = v2->_messagesToWeb;
    v2->_messagesToWeb = v3;

    v5 = objc_alloc_init(VSMessageQueue);
    messagesFromWeb = v2->_messagesFromWeb;
    v2->_messagesFromWeb = v5;
  }
  return v2;
}

- (void)configureWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(VSViewModel *)self identityProvider];
  v6 = [v5 displayName];
  v7 = [v6 forceUnwrapObject];
  [(VSViewModel *)self setTitle:v7];

  v8.receiver = self;
  v8.super_class = (Class)VSWebAuthenticationViewModel;
  [(VSViewModel *)&v8 configureWithRequest:v4];
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (VSMessageQueue)messagesToWeb
{
  return self->_messagesToWeb;
}

- (VSMessageQueue)messagesFromWeb
{
  return self->_messagesFromWeb;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesFromWeb, 0);
  objc_storeStrong((id *)&self->_messagesToWeb, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end