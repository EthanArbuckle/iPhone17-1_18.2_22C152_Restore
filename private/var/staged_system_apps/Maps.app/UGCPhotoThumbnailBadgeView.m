@interface UGCPhotoThumbnailBadgeView
+ (UIFont)attributionFont;
- (NSAttributedString)attributedText;
- (_TtC4Maps26UGCPhotoThumbnailBadgeView)initWithCoder:(id)a3;
- (_TtC4Maps26UGCPhotoThumbnailBadgeView)initWithFrame:(CGRect)a3;
- (void)setAttributedText:(id)a3;
@end

@implementation UGCPhotoThumbnailBadgeView

- (_TtC4Maps26UGCPhotoThumbnailBadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps26UGCPhotoThumbnailBadgeView *)sub_100356D84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps26UGCPhotoThumbnailBadgeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText) = 0;
  id v4 = a3;

  result = (_TtC4Maps26UGCPhotoThumbnailBadgeView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText));
}

- (void)setAttributedText:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText) = (Class)a3;
  id v7 = a3;
  v6 = self;

  [*(id *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_label) setAttributedText:*(Class *)((char *)&self->super.super.super.isa + v4)];
}

+ (UIFont)attributionFont
{
  id v2 = [self preferredFontForTextStyle:UIFontTextStyleCaption2];

  return (UIFont *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_labelVibrantView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_blurView);
}

@end