@interface UIMovieScrubberThumbnailView
- (BOOL)hasPlaceholderImage;
- (void)setHasPlaceholderImage:(BOOL)a3;
@end

@implementation UIMovieScrubberThumbnailView

- (void)setHasPlaceholderImage:(BOOL)a3
{
  *((unsigned char *)self + 504) = *((unsigned char *)self + 504) & 0xFE | a3;
}

- (BOOL)hasPlaceholderImage
{
  return *((unsigned char *)self + 504) & 1;
}

@end