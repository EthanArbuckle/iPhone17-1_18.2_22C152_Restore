@interface DewConfigurationObjectiveC
- (BOOL)fastWatchdogExit;
- (_TtC13transparencyd26DewConfigurationObjectiveC)init;
- (_TtC13transparencyd26DewConfigurationObjectiveC)initWithSettings:(id)a3;
- (double)coreDataInitialDelaySync;
- (double)resetEnvLogClientNetworkTimeout;
- (double)selfValidateCloudKitTimeout;
- (double)selfValidationEnrollment;
- (id)dewConfig;
- (unint64_t)validatePendingSMTLimit;
- (unint64_t)validatePendingURILimit;
- (void)overrideCoreDataInitialDelaySyncWithTimeInterval:(double)a3;
- (void)overrideSelfValidateCloudKitTimeoutWithTimeInterval:(double)a3;
- (void)overrideSelfValidationEnrollmentWithTimeInterval:(double)a3;
- (void)printAllDescriptions;
- (void)updateDewConfigurationWithData:(id)a3;
@end

@implementation DewConfigurationObjectiveC

- (_TtC13transparencyd26DewConfigurationObjectiveC)initWithSettings:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC13transparencyd26DewConfigurationObjectiveC *)sub_1000973BC((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (id)dewConfig
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x90);
  v3 = self;
  v4 = (void *)v2();

  return v4;
}

- (double)selfValidationEnrollment
{
  return sub_100094D2C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_selfValidsationEnrollment);
}

- (void)overrideSelfValidationEnrollmentWithTimeInterval:(double)a3
{
}

- (double)coreDataInitialDelaySync
{
  return sub_100094D2C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_initialDelaySync);
}

- (void)overrideCoreDataInitialDelaySyncWithTimeInterval:(double)a3
{
}

- (unint64_t)validatePendingURILimit
{
  return sub_100094B0C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_validatePendingURILimitConfig);
}

- (unint64_t)validatePendingSMTLimit
{
  return sub_100094B0C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_validatePendingSMTLimitConfig);
}

- (double)selfValidateCloudKitTimeout
{
  return sub_100094D2C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_selfValidateCloudKitTimeoutConfig);
}

- (void)overrideSelfValidateCloudKitTimeoutWithTimeInterval:(double)a3
{
}

- (double)resetEnvLogClientNetworkTimeout
{
  return sub_100094D2C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_resetEnvLogClientNetworkTimeoutConfig);
}

- (BOOL)fastWatchdogExit
{
  void (*v2)(BOOL *__return_ptr);
  _TtC13transparencyd26DewConfigurationObjectiveC *v3;
  BOOL v5;

  v2 = *(void (**)(BOOL *__return_ptr))(**(void **)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC13transparencyd26DewConfigurationObjectiveC_fastWatchDogExit)
                                                   + 200);
  v3 = self;
  v2(&v5);

  return v5;
}

- (void)printAllDescriptions
{
  uint64_t v2 = qword_100329D38;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  (*(void (**)(void))(*(void *)qword_100329D40 + 160))();
}

- (void)updateDewConfigurationWithData:(id)a3
{
  id v4 = a3;
  v9 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  v8 = (void *)(*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v9->super.isa) + 0x90))();
  (*(void (**)(uint64_t, unint64_t))((swift_isaMask & *v8) + 0x80))(v5, v7);

  sub_100080CB0(v5, v7);
}

- (_TtC13transparencyd26DewConfigurationObjectiveC)init
{
  result = (_TtC13transparencyd26DewConfigurationObjectiveC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end