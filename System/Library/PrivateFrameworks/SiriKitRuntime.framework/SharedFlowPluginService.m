@interface SharedFlowPluginService
- (void)endTurnWithReply:(id)a3;
- (void)loadFlowPluginWithBundleId:(id)a3 bundlePath:(id)a4 rcId:(id)a5 hypothesisId:(id)a6 reply:(id)a7;
- (void)startTurnWithTurnData:(id)a3 bridge:(id)a4 reply:(id)a5;
@end

@implementation SharedFlowPluginService

- (void)startTurnWithTurnData:(id)a3 bridge:(id)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = one-time initialization token for executor;
  id v15 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  __swift_project_value_buffer(v16, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  v17 = (void *)swift_allocObject();
  v17[2] = self;
  v17[3] = v15;
  v17[4] = a4;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v11, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &closure #1 in SharedFlowPluginService.startTurn(turnData:bridge:reply:)partial apply;
  v19[5] = v17;
  v19[6] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ();
  v19[7] = v13;
  id v20 = v15;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v11, (uint64_t)&closure #1 in static AsyncTaskUtils.taskWithCatchingCompletion(completion:do:)partial apply, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)loadFlowPluginWithBundleId:(id)a3 bundlePath:(id)a4 rcId:(id)a5 hypothesisId:(id)a6 reply:(id)a7
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v10 - 8);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a7);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  if (!a5)
  {
    uint64_t v20 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v23 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v12, 1, 1, v23);
    goto LABEL_6;
  }
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a5 = v21;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = type metadata accessor for UUID();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 0, 1, v22);
LABEL_6:
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v13;
  swift_retain();
  SharedFlowPluginService.loadFlowPlugin(bundleId:bundlePath:rcId:hypothesisId:reply:)(v14, v16, v17, v19, v20, (uint64_t)a5, (uint64_t)v12, (uint64_t)_s14SiriKitRuntime27ConversationCanHandleResultCIeyBhy_ACIeghg_TRTA_0, v24);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v12, (uint64_t *)&demangling cache variable for type metadata for UUID?);
}

- (void)endTurnWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
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
  uint64_t v14 = static ConversationActor.shared;
  unint64_t v15 = lazy protocol witness table accessor for type ConversationActor and conformance ConversationActor();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v14;
  v16[3] = v15;
  v16[4] = self;
  v16[5] = _sIeyBh_Iegh_TRTA_0;
  v16[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in SharedFlowPluginService.endTurn(reply:)partial apply, (uint64_t)v16);
  swift_release();
  swift_release();
  swift_release();
}

@end