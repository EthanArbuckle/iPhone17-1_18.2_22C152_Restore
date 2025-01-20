@interface _UIAnimatedColor
+ (CGPatternCallbacks)_patternCallbacks;
+ (id)animatedColorForParentView:(id)a3;
- (BOOL)_geometryObserverNeedsAncestorOnly;
- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6;
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (BOOL)getWhite:(double *)a3 alpha:(double *)a4;
- (BOOL)isAnimating;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPatternColor;
- (CGColor)CGColor;
- (CGColor)_patternColorForSize:(CGSize)a3;
- (UIView)parentView;
- (_UIAnimatedColor)colorWithAlphaComponent:(double)a3;
- (_UIAnimatedColor)initWithBounds:(CGRect)a3 invalidationHandler:(id)a4;
- (_UIAnimatedColor)initWithParentView:(id)a3;
- (double)alphaComponent;
- (double)progress;
- (id)colorSpaceName;
- (unint64_t)hash;
- (void)_drawPatternWithContext:(CGContext *)a3;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_presentationValueChanged;
- (void)_recreatePatternColorForBounds:(CGRect)a3;
- (void)dealloc;
- (void)set;
- (void)setAnimating:(BOOL)a3;
- (void)setFill;
- (void)setProgress:(double)a3;
- (void)setStroke;
@end

@implementation _UIAnimatedColor

+ (CGPatternCallbacks)_patternCallbacks
{
  if (_MergedGlobals_3_14 != -1) {
    dispatch_once(&_MergedGlobals_3_14, &__block_literal_global_261);
  }
  *(_OWORD *)&retstr->version = xmmword_1EB25CE30;
  retstr->releaseInfo = (CGPatternReleaseInfoCallback)qword_1EB25CE40;
  return result;
}

+ (id)animatedColorForParentView:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithParentView:v4];

  return v5;
}

- (_UIAnimatedColor)initWithParentView:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___UIAnimatedColor_initWithParentView___block_invoke;
  aBlock[3] = &unk_1E52F0980;
  v5 = v4;
  id v11 = v5;
  v6 = _Block_copy(aBlock);
  [v5 bounds];
  v7 = -[_UIAnimatedColor initWithBounds:invalidationHandler:](self, "initWithBounds:invalidationHandler:", v6);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentView, v5);
    -[UIView _addGeometryChangeObserver:](v5, v8);
  }

  return v8;
}

- (_UIAnimatedColor)initWithBounds:(CGRect)a3 invalidationHandler:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_UIAnimatedColor;
  v10 = [(_UIAnimatedColor *)&v24 init];
  id v11 = v10;
  if (v10)
  {
    v10->_bounds.origin.double x = x;
    v10->_bounds.origin.double y = y;
    v10->_bounds.size.double width = width;
    v10->_bounds.size.double height = height;
    uint64_t v12 = [v9 copy];
    id invalidationHandler = v11->_invalidationHandler;
    v11->_id invalidationHandler = (id)v12;

    v14 = objc_alloc_init(UIViewFloatAnimatableProperty);
    progressAnimatablePropertdouble y = v11->_progressAnimatableProperty;
    v11->_progressAnimatablePropertdouble y = v14;

    [(UIViewFloatAnimatableProperty *)v11->_progressAnimatableProperty setValue:0.0];
    objc_initWeak(&location, v11);
    v25[0] = v11->_progressAnimatableProperty;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __55___UIAnimatedColor_initWithBounds_invalidationHandler___block_invoke;
    v21 = &unk_1E52DC308;
    objc_copyWeak(&v22, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:v16 presentationValueChangedCallback:&v18];

    -[_UIAnimatedColor _recreatePatternColorForBounds:](v11, "_recreatePatternColorForBounds:", x, y, width, height, v18, v19, v20, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)dealloc
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  -[UIView _removeGeometryChangeObserver:](WeakRetained, self);

  displayLink = self->_displayLink;
  v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)displayLink removeFromRunLoop:v5 forMode:*MEMORY[0x1E4F1C4B0]];

  v6.receiver = self;
  v6.super_class = (Class)_UIAnimatedColor;
  [(_UIAnimatedColor *)&v6 dealloc];
}

- (void)setProgress:(double)a3
{
  if (vabdd_f64(self->_progress, a3) > 2.22044605e-16)
  {
    self->_progress = a3;
    -[UIViewFloatAnimatableProperty setValue:](self->_progressAnimatableProperty, "setValue:");
  }
}

