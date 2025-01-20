@interface TUIPointerStyle
+ (id)defaultPointerStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersScale;
- (BOOL)prefersShadow;
- (TUIPointerCursor)cursor;
- (TUIPointerStyle)init;
- (TUIPointerStyle)initWithOther:(id)a3;
- (TUIPointerStyle)pointerStyleWithCursor:(id)a3;
- (TUIPointerStyle)pointerStyleWithEffect:(int64_t)a3;
- (TUIPointerStyle)pointerStyleWithPreferredTintMode:(int64_t)a3;
- (TUIPointerStyle)pointerStyleWithPrefersScale:(BOOL)a3;
- (TUIPointerStyle)pointerStyleWithPrefersShadow:(BOOL)a3;
- (id)pointerEffectWithPreview:(id)a3;
- (int64_t)effect;
- (int64_t)preferredTintMode;
- (void)setCursor:(id)a3;
- (void)setEffect:(int64_t)a3;
- (void)setPreferredTintMode:(int64_t)a3;
- (void)setPrefersScale:(BOOL)a3;
- (void)setPrefersShadow:(BOOL)a3;
@end

@implementation TUIPointerStyle

- (TUIPointerStyle)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIPointerStyle;
  result = [(TUIPointerStyle *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_prefersShadow = 257;
    *(_OWORD *)&result->_effect = xmmword_2433C0;
  }
  return result;
}

- (TUIPointerStyle)initWithOther:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIPointerStyle;
  v5 = [(TUIPointerStyle *)&v9 init];
  if (v5)
  {
    v5->_effect = (int64_t)[v4 effect];
    v5->_prefersShadow = [v4 prefersShadow];
    v5->_prefersScale = [v4 prefersScale];
    v5->_preferredTintMode = (int64_t)[v4 preferredTintMode];
    uint64_t v6 = [v4 cursor];
    cursor = v5->_cursor;
    v5->_cursor = (TUIPointerCursor *)v6;
  }
  return v5;
}

+ (id)defaultPointerStyle
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = v6;
  v8 = v7;
  unsigned __int8 v9 = v7 == self;
  if (v7) {
    BOOL v10 = v7 == self;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    if (self->_effect == v7->_effect
      && self->_prefersShadow == v7->_prefersShadow
      && self->_prefersScale == v7->_prefersScale
      && self->_preferredTintMode == v7->_preferredTintMode)
    {
      cursor = self->_cursor;
      if (cursor == v8->_cursor) {
        unsigned __int8 v9 = 1;
      }
      else {
        unsigned __int8 v9 = -[TUIPointerCursor isEqual:](cursor, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (id)pointerEffectWithPreview:(id)a3
{
  id v4 = a3;
  switch(self->_effect)
  {
    case 0:
      uint64_t v5 = UIPointerEffect;
      goto LABEL_6;
    case 1:
      uint64_t v5 = UIPointerHighlightEffect;
      goto LABEL_6;
    case 2:
      uint64_t v5 = UIPointerLiftEffect;
LABEL_6:
      uint64_t v6 = [v5 effectWithPreview:v4];
      break;
    case 3:
      uint64_t v6 = +[UIPointerHoverEffect effectWithPreview:v4];
      [v6 setPrefersShadow:self->_prefersShadow];
      [v6 setPrefersScaledContent:self->_prefersScale];
      [v6 setPreferredTintMode:self->_preferredTintMode];
      break;
    default:
      uint64_t v6 = 0;
      break;
  }

  return v6;
}

- (TUIPointerStyle)pointerStyleWithEffect:(int64_t)a3
{
  id v4 = self;
  if (v4->_effect != a3)
  {
    uint64_t v5 = [[TUIPointerStyle alloc] initWithOther:v4];

    [(TUIPointerStyle *)v5 setEffect:a3];
    id v4 = v5;
  }

  return v4;
}

- (TUIPointerStyle)pointerStyleWithPrefersShadow:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  if (v4->_prefersShadow != v3)
  {
    uint64_t v5 = [[TUIPointerStyle alloc] initWithOther:v4];

    [(TUIPointerStyle *)v5 setPrefersShadow:v3];
    id v4 = v5;
  }

  return v4;
}

- (TUIPointerStyle)pointerStyleWithPrefersScale:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  if (v4->_prefersScale != v3)
  {
    uint64_t v5 = [[TUIPointerStyle alloc] initWithOther:v4];

    [(TUIPointerStyle *)v5 setPrefersScale:v3];
    id v4 = v5;
  }

  return v4;
}

- (TUIPointerStyle)pointerStyleWithPreferredTintMode:(int64_t)a3
{
  id v4 = self;
  if (v4->_preferredTintMode != a3)
  {
    uint64_t v5 = [[TUIPointerStyle alloc] initWithOther:v4];

    [(TUIPointerStyle *)v5 setPreferredTintMode:a3];
    id v4 = v5;
  }

  return v4;
}

- (TUIPointerStyle)pointerStyleWithCursor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[TUIPointerStyle alloc] initWithOther:self];
  [(TUIPointerStyle *)v5 setCursor:v4];

  return v5;
}

- (TUIPointerCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
}

- (int64_t)effect
{
  return self->_effect;
}

- (void)setEffect:(int64_t)a3
{
  self->_effect = a3;
}

- (BOOL)prefersShadow
{
  return self->_prefersShadow;
}

- (void)setPrefersShadow:(BOOL)a3
{
  self->_prefersShadow = a3;
}

- (BOOL)prefersScale
{
  return self->_prefersScale;
}

- (void)setPrefersScale:(BOOL)a3
{
  self->_prefersScale = a3;
}

- (int64_t)preferredTintMode
{
  return self->_preferredTintMode;
}

- (void)setPreferredTintMode:(int64_t)a3
{
  self->_preferredTintMode = a3;
}

- (void).cxx_destruct
{
}

@end