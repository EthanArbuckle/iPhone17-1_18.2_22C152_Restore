@interface AudiobookTOCToolbarButton
- (_TtC5Books25AudiobookTOCToolbarButton)initWithFrame:(CGRect)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)tintColorDidChange;
@end

@implementation AudiobookTOCToolbarButton

- (_TtC5Books25AudiobookTOCToolbarButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Books25AudiobookTOCToolbarButton *)sub_1005C45FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AudiobookTOCToolbarButton();
  [(AudiobookTOCToolbarButton *)&v6 setImage:a3 forState:a4];
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiobookTOCToolbarButton();
  v2 = (char *)v5.receiver;
  [(AudiobookTOCToolbarButton *)&v5 tintColorDidChange];
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Books25AudiobookTOCToolbarButton_supplementalBackgroundView];
  id v4 = [v2 tintColor];
  [v3 setTintColor:v4];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books25AudiobookTOCToolbarButton_supplementalBackgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Books25AudiobookTOCToolbarButton_supplementalIconView);
}

@end