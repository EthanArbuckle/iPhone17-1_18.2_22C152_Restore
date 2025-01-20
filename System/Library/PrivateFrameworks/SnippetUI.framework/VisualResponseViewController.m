@interface VisualResponseViewController
- (BOOL)containsComponentsWithAction;
- (BOOL)isPresentedWithSmartDialogText;
- (BOOL)isRedacted;
- (BOOL)requestsKeyWindow;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)aceCommands;
- (NSString)description;
- (NSString)responseViewId;
- (NSString)viewId;
- (VRXInteractionDelegate)interactionDelegate;
- (_TtC9SnippetUI28VisualResponseViewController)initWithCoder:(id)a3;
- (_TtC9SnippetUI28VisualResponseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)snippetWidth;
- (int64_t)backgroundMaterial;
- (int64_t)currentIdiom;
- (int64_t)visualResponseLocation;
- (void)postSiriEvent:(int64_t)a3;
- (void)setAsrText:(id)a3;
- (void)setBackgroundMaterial:(int64_t)a3;
- (void)setCurrentIdiom:(int64_t)a3;
- (void)setInitialFocusIndex:(int64_t)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setIsInAmbient:(BOOL)a3 withScaleFactor:(double)a4;
- (void)setIsPresentedWithSmartDialogText:(BOOL)a3;
- (void)setIsRedacted:(BOOL)a3;
- (void)setPlayerState:(int64_t)a3 aceId:(id)a4;
- (void)setResponseViewId:(id)a3;
- (void)setSnippetWidth:(double)a3;
- (void)setViewId:(id)a3;
- (void)setVisualResponseLocation:(int64_t)a3;
- (void)updateSharedState:(id)a3;
- (void)updateSharedStateData:(id)a3;
@end

@implementation VisualResponseViewController

- (_TtC9SnippetUI28VisualResponseViewController)initWithCoder:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_22C4AFC54(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (_TtC9SnippetUI28VisualResponseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_22C64F480();
  }
  id v5 = a4;
  VisualResponseViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SnippetUI28VisualResponseViewController_context));
  sub_22C2F0890((uint64_t)self + OBJC_IVAR____TtC9SnippetUI28VisualResponseViewController_anyRootView, (void (*)(void))type metadata accessor for AnyRootView);
}

- (void)setInitialFocusIndex:(int64_t)a3
{
  v4 = self;
  VisualResponseViewController.setInitialFocus(_:)(a3);
}

- (void)updateSharedState:(id)a3
{
  uint64_t v4 = sub_22C64F380();
  id v5 = self;
  VisualResponseViewController.updateSharedState(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)updateSharedStateData:(id)a3
{
  id v4 = a3;
  double v8 = self;
  uint64_t v5 = sub_22C648F30();
  unint64_t v7 = v6;

  VisualResponseViewController.updateSharedStateData(_:)();
  sub_22C264380(v5, v7);
}

- (void)setAsrText:(id)a3
{
  uint64_t v4 = sub_22C64F480();
  unint64_t v6 = v5;
  unint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  VisualResponseViewController.setAsrText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)setIsInAmbient:(BOOL)a3 withScaleFactor:(double)a4
{
  uint64_t v4 = self;
  VisualResponseViewController.setIsInAmbient(_:withScaleFactor:)();
}

- (void)setPlayerState:(int64_t)a3 aceId:(id)a4
{
  sub_22C64F480();
  uint64_t v5 = self;
  VisualResponseViewController.setPlayerState(_:aceId:)();

  swift_bridgeObjectRelease();
}

- (void)postSiriEvent:(int64_t)a3
{
  v3 = self;
  VisualResponseViewController.postSiriEvent(_:)();
}

- (int64_t)currentIdiom
{
  return VisualResponseViewController.currentIdiom.getter();
}

- (void)setCurrentIdiom:(int64_t)a3
{
  uint64_t v4 = self;
  VisualResponseViewController.currentIdiom.setter(a3);
}

- (double)snippetWidth
{
  v2 = self;
  double v3 = VisualResponseViewController.snippetWidth.getter();

  return v3;
}

- (void)setSnippetWidth:(double)a3
{
  double v3 = self;
  VisualResponseViewController.snippetWidth.setter();
}

- (VRXInteractionDelegate)interactionDelegate
{
  v2 = (void *)VisualResponseViewController.interactionDelegate.getter();

  return (VRXInteractionDelegate *)v2;
}

- (void)setInteractionDelegate:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  VisualResponseViewController.interactionDelegate.setter();
}

- (int64_t)backgroundMaterial
{
  v2 = self;
  int64_t v3 = VisualResponseViewController.backgroundMaterial.getter();

  return v3;
}

- (void)setBackgroundMaterial:(int64_t)a3
{
  int64_t v3 = self;
  VisualResponseViewController.backgroundMaterial.setter();
}

- (NSArray)aceCommands
{
  v2 = self;
  VisualResponseViewController.aceCommands.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2684AA9F8);
  int64_t v3 = (void *)sub_22C64F740();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (BOOL)containsComponentsWithAction
{
  v2 = self;
  char v3 = VisualResponseViewController.containsComponentsWithAction.getter();

  return v3 & 1;
}

- (BOOL)requestsKeyWindow
{
  v2 = self;
  VisualResponseViewController.requestsKeyWindow.getter();

  return 0;
}

- (NSString)viewId
{
  return (NSString *)sub_22C4B1B58((uint64_t)self, (uint64_t)a2, (void (*)(void))VisualResponseViewController.viewId.getter);
}

- (void)setViewId:(id)a3
{
}

- (NSString)responseViewId
{
  return (NSString *)sub_22C4B1B58((uint64_t)self, (uint64_t)a2, (void (*)(void))VisualResponseViewController.responseViewId.getter);
}

- (void)setResponseViewId:(id)a3
{
}

- (BOOL)isRedacted
{
  return VisualResponseViewController.isRedacted.getter() & 1;
}

- (void)setIsRedacted:(BOOL)a3
{
}

- (BOOL)isPresentedWithSmartDialogText
{
  v2 = self;
  char v3 = VisualResponseViewController.isPresentedWithSmartDialogText.getter();

  return v3 & 1;
}

- (void)setIsPresentedWithSmartDialogText:(BOOL)a3
{
  char v3 = self;
  VisualResponseViewController.isPresentedWithSmartDialogText.setter();
}

- (int64_t)visualResponseLocation
{
  return VisualResponseViewController.visualResponseLocation.getter();
}

- (void)setVisualResponseLocation:(int64_t)a3
{
}

- (NSString)description
{
  v2 = self;
  VisualResponseViewController.description.getter();

  char v3 = (void *)sub_22C64F450();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end