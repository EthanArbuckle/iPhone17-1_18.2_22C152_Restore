@interface VUIJSNetworkProxy
+ (void)makeNetworkRequestOperation:(WLKURLRequestProperties *)a3 completionHandler:(id)a4;
- (_TtC8VideosUI17VUIJSNetworkProxy)init;
@end

@implementation VUIJSNetworkProxy

+ (void)makeNetworkRequestOperation:(WLKURLRequestProperties *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;
  sub_1E317843C((uint64_t)&unk_1EADF12E0, (uint64_t)v7);
}

- (_TtC8VideosUI17VUIJSNetworkProxy)init
{
  return (_TtC8VideosUI17VUIJSNetworkProxy *)VUIJSNetworkProxy.init()();
}

@end