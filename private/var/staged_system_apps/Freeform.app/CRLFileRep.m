@interface CRLFileRep
- (BOOL)accessibilityPerformPress;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)isAccessibilityElement;
- (BOOL)replacingInterfaceAllowsMultipleSelection;
- (BOOL)shouldShowMediaReplaceUI;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)wantsToHandleDoubleTapsWhenLocked;
- (_TtC8Freeform10CRLFileRep)initWithLayout:(id)a3 canvas:(id)a4;
- (_TtC8Freeform11CRLFileItem)item;
- (int64_t)preferredReplacingInterfaceKind;
- (int64_t)supportedMediaTypes;
- (void)enterPreviewMode;
- (void)processChangedProperty:(unint64_t)a3;
- (void)willBeRemoved;
@end

@implementation CRLFileRep

- (_TtC8Freeform10CRLFileRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (_TtC8Freeform10CRLFileRep *)sub_100A267E4(v5, a4);
}

- (BOOL)shouldShowSelectionHighlight
{
  return 0;
}

- (void)willBeRemoved
{
  v2 = self;
  sub_100A2690C();
}

- (void)processChangedProperty:(unint64_t)a3
{
  v4 = self;
  sub_100A27610(a3);
}

- (_TtC8Freeform11CRLFileItem)item
{
  v2 = self;
  sub_100A27774();
  v4 = v3;

  return (_TtC8Freeform11CRLFileItem *)v4;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityPerformPress
{
  return 1;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform10CRLFileRep_downloadObserverIdentifier;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform10CRLFileRep____lazy_storage___placeholderImage);

  sub_100522AD8(v5);
}

- (int64_t)supportedMediaTypes
{
  return 3;
}

- (int64_t)preferredReplacingInterfaceKind
{
  return 1;
}

- (BOOL)replacingInterfaceAllowsMultipleSelection
{
  return 0;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 1;
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

- (void)enterPreviewMode
{
  v2 = self;
  sub_100FA4FE0();
}

@end