@interface GMAvailabilityViewModel
- (BOOL)hasCameraButton;
- (BOOL)isBuddy;
- (BOOL)isBuddyOrCFU;
- (BOOL)showNotNowWithEnrollmentType:(unint64_t)a3;
- (_TtC14VoiceTriggerUI23GMAvailabilityViewModel)init;
- (id)continueButtonTitleKeyWithEnrollmentType:(unint64_t)a3;
- (id)subtitleKeyWithEnrollmentType:(unint64_t)a3;
- (id)titleKeyWithEnrollmentType:(unint64_t)a3;
- (unint64_t)enrollmentType;
- (void)sendCancelEventWithEnrollmentType:(unint64_t)a3;
- (void)sendContinueEventWithEnrollmentType:(unint64_t)a3;
- (void)sendViewDidLoadEventWithEnrollmentType:(unint64_t)a3;
@end

@implementation GMAvailabilityViewModel

- (_TtC14VoiceTriggerUI23GMAvailabilityViewModel)init
{
  return (_TtC14VoiceTriggerUI23GMAvailabilityViewModel *)GMAvailabilityViewModel.init()();
}

- (BOOL)isBuddy
{
  return sub_2388BDF1C() & 1;
}

- (BOOL)isBuddyOrCFU
{
  v2 = self;
  if (sub_2388BDF1C()) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = objc_msgSend(*(id *)((char *)&v2->super.isa+ OBJC_IVAR____TtC14VoiceTriggerUI23GMAvailabilityViewModel_vtuiStyle), sel_isBuddyOrFollowUp);
  }

  return v3;
}

- (BOOL)hasCameraButton
{
  v2 = self;
  unsigned __int8 v3 = (void *)sub_2388E0768();
  char v4 = MGGetBoolAnswer();

  return v4;
}

- (unint64_t)enrollmentType
{
  v2 = self;
  unint64_t v3 = sub_2388BCE70();

  return v3;
}

- (BOOL)showNotNowWithEnrollmentType:(unint64_t)a3
{
  return a3 == 0;
}

- (id)titleKeyWithEnrollmentType:(unint64_t)a3
{
  if (a3 - 2 >= 3 && a3 > 1)
  {
    type metadata accessor for VTUIGMEnrollmentType(0);
    v6 = self;
    id result = (id)sub_2388E09F8();
    __break(1u);
  }
  else
  {
    unint64_t v3 = (void *)sub_2388E0768();
    swift_bridgeObjectRelease();
    return v3;
  }
  return result;
}

- (id)subtitleKeyWithEnrollmentType:(unint64_t)a3
{
  sub_2388BE394(a3);
  unint64_t v3 = (void *)sub_2388E0768();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)continueButtonTitleKeyWithEnrollmentType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      unint64_t v3 = (void *)sub_2388E0768();
      swift_bridgeObjectRelease();
      return v3;
    default:
      type metadata accessor for VTUIGMEnrollmentType(0);
      id v5 = (id)0xD000000000000014;
      sub_2388E09F8();
      __break(1u);
      JUMPOUT(0x2388BD500);
  }
}

- (void)sendViewDidLoadEventWithEnrollmentType:(unint64_t)a3
{
  char v4 = self;
  sub_2388BD514(a3);
}

- (void)sendCancelEventWithEnrollmentType:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v5 = *(char **)((char *)&self->super.isa
                  + OBJC_IVAR____TtC14VoiceTriggerUI23GMAvailabilityViewModel_analyticsProvider);
    v6 = *(void (**)(unint64_t, unint64_t, uint64_t (*)(), uint64_t))&v5[OBJC_IVAR____TtC14VoiceTriggerUI19GMAnalyticsProvider_sendFunction];
    uint64_t v7 = swift_allocObject();
    *(unsigned char *)(v7 + 16) = 3;
    *(void *)(v7 + 24) = v5;
    v8 = self;
    v9 = v5;
    v6(0xD00000000000002CLL, 0x80000002388EC6E0, sub_2388BEA84, v7);

    swift_release();
  }
}

- (void)sendContinueEventWithEnrollmentType:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v5 = *(char **)((char *)&self->super.isa
                  + OBJC_IVAR____TtC14VoiceTriggerUI23GMAvailabilityViewModel_analyticsProvider);
    v6 = *(void (**)(unint64_t, unint64_t, uint64_t (*)(), uint64_t))&v5[OBJC_IVAR____TtC14VoiceTriggerUI19GMAnalyticsProvider_sendFunction];
    uint64_t v7 = swift_allocObject();
    *(unsigned char *)(v7 + 16) = 4;
    *(void *)(v7 + 24) = v5;
    v8 = self;
    v9 = v5;
    v6(0xD00000000000002CLL, 0x80000002388EC6E0, sub_2388BEA84, v7);

    swift_release();
  }
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14VoiceTriggerUI23GMAvailabilityViewModel_provider);

  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14VoiceTriggerUI23GMAvailabilityViewModel_analyticsProvider);
}

@end