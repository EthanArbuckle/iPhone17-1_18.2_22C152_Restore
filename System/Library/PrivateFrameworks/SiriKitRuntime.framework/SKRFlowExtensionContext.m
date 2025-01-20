@interface SKRFlowExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (SKRFlowExtensionContext)init;
- (SKRFlowExtensionContext)initWithInputItems:(id)a3;
- (SKRFlowExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (SKRFlowExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)acceptInitialInputWithInputIdentifier:(id)a3 speechData:(id)a4 reply:(id)a5;
- (void)acceptWithInputData:(id)a3 speechData:(id)a4 reply:(id)a5;
- (void)canHandleWithInputData:(id)a3 rcId:(id)a4 reply:(id)a5;
- (void)cancelWithReply:(id)a3;
- (void)commitWithBridge:(id)a3 reply:(id)a4;
- (void)drainAsyncWorkWithReply:(id)a3;
- (void)ensureReadyWithReply:(id)a3;
- (void)flexibleExecutionSupportOptionsWithReply:(id)a3;
- (void)isCorrectableWithReply:(id)a3;
- (void)isEmptyWithReply:(id)a3;
- (void)paraphraseWithReply:(id)a3;
- (void)prepareWithBridge:(id)a3 reply:(id)a4;
- (void)resetWithReply:(id)a3;
- (void)startTurnFromCacheWithExecutionRequestId:(id)a3 bridge:(id)a4 reply:(id)a5;
- (void)startTurnWithTurnData:(id)a3 bridge:(id)a4 reply:(id)a5;
- (void)warmupWithRefId:(id)a3 reply:(id)a4;
@end

@implementation SKRFlowExtensionContext

- (SKRFlowExtensionContext)init
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v2 - 8);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  v7 = (SKRFlowExtensionContext *)(*(uint64_t (**)(void))(ObjectType + 216))(MEMORY[0x1E4FBC860]);
  swift_deallocPartialClassInstance();
  return v7;
}

- (SKRFlowExtensionContext)initWithInputItems:(id)a3
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (SKRFlowExtensionContext *)(*(uint64_t (**)(uint64_t, void, char *, void, void, void, void, void, void))(ObjectType + 216))(v6, 0, v5, 0, 0, 0, 0, 0, MEMORY[0x1E4FBC860]);
  swift_deallocPartialClassInstance();
  return v9;
}

- (SKRFlowExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  v12 = (char *)&v21 - v11;
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  }
  uint64_t ObjectType = swift_getObjectType();
  outlined init with copy of UUID?((uint64_t)v12, (uint64_t)v10);
  v17 = *(uint64_t (**)(uint64_t, id, char *, void, void, void, void, void, void))(ObjectType + 216);
  id v18 = a4;
  v19 = (SKRFlowExtensionContext *)v17(v13, a4, v10, 0, 0, 0, 0, 0, MEMORY[0x1E4FBC860]);
  outlined destroy of UUID?((uint64_t)v12);
  swift_deallocPartialClassInstance();
  return v19;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return @objc static FlowExtensionContext._extensionAuxiliaryVendorProtocol()((uint64_t)a1, (uint64_t)a2, &one-time initialization token for remoteConversationXPCInterface, (void **)&static RemoteConversationXPCHelper.remoteConversationXPCInterface);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return @objc static FlowExtensionContext._extensionAuxiliaryVendorProtocol()((uint64_t)a1, (uint64_t)a2, &one-time initialization token for remoteConversationHostXPCInterface, (void **)&static RemoteConversationXPCHelper.remoteConversationHostXPCInterface);
}

- (void)warmupWithRefId:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  FlowExtensionContext.warmup(refId:reply:)(v6, v8, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ()partial apply, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)canHandleWithInputData:(id)a3 rcId:(id)a4 reply:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  id v18 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v8;
  FlowExtensionContext.canHandle(inputData:rcId:reply:)(v11, v13, v14, v16, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationCanHandleResult) -> (), v17);
  swift_bridgeObjectRelease();
  swift_release();
  outlined consume of Data._Representation(v11, v13);
}

- (void)cancelWithReply:(id)a3
{
}

- (void)resetWithReply:(id)a3
{
}

- (void)ensureReadyWithReply:(id)a3
{
}

- (void)startTurnWithTurnData:(id)a3 bridge:(id)a4 reply:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0xE0);
  id v11 = a3;
  swift_unknownObjectRetain();
  unint64_t v12 = self;
  v10();
  RemoteConversationService.startTurn(turnData:bridge:reply:)(v11, (uint64_t)a4, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ()partial apply, v9);

  swift_unknownObjectRelease();
  swift_release();

  swift_release();
}

- (void)startTurnFromCacheWithExecutionRequestId:(id)a3 bridge:(id)a4 reply:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = (void (*)(void *, void, void))v6[2];
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  v7(v6, 0, 0);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (void)acceptInitialInputWithInputIdentifier:(id)a3 speechData:(id)a4 reply:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0xE0);
  id v15 = a4;
  uint64_t v16 = self;
  v14();
  RemoteConversationService.acceptInitialInput(inputIdentifier:speechData:reply:)((uint64_t)v11, v15, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned FlowExtensionUserInputResultXPC) -> ()partial apply, v13);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)acceptWithInputData:(id)a3 speechData:(id)a4 reply:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  id v15 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v8;
  FlowExtensionContext.accept(inputData:speechData:reply:)(v11, v13, v10, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationFlexibleExecutionSupportXPC) -> (), v14);
  swift_release();
  outlined consume of Data._Representation(v11, v13);
}

- (void)paraphraseWithReply:(id)a3
{
}

- (void)prepareWithBridge:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  FlowExtensionContext.cancel(reply:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> (), v6, (uint64_t)"prepare(bridge:reply:)", 22, (uint64_t)&unk_1F137DAE8, (uint64_t)&async function pointer to partial apply for closure #1 in RemoteConversationService.prepare(bridge:reply:));
  swift_unknownObjectRelease();

  swift_release();
}

- (void)commitWithBridge:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  FlowExtensionContext.cancel(reply:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationFlexibleExecutionSupportXPC) -> (), v6, (uint64_t)"commit(bridge:reply:)", 21, (uint64_t)&unk_1F137DAC0, (uint64_t)&async function pointer to partial apply for closure #1 in RemoteConversationService.commit(bridge:reply:));
  swift_unknownObjectRelease();

  swift_release();
}

- (void)isEmptyWithReply:(id)a3
{
}

- (void)isCorrectableWithReply:(id)a3
{
}

- (void)flexibleExecutionSupportOptionsWithReply:(id)a3
{
}

- (void)drainAsyncWorkWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0xE0);
  uint64_t v11 = self;
  uint64_t v12 = v10();
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  uint64_t v14 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = static ConversationActor.shared;
  uint64_t v16 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, 255, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = v12;
  v17[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ();
  v17[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in RemoteConversationService.drainAsyncWork(reply:)partial apply, (uint64_t)v17);

  swift_release();
  swift_release();
  swift_release();
}

- (SKRFlowExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v10 = 0;
    uint64_t v9 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v9 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v10 = 1;
  }
  (*v9)(v7, v10, 1, v8);
  result = (SKRFlowExtensionContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end