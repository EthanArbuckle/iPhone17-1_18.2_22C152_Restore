@interface GQHKeynoteState
- (BOOL)shouldMapLinkWithUrl:(__CFString *)a3;
- (BOOL)shouldStreamContent;
- (CGSize)slideSize;
- (int)currentSlide;
- (int)progressiveIndex;
- (void)incrementCurrentSlide;
- (void)setProgressiveIndex:(int)a3;
- (void)setSlideSize:(CGSize)a3;
@end

@implementation GQHKeynoteState

- (void)incrementCurrentSlide
{
}

- (int)currentSlide
{
  return self->mCurrentSlide;
}

- (CGSize)slideSize
{
  double width = self->mSlideSize.width;
  double height = self->mSlideSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSlideSize:(CGSize)a3
{
  self->mSlideSize = a3;
}

- (BOOL)shouldMapLinkWithUrl:(__CFString *)a3
{
  return a3 != 0;
}

- (int)progressiveIndex
{
  return self->mProgressiveIndex;
}

- (void)setProgressiveIndex:(int)a3
{
  self->mProgressiveIndex = a3;
}

- (BOOL)shouldStreamContent
{
  int mCurrentSlide = self->mCurrentSlide;
  int v3 = mCurrentSlide % self->mProgressiveIndex;
  if (!v3) {
    self->mProgressiveIndex = 2 * mCurrentSlide + 2;
  }
  return v3 == 0;
}

@end