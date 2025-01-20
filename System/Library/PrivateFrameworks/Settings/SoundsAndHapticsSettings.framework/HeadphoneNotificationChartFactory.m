@interface HeadphoneNotificationChartFactory
+ (id)create;
- (_TtC24SoundsAndHapticsSettings33HeadphoneNotificationChartFactory)init;
@end

@implementation HeadphoneNotificationChartFactory

+ (id)create
{
  if (qword_2689176C8 != -1) {
    swift_once();
  }
  v2 = (void *)static HeadphoneAudioNotificationModel.shared;
  type metadata accessor for HeadphoneAudioNotificationModel();
  sub_23731E3A0(&qword_2689176F8, (void (*)(uint64_t))type metadata accessor for HeadphoneAudioNotificationModel);
  id v3 = v2;
  sub_2373229A0();
  id v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268917740));
  v5 = (void *)sub_237322A70();
  return v5;
}

- (_TtC24SoundsAndHapticsSettings33HeadphoneNotificationChartFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HeadphoneNotificationChartFactory();
  return [(HeadphoneNotificationChartFactory *)&v3 init];
}

@end