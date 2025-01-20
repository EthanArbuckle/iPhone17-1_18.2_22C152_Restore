@interface MixedMediaLockupPlaceholderView
- (_TtC8AppStore31MixedMediaLockupPlaceholderView)initWithCoder:(id)a3;
- (_TtC8AppStore31MixedMediaLockupPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MixedMediaLockupPlaceholderView

- (_TtC8AppStore31MixedMediaLockupPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31MixedMediaLockupPlaceholderView *)sub_100405E00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31MixedMediaLockupPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100406C4C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100406588();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31MixedMediaLockupPlaceholderView_artworkPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31MixedMediaLockupPlaceholderView_smallLockupPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31MixedMediaLockupPlaceholderView_supplementaryTextPlaceholder));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore31MixedMediaLockupPlaceholderView_contentType;
  uint64_t v4 = type metadata accessor for Shelf.ContentType();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end