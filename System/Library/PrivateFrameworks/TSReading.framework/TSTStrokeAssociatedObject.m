@interface TSTStrokeAssociatedObject
- (BOOL)dontClearBackground;
- (void)setDontClearBackground:(BOOL)a3;
@end

@implementation TSTStrokeAssociatedObject

- (BOOL)dontClearBackground
{
  return self->dontClearBackground;
}

- (void)setDontClearBackground:(BOOL)a3
{
  self->dontClearBackground = a3;
}

@end