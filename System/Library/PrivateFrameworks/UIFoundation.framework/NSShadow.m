@interface NSShadow
+ (BOOL)supportsSecureCoding;
+ (id)defaultShadowColor;
+ (id)shadow;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CGFloat)shadowBlurRadius;
- (CGSize)shadowOffset;
- (NSShadow)init;
- (NSShadow)initWithCoder:(NSCoder *)coder;
- (NSShadow)initWithShadow:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shadowColor;
- (unint64_t)hash;
- (void)applyToGraphicsContext:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setShadowBlurRadius:(CGFloat)shadowBlurRadius;
- (void)setShadowColor:(id)shadowColor;
- (void)setShadowOffset:(CGSize)shadowOffset;
@end

@implementation NSShadow

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithShadow:self];
}

- (id)shadowColor
{
  objc_sync_enter(self);
  if (self->_shadowFlags) {
    shadowColor = self->_shadowColor;
  }
  else {
    shadowColor = (NSColor *)[(id)objc_opt_class() defaultShadowColor];
  }
  objc_sync_exit(self);
  return shadowColor;
}

- (unint64_t)hash
{
  return (unint64_t)((double)(uint64_t)self->_shadowBlurRadius * 10.0)
       + ((uint64_t)(self->_shadowOffset.width * 10.0) << 16)
       + (uint64_t)(self->_shadowOffset.height * 10.0);
}

- (CGFloat)shadowBlurRadius
{
  return self->_shadowBlurRadius;
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
  self->_shadowOffset = shadowOffset;
}

- (void)setShadowBlurRadius:(CGFloat)shadowBlurRadius
{
  self->_shadowBlurRadius = shadowBlurRadius;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_20;
  }
  if (!a3)
  {
LABEL_16:
    LOBYTE(v11) = 0;
    return v11;
  }
  if (object_getClass(self) != (Class)__NSShadowClass || object_getClass(a3) != (Class)__NSShadowClass)
  {
    if (objc_opt_isKindOfClass())
    {
      [(NSShadow *)self shadowOffset];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      [a3 shadowOffset];
      v22.double width = v9;
      v22.double height = v10;
      v21.double width = v6;
      v21.double height = v8;
      int v11 = NSEqualSizes(v21, v22);
      if (!v11) {
        return v11;
      }
      [(NSShadow *)self shadowBlurRadius];
      double v13 = v12;
      [a3 shadowBlurRadius];
      if (v13 == v14)
      {
        v15 = [(NSShadow *)self shadowColor];
        uint64_t v16 = [a3 shadowColor];
        if (v15 != (NSColor *)v16)
        {
          v17 = (NSColor *)v16;
          shadowColor = v15;
          goto LABEL_10;
        }
LABEL_20:
        LOBYTE(v11) = 1;
        return v11;
      }
    }
    goto LABEL_16;
  }
  if (self->_shadowOffset.width != *((double *)a3 + 2)
    || self->_shadowOffset.height != *((double *)a3 + 3)
    || self->_shadowBlurRadius != *((double *)a3 + 4))
  {
    goto LABEL_16;
  }
  if ((self->_shadowFlags & 1) == 0 && (*((unsigned char *)a3 + 8) & 1) == 0) {
    goto LABEL_20;
  }
  shadowColor = self->_shadowColor;
  v17 = (NSColor *)*((void *)a3 + 5);
  if (shadowColor == v17) {
    goto LABEL_20;
  }
LABEL_10:

  LOBYTE(v11) = [(NSColor *)shadowColor isEqual:v17];
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSShadow;
  [(NSShadow *)&v3 dealloc];
}

- (NSShadow)initWithShadow:(id)a3
{
  v4 = [(NSShadow *)self init];
  double v5 = v4;
  if (a3 && v4)
  {
    if (object_getClass(v4) == (Class)__NSShadowClass && object_getClass(a3) == (Class)__NSShadowClass)
    {
      v5->_shadowOffset = (CGSize)*((_OWORD *)a3 + 1);
      v5->_shadowBlurRadius = *((double *)a3 + 4);
      unint64_t v7 = *((void *)a3 + 1);
      v5->_shadowFlags = v7;
      if (v7) {
        v5->_shadowColor = (NSColor *)objc_msgSend(*((id *)a3 + 5), "copyWithZone:", -[NSShadow zone](v5, "zone"));
      }
    }
    else
    {
      [a3 shadowOffset];
      -[NSShadow setShadowOffset:](v5, "setShadowOffset:");
      [a3 shadowBlurRadius];
      -[NSShadow setShadowBlurRadius:](v5, "setShadowBlurRadius:");
      -[NSShadow setShadowColor:](v5, "setShadowColor:", [a3 shadowColor]);
    }
  }
  return v5;
}

- (NSShadow)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSShadow;
  return [(NSShadow *)&v3 init];
}

- (void)setShadowColor:(id)shadowColor
{
  objc_sync_enter(self);
  self->_shadowFlags |= 1uLL;
  double v5 = self->_shadowColor;
  if (v5 != shadowColor)
  {

    self->_shadowColor = (NSColor *)objc_msgSend(shadowColor, "copyWithZone:", -[NSShadow zone](self, "zone"));
  }

  objc_sync_exit(self);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSShadow setVersion:1];
    __NSShadowClass = (uint64_t)a1;
  }
}

