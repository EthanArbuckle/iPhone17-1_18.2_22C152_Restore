@interface _TUINotLoadedImageResourceCollector
- (void)collectImageResource:(id)a3;
@end

@implementation _TUINotLoadedImageResourceCollector

- (void)collectImageResource:(id)a3
{
  id v4 = a3;
  if (([v4 isImageLoaded] & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)_TUINotLoadedImageResourceCollector;
    [(_TUIImageResourceCollector *)&v5 collectImageResource:v4];
  }
}

@end