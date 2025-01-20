@interface NACAlertProxy
+ (id)alertProxyWithConfiguration:(id)a3;
- (id)_initWithConfiguration:(id)a3;
- (void)play;
- (void)stopWithOptions:(id)a3;
@end

@implementation NACAlertProxy

+ (id)alertProxyWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithConfiguration:v4];

  return v5;
}

- (id)_initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NACAlertProxy;
  v6 = [(NACAlertProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_alertConfiguration, a3);
  }

  return v7;
}

- (void)play
{
  id v3 = +[NACXPCClient sharedClient];
  [v3 playToneWithConfiguration:self->_alertConfiguration];
}

- (void)stopWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = +[NACXPCClient sharedClient];
  [v4 stopToneWithOptions:v3];
}

- (void).cxx_destruct
{
}

@end