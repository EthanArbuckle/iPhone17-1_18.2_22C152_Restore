@interface VisualResponseView
- (BOOL)containsComponentsWithAction;
- (BOOL)isPresentedWithSmartDialogText;
- (BOOL)isRedacted;
- (BOOL)requestsKeyWindow;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)aceCommands;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (NSString)responseViewId;
- (NSString)viewId;
- (VRXInteractionDelegate)interactionDelegate;
- (_TtC9SnippetUI18VisualResponseView)initWithCoder:(id)a3;
- (_TtC9SnippetUI18VisualResponseView)initWithFrame:(CGRect)a3;
- (double)snippetWidth;
- (int64_t)backgroundMaterial;
- (int64_t)currentIdiom;
- (int64_t)visualResponseLocation;
- (void)layoutSubviews;
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

@implementation VisualResponseView

- (_TtC9SnippetUI18VisualResponseView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22C2EE798();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_22C2EE840(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22C2EE914();
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)sub_22C2EF6F4(self, (uint64_t)a2, (void (*)(void))sub_22C2EEA0C, &qword_2684AAA60);
}

- (_TtC9SnippetUI18VisualResponseView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_22C2F0890((uint64_t)self + OBJC_IVAR____TtC9SnippetUI18VisualResponseView_anyRootView, (void (*)(void))type metadata accessor for AnyRootView);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SnippetUI18VisualResponseView_hostingViewController);
}

- (void)setInitialFocusIndex:(int64_t)a3
{
  v4 = self;
  VisualResponseView.setInitialFocus(_:)(a3);
}

- (void)updateSharedState:(id)a3
{
  uint64_t v4 = sub_22C64F380();
  v5 = self;
  VisualResponseView.updateSharedState(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)updateSharedStateData:(id)a3
{
  id v4 = a3;
  double v8 = self;
  uint64_t v5 = sub_22C648F30();
  unint64_t v7 = v6;

  VisualResponseView.updateSharedStateData(_:)();
  sub_22C264380(v5, v7);
}

- (void)setAsrText:(id)a3
{
  uint64_t v4 = sub_22C64F480();
  unint64_t v6 = v5;
  unint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  VisualResponseView.setAsrText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)setIsInAmbient:(BOOL)a3 withScaleFactor:(double)a4
{
  uint64_t v4 = self;
  VisualResponseView.setIsInAmbient(_:withScaleFactor:)();
}

- (void)setPlayerState:(int64_t)a3 aceId:(id)a4
{
  sub_22C64F480();
  uint64_t v5 = self;
  VisualResponseView.setPlayerState(_:aceId:)();

  swift_bridgeObjectRelease();
}

- (void)postSiriEvent:(int64_t)a3
{
  id v3 = self;
  VisualResponseView.postSiriEvent(_:)();
}

- (int64_t)currentIdiom
{
  return VisualResponseView.currentIdiom.getter();
}

- (void)setCurrentIdiom:(int64_t)a3
{
  uint64_t v4 = self;
  VisualResponseView.currentIdiom.setter(a3);
}

- (double)snippetWidth
{
  v2 = self;
  double v3 = VisualResponseView.snippetWidth.getter();

  return v3;
}

- (void)setSnippetWidth:(double)a3
{
  double v3 = self;
  VisualResponseView.snippetWidth.setter();
}

- (VRXInteractionDelegate)interactionDelegate
{
  v2 = (void *)VisualResponseView.interactionDelegate.getter();

  return (VRXInteractionDelegate *)v2;
}

- (void)setInteractionDelegate:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  VisualResponseView.interactionDelegate.setter();
}

- (int64_t)backgroundMaterial
{
  v2 = self;
  int64_t v3 = VisualResponseView.backgroundMaterial.getter();

  return v3;
}

- (void)setBackgroundMaterial:(int64_t)a3
{
  int64_t v3 = self;
  VisualResponseView.backgroundMaterial.setter();
}

- (NSArray)aceCommands
{
  return (NSArray *)sub_22C2EF6F4(self, (uint64_t)a2, (void (*)(void))VisualResponseView.aceCommands.getter, &qword_2684AA9F8);
}

- (BOOL)containsComponentsWithAction
{
  v2 = self;
  char v3 = VisualResponseView.containsComponentsWithAction.getter();

  return v3 & 1;
}

- (BOOL)requestsKeyWindow
{
  v2 = self;
  VisualResponseView.requestsKeyWindow.getter();

  return 0;
}

- (NSString)viewId
{
  return (NSString *)sub_22C2EFAE4((uint64_t)self, (uint64_t)a2, (void (*)(void))VisualResponseView.viewId.getter);
}

- (void)setViewId:(id)a3
{
}

- (NSString)responseViewId
{
  return (NSString *)sub_22C2EFAE4((uint64_t)self, (uint64_t)a2, (void (*)(void))VisualResponseView.responseViewId.getter);
}

- (void)setResponseViewId:(id)a3
{
}

- (BOOL)isRedacted
{
  return VisualResponseView.isRedacted.getter() & 1;
}

- (void)setIsRedacted:(BOOL)a3
{
}

- (BOOL)isPresentedWithSmartDialogText
{
  v2 = self;
  char v3 = VisualResponseView.isPresentedWithSmartDialogText.getter();

  return v3 & 1;
}

- (void)setIsPresentedWithSmartDialogText:(BOOL)a3
{
  char v3 = self;
  VisualResponseView.isPresentedWithSmartDialogText.setter();
}

- (int64_t)visualResponseLocation
{
  return VisualResponseView.visualResponseLocation.getter();
}

- (void)setVisualResponseLocation:(int64_t)a3
{
}

- (NSString)description
{
  v2 = self;
  VisualResponseView.description.getter();

  char v3 = (void *)sub_22C64F450();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end