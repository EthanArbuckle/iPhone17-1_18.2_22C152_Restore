@interface RSBayWindowFPRemoval
- (RSBayWindowFPRemoval)init;
@end

@implementation RSBayWindowFPRemoval

- (RSBayWindowFPRemoval)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSBayWindowFPRemoval;
  result = [(RSBayWindowFPRemoval *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_angle_thr_side = xmmword_25B5F1150;
    *(void *)&result->_overlap_thr = 0x3E99999A3F4CCCCDLL;
  }
  return result;
}

@end