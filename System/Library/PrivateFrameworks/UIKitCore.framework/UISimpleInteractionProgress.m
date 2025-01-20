@interface UISimpleInteractionProgress
- (void)endInteraction:(BOOL)a3;
@end

@implementation UISimpleInteractionProgress

- (void)endInteraction:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UISimpleInteractionProgress;
  [(UIInteractionProgress *)&v3 endInteraction:a3];
}

@end