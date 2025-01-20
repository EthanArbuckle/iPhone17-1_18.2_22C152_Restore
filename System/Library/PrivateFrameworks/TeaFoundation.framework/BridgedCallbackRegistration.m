@interface BridgedCallbackRegistration
- (_TtC13TeaFoundation27BridgedCallbackRegistration)init;
- (void)whenResolvingClass:(Class)a3 scope:(id)a4 callbackBlock:(id)a5;
- (void)whenResolvingProtocol:(id)a3 scope:(id)a4 callbackBlock:(id)a5;
@end

@implementation BridgedCallbackRegistration

- (void)whenResolvingClass:(Class)a3 scope:(id)a4 callbackBlock:(id)a5
{
  v7 = _Block_copy(a5);
  swift_getObjCClassMetadata();
  *(void *)(swift_allocObject() + 16) = v7;
  id v8 = a4;
  v9 = self;
  sub_191EE1A08();

  swift_release();
}

- (void)whenResolvingProtocol:(id)a3 scope:(id)a4 callbackBlock:(id)a5
{
  id v8 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_191EE1C3C();

  swift_release();
}

- (_TtC13TeaFoundation27BridgedCallbackRegistration)init
{
}

- (void).cxx_destruct
{
}

@end