@interface _RTCReportingS
+ (BOOL)closeEphemeralSessiontWithSessionId:(id)a3;
+ (BOOL)sendOneMessageWithSessionInfo:(id)a3 userInfo:(id)a4 category:(unsigned __int16)a5 type:(unsigned __int16)a6 payload:(id)a7 error:(id *)a8;
+ (id)_privacyLogs:(id *)a3;
+ (id)createEphemeralSessionWithSessionInfo:(id)a3 userInfo:(id)a4 error:(id *)a5;
+ (id)getPersistentIdentifierForDNU:(BOOL)a3;
+ (id)newHierarchyTokenFromParentToken:(id)a3;
+ (void)updateEarlyCacheLimitWithNewLimit:(int64_t)a3;
- (BOOL)registerPeriodicTaskForModule:(unsigned int)a3 needToUpdate:(BOOL)a4 needToReport:(BOOL)a5 serviceBlock:(id)a6;
- (BOOL)sendMessageWithCategory:(unsigned __int16)a3 type:(unsigned __int16)a4 payload:(id)a5 error:(id *)a6;
- (BOOL)sendMessageWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)serverSupportsFileUpload;
- (BOOL)setDigestKey:(id)a3 algorithm:(int)a4;
- (BOOL)uploadDataArray:(id)a3 completionHandler:(id)a4;
- (BOOL)uploadFileWithURL:(id)a3 completionHandler:(id)a4;
- (RTCReportingMessageSentNotifier)messageSentDelegate;
- (_RTCReportingS)init;
- (_RTCReportingS)initWithSessionInfo:(id)a3 userInfo:(id)a4 frameworksToCheck:(id)a5;
- (_RTCReportingS)initWithSessionInfo:(id)a3 userInfo:(id)a4 frameworksToCheck:(id)a5 aggregationBlock:(id)a6;
- (id)getReportingSessionID;
- (id)messageLoggingBlock;
- (void)dealloc;
- (void)fetchReportingStatesWithUserInfo:(id)a3 fetchComplete:(id)a4;
- (void)flushMessages;
- (void)flushMessagesWithCompletion:(id)a3;
- (void)setMessageLoggingBlock:(id)a3;
- (void)setMessageSentDelegate:(id)a3;
- (void)startConfigurationWithCompletionHandler:(id)a3;
- (void)startLogTimerWithInterval:(int)a3 reportingMultiplier:(int)a4 category:(unsigned __int16)a5 type:(unsigned __int16)a6;
- (void)stopLogTimer;
- (void)terminateSessionWithCompletion:(id)a3;
- (void)unregisterPeriodTaskForModule:(unsigned int)a3;
- (void)updateSharedDataForKey:(id)a3 value:(id)a4;
- (void)updateSharedDataWithDictionary:(id)a3;
@end

@implementation _RTCReportingS

- (_RTCReportingS)initWithSessionInfo:(id)a3 userInfo:(id)a4 frameworksToCheck:(id)a5
{
  uint64_t v6 = sub_193668488();
  uint64_t v7 = sub_193668488();
  if (a5) {
    uint64_t v8 = sub_193668598();
  }
  else {
    uint64_t v8 = 0;
  }
  return (_RTCReportingS *)_RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:)(v6, v7, v8);
}

+ (id)newHierarchyTokenFromParentToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)static _RTCReportingS.newHierarchyTokenFromParentToken(_:)(a3);

  return v5;
}

- (void)startConfigurationWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_193654B0C;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = self;
  _RTCReportingS.startConfiguration(completionHandler:)((void (*)(void))v7, (os_unfair_lock_s *)v6);
  sub_19364ACA4((uint64_t)v7);
}

- (_RTCReportingS)initWithSessionInfo:(id)a3 userInfo:(id)a4 frameworksToCheck:(id)a5 aggregationBlock:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_193668488();
  if (a4) {
    a4 = (id)sub_193668488();
  }
  if (a5) {
    a5 = (id)sub_193668598();
  }
  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    v10 = sub_193663374;
  }
  else
  {
    v10 = 0;
  }
  return (_RTCReportingS *)_RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:aggregationBlock:)(v9, (uint64_t)a4, (uint64_t)a5, (uint64_t)v10);
}

- (id)getReportingSessionID
{
  v2 = self;
  _RTCReportingS.getReportingSessionID()();

  v3 = (void *)sub_193668508();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)sendMessageWithDictionary:(id)a3 error:(id *)a4
{
  if (a3) {
    uint64_t v6 = (void *)sub_193668488();
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  v12.value._rawValue = v6;
  _RTCReportingS.sendMessage(dictionary:)(v12);

  swift_bridgeObjectRelease();
  if (v8)
  {
    if (a4)
    {
      uint64_t v9 = (void *)sub_1936682A8();

      id v10 = v9;
      *a4 = v9;
    }
    else
    {
    }
  }
  return v8 == 0;
}

- (void).cxx_destruct
{
  sub_19364ACA4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____RTCReportingS_messageLoggingBlock));
  sub_193654B88((uint64_t)self + OBJC_IVAR____RTCReportingS_messageSentDelegate);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  _RTCReportingS.__deallocating_deinit();
}

- (id)messageLoggingBlock
{
  uint64_t v2 = _RTCReportingS.messageLoggingBlock.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_19365DE8C;
    v6[3] = &block_descriptor_50_0;
    id v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setMessageLoggingBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    id v4 = sub_19366337C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = self;
  _RTCReportingS.messageLoggingBlock.setter((uint64_t)v4, v5);
}

- (RTCReportingMessageSentNotifier)messageSentDelegate
{
  uint64_t v2 = (void *)_RTCReportingS.messageSentDelegate.getter();
  return (RTCReportingMessageSentNotifier *)v2;
}

