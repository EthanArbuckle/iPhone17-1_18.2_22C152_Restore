@interface RAPNotificationDetailsViewModelDescriptionInfo
- (NSString)descriptionText;
- (NSString)imageName;
- (NSString)titleText;
- (RAPNotificationDetailsViewModelDescriptionInfo)init;
- (UIColor)imageBackgroundColor;
@end

@implementation RAPNotificationDetailsViewModelDescriptionInfo

- (NSString)imageName
{
  return (NSString *)sub_1001C3764((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_imageName);
}

- (UIColor)imageBackgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_imageBackgroundColor));
}

- (NSString)titleText
{
  return (NSString *)sub_1001C3764((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_titleText);
}

- (NSString)descriptionText
{
  return (NSString *)sub_1001C3764((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_descriptionText);
}

- (RAPNotificationDetailsViewModelDescriptionInfo)init
{
  result = (RAPNotificationDetailsViewModelDescriptionInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___RAPNotificationDetailsViewModelDescriptionInfo_imageBackgroundColor));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end