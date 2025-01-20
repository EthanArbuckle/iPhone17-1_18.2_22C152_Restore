@interface UIStatusBarStyleRequest
- (BOOL)isDoubleHeight;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLegacy;
- (BOOL)isTranslucent;
- (NSNumber)overrideHeight;
- (UIColor)foregroundColor;
- (UIStatusBarStyleRequest)init;
- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legacy:(BOOL)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6;
- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legacy:(BOOL)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 foregroundAlpha:(double)a7;
- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5;
- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5 foregroundAlpha:(double)a6;
- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5 foregroundAlpha:(double)a6 overrideHeight:(id)a7;
- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5 overrideHeight:(id)a6;
- (double)foregroundAlpha;
- (id)_copyWithZone:(_NSZone *)a3 class:(Class)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)legibilityStyle;
- (int64_t)style;
- (unint64_t)hash;
@end

@implementation UIStatusBarStyleRequest

- (unint64_t)hash
{
  int64_t v3 = 1000 * self->_legibilityStyle + 31000 * self->_style;
  unint64_t v4 = [(UIColor *)self->_foregroundColor hash] - v3 + 32 * v3;
  return [(NSNumber *)self->_overrideHeight hash] - v4 + 32 * v4 + 923521;
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5
{
  return [(UIStatusBarStyleRequest *)self initWithStyle:a3 legibilityStyle:a4 foregroundColor:a5 foregroundAlpha:0 overrideHeight:1.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHeight, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

- (BOOL)isDoubleHeight
{
  v2 = +[UIStatusBar _styleAttributesForRequest:self];
  char v3 = [v2 isDoubleHeight];

  return v3;
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5 foregroundAlpha:(double)a6 overrideHeight:(id)a7
{
  id v13 = a5;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)UIStatusBarStyleRequest;
  v15 = [(UIStatusBarStyleRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_style = a3;
    v15->_legibilityStyle = a4;
    objc_storeStrong((id *)&v15->_foregroundColor, a5);
    objc_storeStrong((id *)&v16->_overrideHeight, a7);
    v16->_foregroundAlpha = a6;
  }

  return v16;
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5 overrideHeight:(id)a6
{
  return [(UIStatusBarStyleRequest *)self initWithStyle:a3 legibilityStyle:a4 foregroundColor:a5 foregroundAlpha:a6 overrideHeight:1.0];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    int64_t style = self->_style;
    if (style != [v6 style]
      || (int64_t legibilityStyle = self->_legibilityStyle, legibilityStyle != [v6 legibilityStyle]))
    {
      BOOL v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
    foregroundColor = self->_foregroundColor;
    v10 = [v6 foregroundColor];
    if (foregroundColor == v10
      || (v11 = self->_foregroundColor,
          [v6 foregroundColor],
          char v3 = objc_claimAutoreleasedReturnValue(),
          [(UIColor *)v11 isEqual:v3]))
    {
      overrideHeight = self->_overrideHeight;
      uint64_t v14 = [v6 overrideHeight];
      if (overrideHeight == (NSNumber *)v14)
      {
        double foregroundAlpha = self->_foregroundAlpha;
        [v6 foregroundAlpha];
        BOOL v12 = foregroundAlpha == v21;
      }
      else
      {
        v15 = (void *)v14;
        v16 = self->_overrideHeight;
        v17 = [v6 overrideHeight];
        if ([(NSNumber *)v16 isEqual:v17])
        {
          double v18 = self->_foregroundAlpha;
          [v6 foregroundAlpha];
          BOOL v12 = v18 == v19;
        }
        else
        {

          BOOL v12 = 0;
        }
      }
      if (foregroundColor == v10) {
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v12 = 0;
    }

LABEL_16:
    goto LABEL_17;
  }
  BOOL v12 = 0;
LABEL_18:

  return v12;
}

- (int64_t)legibilityStyle
{
  return self->_legibilityStyle;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (int64_t)style
{
  return self->_style;
}

- (NSNumber)overrideHeight
{
  return self->_overrideHeight;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legibilityStyle:(int64_t)a4 foregroundColor:(id)a5 foregroundAlpha:(double)a6
{
  return [(UIStatusBarStyleRequest *)self initWithStyle:a3 legibilityStyle:a4 foregroundColor:a5 foregroundAlpha:0 overrideHeight:a6];
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legacy:(BOOL)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6
{
  return [(UIStatusBarStyleRequest *)self initWithStyle:a3 legibilityStyle:a5 foregroundColor:a6];
}

- (UIStatusBarStyleRequest)initWithStyle:(int64_t)a3 legacy:(BOOL)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 foregroundAlpha:(double)a7
{
  return [(UIStatusBarStyleRequest *)self initWithStyle:a3 legibilityStyle:a5 foregroundColor:a6 foregroundAlpha:a7];
}

- (UIStatusBarStyleRequest)init
{
  return [(UIStatusBarStyleRequest *)self initWithStyle:0 legibilityStyle:0 foregroundColor:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  return [(UIStatusBarStyleRequest *)self _copyWithZone:a3 class:v5];
}

- (id)_copyWithZone:(_NSZone *)a3 class:(Class)a4
{
  uint64_t v5 = [(objc_class *)a4 allocWithZone:a3];
  int64_t v6 = [(UIStatusBarStyleRequest *)self style];
  int64_t v7 = [(UIStatusBarStyleRequest *)self legibilityStyle];
  v8 = [(UIStatusBarStyleRequest *)self foregroundColor];
  v9 = [(UIStatusBarStyleRequest *)self overrideHeight];
  v10 = [(objc_class *)v5 initWithStyle:v6 legibilityStyle:v7 foregroundColor:v8 overrideHeight:v9];

  v10[5] = self->_foregroundAlpha;
  return v10;
}

- (BOOL)isTranslucent
{
  v2 = +[UIStatusBar _styleAttributesForRequest:self];
  char v3 = [v2 isTranslucent];

  return v3;
}

- (BOOL)isLegacy
{
  return 0;
}

@end