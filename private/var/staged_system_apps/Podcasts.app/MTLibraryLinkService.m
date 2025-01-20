@interface MTLibraryLinkService
+ (BOOL)shouldFollowRedirects;
- (MTLibraryLinkService)init;
- (NSDictionary)requestParams;
- (id)urlRequest;
- (void)performRequest:(id)a3;
- (void)requestWithParams:(id)a3 callback:(id)a4;
- (void)setRequestParams:(id)a3;
- (void)updateAdamIdForPodcast:(id)a3 withFeedURLs:(id)a4;
@end

@implementation MTLibraryLinkService

- (MTLibraryLinkService)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLibraryLinkService;
  return [(MTLibraryLinkService *)&v3 init];
}

+ (BOOL)shouldFollowRedirects
{
  return 0;
}

- (id)urlRequest
{
  objc_super v3 = +[IMURLBag sharedInstance];
  v4 = [v3 syncStringForKey:kBagKeyLibraryLinkURL];
  if (v4)
  {
    v5 = +[NSURL URLWithString:v4];
    v6 = [(MTLibraryLinkService *)self requestParams];
    v7 = [v5 pf_URLByAppendingQueryString:v6];
  }
  else
  {
    v7 = 0;
  }
  id v8 = [objc_alloc((Class)NSURLRequest) initWithURL:v7];

  return v8;
}

- (void)performRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(MTLibraryLinkService *)self urlRequest];
  [(MTLibraryLinkService *)self performUrlRequest:v5 callback:v4];
}

- (void)requestWithParams:(id)a3 callback:(id)a4
{
  id v6 = a4;
  [(MTLibraryLinkService *)self setRequestParams:a3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100162610;
  v8[3] = &unk_100552598;
  id v9 = v6;
  id v7 = v6;
  [(MTLibraryLinkService *)self performRequest:v8];
}

- (void)updateAdamIdForPodcast:(id)a3 withFeedURLs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if ([v7 count])
    {
      id v9 = [v8 objectAtIndexedSubscript:0];

      if (v9)
      {
        v15[0] = @"podcastUrl";
        v10 = [v8 objectAtIndexedSubscript:0];
        v15[1] = @"suppressRedirectToSearch";
        v16[0] = v10;
        v16[1] = @"true";
        v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1001628C4;
        v12[3] = &unk_1005531F0;
        id v13 = v6;
        id v14 = v8;
        [(MTLibraryLinkService *)self requestWithParams:v11 callback:v12];
      }
    }
  }
}

- (NSDictionary)requestParams
{
  return self->_requestParams;
}

- (void)setRequestParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end