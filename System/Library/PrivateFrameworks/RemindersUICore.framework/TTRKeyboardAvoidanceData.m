@interface TTRKeyboardAvoidanceData
- (_TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData)init;
@end

@implementation TTRKeyboardAvoidanceData

- (_TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willShowNotificationToken);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willHideNotificationToken);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  v6 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willChangeFrameNotificationToken);
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(TTRKeyboardAvoidanceData *)&v8 init];
}

- (void).cxx_destruct
{
  sub_1B922A57C((uint64_t)self+ OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willShowNotificationToken);
  sub_1B922A57C((uint64_t)self+ OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willHideNotificationToken);
  v3 = (char *)self
     + OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willChangeFrameNotificationToken;

  sub_1B922A57C((uint64_t)v3);
}

@end