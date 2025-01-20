@interface WFParameterHostingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (WFParameterHostingView)initWithCoder:(id)a3;
- (WFParameterHostingView)initWithFrame:(CGRect)a3;
- (void)attachToParentViewController:(id)a3;
- (void)configureConfigurationUIViewWithParameter:(id)a3 state:(id)a4 processing:(BOOL)a5 shouldFocus:(BOOL)a6 variableProvider:(id)a7 widgetFamily:(int64_t)a8 fillProvider:(id)a9 overridingCellBackgroundColor:(id)a10 updateBlock:(id)aBlock;
- (void)configureViewForRuntimeUIWithParameter:(id)a3 state:(id)a4 processing:(BOOL)a5 shouldFocus:(BOOL)a6 variableProvider:(id)a7 updateBlock:(id)a8;
- (void)detachFromParentViewController;
- (void)layoutSubviews;
@end

@implementation WFParameterHostingView

- (WFParameterHostingView)initWithFrame:(CGRect)a3
{
  return (WFParameterHostingView *)ParameterHostingView.init(frame:)();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_234AF42DC();
}

- (WFParameterHostingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_234AF43FC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_234AF4490();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)configureViewForRuntimeUIWithParameter:(id)a3 state:(id)a4 processing:(BOOL)a5 shouldFocus:(BOOL)a6 variableProvider:(id)a7 updateBlock:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  v14 = _Block_copy(a8);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  id v16 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v17 = self;
  sub_234AF4510(v16, (uint64_t)a4, v10, v9, (uint64_t)a7, (uint64_t)sub_234AF5BB0, v15);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

- (void)configureConfigurationUIViewWithParameter:(id)a3 state:(id)a4 processing:(BOOL)a5 shouldFocus:(BOOL)a6 variableProvider:(id)a7 widgetFamily:(int64_t)a8 fillProvider:(id)a9 overridingCellBackgroundColor:(id)a10 updateBlock:(id)aBlock
{
  v18 = _Block_copy(aBlock);
  if (a9)
  {
    id v19 = a3;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    id v20 = a10;
    v21 = self;
    swift_unknownObjectRetain();
    sub_234B3BE18();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v26, 0, sizeof(v26));
    id v22 = a3;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    id v23 = a10;
    v24 = self;
  }
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v18;
  sub_234AF4650(a3, (uint64_t)a4, a5, a6, (uint64_t)a7, a8, (uint64_t)v26, a10, (uint64_t)sub_234AF56A4, v25);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  sub_234915B14((uint64_t)v26, (uint64_t *)&unk_2687CF600);
}

- (void)attachToParentViewController:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_234AF52BC(a3);
}

- (void)detachFromParentViewController
{
  v2 = self;
  sub_234AF532C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end