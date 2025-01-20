@interface HeadphoneNotificationChartFactory
+ (id)create;
- (_TtC6Bridge33HeadphoneNotificationChartFactory)init;
@end

@implementation HeadphoneNotificationChartFactory

+ (id)create
{
  v2 = (void *)*HeadphoneAudioNotificationModel.shared.unsafeMutableAddressor();
  type metadata accessor for HeadphoneAudioNotificationModel();
  sub_100144628(&qword_10029A468, (void (*)(uint64_t))type metadata accessor for HeadphoneAudioNotificationModel);
  id v3 = v2;
  ObservedObject.init(wrappedValue:)();
  id v4 = objc_allocWithZone((Class)sub_10013385C(&qword_10029A8D8));
  v5 = (void *)UIHostingController.init(rootView:)();

  return v5;
}

- (_TtC6Bridge33HeadphoneNotificationChartFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HeadphoneNotificationChartFactory();
  return [(HeadphoneNotificationChartFactory *)&v3 init];
}

@end