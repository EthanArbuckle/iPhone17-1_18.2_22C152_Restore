@interface NTKInterpolatedColorPalette
+ (BOOL)resolveInstanceMethod:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (NTKFaceColorPalette)fromPalette;
- (NTKFaceColorPalette)toPalette;
- (NTKInterpolatedColorPalette)initWithColorPalette:(id)a3;
- (NTKInterpolatedColorPalette)initWithFromPalette:(id)a3 toPalette:(id)a4;
- (double)transitionFraction;
- (id)colorInterpolator;
- (id)floatInterpolator;
- (id)interpolatedColorFromSelector:(SEL)a3 parameter:(id)a4;
- (id)valueForKey:(id)a3;
- (void)setColorInterpolator:(id)a3;
- (void)setFloatInterpolator:(id)a3;
- (void)setFromPalette:(id)a3;
- (void)setToPalette:(id)a3;
- (void)setTransitionFraction:(double)a3;
@end

@implementation NTKInterpolatedColorPalette

- (NTKInterpolatedColorPalette)initWithFromPalette:(id)a3 toPalette:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKInterpolatedColorPalette;
  v8 = [(NTKInterpolatedColorPalette *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    fromPalette = v8->_fromPalette;
    v8->_fromPalette = (NTKFaceColorPalette *)v9;

    uint64_t v11 = [v7 copy];
    toPalette = v8->_toPalette;
    v8->_toPalette = (NTKFaceColorPalette *)v11;

    v13 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v8->_cache;
    v8->_cache = v13;
  }
  return v8;
}

- (NTKInterpolatedColorPalette)initWithColorPalette:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKInterpolatedColorPalette;
  v5 = [(NTKInterpolatedColorPalette *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    fromPalette = v5->_fromPalette;
    v5->_fromPalette = (NTKFaceColorPalette *)v6;

    uint64_t v8 = [v4 copy];
    toPalette = v5->_toPalette;
    v5->_toPalette = (NTKFaceColorPalette *)v8;

    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v5->_cache;
    v5->_cache = v10;
  }
  return v5;
}

- (id)valueForKey:(id)a3
{
  SEL v4 = NSSelectorFromString((NSString *)a3);
  return [(NTKInterpolatedColorPalette *)self interpolatedColorFromSelector:v4 parameter:0];
}

- (id)interpolatedColorFromSelector:(SEL)a3 parameter:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a3);
  uint64_t v9 = [v7 stringWithFormat:@"%@-%@", v8, v6];

  v10 = [(NSCache *)self->_cache objectForKey:v9];
  if (v10)
  {
    id v11 = v10;
    goto LABEL_22;
  }
  v12 = PerformSelectorWithArgument(self->_fromPalette, (uint64_t)a3, (uint64_t)v6);
  objc_super v13 = [(NTKFaceColorPalette *)self->_fromPalette identifier];
  v14 = [(NTKFaceColorPalette *)self->_toPalette identifier];
  int v15 = [v13 isEqual:v14];

  if (v15)
  {
    id v16 = v12;
    if (!v16) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v17 = PerformSelectorWithArgument(self->_toPalette, (uint64_t)a3, (uint64_t)v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v18 = [(NTKInterpolatedColorPalette *)self colorInterpolator];

    if (v18)
    {
      v19 = [(NTKInterpolatedColorPalette *)self colorInterpolator];
      [(NTKInterpolatedColorPalette *)self transitionFraction];
      ((void (**)(void, void *, void *))v19)[2](v19, v12, v17);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    [(NTKInterpolatedColorPalette *)self transitionFraction];
    uint64_t v28 = NTKInterpolateBetweenColors();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v16 = 0;
      goto LABEL_19;
    }
    [v12 floatValue];
    double v21 = v20;
    [v17 floatValue];
    double v23 = v22;
    v24 = [(NTKInterpolatedColorPalette *)self floatInterpolator];

    if (v24)
    {
      v25 = [(NTKInterpolatedColorPalette *)self floatInterpolator];
      [(NTKInterpolatedColorPalette *)self transitionFraction];
      double v27 = v25[2](v25, v21, v23, v26);
    }
    else
    {
      [(NTKInterpolatedColorPalette *)self transitionFraction];
      CLKInterpolateBetweenFloatsClipped();
      double v27 = v29;
    }
    uint64_t v28 = [NSNumber numberWithDouble:v27];
  }
  id v16 = (id)v28;
LABEL_19:

  if (v16) {
LABEL_20:
  }
    [(NSCache *)self->_cache setObject:v16 forKey:v9];
LABEL_21:
  id v11 = v16;

LABEL_22:
  return v11;
}

- (void)setTransitionFraction:(double)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  self->_transitionFraction = a3;
  cache = self->_cache;
  [(NSCache *)cache removeAllObjects];
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  v5 = NSStringFromSelector(a3);
  id v6 = [v5 componentsSeparatedByString:@":"];
  uint64_t v7 = [v6 count];

  if (v7 == 2)
  {
    uint64_t v8 = "@@:@";
    uint64_t v9 = (void (*)(void))NTKInterpolatedColorPalette_singleArgumentMethodImplementation;
  }
  else
  {
    if (v7 != 1)
    {
      v13.receiver = a1;
      v13.super_class = (Class)&OBJC_METACLASS___NTKInterpolatedColorPalette;
      unsigned __int8 v10 = objc_msgSendSuper2(&v13, sel_resolveInstanceMethod_, a3);
      goto LABEL_7;
    }
    uint64_t v8 = "@@:";
    uint64_t v9 = (void (*)(void))NTKInterpolatedColorPalette_noArgumentMethodImplementation;
  }
  unsigned __int8 v10 = class_addMethod((Class)a1, a3, v9, v8);
LABEL_7:
  BOOL v11 = v10;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SEL v4 = (NTKInterpolatedColorPalette *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    fromPalette = self->_fromPalette;
    uint64_t v7 = [(NTKInterpolatedColorPalette *)v4 fromPalette];
    if ([(NTKFaceColorPalette *)fromPalette isEqual:v7])
    {
      toPalette = self->_toPalette;
      uint64_t v9 = [(NTKInterpolatedColorPalette *)v5 toPalette];
      if ([(NTKFaceColorPalette *)toPalette isEqual:v9])
      {
        [(NTKInterpolatedColorPalette *)self transitionFraction];
        double v11 = v10;
        [(NTKInterpolatedColorPalette *)v5 transitionFraction];
        BOOL v13 = v11 == v12;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (double)transitionFraction
{
  return self->_transitionFraction;
}

- (NTKFaceColorPalette)fromPalette
{
  return self->_fromPalette;
}

- (void)setFromPalette:(id)a3
{
}

- (NTKFaceColorPalette)toPalette
{
  return self->_toPalette;
}

- (void)setToPalette:(id)a3
{
}

- (id)colorInterpolator
{
  return self->_colorInterpolator;
}

- (void)setColorInterpolator:(id)a3
{
}

- (id)floatInterpolator
{
  return self->_floatInterpolator;
}

- (void)setFloatInterpolator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_floatInterpolator, 0);
  objc_storeStrong(&self->_colorInterpolator, 0);
  objc_storeStrong((id *)&self->_toPalette, 0);
  objc_storeStrong((id *)&self->_fromPalette, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end