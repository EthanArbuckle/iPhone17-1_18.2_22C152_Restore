@interface ServiceBridgeDelegateXPCWrapper
- (void)closeServerRequestForExecutionRequestId:(id)a3;
- (void)closeWithExecutionOutput:(id)a3;
- (void)closeWithExecutionOutput:(id)a3 errorString:(id)a4;
- (void)closeWithExecutionOutput:(id)a3 needsUserInput:(BOOL)a4;
- (void)fallbackToInfoDomainResultsForResultCandidateId:(id)a3;
- (void)fallbackToServerForResultCandidateId:(id)a3;
- (void)fetchContextsFor:(id)a3 includesNearByDevices:(BOOL)a4 completion:(id)a5;
- (void)fetchRecentDialogsWithReply:(id)a3;
- (void)fetchSpeechInfoWithReply:(id)a3;
- (void)flowPluginWillExecuteWithFlowPluginInfo:(id)a3;
- (void)postToMessageBusWithMessage:(id)a3 completion:(id)a4;
- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3;
- (void)prepareForAudioHandoffWithCompletion:(id)a3;
- (void)retriggerOriginalRequestWithExecutionRequestId:(id)a3 forUserId:(id)a4 givenCurrentExecutionRequestId:(id)a5 reply:(id)a6;
- (void)submitExternalActivationRequestWithRequestInfo:(id)a3 completion:(id)a4;
- (void)submitWithExecutionOutput:(id)a3 completion:(id)a4;
@end

@implementation ServiceBridgeDelegateXPCWrapper

- (void)fetchContextsFor:(id)a3 includesNearByDevices:(BOOL)a4 completion:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 1, 1, v14);
  uint64_t v15 = one-time initialization token for shared;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  if (v15 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v16 = static MessageBusActor.shared;
  unint64_t v17 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v16;
  *(void *)(v18 + 24) = v17;
  *(void *)(v18 + 32) = self;
  *(void *)(v18 + 40) = v12;
  *(unsigned char *)(v18 + 48) = a4;
  *(void *)(v18 + 56) = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSArray?) -> ();
  *(void *)(v18 + 64) = v13;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v10, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.fetchContexts(for:includesNearByDevices:completion:)partial apply, v18);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)submitWithExecutionOutput:(id)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = one-time initialization token for shared;
  id v14 = a3;
  swift_retain_n();
  id v15 = v14;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v16 = static MessageBusActor.shared;
  unint64_t v17 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v16;
  v18[3] = v17;
  v18[4] = self;
  v18[5] = v15;
  v18[6] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned SABaseCommand?, @unowned NSError?) -> ();
  v18[7] = v11;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.submit(executionOutput:completion:)partial apply, (uint64_t)v18);

  swift_release();
  swift_release();
  swift_release();
}

- (void)flowPluginWillExecuteWithFlowPluginInfo:(id)a3
{
}

- (void)closeServerRequestForExecutionRequestId:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  uint64_t v11 = one-time initialization token for shared;
  swift_retain_n();
  swift_bridgeObjectRetain();
  if (v11 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v12 = static MessageBusActor.shared;
  unint64_t v13 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  id v14 = (void *)swift_allocObject();
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = self;
  v14[5] = v7;
  v14[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v6, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.closeServerRequest(forExecutionRequestId:)partial apply, (uint64_t)v14);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)prepareForAudioHandoffWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
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
  swift_beginAccess();
  uint64_t v12 = static MessageBusActor.shared;
  unint64_t v13 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  id v14 = (void *)swift_allocObject();
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = self;
  v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool) -> ();
  v14[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.prepareForAudioHandoff(completion:)partial apply, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();
}

- (void)closeWithExecutionOutput:(id)a3
{
}

