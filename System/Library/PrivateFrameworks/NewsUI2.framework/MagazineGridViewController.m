@interface MagazineGridViewController
- (_TtC7NewsUI226MagazineGridViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI226MagazineGridViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollView;
- (void)doDoneAction;
- (void)doDownloadAction;
- (void)doRemoveDownloadsAction;
- (void)doRemoveIssuesAndDownloadsAction;
- (void)doSelectAllAction;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MagazineGridViewController

- (_TtC7NewsUI226MagazineGridViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF8C60CC();
}

- (_TtC7NewsUI226MagazineGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI226MagazineGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_viewControllerConfig));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_blueprintViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_offlineAlertControllerFactory);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___selectAllBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___doneBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___downloadBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___removeIssuesAndDownloadsBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___removeDownloadsBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___selectionCountBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___selectionCountLabel));
  swift_release();
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF8C00A0();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(MagazineGridViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    id v4 = v3;
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

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DF8C0694(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DF8C092C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = self;
  [(MagazineGridViewController *)&v8 viewWillDisappear:v3];
  if (*((unsigned char *)&v6->super.super.super.super.isa
       + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_viewControllerConfig) == 1)
  {
    swift_getObjectType();
    sub_1DFDF2040();
    if ([(MagazineGridViewController *)v6 isEditing])
    {
      v7.receiver = v6;
      v7.super_class = ObjectType;
      [(MagazineGridViewController *)&v7 setEditing:0 animated:v3];
      sub_1DF8C0C7C(0, v3, 1);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(MagazineGridViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF8C6180();
}

- (id)contentScrollView
{
  v2 = self;
  sub_1DFDF30E0();
  BOOL v3 = (void *)sub_1DFDF26C0();

  swift_release();
  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v6 = v7.receiver;
  [(MagazineGridViewController *)&v7 setEditing:v5 animated:v4];
  sub_1DF8C0C7C(v5, v4, 1);
}

- (void)doSelectAllAction
{
  v2 = self;
  sub_1DF8C2524();
}

- (void)doDoneAction
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(MagazineGridViewController *)&v3 setEditing:0 animated:1];
  sub_1DF8C0C7C(0, 1, 1);
}

- (void)doDownloadAction
{
  id v2 = self;
  sub_1DF8C2EF4();
}

- (void)doRemoveIssuesAndDownloadsAction
{
  id v2 = self;
  sub_1DF8C365C();
}

- (void)doRemoveDownloadsAction
{
  id v2 = self;
  sub_1DF8C3970();
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  sub_1DFDF30E0();
  id v5 = (id)sub_1DFDF26C0();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_, v3);
}

@end