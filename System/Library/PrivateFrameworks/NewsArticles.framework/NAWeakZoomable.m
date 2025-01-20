@interface NAWeakZoomable
- (BOOL)canDecreaseTextSize;
- (BOOL)canIncreaseTextSize;
- (BOOL)canResetZoom;
- (BOOL)canZoomIn;
- (BOOL)canZoomOut;
- (NAWeakZoomable)init;
- (NAWeakZoomable)initWithZoomable:(id)a3;
- (void)decreaseTextSize;
- (void)increaseTextSize;
- (void)resetZoom;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation NAWeakZoomable

- (NAWeakZoomable)initWithZoomable:(id)a3
{
  swift_getObjectType();
  uint64_t v4 = swift_unknownObjectRetain();
  v5 = (NAWeakZoomable *)sub_1BF6EDA08(v4, self);
  swift_unknownObjectRelease();
  return v5;
}

- (NAWeakZoomable)init
{
  result = (NAWeakZoomable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)canIncreaseTextSize
{
  return sub_1BF6ED844((char *)self, (uint64_t)a2, (SEL *)&selRef_canIncreaseTextSize);
}

- (BOOL)canDecreaseTextSize
{
  return sub_1BF6ED844((char *)self, (uint64_t)a2, (SEL *)&selRef_canDecreaseTextSize);
}

- (BOOL)canZoomIn
{
  return sub_1BF6ED844((char *)self, (uint64_t)a2, (SEL *)&selRef_canZoomIn);
}

- (BOOL)canZoomOut
{
  return sub_1BF6ED844((char *)self, (uint64_t)a2, (SEL *)&selRef_canZoomOut);
}

- (BOOL)canResetZoom
{
  return sub_1BF6ED844((char *)self, (uint64_t)a2, (SEL *)&selRef_canResetZoom);
}

- (void)increaseTextSize
{
}

- (void)decreaseTextSize
{
}

- (void)zoomIn
{
}

- (void)zoomOut
{
}

- (void)resetZoom
{
}

@end