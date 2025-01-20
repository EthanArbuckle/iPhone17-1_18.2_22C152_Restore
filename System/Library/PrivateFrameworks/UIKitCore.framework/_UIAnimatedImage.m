@interface _UIAnimatedImage
+ (BOOL)supportsSecureCoding;
- (BOOL)_isPDFVector;
- (BOOL)_isResizable;
- (BOOL)_isSVGVector;
- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)_contentRectInPixels;
- (CGRect)_contentStretchInPixels;
- (CGSize)_sizeWithHairlineThickening:(BOOL)a3 forTraitCollection:(id)a4;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)capInsets;
- (_UIAnimatedImage)initWithCoder:(id)a3;
- (_UIAnimatedImage)initWithImages:(id)a3 duration:(double)a4;
- (double)duration;
- (id)_bezeledImageWithShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 fillRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 drawShadow:(BOOL)a11;
- (id)_doubleBezeledImageWithExteriorShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 interiorShadowRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 fillRed:(double)a11 green:(double)a12 blue:(double)a13 alpha:(double)a14;
- (id)_imageScaledToProportion:(double)a3 interpolationQuality:(int)a4;
- (id)_imageWithStylePresets:(id)a3 tintColor:(id)a4 traitCollection:(id)a5;
- (id)_initWithOtherImage:(id)a3;
- (id)images;
- (id)resizableImageWithCapInsets:(UIEdgeInsets)a3;
- (id)resizableImageWithCapInsets:(UIEdgeInsets)a3 resizingMode:(int64_t)a4;
- (int64_t)resizingMode;
- (unint64_t)hash;
- (void)_horizontallyFlipImageOrientation;
- (void)_mirrorImageOrientation;
- (void)_setAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)_setAlwaysStretches:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIAnimatedImage

- (id)_initWithOtherImage:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 images];
    [v4 duration];
  }
  else
  {
    v9[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    double v6 = 0.0;
  }
  v7 = [(_UIAnimatedImage *)self initWithImages:v5 duration:v6];

  if (v7) {
    [v4 _configureImage:v7 assumePreconfigured:0];
  }

  return v7;
}

- (_UIAnimatedImage)initWithImages:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v7 = [v6 objectAtIndex:0];
  v12.receiver = self;
  v12.super_class = (Class)_UIAnimatedImage;
  v8 = [(UIImage *)&v12 _initWithOtherImage:v7];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    images = v8->_images;
    v8->_images = (NSArray *)v9;

    if (a4 <= 0.0) {
      a4 = (double)(unint64_t)[v6 count] * 0.0333333333;
    }
    v8->_duration = a4;
  }

  return v8;
}

- (BOOL)_isPDFVector
{
  return 0;
}

- (BOOL)_isSVGVector
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIAnimatedImage)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIAnimatedImage;
  v5 = [(UIImage *)&v12 initWithCoder:v4];
  if (v5)
  {
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"UIImages"];
    images = v5->_images;
    v5->_images = (NSArray *)v8;

    [v4 decodeDoubleForKey:@"UIDuration"];
    v5->_duration = v10;
    if (v10 == 0.0) {
      v5->_duration = (double)[(NSArray *)v5->_images count] * 0.0333333333;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIAnimatedImage;
  [(UIImage *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_images forKey:@"UIImages"];
  if (fabs(self->_duration + (double)[(NSArray *)self->_images count] * -0.0333333333) >= 2.22044605e-16) {
    [v4 encodeDouble:@"UIDuration" forKey:self->_duration];
  }
}

- (id)images
{
  return self->_images;
}

- (double)duration
{
  return self->_duration;
}

- (void)_mirrorImageOrientation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_UIAnimatedImage;
  [(UIImage *)&v12 _mirrorImageOrientation];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_images;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "_mirrorImageOrientation", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_horizontallyFlipImageOrientation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_UIAnimatedImage;
  [(UIImage *)&v12 _horizontallyFlipImageOrientation];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_images;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "_horizontallyFlipImageOrientation", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (UIEdgeInsets)capInsets
{
  v2 = [(NSArray *)self->_images objectAtIndex:0];
  [v2 capInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (int64_t)resizingMode
{
  v2 = [(NSArray *)self->_images objectAtIndex:0];
  int64_t v3 = [v2 resizingMode];

  return v3;
}

- (CGRect)_contentStretchInPixels
{
  v2 = [(NSArray *)self->_images objectAtIndex:0];
  [v2 _contentStretchInPixels];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_contentRectInPixels
{
  v2 = [(NSArray *)self->_images objectAtIndex:0];
  [v2 _contentRectInPixels];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_isResizable
{
  v2 = [(NSArray *)self->_images objectAtIndex:0];
  char v3 = [v2 _isResizable];

  return v3;
}

- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(NSArray *)self->_images objectAtIndex:0];
  char v6 = objc_msgSend(v5, "_isTiledWhenStretchedToSize:", width, height);

  return v6;
}

- (void)_setAlwaysStretches:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = self->_images;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "_setAlwaysStretches:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)resizableImageWithCapInsets:(UIEdgeInsets)a3
{
  return -[_UIAnimatedImage resizableImageWithCapInsets:resizingMode:](self, "resizableImageWithCapInsets:resizingMode:", 0, a3.top, a3.left, a3.bottom, a3.right);
}

- (id)resizableImageWithCapInsets:(UIEdgeInsets)a3 resizingMode:(int64_t)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_images, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v12 = self->_images;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "resizableImageWithCapInsets:", top, left, bottom, right);
        if (!v18)
        {
          v24 = [MEMORY[0x1E4F28B00] currentHandler];
          int64_t v25 = a4;
          v33.double top = top;
          v33.double left = left;
          v33.double bottom = bottom;
          v33.double right = right;
          NSStringFromUIEdgeInsets(v33);
          v20 = v19 = a2;
          [v24 handleFailureInMethod:v19, self, @"UIImage.m", 734, @"Unable to create resizable image from %@ with cap insets %@", v17, v20 object file lineNumber description];

          a2 = v19;
          a4 = v25;
        }
        [v11 addObject:v18];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  v21 = +[UIImage animatedImageWithImages:v11 duration:self->_duration];
  v22 = v21;
  if (a4 == 1) {
    [v21 _setAlwaysStretches:1];
  }

  return v22;
}

- (void)_setAlignmentRectInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_images;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "_setAlignmentRectInsets:", top, left, bottom, right, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  v2 = [(NSArray *)self->_images objectAtIndex:0];
  [v2 alignmentRectInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v12;
  result.double top = v11;
  return result;
}

- (id)_bezeledImageWithShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 fillRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 drawShadow:(BOOL)a11
{
  BOOL v11 = a11;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_images, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v22 = self->_images;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "_bezeledImageWithShadowRed:green:blue:alpha:fillRed:green:blue:alpha:drawShadow:", v11, a3, a4, a5, a6, a7, a8, a9, a10, (void)v30);
        [v21 addObject:v27];
      }
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v24);
  }

  long long v28 = +[UIImage animatedImageWithImages:v21 duration:self->_duration];

  return v28;
}

- (id)_doubleBezeledImageWithExteriorShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 interiorShadowRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 fillRed:(double)a11 green:(double)a12 blue:(double)a13 alpha:(double)a14
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_images, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v20 = self->_images;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = [*(id *)(*((void *)&v32 + 1) + 8 * i) _doubleBezeledImageWithExteriorShadowRed:a3 green:a4 blue:a5 alpha:a6 interiorShadowRed:a7 green:a8 blue:a9 alpha:a10 fillRed:*(void *)&a11 green:*(void *)&a12 blue:*(void *)&a13 alpha:*(void *)&a14];
        [v19 addObject:v25];
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v22);
  }

  long long v26 = +[UIImage animatedImageWithImages:v19 duration:self->_duration];

  return v26;
}

- (id)_imageScaledToProportion:(double)a3 interpolationQuality:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_images, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v8 = self->_images;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "_imageScaledToProportion:interpolationQuality:", v4, a3, (void)v16);
        [v7 addObject:v13];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  double v14 = +[UIImage animatedImageWithImages:v7 duration:self->_duration];

  return v14;
}

- (id)_imageWithStylePresets:(id)a3 tintColor:(id)a4 traitCollection:(id)a5
{
  double v6 = NSStringFromSelector(a2);
  NSLog(&cfstr_NotYetSupporte.isa, v6);

  return self;
}

- (CGSize)_sizeWithHairlineThickening:(BOOL)a3 forTraitCollection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(NSArray *)self->_images firstObject];
  double v8 = v7;
  if (v7)
  {
    [v7 _sizeWithHairlineThickening:v4 forTraitCollection:v6];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(_UIAnimatedImage *)self images];
    uint64_t v7 = [v6 count];
    double v8 = [v5 images];
    if (v7 != [v8 count]) {
      goto LABEL_15;
    }
    [(_UIAnimatedImage *)self duration];
    double v10 = v9;
    [v5 duration];
    if (v10 != v11) {
      goto LABEL_15;
    }
    [(_UIAnimatedImage *)self capInsets];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [v5 capInsets];
    if (v15 == v23 && v13 == v20 && v19 == v22 && v17 == v21)
    {
      int64_t v24 = [(_UIAnimatedImage *)self resizingMode];
      uint64_t v25 = [v5 resizingMode];

      if (v24 == v25)
      {
        long long v26 = [(_UIAnimatedImage *)self images];
        uint64_t v27 = [v26 count];

        if (v27)
        {
          unint64_t v28 = 0;
          do
          {
            long long v29 = [(_UIAnimatedImage *)self images];
            long long v30 = [v29 objectAtIndexedSubscript:v28];

            long long v31 = [v5 images];
            long long v32 = [v31 objectAtIndexedSubscript:v28];

            char v33 = [v30 isEqual:v32];
            if ((v33 & 1) == 0) {
              break;
            }
            ++v28;
            long long v34 = [(_UIAnimatedImage *)self images];
            unint64_t v35 = [v34 count];
          }
          while (v28 < v35);
        }
        else
        {
          char v33 = 1;
        }
        goto LABEL_17;
      }
    }
    else
    {
LABEL_15:
    }
    char v33 = 0;
LABEL_17:

    goto LABEL_18;
  }
  char v33 = 0;
LABEL_18:

  return v33;
}

- (unint64_t)hash
{
  v2 = [(NSArray *)self->_images objectAtIndexedSubscript:0];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void).cxx_destruct
{
}

@end