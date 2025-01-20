@interface NotificationSummarizationOnboardingViewModel
+ (BOOL)supportsSecureCoding;
+ (unint64_t)experience;
- (BOOL)isEqual:(id)a3;
- (_TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel)init;
- (_TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)saveWithOutcome:(unint64_t)a3;
@end

@implementation NotificationSummarizationOnboardingViewModel

+ (unint64_t)experience
{
  return 0;
}

- (_TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel)init
{
  return (_TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel *)sub_220165A8C();
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_2201666EC();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2201826D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_220166A4C((uint64_t)v8);

  sub_22014ACAC((uint64_t)v8, &qword_267F0ABB0);
  return v6 & 1;
}

- (id)copyWithZone:(void *)a3
{
  int64_t v3 = self;
  sub_220166E6C(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_220182900();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_220167128(v4);
}

- (_TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel)initWithCoder:(id)a3
{
  return (_TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel *)sub_220167A38(a3);
}

- (void)saveWithOutcome:(unint64_t)a3
{
  id v4 = self;
  sub_220168F4C(a3);
  sub_22016949C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  int64_t v3 = (char *)self
     + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel___observationRegistrar;
  uint64_t v4 = sub_220181C30();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end