@interface _TUILoadedImageResourceCollector
- (void)collectImageResource:(id)a3;
@end

@implementation _TUILoadedImageResourceCollector

- (void)collectImageResource:(id)a3
{
  id v4 = a3;
  if ([v4 isImageLoaded])
  {
    v5.receiver = self;
    v5.super_class = (Class)_TUILoadedImageResourceCollector;
    [(_TUIImageResourceCollector *)&v5 collectImageResource:v4];
  }
}

@end