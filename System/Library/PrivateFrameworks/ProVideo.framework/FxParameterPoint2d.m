@interface FxParameterPoint2d
- (BOOL)isCanvasRelative;
- (BOOL)isTranslation;
- (FxParameterPoint2d)init;
- (void)dealloc;
- (void)setIsCanvasRelative:(BOOL)a3;
- (void)setIsTranslation:(BOOL)a3;
@end

@implementation FxParameterPoint2d

- (FxParameterPoint2d)init
{
  v4.receiver = self;
  v4.super_class = (Class)FxParameterPoint2d;
  v2 = [(FxPinParameter *)&v4 init];
  if (v2)
  {
    v2->_point2dPriv = (FxParameterPoint2dPriv *)malloc_type_calloc(1uLL, 2uLL, 0x1000040BDFB0063uLL);
    [(FxPin *)v2 setValueClass:objc_opt_class()];
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_point2dPriv != 0, &cfstr_Point2dprivNul.isa, v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_point2dPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterPoint2d;
  [(FxPinParameter *)&v9 dealloc];
}

- (BOOL)isCanvasRelative
{
  return self->_point2dPriv->var0;
}

- (void)setIsCanvasRelative:(BOOL)a3
{
  self->_point2dPriv->var0 = a3;
}

- (BOOL)isTranslation
{
  return self->_point2dPriv->var1;
}

- (void)setIsTranslation:(BOOL)a3
{
  self->_point2dPriv->var1 = a3;
}

@end