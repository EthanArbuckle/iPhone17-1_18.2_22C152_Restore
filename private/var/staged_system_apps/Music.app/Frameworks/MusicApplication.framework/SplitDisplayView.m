@interface SplitDisplayView
- (_TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SplitDisplayView

- (void)layoutSubviews
{
  v2 = self;
  sub_DDD34();
}

- (_TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView *)sub_DE3F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView *)sub_DEB6C((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView_leftContentItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView_rightContentItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView_gradientColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView_gradientView);
}

@end