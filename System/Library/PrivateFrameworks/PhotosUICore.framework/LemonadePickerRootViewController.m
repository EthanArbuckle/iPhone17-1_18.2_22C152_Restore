@interface LemonadePickerRootViewController
- (_TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)dealloc;
- (void)navigateToDestination:(PXProgrammaticNavigationDestination *)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)splitViewController:(id)a3 didChangeSidebarVisibility:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation LemonadePickerRootViewController

- (_TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AA66D5C4();
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for LemonadePickerRootViewController();
  v2 = (char *)v10.receiver;
  [(LemonadePickerRootViewController *)&v10 viewWillLayoutSubviews];
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController_rootModel];
  id v4 = objc_msgSend(v2, sel_view, v10.receiver, v10.super_class);
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;

    (*(void (**)(double, double))(*(void *)v3 + 536))(v7, v9);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LemonadePickerRootViewController();
  id v4 = v5.receiver;
  [(LemonadePickerRootViewController *)&v5 viewDidAppear:v3];
  sub_1AA66F7D8();
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  double v6 = PXLemonadeReroutedProgrammaticDestination(v4);
  sub_1AB22F8DC();
  unint64_t v7 = sub_1AA619210((uint64_t)v6);

  swift_release();
  return v7;
}

- (void)navigateToDestination:(PXProgrammaticNavigationDestination *)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  sub_1AA67144C(0, (unint64_t *)&qword_1E9821250, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8, v10);
  v12 = (char *)&v20 - v11;
  v13 = _Block_copy(a5);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  uint64_t v15 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E9837008;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E9837018;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1A9FD8BA0((uint64_t)v12, (uint64_t)&unk_1E9837028, (uint64_t)v17);
  swift_release();
}

- (void)dealloc
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController_delegate) = 0;
  swift_unknownObjectWeakAssign();
  BOOL v3 = self;
  sub_1AB22F8DC();
  sub_1AB2331DC();
  swift_release();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LemonadePickerRootViewController();
  [(LemonadePickerRootViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController_pickerConfiguration));
  swift_release();
  BOOL v3 = (char *)self
     + OBJC_IVAR____TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController_delegate;
  sub_1A9D6D380((uint64_t)v3);
}

- (void)splitViewController:(id)a3 didChangeSidebarVisibility:(BOOL)a4
{
  id v5 = a3;
  double v6 = self;
  sub_1AB22F8DC();
  sub_1AA614C7C();

  swift_release();
}

- (_TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end