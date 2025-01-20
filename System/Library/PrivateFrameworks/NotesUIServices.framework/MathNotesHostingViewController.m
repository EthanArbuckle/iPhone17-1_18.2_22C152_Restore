@interface MathNotesHostingViewController
- (_TtC15NotesUIServices30MathNotesHostingViewController)init;
- (_TtC15NotesUIServices30MathNotesHostingViewController)initWithCoder:(id)a3;
- (_TtC15NotesUIServices30MathNotesHostingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MathNotesHostingViewController

- (_TtC15NotesUIServices30MathNotesHostingViewController)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController____lazy_storage___appProtectionController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  v4 = (objc_class *)type metadata accessor for MathNotesHostingViewController();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(MathNotesHostingViewController *)&v6 initWithNibName:0 bundle:0];
}

- (_TtC15NotesUIServices30MathNotesHostingViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController____lazy_storage___appProtectionController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC15NotesUIServices30MathNotesHostingViewController *)sub_257DB0118();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MathNotesHostingViewController();
  id v2 = v6.receiver;
  [(MathNotesHostingViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(self, sel_subjectMonitorRegistry, v6.receiver, v6.super_class);
  id v4 = sub_257DA141C();
  id v5 = objc_msgSend(v3, sel_addMonitor_subjectMask_subscriptionOptions_, v4, 1, 1);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  sub_257DA2C0C();
}

- (void)viewIsAppearing:(BOOL)a3
{
  id v4 = self;
  sub_257DA18E0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_257DA1BF4(a3);
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (_TtC15NotesUIServices30MathNotesHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15NotesUIServices30MathNotesHostingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController____lazy_storage___appProtectionController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_shieldView));
  sub_257D9FE10((uint64_t)self + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate, &qword_26A05E278);
}

@end