@interface ServiceBridgeErrorHandlingProxy
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

@implementation ServiceBridgeErrorHandlingProxy

- (void)submitWithExecutionOutput:(id)a3 completion:(id)a4
{
}

- (void)closeWithExecutionOutput:(id)a3
{
}

- (void)closeWithExecutionOutput:(id)a3 errorString:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  id v12 = a3;
  uint64_t v8 = swift_retain();
  uint64_t v9 = specialized ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:)(v8, (uint64_t)specialized closure #1 in ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:), (uint64_t)&block_descriptor_300);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1BA9E2DD0](v5, v7);
    objc_msgSend(v10, sel_closeWithExecutionOutput_errorString_, v12, v11);
    swift_release();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
}

- (void)closeWithExecutionOutput:(id)a3 needsUserInput:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = swift_retain();
  uint64_t v7 = (void *)specialized ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:)(v6, (uint64_t)specialized closure #1 in ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:), (uint64_t)&block_descriptor_297);
  if (v7)
  {
    objc_msgSend(v7, sel_closeWithExecutionOutput_needsUserInput_, v5, v4);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_release();
  }
}

- (void)flowPluginWillExecuteWithFlowPluginInfo:(id)a3
{
}

- (void)fallbackToServerForResultCandidateId:(id)a3
{
}

- (void)fallbackToInfoDomainResultsForResultCandidateId:(id)a3
{
}

- (void)prepareForAudioHandoffWithCompletion:(id)a3
{
}

- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3
{
}

- (void)fetchContextsFor:(id)a3 includesNearByDevices:(BOOL)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v7);
  swift_retain();
  specialized ServiceBridgeErrorHandlingProxy.fetchContexts(for:includesNearByDevices:completion:)(v8, a4, (uint64_t)self, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)fetchSpeechInfoWithReply:(id)a3
{
}

- (void)retriggerOriginalRequestWithExecutionRequestId:(id)a3 forUserId:(id)a4 givenCurrentExecutionRequestId:(id)a5 reply:(id)a6
{
  uint64_t v7 = _Block_copy(a6);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  _Block_copy(v7);
  swift_retain();
  specialized ServiceBridgeErrorHandlingProxy.retriggerOriginalRequest(withExecutionRequestId:forUserId:givenCurrentExecutionRequestId:reply:)(v8, v10, v11, v13, v14, v16, (uint64_t)self, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)closeServerRequestForExecutionRequestId:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  swift_retain();
  uint64_t v7 = specialized ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:)((uint64_t)self, (uint64_t)specialized closure #1 in ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:), (uint64_t)&block_descriptor_200);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = (void *)MEMORY[0x1BA9E2DD0](v4, v6);
    objc_msgSend(v8, sel_closeServerRequestForExecutionRequestId_, v9);
    swift_release();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
}

- (void)fetchRecentDialogsWithReply:(id)a3
{
}

- (void)submitExternalActivationRequestWithRequestInfo:(id)a3 completion:(id)a4
{
}

- (void)postToMessageBusWithMessage:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  swift_retain();
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  _Block_copy(v6);
  specialized ServiceBridgeErrorHandlingProxy.postToMessageBus(message:completion:)(v8, v10, (uint64_t)self, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  outlined consume of Data._Representation(v8, v10);

  swift_release();
}

@end