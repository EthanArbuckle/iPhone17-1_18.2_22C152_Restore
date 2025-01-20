@interface UIGradient
- (id)initVerticalWithValues:(id *)a3;
- (void)dealloc;
- (void)fillRect:(CGRect)a3;
- (void)fillRect:(CGRect)a3 inContext:(CGContext *)a4;
@end

@implementation UIGradient

- (id)initVerticalWithValues:(id *)a3
{
  v3 = a3;
  v4 = self;
  if (!a3)
  {
    NSLog(&cfstr_UigradientInit.isa, a2);
    goto LABEL_12;
  }
  int v5 = 0;
  do
  {
    unsigned int v6 = v5 + 1;
    double var4 = a3[v5++].var4;
  }
  while (var4 < 1.0);
  if (v6 > 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)UIGradient;
    v4 = [(UIGradient *)&v11 init];
    if (v4)
    {
      size_t v8 = 40 * v6;
      v9 = ($3CC2805F0189FCCE51047C0D2B5A52A9 *)malloc_type_malloc(v8, 0x10000400A747E1EuLL);
      v4->_values = v9;
      if (!v9) {
        goto LABEL_6;
      }
      memcpy(v9, v3, v8);
    }
    v4 = v4;
    v3 = ($3CC2805F0189FCCE51047C0D2B5A52A9 *)v4;
    goto LABEL_12;
  }
  NSLog(&cfstr_UigradientInit_0.isa, a2, 1.0);
LABEL_6:
  v3 = 0;
LABEL_12:

  return v3;
}

- (void)fillRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v10 = self->_height;
  shader = self->_shader;
  if (a3.size.height == v10)
  {
    if (shader)
    {
LABEL_10:
      CGContextSaveGState(a4);
      v16.origin.CGFloat x = x;
      v16.origin.CGFloat y = y;
      v16.size.CGFloat width = width;
      v16.size.CGFloat height = height;
      CGContextClipToRect(a4, v16);
      CGContextTranslateCTM(a4, x, y);
      CGContextDrawShading(a4, self->_shader);
      CGContextRestoreGState(a4);
      return;
    }
  }
  else
  {
    if (shader)
    {
      CGShadingRelease(shader);
      self->_shader = 0;
    }
    self->_CGFloat height = height;
  }
  if (!fillRect_inContext____gradientColorSpace) {
    fillRect_inContext____gradientColorSpace = (uint64_t)CGColorSpaceCreateDeviceRGB();
  }
  values = self->_values;
  CGFunctionCallbacks v14 = *(CGFunctionCallbacks *)byte_1ED0E5B08;
  v13 = CGFunctionCreate(values, 1uLL, createGradientShaderFunction_domain, 4uLL, createGradientShaderFunction_range, &v14);
  v15.CGFloat y = self->_height;
  v15.CGFloat x = 0.0;
  self->_shader = CGShadingCreateAxial((CGColorSpaceRef)fillRect_inContext____gradientColorSpace, *MEMORY[0x1E4F1DAD8], v15, v13, 0, 0);
  CGFunctionRelease(v13);
  if (self->_shader) {
    goto LABEL_10;
  }
}

- (void)fillRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  -[UIGradient fillRect:inContext:](self, "fillRect:inContext:", v9, x, y, width, height);
}

- (void)dealloc
{
  shader = self->_shader;
  if (shader) {
    CGShadingRelease(shader);
  }
  free(self->_values);
  v4.receiver = self;
  v4.super_class = (Class)UIGradient;
  [(UIGradient *)&v4 dealloc];
}

@end