@interface OspreyService
- (OspreyRPC)channel;
- (OspreyService)initWithConnectionConfiguration:(id)a3;
- (OspreyService)initWithConnectionURL:(id)a3;
@end

@implementation OspreyService

- (OspreyService)initWithConnectionURL:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(OspreyConnectionConfiguration);
  [(OspreyConnectionConfiguration *)v5 setConnectionUrl:v4];

  v6 = [(OspreyService *)self initWithConnectionConfiguration:v5];
  return v6;
}

- (OspreyService)initWithConnectionConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OspreyService;
  v5 = [(OspreyService *)&v11 init];
  if (v5)
  {
    v6 = +[OspreyServiceConfiguration sharedConfiguration];
    v7 = [v6 connectionPool];
    uint64_t v8 = [v7 connectionForConfiguration:v4];
    channel = v5->_channel;
    v5->_channel = (OspreyRPC *)v8;
  }
  return v5;
}

- (OspreyRPC)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
}

@end