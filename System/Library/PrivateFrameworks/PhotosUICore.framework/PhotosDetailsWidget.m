@interface PhotosDetailsWidget
- (PXAnonymousView)contentView;
- (PXPhotosDetailsContext)context;
- (PXWidgetDelegate)widgetDelegate;
- (PXWidgetSpec)spec;
- (_TtC12PhotosUICore19PhotosDetailsWidget)init;
- (double)preferredContentHeightForWidth:(double)a3;
- (void)contentViewDidDisappear;
- (void)setContext:(id)a3;
- (void)setSpec:(id)a3;
- (void)setWidgetDelegate:(id)a3;
@end

@implementation PhotosDetailsWidget

- (PXWidgetDelegate)widgetDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget_widgetDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (PXWidgetDelegate *)v3;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXPhotosDetailsContext)context
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x90);
  v3 = self;
  result = (PXPhotosDetailsContext *)v2();
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AA0A5A20(v4);
}

- (PXWidgetSpec)spec
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0xF0);
  v3 = self;
  result = (PXWidgetSpec *)v2();
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setSpec:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AA0A633C(v4);
}

- (double)preferredContentHeightForWidth:(double)a3
{
  id v4 = self;
  double v5 = sub_1AA0A6920(a3);

  return v5;
}

- (PXAnonymousView)contentView
{
  v2 = self;
  v3 = sub_1AA0A66C8();
  if (!v3 || (id v4 = v3, v5 = objc_msgSend(v3, sel_view), v4, !v5)) {
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  }

  return (PXAnonymousView *)v5;
}

- (void)contentViewDidDisappear
{
  v2 = (void *)MEMORY[0x1E4FBC8C8];
  v3 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0xD8);
  v7 = self;
  id v4 = (_TtC12PhotosUICore19PhotosDetailsWidget *)v3();
  if (v4)
  {
    id v5 = v4;
    (*(void (**)(void))((*v2 & (uint64_t)v4->super.isa) + 0x140))();

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }
}

- (_TtC12PhotosUICore19PhotosDetailsWidget)init
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget__context) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget__viewModel) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget__spec) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget____lazy_storage___contentViewController) = (Class)1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PhotosDetailsWidget();
  return [(PhotosDetailsWidget *)&v4 init];
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget_widgetDelegate);

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget____lazy_storage___contentViewController);
  sub_1A9EAA228(v3);
}

@end