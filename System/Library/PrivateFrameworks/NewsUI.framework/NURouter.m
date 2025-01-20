@interface NURouter
- (NURouter)initWithURLHandler:(id)a3;
- (NUURLHandling)urlHandler;
- (void)routeToNewsAppForYouFeed;
@end

@implementation NURouter

- (NURouter)initWithURLHandler:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NURouter;
  v6 = [(NURouter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_urlHandler, a3);
  }

  return v7;
}

- (void)routeToNewsAppForYouFeed
{
  id v4 = [NSURL URLWithString:@"applenews:///foryou"];
  v3 = [(NURouter *)self urlHandler];
  [v3 openURL:v4 options:0 completion:0];
}

- (NUURLHandling)urlHandler
{
  return self->_urlHandler;
}

- (void).cxx_destruct
{
}

@end