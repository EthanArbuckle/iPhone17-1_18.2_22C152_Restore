@interface CRLLinkViewHostingRep
- (BOOL)directlyManagesContentPlatformView;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)isAccessibilityElement;
- (NSArray)accessibilityCustomActions;
- (NSArray)crlaxUserInputLabels;
- (NSString)crlaxLabel;
- (UIView)contentPlatformView;
- (_TtC8Freeform21CRLLinkViewHostingRep)initWithLayout:(id)a3 canvas:(id)a4;
- (void)cancelReload:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)drawInContextWithoutEffectsForAlphaOnly:(CGContext *)a3;
- (void)dynamicallyRotatingWithTracker:(id)a3;
- (void)handleFadeInForZoom;
- (void)handleFadeOutForZoom;
- (void)viewScaleDidChange;
- (void)willUpdateRenderable:(id)a3;
@end

@implementation CRLLinkViewHostingRep

- (NSString)crlaxLabel
{
  v2 = self;
  CRLLinkViewHostingRep.getAccessibilityLabelTokens(forUserInput:)(0);
  sub_1005057FC((uint64_t *)&unk_1016773F0);
  sub_100523288((unint64_t *)&qword_101672620, (uint64_t *)&unk_1016773F0);
  BidirectionalCollection<>.joined(separator:)();

  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSArray)crlaxUserInputLabels
{
  v2 = self;
  CRLLinkViewHostingRep.getAccessibilityLabelTokens(forUserInput:)(1);

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)directlyManagesContentPlatformView
{
  NSArray v3 = self;
  v4 = self;
  if ([v3 isMainThread]
    && (v5 = [(CRLCanvasRep *)v4 canvas]) != 0)
  {
    v6 = (_TtC8Freeform21CRLLinkViewHostingRep *)v5;
    unsigned __int8 v7 = [(CRLCanvas *)v5 isCanvasInteractive];

    v4 = v6;
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (UIView)contentPlatformView
{
  v2 = self;
  CRLLinkViewHostingRep.contentPlatformView.getter();
  v4 = v3;

  return (UIView *)v4;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  CRLLinkViewHostingRep.draw(in:)(v4);
}

- (void)cancelReload:(id)a3
{
  if (a3)
  {
    NSArray v3 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_100522F00((uint64_t)v4, &qword_101672BF0);
}

- (void)handleFadeOutForZoom
{
  v2 = self;
  CRLLinkViewHostingRep.handleFadeOutForZoom()();
}

- (void)handleFadeInForZoom
{
  v2 = self;
  CRLLinkViewHostingRep.handleFadeInForZoom()();
}

- (void)viewScaleDidChange
{
  v2 = self;
  CRLLinkViewHostingRep.viewScaleDidChange()();
}

- (void)dynamicallyRotatingWithTracker:(id)a3
{
}

- (void)willUpdateRenderable:(id)a3
{
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  v4 = self;
  _s8Freeform21CRLLinkViewHostingRepC15handleDoubleTap2at9inputTypeSbSo7CGPointV_So08CRLInputK0VtF_0();
  char v6 = v5;

  return v6 & 1;
}

- (void)drawInContextWithoutEffectsForAlphaOnly:(CGContext *)a3
{
  v4 = a3;
  char v5 = self;
  CRLLinkViewHostingRep.drawInContextWithoutEffectsForAlphaOnly(_:)(v4);
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  uint64_t v3 = CRLLinkViewHostingRep.accessibilityCustomActions.getter();

  if (v3)
  {
    sub_10050BF48(0, &qword_10167AE48);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (_TtC8Freeform21CRLLinkViewHostingRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = (_TtC8Freeform21CRLLinkViewHostingRep *)sub_100E166F4((uint64_t)v5, (uint64_t)a4);

  return v7;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform21CRLLinkViewHostingRep____lazy_storage___reloadView);
}

@end