- (void)setMessageSentDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _RTCReportingS.messageSentDelegate.setter();
}

- (void)fetchReportingStatesWithUserInfo:(id)a3 fetchComplete:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_193668488();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    uint64_t v8 = sub_193654B10;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v9 = self;
  _RTCReportingS.fetchReportingStates(userInfo:fetchComplete:)(v6, v8, v7);
  sub_19364ACA4((uint64_t)v8);
  swift_bridgeObjectRelease();
}

- (BOOL)sendMessageWithCategory:(unsigned __int16)a3 type:(unsigned __int16)a4 payload:(id)a5 error:(id *)a6
{
  if (a5) {
    id v10 = (void *)sub_193668488();
  }
  else {
    id v10 = 0;
  }
  v11 = self;
  v16.value._rawValue = v10;
  _RTCReportingS.sendMessage(category:type:payload:)(a3, a4, v16);

  swift_bridgeObjectRelease();
  if (v12)
  {
    if (a6)
    {
      v13 = (void *)sub_1936682A8();

      id v14 = v13;
      *a6 = v13;
    }
    else
    {
    }
  }
  return v12 == 0;
}

- (void)flushMessages
{
  uint64_t v2 = self;
  _RTCReportingS.flushMessages()();
}

- (void)flushMessagesWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_193665430;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = self;
  _RTCReportingS.flushMessages(completion:)((uint64_t)v7, (os_unfair_lock_s *)v6);
  sub_19364ACA4((uint64_t)v7);
}

+ (id)getPersistentIdentifierForDNU:(BOOL)a3
{
  uint64_t v3 = (void *)sub_193668508();
  swift_bridgeObjectRelease();
  return v3;
}

+ (BOOL)sendOneMessageWithSessionInfo:(id)a3 userInfo:(id)a4 category:(unsigned __int16)a5 type:(unsigned __int16)a6 payload:(id)a7 error:(id *)a8
{
  uint64_t v11 = sub_193668488();
  uint64_t v12 = sub_193668488();
  if (a7) {
    a7 = (id)sub_193668488();
  }
  swift_getObjCClassMetadata();
  static _RTCReportingS.sendOneMessage(sessionInfo:userInfo:category:type:payload:)(v11, v12, a5, a6, (uint64_t)a7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

+ (id)createEphemeralSessionWithSessionInfo:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  sub_193668488();
  sub_193668488();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_193668508();
  swift_bridgeObjectRelease();
  return v5;
}

+ (BOOL)closeEphemeralSessiontWithSessionId:(id)a3
{
  return 0;
}

- (void)updateSharedDataWithDictionary:(id)a3
{
  sub_193668488();
  id v4 = self;
  _RTCReportingS.updateSharedData(dictionary:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)updateSharedDataForKey:(id)a3 value:(id)a4
{
  sub_193668518();
  id v6 = a4;
  v7._countAndFlagsBits = (uint64_t)self;
  countAndFlagsBits = (void *)v7._countAndFlagsBits;
  _RTCReportingS.updateSharedData(key:value:)(v7, v9);

  swift_bridgeObjectRelease();
}

- (void)startLogTimerWithInterval:(int)a3 reportingMultiplier:(int)a4 category:(unsigned __int16)a5 type:(unsigned __int16)a6
{
  id v10 = self;
  _RTCReportingS.startLogTimer(interval:reportingMultiplier:category:type:)(a3, a4, a5, a6);
}

- (void)stopLogTimer
{
  uint64_t v2 = self;
  _RTCReportingS.stopLogTimer()();
}

- (BOOL)registerPeriodicTaskForModule:(unsigned int)a3 needToUpdate:(BOOL)a4 needToReport:(BOOL)a5 serviceBlock:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = self;
  _RTCReportingS.registerPeriodicTask(module:needToUpdate:needToReport:serviceBlock:)(v8, a4, a5, (uint64_t)sub_193663360, v11);
  char v14 = v13;

  swift_release();
  return v14 & 1;
}

- (void)unregisterPeriodTaskForModule:(unsigned int)a3
{
  id v4 = self;
  _RTCReportingS.unregisterPeriodicTask(module:)(a3);
}

- (BOOL)serverSupportsFileUpload
{
  return 0;
}

- (BOOL)uploadFileWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    id v6 = sub_1936653C4;
  }
  id v7 = a3;
  uint64_t v8 = self;
  _RTCReportingS.uploadFile(URL:completionHandler:)();
  sub_19364ACA4((uint64_t)v6);

  return 0;
}

- (BOOL)uploadDataArray:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_193668598();
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    uint64_t v5 = sub_193663344;
  }
  id v6 = self;
  _RTCReportingS.uploadFile(URL:completionHandler:)();
  sub_19364ACA4((uint64_t)v5);

  swift_bridgeObjectRelease();
  return 0;
}

- (BOOL)setDigestKey:(id)a3 algorithm:(int)a4
{
  return 0;
}

- (void)terminateSessionWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v7 = sub_193663334;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = self;
  _RTCReportingS.terminateSession(completion:)((uint64_t)v7, (os_unfair_lock_s *)v6);
  sub_19364ACA4((uint64_t)v7);
}

+ (void)updateEarlyCacheLimitWithNewLimit:(int64_t)a3
{
}

+ (id)_privacyLogs:(id *)a3
{
  static _RTCReportingS._privacyLogs()();
  sub_193668328();
  uint64_t v3 = (void *)sub_193668588();
  swift_bridgeObjectRelease();
  return v3;
}

- (_RTCReportingS)init
{
}

@end