@interface ICActivityStreamViewController
- (ICActivityStreamCoordinating)coordinator;
- (ICActivityStreamSelection)selection;
- (ICActivityStreamViewController)initWithCoder:(id)a3;
- (ICActivityStreamViewController)initWithCoordinator:(id)a3 error:(id *)a4;
- (ICActivityStreamViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSManagedObjectID)objectID;
- (double)topInset;
- (void)addHostingViewIfNeeded;
- (void)observeActivityStreamForObject:(id)a3;
- (void)setSelection:(id)a3;
- (void)setTopInset:(double)a3;
- (void)updateContentLayout;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ICActivityStreamViewController

- (ICActivityStreamCoordinating)coordinator
{
  v2 = (void *)swift_unknownObjectRetain();

  return (ICActivityStreamCoordinating *)v2;
}

- (ICActivityStreamViewController)initWithCoordinator:(id)a3 error:(id *)a4
{
  return (ICActivityStreamViewController *)sub_10016F1D4((uint64_t)a3);
}

- (ICActivityStreamViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(ICActivityStreamViewController *)&v6 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self ICBackgroundColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ICActivityStreamViewController *)&v3 viewDidLayoutSubviews];
  sub_10016FBC0();
}

- (void)addHostingViewIfNeeded
{
  id v2 = self;
  sub_10016FD54();
}

- (double)topInset
{
  return *(double *)&self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController_topInset];
}

- (void)setTopInset:(double)a3
{
  *(double *)&self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController_topInset] = a3;
  objc_super v3 = self;
  sub_10016FBC0();
}

- (void)updateContentLayout
{
  id v2 = self;
  sub_10016FBC0();
}

- (ICActivityStreamSelection)selection
{
  swift_getKeyPath();
  swift_getKeyPath();
  objc_super v3 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();

  return (ICActivityStreamSelection *)v5;
}

- (void)setSelection:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  objc_super v6 = self;
  static Published.subscript.setter();
}

- (void)observeActivityStreamForObject:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_100170284(a3);
}

- (NSManagedObjectID)objectID
{
  id v2 = self;
  id v3 = sub_100170E4C();

  return (NSManagedObjectID *)v3;
}

- (ICActivityStreamViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICActivityStreamViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  id v3 = &self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController__activityStream];
  uint64_t v4 = sub_10002F214(&qword_10069C748);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = &self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController__selection];
  uint64_t v6 = sub_10002F214(&qword_10069C6E8);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = &self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController__pressedItem];
  uint64_t v8 = sub_10002F214(&qword_10069C6F8);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();

  swift_release();
}

@end