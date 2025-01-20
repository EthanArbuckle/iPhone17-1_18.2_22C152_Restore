@interface PhotosSecondaryToolbarPageControl
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl)init;
- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PhotosSecondaryToolbarPageControl

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl)init
{
  return (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl *)sub_1AA3783F4();
}

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl)initWithCoder:(id)a3
{
  result = (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PhotosSecondaryToolbarPageControl();
  v2 = (char *)v6.receiver;
  [(PhotosSecondaryToolbarPageControl *)&v6 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v6.receiver, v6.super_class);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl_pageIndicator];
  uint64_t v4 = (uint64_t)objc_msgSend(v3, sel_numberOfPages);
  if (v4 >= 6) {
    uint64_t v5 = 6;
  }
  else {
    uint64_t v5 = v4;
  }
  objc_msgSend(v3, sel_sizeForNumberOfPages_, v5);
  sub_1AB23B60C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl_pageIndicator), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarPageControl_pageIndicator));
}

@end