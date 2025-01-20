@interface RPPairableHost
- (BOOL)available;
- (BOOL)paired;
- (NSString)model;
- (NSString)name;
- (NSUUID)identifier;
- (RPPairableHost)init;
- (void)pairInvokingHandlersOnQueue:(id)a3 handlingPairingChallengesUsing:(id)a4 handlingCompletionUsing:(id)a5;
- (void)registerChangeHandlerOnTargetQueue:(id)a3 handler:(id)a4;
@end

@implementation RPPairableHost

- (NSString)name
{
  v2 = self;
  RPPairableHost.name.getter();

  v3 = (void *)sub_1D7660AE0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)model
{
  v2 = self;
  RPPairableHost.model.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1D7660AE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSUUID)identifier
{
  uint64_t v3 = sub_1D765FFD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  RPPairableHost.identifier.getter((uint64_t)v6);

  v8 = (void *)sub_1D765FFA0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (BOOL)available
{
  v2 = self;
  char v3 = RPPairableHost.available.getter();

  return v3 & 1;
}

- (BOOL)paired
{
  v2 = self;
  char v3 = RPPairableHost.paired.getter();

  return v3 & 1;
}

- (void)registerChangeHandlerOnTargetQueue:(id)a3 handler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  RPPairableHost.registerChangeHandler(on:handler:)(a3, (uint64_t)sub_1D75EDDD4, v7);

  swift_release();
}

- (void)pairInvokingHandlersOnQueue:(id)a3 handlingPairingChallengesUsing:(id)a4 handlingCompletionUsing:(id)a5
{
  id v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  id v12 = a3;
  v13 = self;
  RPPairableHost.pair(invokingHandlersOn:handlingPairingChallengesUsing:completionHandler:)(a3, (uint64_t)sub_1D75EDDC0, v10, (uint64_t)sub_1D75AB824, v11);

  swift_release();
  swift_release();
}

- (RPPairableHost)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end