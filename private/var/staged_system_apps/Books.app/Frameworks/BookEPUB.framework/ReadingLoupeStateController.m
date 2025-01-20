@interface ReadingLoupeStateController
- (void)timerFiredWithTimer:(id)a3;
@end

@implementation ReadingLoupeStateController

- (void)timerFiredWithTimer:(id)a3
{
  *(void *)&self->readingLoupeScrolledPointInView[11] = 0;
  _objc_release_x1();
}

@end