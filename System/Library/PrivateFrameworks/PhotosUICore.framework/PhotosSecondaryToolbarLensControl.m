@interface PhotosSecondaryToolbarLensControl
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl)init;
- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl)initWithFrame:(CGRect)a3;
- (uint64_t)photosLensControl:(void *)a3 didSelectItem:;
- (void)layoutSubviews;
@end

@implementation PhotosSecondaryToolbarLensControl

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl)init
{
  return (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl *)sub_1AA378774();
}

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_delegate) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_performsUpdates) = 0;
  id v5 = a3;

  result = (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosSecondaryToolbarLensControl();
  id v2 = v3.receiver;
  [(PhotosSecondaryToolbarLensControl *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  sub_1AB23B60C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_lensControl), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (uint64_t)photosLensControl:(void *)a3 didSelectItem:
{
  if ((*(unsigned char *)(result
                 + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_performsUpdates) & 1) == 0)
  {
    double v4 = (void *)result;
    uint64_t v5 = result
       + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_delegate;
    CGSize result = MEMORY[0x1AD10DA80](result+ OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_delegate);
    if (result)
    {
      uint64_t v6 = *(void *)(v5 + 8);
      swift_getObjectType();
      v7 = *(void (**)(void))(v6 + 8);
      id v8 = a3;
      swift_unknownObjectRetain();
      id v9 = v4;
      v7();

      swift_unknownObjectRelease();
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

- (_TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_delegate);
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICoreP33_8EFB6D60E7554E18002E58C22439F8D333PhotosSecondaryToolbarLensControl_lensControl);
}

@end