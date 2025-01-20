@interface CSStudiesServerRegistrar
- (CSStudiesServerRegistrar)initWithEndpoint:(id)a3 authorization:(id)a4 cellularAccess:(BOOL)a5 timeoutInSeconds:(unint64_t)a6;
- (NSString)authorization;
- (NSURL)endpoint;
- (NSURLSessionConfiguration)config;
- (void)registerWithHandler:(id)a3;
@end

@implementation CSStudiesServerRegistrar

- (CSStudiesServerRegistrar)initWithEndpoint:(id)a3 authorization:(id)a4 cellularAccess:(BOOL)a5 timeoutInSeconds:(unint64_t)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSStudiesServerRegistrar;
  v13 = [(CSStudiesServerRegistrar *)&v17 init];
  if (v13)
  {
    uint64_t v14 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    config = v13->_config;
    v13->_config = (NSURLSessionConfiguration *)v14;

    [(NSURLSessionConfiguration *)v13->_config setAllowsCellularAccess:v7];
    [(NSURLSessionConfiguration *)v13->_config setHTTPAdditionalHeaders:&off_1003C3478];
    [(NSURLSessionConfiguration *)v13->_config setWaitsForConnectivity:0];
    [(NSURLSessionConfiguration *)v13->_config setTimeoutIntervalForResource:(double)a6];
    objc_storeStrong((id *)&v13->_authorization, a4);
    objc_storeStrong((id *)&v13->_endpoint, a3);
  }

  return v13;
}

- (void)registerWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CSStudiesServerRegistrar *)self endpoint];
  v6 = +[NSMutableURLRequest requestWithURL:v5];

  BOOL v7 = [(CSStudiesServerRegistrar *)self authorization];
  [v6 setValue:v7 forHTTPHeaderField:@"Authorization"];

  [v6 setHTTPMethod:@"POST"];
  v8 = [(CSStudiesServerRegistrar *)self config];
  v9 = +[NSURLSession sessionWithConfiguration:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100017618;
  v12[3] = &unk_10039B028;
  id v13 = v4;
  id v10 = v4;
  id v11 = [v9 dataTaskWithRequest:v6 completionHandler:v12];
  [v11 resume];
}

- (NSURL)endpoint
{
  return self->_endpoint;
}

- (NSString)authorization
{
  return self->_authorization;
}

- (NSURLSessionConfiguration)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_authorization, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end