- (void)applyToGraphicsContext:(id)a3
{
  CGFloat width = self->_shadowOffset.width;
  CGFloat height = self->_shadowOffset.height;
  CGFloat v6 = (CGContext *)[a3 CGContext];
  unint64_t v7 = v6;
  if (self->_shadowFlags)
  {
    int v11 = [(NSColor *)self->_shadowColor CGColor];
    if (v11)
    {
      double shadowBlurRadius = self->_shadowBlurRadius;
      CGFloat v13 = width;
      CGFloat v14 = height;
      CGContextSetShadowWithColor(v7, *(CGSize *)&v13, shadowBlurRadius, v11);
    }
  }
  else
  {
    double v8 = self->_shadowBlurRadius;
    CGFloat v9 = width;
    CGFloat v10 = height;
    CGContextSetShadow(v6, *(CGSize *)&v9, v8);
  }
}

+ (id)shadow
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)defaultShadowColor
{
  id result = (id)defaultShadowColor_defaultShadowColor;
  if (!defaultShadowColor_defaultShadowColor)
  {
    id result = (id)[(Class)getNSColorClass_2[0]() colorWithCalibratedRed:0.0 green:0.0 blue:0.0 alpha:0.333333333];
    defaultShadowColor_defaultShadowColor = (uint64_t)result;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_shadowOffset.width != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"NSShadowHoriz");
  }
  double height = self->_shadowOffset.height;
  if (height != 0.0) {
    [a3 encodeDouble:@"NSShadowVert" forKey:-height];
  }
  if (self->_shadowBlurRadius != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"NSShadowBlurRadius");
  }
  if (self->_shadowFlags)
  {
    shadowColor = self->_shadowColor;
    [a3 encodeObject:shadowColor forKey:@"NSShadowColor"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSShadow)initWithCoder:(NSCoder *)coder
{
  if ([(NSCoder *)coder containsValueForKey:@"NSShadowHoriz"])
  {
    [(NSCoder *)coder decodeDoubleForKey:@"NSShadowHoriz"];
    self->_shadowOffset.CGFloat width = v6;
    if ([(NSCoder *)coder error]) {
      goto LABEL_29;
    }
    double v12 = fabs(self->_shadowOffset.width);
    if (v12 >= INFINITY && v12 <= INFINITY)
    {
      CGFloat v13 = @"decoded horizontal offset is invalid";
LABEL_24:
      uint64_t v22 = _NSSecureDecodingError((uint64_t)self, (uint64_t)a2, (uint64_t)v13, v7, v8, v9, v10, v11, v24);

      [(NSCoder *)coder failWithError:v22];
      return 0;
    }
  }
  if ([(NSCoder *)coder containsValueForKey:@"NSShadowVert"])
  {
    [(NSCoder *)coder decodeDoubleForKey:@"NSShadowVert"];
    self->_shadowOffset.double height = v14;
    if ([(NSCoder *)coder error]) {
      goto LABEL_29;
    }
    double height = self->_shadowOffset.height;
    double v16 = fabs(height);
    if (v16 >= INFINITY && v16 <= INFINITY)
    {
      CGFloat v13 = @"decoded vertical offset is invalid";
      goto LABEL_24;
    }
  }
  else
  {
    double height = self->_shadowOffset.height;
  }
  self->_shadowOffset.double height = -height;
  if (![(NSCoder *)coder containsValueForKey:@"NSShadowBlurRadius"]) {
    goto LABEL_25;
  }
  [(NSCoder *)coder decodeDoubleForKey:@"NSShadowBlurRadius"];
  self->_double shadowBlurRadius = v17;
  if ([(NSCoder *)coder error])
  {
LABEL_29:

    return 0;
  }
  double shadowBlurRadius = self->_shadowBlurRadius;
  BOOL v19 = (*(void *)&shadowBlurRadius & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  BOOL v20 = shadowBlurRadius < 0.0
     && ((*(void *)&shadowBlurRadius & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (shadowBlurRadius >= 0.0) {
    BOOL v19 = 0;
  }
  int v21 = (*(void *)&shadowBlurRadius & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v19;
  if ((v21 | v20) == 1)
  {
    CGFloat v13 = @"decoded blur radius is invalid";
    goto LABEL_24;
  }
LABEL_25:
  if ([(NSCoder *)coder containsValueForKey:@"NSShadowColor"])
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_8);
    }
    self->_shadowColor = (NSColor *)[(NSCoder *)coder decodeTopLevelObjectOfClasses:initWithCoder__allowedClasses forKey:@"NSShadowColor" error:0];
    self->_shadowFlags |= 1uLL;
    if ([(NSCoder *)coder error]) {
      goto LABEL_29;
    }
  }
  return self;
}

uint64_t __26__NSShadow_initWithCoder___block_invoke()
{
  Class v0 = NSClassFromString((NSString *)@"UIColor");
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v0, getNSColorClass_2[0](), 0);
  initWithCoder__allowedClasses = result;
  return result;
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"NSShadow %@", NSStringFromSize(self->_shadowOffset)];
  v4 = v3;
  if (self->_shadowBlurRadius != 0.0) {
    objc_msgSend(v3, "appendFormat:", @" blur = %g", *(void *)&self->_shadowBlurRadius);
  }
  if (self->_shadowFlags) {
    [v4 appendFormat:@" color = {%@}", self->_shadowColor];
  }
  return v4;
}

@end