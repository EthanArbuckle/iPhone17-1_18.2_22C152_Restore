@interface _UIOverlayEffectViewEntry
+ (id)newEntryWithFilterType:(id)a3 color:(id)a4 alpha:(double)a5;
+ (id)newEntryWithFilterType:(id)a3 image:(id)a4 alpha:(double)a5;
- (BOOL)canTransitionToEffect:(id)a3;
- (NSString)filterType;
- (UIColor)color;
- (UIImage)image;
- (double)alpha;
- (id)description;
- (void)addEffectToView:(id)a3;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setColor:(id)a3;
- (void)setFilterType:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation _UIOverlayEffectViewEntry

- (void)applyRequestedEffectToView:(id)a3
{
}

- (void)removeEffectFromView:(id)a3
{
  id v7 = a3;
  v3 = [v7 layer];
  [v3 setCompositingFilter:0];

  [v7 setAlpha:1.0];
  v4 = [v7 _nilBackgroundColor];
  [v7 setBackgroundColor:v4];

  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0;
  v6 = v7;
  if (v5) {
    v6 = 0;
  }
  [v6 setImage:0];
}

+ (id)newEntryWithFilterType:(id)a3 color:(id)a4 alpha:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  [(id)v9 setRequirements:0];
  uint64_t v10 = [v8 copy];

  v11 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v10;

  uint64_t v12 = [v7 copy];
  v13 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v12;

  v14 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = 0;

  *(double *)(v9 + 40) = a5;
  return (id)v9;
}

- (void)addEffectToView:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F39BC0];
  id v5 = a3;
  id v9 = (id)[[v4 alloc] initWithType:self->_filterType];
  v6 = [v5 layer];
  [v6 setCompositingFilter:v9];

  [v5 setBackgroundColor:self->_color];
  image = self->_image;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v5;
  }
  else {
    id v8 = 0;
  }
  [v8 setImage:image];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

+ (id)newEntryWithFilterType:(id)a3 image:(id)a4 alpha:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  [(id)v9 setRequirements:v7 != 0];
  uint64_t v10 = [v8 copy];

  v11 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v10;

  uint64_t v12 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = 0;

  v13 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v7;

  *(double *)(v9 + 40) = a5;
  return (id)v9;
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [(_UIVisualEffectViewEntry *)self setRequirements:self->_image != 0];
    id v5 = v6;
  }
}

- (void)applyIdentityEffectToView:(id)a3
{
}

- (BOOL)canTransitionToEffect:(id)a3
{
  filterType = self->_filterType;
  v4 = [a3 filterType];
  LOBYTE(filterType) = [(NSString *)filterType isEqualToString:v4];

  return (char)filterType;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIOverlayEffectViewEntry;
  v3 = [(_UIVisualEffectViewEntry *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" compositingMode=%@ color=%@ image=%@ alpha=%f", self->_filterType, self->_color, self->_image, *(void *)&self->_alpha];

  return v4;
}

- (NSString)filterType
{
  return self->_filterType;
}

- (void)setFilterType:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

@end