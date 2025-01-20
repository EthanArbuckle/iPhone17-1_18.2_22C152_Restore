@interface UIGraphicsRenderer
+ (BOOL)_supportsContextReuse;
+ (CGContext)_contextWithFormat:(id)a3 renderer:(id)a4;
+ (CGContextRef)contextWithFormat:(UIGraphicsRendererFormat *)format;
+ (Class)rendererContextClass;
+ (void)_destroyCGContext:(CGContext *)a3 withRenderer:(id)a4;
- (BOOL)allowsImageOutput;
- (BOOL)runDrawingActions:(UIGraphicsDrawingActions)drawingActions completionActions:(UIGraphicsDrawingActions)completionActions error:(NSError *)error;
- (BOOL)runDrawingActions:(id)a3 completionActions:(id)a4 format:(id)a5 error:(id *)a6;
- (CGContext)_dequeueContextForReuse;
- (UIGraphicsRenderer)init;
- (UIGraphicsRenderer)initWithBounds:(CGRect)bounds;
- (UIGraphicsRenderer)initWithBounds:(CGRect)bounds format:(UIGraphicsRendererFormat *)format;
- (UIGraphicsRendererFormat)format;
- (void)_configureReuseState;
- (void)_enqueueContextForReuse:(CGContext *)a3;
- (void)popContext:(id)a3;
- (void)pushContext:(id)a3;
@end

@implementation UIGraphicsRenderer

- (UIGraphicsRenderer)initWithBounds:(CGRect)bounds format:(UIGraphicsRendererFormat *)format
{
  CGFloat height = bounds.size.height;
  CGFloat width = bounds.size.width;
  CGFloat y = bounds.origin.y;
  CGFloat x = bounds.origin.x;
  v10 = format;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UIGraphicsRenderer.m", 167, @"Invalid parameter not satisfying: %@", @"format != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)UIGraphicsRenderer;
  v11 = [(UIGraphicsRenderer *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [(UIGraphicsRendererFormat *)v10 copy];
    v13 = v11->_format;
    v11->_format = (UIGraphicsRendererFormat *)v12;

    v14 = v11->_format;
    v14->_bounds.origin.CGFloat x = x;
    v14->_bounds.origin.CGFloat y = y;
    v14->_bounds.size.CGFloat width = width;
    v14->_bounds.size.CGFloat height = height;
    [(UIGraphicsRenderer *)v11 _configureReuseState];
  }

  return v11;
}

- (void)_configureReuseState
{
  if ([(id)objc_opt_class() _supportsContextReuse])
  {
    v3 = [[_UIReusePool alloc] initWithPolicy:3];
    reusePool = self->_reusePool;
    self->_reusePool = v3;
  }
}

+ (BOOL)_supportsContextReuse
{
  return 1;
}

- (void)pushContext:(id)a3
{
  id v3 = a3;
  int v4 = objc_msgSend(v3, "__createsImages");
  v5 = (CGContext *)[v3 CGContext];

  ContextStack = (int *)GetContextStack(1);
  CGContextRef v7 = CGContextRetain(v5);
  int v8 = *ContextStack;
  v9 = &ContextStack[6 * *ContextStack];
  *((void *)v9 + 1) = v7;
  v9[4] = v4;
  *((void *)v9 + 3) = 0;
  int *ContextStack = v8 + 1;
}

- (BOOL)runDrawingActions:(UIGraphicsDrawingActions)drawingActions completionActions:(UIGraphicsDrawingActions)completionActions error:(NSError *)error
{
  UIGraphicsDrawingActions v8 = completionActions;
  UIGraphicsDrawingActions v9 = drawingActions;
  v10 = [(UIGraphicsRenderer *)self format];
  LOBYTE(error) = [(UIGraphicsRenderer *)self runDrawingActions:v9 completionActions:v8 format:v10 error:error];

  return (char)error;
}

- (UIGraphicsRendererFormat)format
{
  return self->_format;
}

- (BOOL)runDrawingActions:(id)a3 completionActions:(id)a4 format:(id)a5 error:(id *)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v10 = (void (**)(id, void *))a3;
  v11 = (void (**)(id, void *))a4;
  id v12 = a5;
  v13 = (void *)[(id)objc_opt_class() rendererContextClass];
  if (([v13 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"*** Attempting to use a Class (%@) that is not a UIGraphicsRendererContext subclass as a UIGraphicsRenderer context.", v13 format];
  }
  v14 = objc_opt_class();
  v15 = [(UIGraphicsRenderer *)self format];
  uint64_t v16 = [v14 _contextWithFormat:v15 renderer:self];

  if (v16)
  {
    objc_super v17 = (void *)[objc_alloc((Class)v13) initWithCGContext:v16 format:v12];
    objc_msgSend(v17, "set__createsImages:", -[UIGraphicsRenderer allowsImageOutput](self, "allowsImageOutput"));
    [(id)objc_opt_class() prepareCGContext:v16 withRendererContext:v17];
    if (v10)
    {
      [(UIGraphicsRenderer *)self pushContext:v17];
      v10[2](v10, v17);
      [(UIGraphicsRenderer *)self popContext:v17];
    }
    if (v11) {
      v11[2](v11, v17);
    }
    [(id)objc_opt_class() _destroyCGContext:v16 withRenderer:self];
  }
  else if (a6)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F281F8];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"Could not create CGContextRef";
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v21 = [v18 errorWithDomain:v19 code:0 userInfo:v20];

    id v22 = v21;
    *a6 = v22;
  }
  return v16 != 0;
}

- (void)popContext:(id)a3
{
  ContextStack = (int *)GetContextStack(0);
  PopContextFromStack(ContextStack);
}

+ (CGContext)_contextWithFormat:(id)a3 renderer:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 _dequeueContextForReuse];
  if (v7)
  {
    UIGraphicsDrawingActions v8 = (CGContext *)v7;
    CGContextResetState();
    CGContextClear();
  }
  else
  {
    UIGraphicsDrawingActions v8 = (CGContext *)[a1 contextWithFormat:v6];
  }

  return v8;
}

- (CGContext)_dequeueContextForReuse
{
  return (CGContext *)objc_claimAutoreleasedReturnValue();
}

+ (void)_destroyCGContext:(CGContext *)a3 withRenderer:(id)a4
{
  v5 = a4;
  if (v5[2])
  {
    id v6 = v5;
    [v5 _prepareContextForReuse:a3];
    [v6 _enqueueContextForReuse:a3];
  }
  else
  {
    if (!a3) {
      goto LABEL_6;
    }
    id v6 = v5;
    CGContextRelease(a3);
  }
  v5 = v6;
LABEL_6:
}

- (void)_enqueueContextForReuse:(CGContext *)a3
{
  -[_UIReusePool addObject:](self->_reusePool, "addObject:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusePool, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

+ (Class)rendererContextClass
{
  return (Class)objc_opt_class();
}

+ (CGContextRef)contextWithFormat:(UIGraphicsRendererFormat *)format
{
  return 0;
}

- (UIGraphicsRenderer)init
{
  return -[UIGraphicsRenderer initWithBounds:](self, "initWithBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (UIGraphicsRenderer)initWithBounds:(CGRect)bounds
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  UIGraphicsDrawingActions v8 = +[UIGraphicsRendererFormat preferredFormat];
  UIGraphicsDrawingActions v9 = -[UIGraphicsRenderer initWithBounds:format:](self, "initWithBounds:format:", v8, x, y, width, height);

  return v9;
}

- (BOOL)allowsImageOutput
{
  return 0;
}

@end