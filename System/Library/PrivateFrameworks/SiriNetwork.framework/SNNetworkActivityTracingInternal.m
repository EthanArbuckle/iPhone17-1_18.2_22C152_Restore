@interface SNNetworkActivityTracingInternal
+ (SNNetworkActivityTracingInternal)shared;
- (SNNetworkActivityTracingInternal)init;
- (void)activateWithLabel:(int64_t)a3 completion:(id)a4;
- (void)currentNetworkActivityToken:(id)a3;
- (void)startWithLabel:(int64_t)a3 activate:(BOOL)a4 completion:(id)a5;
- (void)stopWithLabel:(int64_t)a3 reason:(int64_t)a4 error:(id)a5 completion:(id)a6;
- (void)tracingCancelWithCompletion:(id)a3;
@end

@implementation SNNetworkActivityTracingInternal

+ (SNNetworkActivityTracingInternal)shared
{
  id v2 = static NetworkActivityTracing.shared.getter();

  return (SNNetworkActivityTracingInternal *)v2;
}

- (SNNetworkActivityTracingInternal)init
{
  return (SNNetworkActivityTracingInternal *)NetworkActivityTracing.init()();
}

- (void)startWithLabel:(int64_t)a3 activate:(BOOL)a4 completion:(id)a5
{
  v7 = (uint64_t (*)())_Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    v7 = thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  }
  v8 = self;
  NetworkActivityTracing.start(label:activate:completion:)(a3);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v7);
}

- (void)activateWithLabel:(int64_t)a3 completion:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  }
  v7 = self;
  NetworkActivityTracing.activate(label:completion:)(a3);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v6);
}

- (void)stopWithLabel:(int64_t)a3 reason:(int64_t)a4 error:(id)a5 completion:(id)a6
{
  v10 = (uint64_t (*)())_Block_copy(a6);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    v10 = thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = self;
  id v13 = a5;
  NetworkActivityTracing.stop(label:reason:error:completion:)(a3, a4, a5, (uint64_t)v10, v11);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v10);
}

- (void)tracingCancelWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  NetworkActivityTracing.tracingCancel(completion:)((uint64_t)v7, v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v7);
}

- (void)currentNetworkActivityToken:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSUUID?) -> ();
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  NetworkActivityTracing.currentNetworkActivityToken(_:)((uint64_t)v7, v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v7);
}

- (void).cxx_destruct
{
}

@end