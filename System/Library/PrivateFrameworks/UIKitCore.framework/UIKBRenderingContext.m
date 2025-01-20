@interface UIKBRenderingContext
+ (id)renderingContextForRenderConfig:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFloating;
- (UIKBRenderConfig)renderConfig;
- (UIKBRenderingContext)initWithRenderConfig:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)handBias;
- (int64_t)keyboardType;
- (unint64_t)shiftState;
- (void)setHandBias:(int64_t)a3;
- (void)setIsFloating:(BOOL)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setRenderConfig:(id)a3;
- (void)setShiftState:(unint64_t)a3;
@end

@implementation UIKBRenderingContext

- (void)setShiftState:(unint64_t)a3
{
  self->_shiftState = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (UIKBRenderConfig **)v4;
    unint64_t v6 = [(UIKBRenderingContext *)self shiftState];
    BOOL v8 = v6 == [v5 shiftState]
      && (int isFloating = self->_isFloating, isFloating == [v5 isFloating])
      && self->_renderConfig == v5[3];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[UIKBRenderingContext allocWithZone:a3] init];
  v4->_shiftState = self->_shiftState;
  objc_storeStrong((id *)&v4->_renderConfig, self->_renderConfig);
  v4->_int isFloating = self->_isFloating;
  return v4;
}

+ (id)renderingContextForRenderConfig:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithRenderConfig:v4];

  return v5;
}

- (UIKBRenderingContext)initWithRenderConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBRenderingContext;
  unint64_t v6 = [(UIKBRenderingContext *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_shiftState = 0;
    objc_storeStrong((id *)&v6->_renderConfig, a3);
    v7->_int isFloating = [v5 isFloating];
  }

  return v7;
}

- (unint64_t)shiftState
{
  return self->_shiftState;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void)setRenderConfig:(id)a3
{
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)handBias
{
  return self->_handBias;
}

- (void)setHandBias:(int64_t)a3
{
  self->_handBias = a3;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_int isFloating = a3;
}

- (void).cxx_destruct
{
}

@end