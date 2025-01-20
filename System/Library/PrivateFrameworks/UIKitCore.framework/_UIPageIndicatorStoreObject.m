@interface _UIPageIndicatorStoreObject
- (BOOL)hasImage;
- (BOOL)validPageWithinBound:(int64_t)a3;
- (CGSize)activeIndicatorSize;
- (CGSize)indicatorSize;
- (CGSize)resolvedSize;
- (UIImage)activeImage;
- (UIImage)customImage;
- (_UIPageIndicatorStoreObject)initWithStartIndex:(int64_t)a3 endIndex:(int64_t)a4;
- (id)description;
- (id)splitAtIndex:(int64_t)a3 withImage:(id)a4 active:(BOOL)a5;
- (int64_t)endIndex;
- (int64_t)startIndex;
- (void)_copyImagesFromObject:(id)a3;
- (void)invalidateLayoutInfo;
- (void)setActiveImage:(id)a3;
- (void)setActiveIndicatorSize:(CGSize)a3;
- (void)setCustomImage:(id)a3;
- (void)setEndIndex:(int64_t)a3;
- (void)setIndicatorSize:(CGSize)a3;
- (void)setStartIndex:(int64_t)a3;
@end

@implementation _UIPageIndicatorStoreObject

- (CGSize)indicatorSize
{
  double width = self->_indicatorSize.width;
  double height = self->_indicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)activeIndicatorSize
{
  double width = self->_activeIndicatorSize.width;
  double height = self->_activeIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)resolvedSize
{
  double width = self->_indicatorSize.width;
  double height = self->_indicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)hasImage
{
  return self->_customImage || self->_activeImage != 0;
}

- (int64_t)endIndex
{
  return self->_endIndex;
}

- (BOOL)validPageWithinBound:(int64_t)a3
{
  return self->_startIndex <= a3 && self->_endIndex > a3;
}

- (int64_t)startIndex
{
  return self->_startIndex;
}

- (_UIPageIndicatorStoreObject)initWithStartIndex:(int64_t)a3 endIndex:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIPageIndicatorStoreObject;
  v6 = [(_UIPageIndicatorStoreObject *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(_UIPageIndicatorStoreObject *)v6 setStartIndex:a3];
    [(_UIPageIndicatorStoreObject *)v7 setEndIndex:a4];
  }
  return v7;
}

- (void)setEndIndex:(int64_t)a3
{
  self->_endIndex = a3;
}

- (void)setStartIndex:(int64_t)a3
{
  self->_startIndex = a3;
}

- (void)setActiveIndicatorSize:(CGSize)a3
{
  self->_activeIndicatorSize = a3;
}

- (void)invalidateLayoutInfo
{
  -[_UIPageIndicatorStoreObject setIndicatorSize:](self, "setIndicatorSize:", -1.0, -1.0);
  -[_UIPageIndicatorStoreObject setActiveIndicatorSize:](self, "setActiveIndicatorSize:", -1.0, -1.0);
}

- (void)setIndicatorSize:(CGSize)a3
{
  self->_indicatorSize = a3;
}

- (UIImage)customImage
{
  return self->_customImage;
}

- (UIImage)activeImage
{
  return self->_activeImage;
}

- (id)splitAtIndex:(int64_t)a3 withImage:(id)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (self->_endIndex - self->_startIndex == 1)
  {
    uint64_t v10 = 8;
    if (v5) {
      uint64_t v10 = 16;
    }
    objc_storeStrong((id *)((char *)&self->super.isa + v10), a4);
    v18[0] = self;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    v11 = objc_opt_new();
    if (self->_startIndex < a3)
    {
      v12 = [[_UIPageIndicatorStoreObject alloc] initWithStartIndex:self->_startIndex endIndex:a3];
      [(_UIPageIndicatorStoreObject *)v12 _copyImagesFromObject:self];
      [v11 addObject:v12];
    }
    int64_t v13 = a3 + 1;
    v14 = [[_UIPageIndicatorStoreObject alloc] initWithStartIndex:a3 endIndex:a3 + 1];
    v15 = v14;
    if (v5) {
      [(_UIPageIndicatorStoreObject *)v14 setActiveImage:v9];
    }
    else {
      [(_UIPageIndicatorStoreObject *)v14 setCustomImage:v9];
    }
    [v11 addObject:v15];
    if (v13 < self->_endIndex)
    {
      v16 = [[_UIPageIndicatorStoreObject alloc] initWithStartIndex:v13 endIndex:self->_endIndex];

      [(_UIPageIndicatorStoreObject *)v16 _copyImagesFromObject:self];
      [v11 addObject:v16];
      v15 = v16;
    }
  }
  return v11;
}

- (void)setCustomImage:(id)a3
{
  __asm { FMOV            V0.2D, #-1.0 }
  self->_indicatorSize = _Q0;
}

- (void)_copyImagesFromObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 customImage];
  customImage = self->_customImage;
  self->_customImage = v5;

  v7 = [v4 activeImage];
  activeImage = self->_activeImage;
  self->_activeImage = v7;

  [v4 indicatorSize];
  self->_indicatorSize.double width = v9;
  self->_indicatorSize.double height = v10;
  [v4 activeIndicatorSize];
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  self->_activeIndicatorSize.double width = v12;
  self->_activeIndicatorSize.double height = v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeImage, 0);
  objc_storeStrong((id *)&self->_customImage, 0);
}

- (void)setActiveImage:(id)a3
{
  __asm { FMOV            V0.2D, #-1.0 }
  self->_activeIndicatorSize = _Q0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = @"YES";
  if (self->_customImage) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (!self->_activeImage) {
    BOOL v5 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p> Custom: %@, Active: %@, Range: %ld..<%ld", v4, self, v6, v5, self->_startIndex, self->_endIndex];
}

@end