@interface ChannelPickerDetailViewController
- (_TtC7NewsUI233ChannelPickerDetailViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI233ChannelPickerDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissVC;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ChannelPickerDetailViewController

- (_TtC7NewsUI233ChannelPickerDetailViewController)initWithCoder:(id)a3
{
  result = (_TtC7NewsUI233ChannelPickerDetailViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI233ChannelPickerDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI233ChannelPickerDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_blueprintViewController));
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_model;
  sub_1DEBA1D2C((uint64_t)v3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DEBA01C0();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(ChannelPickerDetailViewController *)&v4 viewDidAppear:v3];
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(ChannelPickerDetailViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    objc_super v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(ChannelPickerDetailViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DEBA1B4C();
}

- (void)dismissVC
{
  id v3 = __swift_project_boxed_opaque_existential_1(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_eventHandler)+ 6, (*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_eventHandler))[9]);
  uint64_t v4 = MEMORY[0x1E01EFB70](*v3 + 16);
  if (v4)
  {
    id v6 = (id)v4;
    id v5 = self;
    objc_msgSend(v6, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

@end