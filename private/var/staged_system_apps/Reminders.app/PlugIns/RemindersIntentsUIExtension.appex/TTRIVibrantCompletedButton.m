@interface TTRIVibrantCompletedButton
- (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton)init;
- (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton)initWithCoder:(id)a3;
- (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIVibrantCompletedButton

- (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton)init
{
  return (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton *)sub_1000139EC();
}

- (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton)initWithCoder:(id)a3
{
  return (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton *)sub_100013AFC(a3);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRIVibrantCompletedButton();
  v2 = (char *)v4.receiver;
  [(TTRIVibrantCompletedButton *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage];
  [v2 intrinsicContentSize];
  [v3 frame];
  [v3 setFrame:];
}

- (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton)initWithFrame:(CGRect)a3
{
  result = (_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->superclass_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image];
}

@end