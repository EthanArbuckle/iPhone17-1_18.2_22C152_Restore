@interface TTRIVibrantTemplateImageView
- (CGSize)intrinsicContentSize;
- (_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView)initWithCoder:(id)a3;
- (_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView)initWithEffect:(id)a3;
@end

@implementation TTRIVibrantTemplateImageView

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView)initWithCoder:(id)a3
{
  return (_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView *)sub_100013580(a3);
}

- (_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView)initWithEffect:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView);
}

@end