- (void)closeWithExecutionOutput:(id)a3 errorString:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  uint64_t v13 = one-time initialization token for shared;
  id v14 = a3;
  swift_retain_n();
  id v15 = v14;
  swift_bridgeObjectRetain();
  if (v13 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v16 = static MessageBusActor.shared;
  unint64_t v17 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v16;
  v18[3] = v17;
  v18[4] = self;
  v18[5] = v15;
  v18[6] = v9;
  v18[7] = v11;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.close(withExecutionOutput:errorString:)partial apply, (uint64_t)v18);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)closeWithExecutionOutput:(id)a3 needsUserInput:(BOOL)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = one-time initialization token for shared;
  id v12 = a3;
  swift_retain_n();
  id v13 = v12;
  if (v11 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v14 = static MessageBusActor.shared;
  unint64_t v15 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v15;
  *(void *)(v16 + 32) = self;
  *(void *)(v16 + 40) = v13;
  *(unsigned char *)(v16 + 48) = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.close(withExecutionOutput:needsUserInput:)partial apply, v16);

  swift_release();
  swift_release();
}

- (void)fallbackToServerForResultCandidateId:(id)a3
{
}

- (void)fallbackToInfoDomainResultsForResultCandidateId:(id)a3
{
}

- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
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
  swift_beginAccess();
  uint64_t v12 = static MessageBusActor.shared;
  unint64_t v13 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = self;
  v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ();
  v14[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.prepareForAudioHandoffFailed(completion:)partial apply, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();
}

- (void)fetchSpeechInfoWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
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
  swift_beginAccess();
  uint64_t v12 = static MessageBusActor.shared;
  unint64_t v13 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = self;
  v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationCanHandleResult) -> ();
  v14[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.fetchSpeechInfo(reply:)partial apply, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();
}

- (void)retriggerOriginalRequestWithExecutionRequestId:(id)a3 forUserId:(id)a4 givenCurrentExecutionRequestId:(id)a5 reply:(id)a6
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a6);
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v11;
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v10, 1, 1, v20);
  uint64_t v21 = one-time initialization token for shared;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (v21 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v22 = static MessageBusActor.shared;
  unint64_t v23 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v24 = (void *)swift_allocObject();
  v24[2] = v22;
  v24[3] = v23;
  uint64_t v25 = v29;
  v24[4] = self;
  v24[5] = v25;
  uint64_t v26 = v28;
  v24[6] = v13;
  v24[7] = v26;
  v24[8] = v15;
  v24[9] = v16;
  v24[10] = v18;
  v24[11] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ();
  v24[12] = v19;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v10, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.retriggerOriginalRequest(withExecutionRequestId:forUserId:givenCurrentExecutionRequestId:reply:)partial apply, (uint64_t)v24);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)fetchRecentDialogsWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
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
  swift_beginAccess();
  uint64_t v12 = static MessageBusActor.shared;
  unint64_t v13 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = self;
  v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSArray) -> ();
  v14[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.fetchRecentDialogs(reply:)partial apply, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();
}

- (void)submitExternalActivationRequestWithRequestInfo:(id)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = one-time initialization token for shared;
  id v14 = a3;
  swift_retain_n();
  id v15 = v14;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v16 = static MessageBusActor.shared;
  unint64_t v17 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v16;
  v18[3] = v17;
  v18[4] = self;
  v18[5] = v15;
  v18[6] = thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool, @unowned NSError?) -> ()partial apply;
  v18[7] = v11;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.submitExternalActivationRequest(withRequestInfo:completion:)partial apply, (uint64_t)v18);

  swift_release();
  swift_release();
  swift_release();
}

- (void)postToMessageBusWithMessage:(id)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = a3;
  swift_retain();
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v10;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 1, 1, v16);
  swift_retain();
  outlined copy of Data._Representation(v12, v14);
  uint64_t v17 = one-time initialization token for shared;
  swift_retain();
  if (v17 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v18 = static MessageBusActor.shared;
  unint64_t v19 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v18;
  v20[3] = v19;
  v20[4] = self;
  v20[5] = v12;
  v20[6] = v14;
  v20[7] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool, @unowned NSError?) -> ();
  v20[8] = v15;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.postToMessageBus(message:completion:)partial apply, (uint64_t)v20);
  swift_release();
  swift_release();
  outlined consume of Data._Representation(v12, v14);
  swift_release();
}

@end