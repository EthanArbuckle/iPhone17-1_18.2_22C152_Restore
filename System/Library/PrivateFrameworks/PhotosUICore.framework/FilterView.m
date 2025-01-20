@interface FilterView
- (_TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView)initWithFrame:(CGRect)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
@end

@implementation FilterView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FilterView();
  v2 = (char *)v4.receiver;
  [(FilterView *)&v4 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  CGFloat v3 = CGRectGetHeight(v5) * 0.5;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_backgroundVisualEffectView], sel__setCornerRadius_, v3);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_button], sel__setCornerRadius_, v3);
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v7 = self;
  if (objc_msgSend(v4, sel_state) == (id)3)
  {
    CGRect v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.isa
                                        + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_onShowDetails);
    if (v5)
    {
      uint64_t v6 = sub_1AB22F8DC();
      v5(v6);
      sub_1A9BB8934((uint64_t)v5);
    }
  }
}

- (_TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView)initWithCoder:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_onToggle);
  *id v4 = 0;
  v4[1] = 0;
  CGRect v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_onShowDetails);
  *CGRect v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_targetFilterState) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_isFilterActive) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_dynamicConstraints) = (Class)MEMORY[0x1E4FBC860];
  id v6 = a3;

  result = (_TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView)initWithFrame:(CGRect)a3
{
  result = (_TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_onToggle));
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_onShowDetails));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_targetFilterState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_button));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_backgroundVisualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1A021748C2E8715B5DBBC8A539A4122610FilterView_label));
  swift_bridgeObjectRelease();
}

@end