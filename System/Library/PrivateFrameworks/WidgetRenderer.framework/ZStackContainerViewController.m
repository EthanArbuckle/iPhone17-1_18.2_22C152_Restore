@interface ZStackContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (_TtC14WidgetRenderer29ZStackContainerViewController)init;
- (_TtC14WidgetRenderer29ZStackContainerViewController)initWithCoder:(id)a3;
- (_TtC14WidgetRenderer29ZStackContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_childViewControllersForAlwaysOnTimelines;
- (void)loadView;
@end

@implementation ZStackContainerViewController

- (_TtC14WidgetRenderer29ZStackContainerViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ZStackContainerViewController();
  return [(ZStackContainerViewController *)&v3 initWithNibName:0 bundle:0];
}

- (_TtC14WidgetRenderer29ZStackContainerViewController)initWithCoder:(id)a3
{
  result = (_TtC14WidgetRenderer29ZStackContainerViewController *)sub_2618FBA30();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for TouchPassThroughView());
  v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  [(ZStackContainerViewController *)v4 setView:v5];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (id)_childViewControllersForAlwaysOnTimelines
{
  v2 = self;
  id v3 = [(ZStackContainerViewController *)v2 childViewControllers];
  sub_2618A2568(0, (unint64_t *)&unk_26B414810);
  unint64_t v4 = sub_2618FB410();

  sub_2618AE520(v4);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B4148C8);
  id v5 = (void *)sub_2618FB400();
  swift_bridgeObjectRelease();

  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (_TtC14WidgetRenderer29ZStackContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC14WidgetRenderer29ZStackContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end