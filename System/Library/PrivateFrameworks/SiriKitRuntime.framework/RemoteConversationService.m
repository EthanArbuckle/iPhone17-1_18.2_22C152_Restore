@interface RemoteConversationService
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

@implementation RemoteConversationService

- (void)warmupWithRefId:(id)a3 reply:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = one-time initialization token for executor;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  __swift_project_value_buffer(v15, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v8, 1, 1, v16);
  uint64_t v17 = one-time initialization token for shared;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v19 = static ConversationActor.shared;
  uint64_t v20 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v18, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  v21 = (void *)swift_allocObject();
  v21[2] = v19;
  v21[3] = v20;
  v21[4] = self;
  v21[5] = v10;
  v21[6] = v12;
  v21[7] = thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ()partial apply;
  v21[8] = v13;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&closure #1 in RemoteConversationService.warmup(refId:reply:)partial apply, (uint64_t)v21);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)canHandleWithInputData:(id)a3 rcId:(id)a4 reply:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  id v8 = a3;
  id v9 = a4;
  swift_retain();
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;

  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v7;
  RemoteConversationService.canHandle(inputData:rcId:reply:)(v10, v12, v13, v15, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationCanHandleResult) -> (), v16);
  swift_release();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v10, v12);

  swift_release();
}

- (void)cancelWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = one-time initialization token for executor;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = static ConversationActor.shared;
  uint64_t v16 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v14, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = self;
  v17[5] = thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ()partial apply;
  v17[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in RemoteConversationService.cancel(reply:)partial apply, (uint64_t)v17);
  swift_release();
  swift_release();
  swift_release();
}

- (void)resetWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = one-time initialization token for executor;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = static ConversationActor.shared;
  uint64_t v16 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v14, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = self;
  v17[5] = thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ()partial apply;
  v17[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in RemoteConversationService.reset(reply:)partial apply, (uint64_t)v17);
  swift_release();
  swift_release();
  swift_release();
}

- (void)ensureReadyWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = one-time initialization token for executor;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = static ConversationActor.shared;
  uint64_t v16 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v14, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = self;
  v17[5] = thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ()partial apply;
  v17[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in RemoteConversationService.ensureReady(reply:)partial apply, (uint64_t)v17);
  swift_release();
  swift_release();
  swift_release();
}

- (void)startTurnFromCacheWithExecutionRequestId:(id)a3 bridge:(id)a4 reply:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  swift_unknownObjectRetain();
  swift_retain();
  RemoteConversationService.startTurnFromCache(executionRequestId:bridge:reply:)(v7, v9, (uint64_t)a4, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool, @unowned NSError?) -> (), v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)startTurnWithTurnData:(id)a3 bridge:(id)a4 reply:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  RemoteConversationService.startTurn(turnData:bridge:reply:)(v9, (uint64_t)a4, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ()partial apply, v8);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)acceptInitialInputWithInputIdentifier:(id)a3 speechData:(id)a4 reply:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a4;
  swift_retain();
  RemoteConversationService.acceptInitialInput(inputIdentifier:speechData:reply:)((uint64_t)v10, v13, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned FlowExtensionUserInputResultXPC) -> ()partial apply, v12);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)acceptWithInputData:(id)a3 speechData:(id)a4 reply:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  id v8 = a3;
  id v13 = a4;
  swift_retain();
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v7;
  RemoteConversationService.accept(inputData:speechData:reply:)(v9, v11, v13, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationFlexibleExecutionSupportXPC) -> (), v12);
  swift_release();
  outlined consume of Data._Representation(v9, v11);
  swift_release();
}

- (void)prepareWithBridge:(id)a3 reply:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = one-time initialization token for executor;
  swift_unknownObjectRetain();
  swift_retain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  uint64_t v14 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v16 = static ConversationActor.shared;
  uint64_t v17 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v15, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v16;
  v18[3] = v17;
  v18[4] = self;
  v18[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ();
  v18[6] = v10;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&closure #1 in RemoteConversationService.prepare(bridge:reply:)partial apply, (uint64_t)v18);
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)paraphraseWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = one-time initialization token for executor;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = static ConversationActor.shared;
  uint64_t v16 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v14, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = self;
  v17[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationFlexibleExecutionSupportXPC) -> ();
  v17[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in RemoteConversationService.paraphrase(reply:)partial apply, (uint64_t)v17);
  swift_release();
  swift_release();
  swift_release();
}

- (void)commitWithBridge:(id)a3 reply:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = one-time initialization token for executor;
  swift_unknownObjectRetain();
  swift_retain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  uint64_t v14 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v16 = static ConversationActor.shared;
  uint64_t v17 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v15, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v16;
  v18[3] = v17;
  v18[4] = self;
  v18[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationFlexibleExecutionSupportXPC) -> ();
  v18[6] = v10;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&closure #1 in RemoteConversationService.commit(bridge:reply:)partial apply, (uint64_t)v18);
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)isEmptyWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = one-time initialization token for executor;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = static ConversationActor.shared;
  uint64_t v16 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v14, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = self;
  v17[5] = thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool) -> ()partial apply;
  v17[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in RemoteConversationService.isEmpty(reply:)partial apply, (uint64_t)v17);
  swift_release();
  swift_release();
  swift_release();
}

- (void)drainAsyncWorkWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = one-time initialization token for shared;
  swift_retain_n();
  swift_retain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = static ConversationActor.shared;
  uint64_t v14 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v12, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v13;
  v15[3] = v14;
  v15[4] = self;
  v15[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ();
  v15[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in RemoteConversationService.drainAsyncWork(reply:)partial apply, (uint64_t)v15);
  swift_release();
  swift_release();
  swift_release();
}

- (void)flexibleExecutionSupportOptionsWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = one-time initialization token for executor;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = static ConversationActor.shared;
  uint64_t v16 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v14, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = self;
  v17[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationFlexibleExecutionSupportXPC) -> ();
  v17[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in RemoteConversationService.flexibleExecutionSupportOptions(reply:)partial apply, (uint64_t)v17);
  swift_release();
  swift_release();
  swift_release();
}

- (void)isCorrectableWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = one-time initialization token for executor;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = static ConversationActor.shared;
  uint64_t v16 = _s14SiriKitRuntime17ConversationActorCACScAAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, v14, (void (*)(uint64_t))type metadata accessor for ConversationActor);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = self;
  v17[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool) -> ();
  v17[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in RemoteConversationService.isCorrectable(reply:)partial apply, (uint64_t)v17);
  swift_release();
  swift_release();
  swift_release();
}

@end