@interface _UICanvasFeedbackGenerator
- (_UICanvasFeedbackGenerator)init;
- (_UICanvasFeedbackGenerator)initWithConfiguration:(id)a3;
- (_UICanvasFeedbackGenerator)initWithConfiguration:(id)a3 coordinateSpace:(id)a4;
- (_UICanvasFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4;
- (_UICanvasFeedbackGenerator)initWithCoordinateSpace:(id)a3;
- (_UICanvasFeedbackGenerator)initWithView:(id)a3;
- (void)snappingOccurredAtLocation:(CGPoint)a3;
@end

@implementation _UICanvasFeedbackGenerator

- (void)snappingOccurredAtLocation:(CGPoint)a3
{
}

- (_UICanvasFeedbackGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UICanvasFeedbackGenerator;
  return [(UICanvasFeedbackGenerator *)&v3 init];
}

- (_UICanvasFeedbackGenerator)initWithCoordinateSpace:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UICanvasFeedbackGenerator;
  return [(UICanvasFeedbackGenerator *)&v4 initWithCoordinateSpace:a3];
}

- (_UICanvasFeedbackGenerator)initWithConfiguration:(id)a3 coordinateSpace:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UICanvasFeedbackGenerator;
  return [(UICanvasFeedbackGenerator *)&v5 initWithConfiguration:a3 coordinateSpace:a4];
}

- (_UICanvasFeedbackGenerator)initWithView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UICanvasFeedbackGenerator;
  return [(UICanvasFeedbackGenerator *)&v4 initWithView:a3];
}

- (_UICanvasFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UICanvasFeedbackGenerator;
  return [(UICanvasFeedbackGenerator *)&v5 initWithConfiguration:a3 view:a4];
}

- (_UICanvasFeedbackGenerator)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UICanvasFeedbackGenerator;
  return [(UICanvasFeedbackGenerator *)&v4 initWithConfiguration:a3];
}

@end