- (CGColor)_patternColorForSize:(CGSize)a3
{
  CGFloat width = a3.width;
  if (a3.width < 2.22044605e-16 || a3.height < 2.22044605e-16) {
    return 0;
  }
  CGFloat height = a3.height;
  v23.origin.CGFloat x = 0.0;
  v23.origin.CGFloat y = 0.0;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRect v24 = CGRectIntegral(v23);
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat v10 = v24.size.width;
  CGFloat v11 = v24.size.height;
  memset(&callbacks, 0, sizeof(callbacks));
  uint64_t v12 = objc_opt_class();
  if (v12) {
    [v12 _patternCallbacks];
  }
  else {
    memset(&callbacks, 0, sizeof(callbacks));
  }
  v13 = self;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v21.c = v14;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGFloat v15 = x;
  *(CGFloat *)&long long v14 = y;
  CGFloat v16 = v10;
  CGFloat v17 = v11;
  uint64_t v18 = CGPatternCreate(v13, *(CGRect *)((char *)&v14 - 8), &v21, width, height, kCGPatternTilingConstantSpacing, 1, &callbacks);
  Pattern = CGColorSpaceCreatePattern(0);
  CGColorRef v20 = CGColorCreateWithPattern(Pattern, v18, &_patternColorForSize__alpha);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v18);
  return (CGColor *)CFAutorelease(v20);
}

- (void)_recreatePatternColorForBounds:(CGRect)a3
{
  if (-[_UIAnimatedColor _patternColorForSize:](self, "_patternColorForSize:", a3.size.width, a3.size.height)) {
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:");
  }
  else {
  id v4 = +[UIColor yellowColor];
  }
  wrappedColor = self->_wrappedColor;
  self->_wrappedColor = v4;
}

- (void)_drawPatternWithContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  [(UIViewFloatAnimatableProperty *)self->_progressAnimatableProperty presentationValue];
  -[_UIAnimatedColor drawRect:usingContext:progress:](self, "drawRect:usingContext:progress:", a3, x, y, width, height, v9);
  CGContextRestoreGState(a3);
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
    v5 = [WeakRetained window];
    objc_super v6 = [v5 screen];
    v7 = [v6 displayLinkWithTarget:self selector:sel__didFireDisplayLink_];

    if (!v7)
    {
      v7 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__didFireDisplayLink_];
    }
    displayLink = self->_displayLink;
    double v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    uint64_t v10 = *MEMORY[0x1E4F1C4B0];
    [(CADisplayLink *)displayLink removeFromRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

    CGFloat v11 = self->_displayLink;
    self->_displayLink = v7;
    uint64_t v12 = v7;

    uint64_t v16 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v12 addToRunLoop:v16 forMode:v10];

    v13 = (CADisplayLink *)v16;
  }
  else
  {
    long long v14 = self->_displayLink;
    CGFloat v15 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v14 removeFromRunLoop:v15 forMode:*MEMORY[0x1E4F1C4B0]];

    v13 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)_presentationValueChanged
{
}

- (BOOL)_geometryObserverNeedsAncestorOnly
{
  return 1;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if ((a3->var0 & 0x108) != 0)
  {
    p_parentView = &self->_parentView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
    [WeakRetained bounds];
    -[_UIAnimatedColor _recreatePatternColorForBounds:](self, "_recreatePatternColorForBounds:");

    id v8 = objc_loadWeakRetained((id *)p_parentView);
    v7 = [v8 window];
    [(CADisplayLink *)self->_displayLink setPaused:v7 == 0];
  }
}

- (id)colorSpaceName
{
  return @"kCGColorSpaceModelPattern";
}

- (BOOL)isPatternColor
{
  return 1;
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  return 0;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  return 0;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return 0;
}

- (void)set
{
}

- (void)setFill
{
}

- (void)setStroke
{
}

- (unint64_t)hash
{
  return [(UIColor *)self->_wrappedColor hash];
}

- (double)alphaComponent
{
  [(UIColor *)self->_wrappedColor alphaComponent];
  return result;
}

- (CGColor)CGColor
{
  return [(UIColor *)self->_wrappedColor CGColor];
}

- (_UIAnimatedColor)colorWithAlphaComponent:(double)a3
{
  return (_UIAnimatedColor *)[(UIColor *)self->_wrappedColor colorWithAlphaComponent:a3];
}

- (UIView)parentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  return (UIView *)WeakRetained;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentView);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_progressAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_wrappedColor, 0);
}

@end