@interface CanvasPointerDelegate
- (_TtC8PaperKit21CanvasPointerDelegate)init;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
@end

@implementation CanvasPointerDelegate

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (_TtC8PaperKit21CanvasPointerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CanvasPointerDelegate();
  return [(CanvasPointerDelegate *)&v3 init];
}

@end