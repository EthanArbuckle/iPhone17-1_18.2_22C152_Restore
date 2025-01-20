@interface WFEditorHostingViewController
- (BOOL)canShowEmptyState;
- (BOOL)canShowInputAction;
- (BOOL)isEditable;
- (BOOL)isHomeWorkflow;
- (BOOL)isRunning;
- (Class)triggerInputType;
- (HMHome)home;
- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter;
- (WFEditorHostingViewController)initWithCoder:(id)a3;
- (WFEditorHostingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WFEditorHostingViewController)initWithWorkflow:(id)a3;
- (WFEditorHostingViewControllerDelegate)delegate;
- (double)actionCanvasWidth;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)appendAction:(id)a3 selectionAware:(BOOL)a4;
- (void)insertAction:(id)a3 at:(int64_t)a4;
- (void)insertActions:(id)a3 at:(int64_t)a4;
- (void)loadView;
- (void)moveActionsFrom:(id)a3 to:(id)a4;
- (void)performScrollingTest:(id)a3;
- (void)removeActions:(id)a3 mode:(int64_t)a4;
- (void)runWithSource:(id)a3;
- (void)scrollToAction:(id)a3;
- (void)setAuxiliaryViewPresenter:(id)a3;
- (void)setCanShowEmptyState:(BOOL)a3;
- (void)setCanShowInputAction:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setIsEditable:(BOOL)a3;
- (void)setTriggerInputType:(Class)a3;
- (void)showActionError:(id)a3 for:(id)a4;
- (void)startPickingParametersForImportQuestionsWithExcluding:(id)a3 onSelect:(id)a4;
- (void)stop;
- (void)stopPickingVariables;
- (void)viewWillAppear:(BOOL)a3;
- (void)workflow:(WFWorkflow *)a3 removeAction:(WFAction *)a4 completionHandler:(id)a5;
- (void)workflow:(id)a3 insertActions:(id)a4 atIndexes:(id)a5;
- (void)workflow:(id)a3 moveActionsAtIndexes:(id)a4 toIndexes:(id)a5;
@end

@implementation WFEditorHostingViewController

- (WFEditorHostingViewControllerDelegate)delegate
{
  v2 = (void *)sub_234A1A56C();
  return (WFEditorHostingViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_234A1A5D8();
}

- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter
{
  v2 = (void *)sub_234A1A788();
  return (WFEditorAuxiliaryViewPresenter *)v2;
}

- (void)setAuxiliaryViewPresenter:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_234A1A830();
}

- (WFEditorHostingViewController)initWithWorkflow:(id)a3
{
  id v3 = a3;
  EditorHostingViewController.init(workflow:)();
  return result;
}

- (WFEditorHostingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_234A1B73C();
}

- (void)loadView
{
  v2 = self;
  sub_234A1B8F0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_234A1BB5C(a3);
}

- (BOOL)isRunning
{
  v2 = self;
  BOOL v3 = sub_234A1BC2C();

  return v3;
}

- (BOOL)isEditable
{
  v2 = self;
  BOOL v3 = sub_234A1BCA0();

  return v3;
}

- (void)setIsEditable:(BOOL)a3
{
  BOOL v3 = self;
  sub_234A1BD28();
}

- (BOOL)canShowEmptyState
{
  v2 = self;
  char v3 = sub_234A1BE1C();

  return v3 & 1;
}

- (void)setCanShowEmptyState:(BOOL)a3
{
  char v3 = self;
  sub_234A1BEA0();
}

- (BOOL)canShowInputAction
{
  v2 = self;
  char v3 = sub_234A1BF80();

  return v3 & 1;
}

- (void)setCanShowInputAction:(BOOL)a3
{
  char v3 = self;
  sub_234A1C004();
}

- (Class)triggerInputType
{
  v2 = self;
  uint64_t v3 = sub_234A1C108();

  if (!v3) {
    return 0;
  }
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setTriggerInputType:(Class)a3
{
  if (a3) {
    swift_getObjCClassMetadata();
  }
  v4 = self;
  sub_234A1C1A0();
}

- (HMHome)home
{
  v2 = self;
  uint64_t v3 = (void *)sub_234A1C288();

  return (HMHome *)v3;
}

- (void)setHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234A1C310();
}

- (BOOL)isHomeWorkflow
{
  v2 = self;
  BOOL v3 = sub_234A1C45C();

  return v3;
}

- (double)actionCanvasWidth
{
  return sub_234A1C4C0();
}

- (void)runWithSource:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234A1C50C(v4);
}

- (void)stop
{
  v2 = self;
  sub_234A1CAB8();
}

- (void)stopPickingVariables
{
  v2 = self;
  sub_234A1CB2C();
}

- (void)startPickingParametersForImportQuestionsWithExcluding:(id)a3 onSelect:(id)a4
{
  v5 = _Block_copy(a4);
  sub_23491E3D4(0, (unint64_t *)&qword_2687D4460);
  sub_234B3B718();
  *(void *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_234A1CBA4();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)scrollToAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234A1CCD4(v4);
}

- (void)showActionError:(id)a3 for:(id)a4
{
  uint64_t v6 = sub_234B3B588();
  uint64_t v8 = v7;
  id v9 = a4;
  v10 = self;
  sub_234A1CD84(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void)performScrollingTest:(id)a3
{
  sub_234B3B588();
  id v4 = self;
  sub_234A1CE4C();

  swift_bridgeObjectRelease();
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  id v4 = self;
  id v5 = sub_234A1CF58(a3);

  return v5;
}

- (void)workflow:(WFWorkflow *)a3 removeAction:(WFAction *)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_234AE9618((uint64_t)&unk_2687D4458, (uint64_t)v9);
}

- (void)workflow:(id)a3 moveActionsAtIndexes:(id)a4 toIndexes:(id)a5
{
  uint64_t v7 = sub_234B385A8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v13 = (char *)&v17 - v12;
  sub_234B38528();
  sub_234B38528();
  id v14 = a3;
  v15 = self;
  sub_234A1DB44();

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v11, v7);
  v16(v13, v7);
}

- (void)workflow:(id)a3 insertActions:(id)a4 atIndexes:(id)a5
{
  uint64_t v7 = sub_234B385A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23491E3D4(0, (unint64_t *)&qword_2687D1290);
  sub_234B3B718();
  sub_234B38528();
  id v11 = a3;
  uint64_t v12 = self;
  sub_234A1DC98();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)appendAction:(id)a3 selectionAware:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_234A1DDE0(v5);
}

- (void)insertAction:(id)a3 at:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_234A1DE8C(v6, a4);
}

- (void)insertActions:(id)a3 at:(int64_t)a4
{
}

- (void)removeActions:(id)a3 mode:(int64_t)a4
{
}

- (void)moveActionsFrom:(id)a3 to:(id)a4
{
  uint64_t v5 = sub_234B385A8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v14 - v10;
  sub_234B38528();
  sub_234B38528();
  uint64_t v12 = self;
  sub_234A1F100();

  uint64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
}

- (WFEditorHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_234B3B588();
  }
  id v5 = a4;
  EditorHostingViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFEditorHostingViewController_hostingViewController));

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_23494A5D4((uint64_t)self + OBJC_IVAR___WFEditorHostingViewController_delegate);
  BOOL v3 = (char *)self + OBJC_IVAR___WFEditorHostingViewController_auxiliaryViewPresenter;
  sub_23494A5D4((uint64_t)v3);
}

@end