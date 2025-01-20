@interface SidecarInsertProgressViewController
- (_TtC11NotesEditor35SidecarInsertProgressViewController)initWithCoder:(id)a3;
- (_TtC11NotesEditor35SidecarInsertProgressViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)cancelButtonDidTouchUpInsideButton:(void *)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SidecarInsertProgressViewController

- (_TtC11NotesEditor35SidecarInsertProgressViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(SidecarInsertProgressViewController *)&v3 viewDidLoad];
  sub_20BFDBC9C();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_20BFDC34C();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 7;
}

- (void)cancelButtonDidTouchUpInsideButton:(void *)a3
{
  objc_super v3 = *(void (**)(uint64_t))&a1[OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController_didTapCancel];
  if (v3)
  {
    id v5 = a3;
    v7 = a1;
    uint64_t v6 = sub_20BFD8C2C((uint64_t)v3);
    v3(v6);
    sub_20BFCDA14((uint64_t)v3);
  }
}

- (_TtC11NotesEditor35SidecarInsertProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11NotesEditor35SidecarInsertProgressViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController_device);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController____lazy_storage___deviceImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController____lazy_storage___progressTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController____lazy_storage___dividerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController____lazy_storage___stackView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController_didTapCancel);

  sub_20BFCDA14(v3);
}

@end