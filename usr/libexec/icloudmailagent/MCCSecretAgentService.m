@interface MCCSecretAgentService
- (_TtC15icloudmailagent21MCCSecretAgentService)init;
- (void)clearAllUserOverridesWithTimestamp:(double)a3 completion:(id)a4;
- (void)createWebRule:(id)a3 completion:(id)a4;
- (void)fetchSigningAndEncryptingStatusForEmailAddress:(id)a3 completion:(id)a4;
- (void)fetchSigningAndEncrytionMessagesStatusForEmailAddress:(id)a3 completion:(id)a4;
- (void)generateCertificateWithContext:(id)a3 completion:(id)a4;
- (void)getBlackPearlVersionWithCompletion:(id)a3;
- (void)getIABCategoryID:(id)a3 completion:(id)a4;
- (void)invokeModelDownloadWithCompletion:(id)a3;
- (void)isModelReadyWithCompletion:(id)a3;
- (void)isPersonalDomain:(id)a3 completion:(id)a4;
- (void)listCertificatesForEmail:(id)a3 completion:(id)a4;
- (void)listCertificatesWithCompletion:(id)a3;
- (void)notifyWebRule:(id)a3 completion:(id)a4;
- (void)pingWithcompletion:(id)a3;
- (void)predictCommerceEmailWithContext:(id)a3 completion:(id)a4;
- (void)refreshCertificateWithContext:(id)a3 certId:(id)a4 completion:(id)a5;
- (void)registerCategoryRulesCallbackListener:(id)a3 completion:(id)a4;
- (void)sendPendingRulesWithType:(id)a3 completion:(id)a4;
- (void)setEncryptIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5;
- (void)setSignIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5;
- (void)setSigningAndEncrytingStatusTo:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5;
- (void)syncRecategorizationRules:(id)a3 completion:(id)a4;
- (void)updateCertificateDefaultsForEmailAddress:(id)a3 certInfo:(id)a4 completion:(id)a5;
@end

@implementation MCCSecretAgentService

- (_TtC15icloudmailagent21MCCSecretAgentService)init
{
  return (_TtC15icloudmailagent21MCCSecretAgentService *)sub_10002B424();
}

- (void)pingWithcompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = qword_100063E90;
  v10 = self;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100008D9C(v6, (uint64_t)qword_1000679D0);
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "MCCSecretAgentService ping", v9, 2u);
    swift_slowDealloc();
  }

  (*((void (**)(void *, uint64_t, void))v4 + 2))(v4, 1, 0);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)generateCertificateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = qword_100063E90;
  id v8 = a3;
  v13 = self;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100008D9C(v9, (uint64_t)qword_1000679D0);
  v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "MCCSecretAgentService generateCertificateWithContext is called", v12, 2u);
    swift_slowDealloc();
  }

  _Block_release(v6);
}

- (void)listCertificatesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = qword_100063E90;
  v10 = self;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100008D9C(v6, (uint64_t)qword_1000679D0);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "MCCSecretAgentService listCertificatesWithCompletion is called", v9, 2u);
    swift_slowDealloc();
  }

  _Block_release(v4);
}

- (void)listCertificatesForEmail:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  uint64_t v9 = self;
  sub_10002CB04(v6, v8);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)fetchSigningAndEncryptingStatusForEmailAddress:(id)a3 completion:(id)a4
{
}

- (void)fetchSigningAndEncrytionMessagesStatusForEmailAddress:(id)a3 completion:(id)a4
{
}

- (void)setEncryptIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
}

- (void)setSignIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
}

- (void)setSigningAndEncrytingStatusTo:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
}

- (void)updateCertificateDefaultsForEmailAddress:(id)a3 certInfo:(id)a4 completion:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = qword_100063E90;
  v12 = self;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100008D9C(v8, (uint64_t)qword_1000679D0);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "MCCSecretAgentService updateCertificateDefaultsForEmailAddress is called", v11, 2u);
    swift_slowDealloc();
  }

  _Block_release(v6);
}

- (void)refreshCertificateWithContext:(id)a3 certId:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = qword_100063E90;
  id v9 = a3;
  v14 = self;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_100008D9C(v10, (uint64_t)qword_1000679D0);
  os_log_type_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "RefreshCertificate MCCSecretAgentService refreshCertificateWithContext is called", v13, 2u);
    swift_slowDealloc();
  }

  _Block_release(v7);
}

- (void)predictCommerceEmailWithContext:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_10002CCAC(v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)isModelReadyWithCompletion:(id)a3
{
}

- (void)invokeModelDownloadWithCompletion:(id)a3
{
}

- (void)registerCategoryRulesCallbackListener:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager);
  _Block_copy(v6);
  id v8 = a3;
  id v9 = self;
  sub_10003CA3C((uint64_t)v8, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)getIABCategoryID:(id)a3 completion:(id)a4
{
}

- (void)isPersonalDomain:(id)a3 completion:(id)a4
{
}

- (void)getBlackPearlVersionWithCompletion:(id)a3
{
}

- (void)sendPendingRulesWithType:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager);
  _Block_copy(v5);
  uint64_t v10 = self;
  sub_10003D714(v6, v8, v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)createWebRule:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_10002D124((uint64_t)a3, (uint64_t)v7, v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (void)syncRecategorizationRules:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_10002D5A0();
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = self;
  sub_10002D258(v6);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)notifyWebRule:(id)a3 completion:(id)a4
{
  unint64_t v6 = (void (**)(void *, uint64_t, void))_Block_copy(a4);
  sub_100008E28(&qword_100063F58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004DF50;
  *(void *)(inited + 32) = a3;
  uint64_t v10 = inited;
  specialized Array._endMutation()();
  id v8 = a3;
  id v9 = self;
  sub_10003B910(v10);
  swift_bridgeObjectRelease();
  v6[2](v6, 1, 0);
  _Block_release(v6);
}

- (void)clearAllUserOverridesWithTimestamp:(double)a3 completion:(id)a4
{
  unint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_10002D450((uint64_t)v7, (uint64_t)v6, a3);
  _Block_release(v6);
  _Block_release(v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationSyncManager));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_apnsManager);
}

@end