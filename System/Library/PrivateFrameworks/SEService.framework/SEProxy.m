@interface SEProxy
+ (id)withEndpoint:(id)a3;
+ (id)withSession:(id)a3 seid:(id)a4;
@end

@implementation SEProxy

+ (id)withSession:(id)a3 seid:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SEProxyWithManagerSession);
  -[SEProxyWithManagerSession setSession:seid:]((uint64_t)v7, v6, v5);

  return v7;
}

+ (id)withEndpoint:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SEProxyWithRemoteTransceiver);
  id v5 = (void *)[objc_alloc(MEMORY[0x263F66238]) initWithListenerEndpoint:v3];

  if (v5)
  {
    [(SEProxyWithRemoteTransceiver *)v4 setRemoteTransceiver:v5];
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end