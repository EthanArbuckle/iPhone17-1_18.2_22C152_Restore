@interface PRXActionCustomColors
+ (id)initWithBackgroundColor:(id)a3 textColor:(id)a4;
- (PRXActionCustomColors)initWithBackgroundColor:(id)a3 textColor:(id)a4;
- (UIColor)backgroundColor;
- (UIColor)textColor;
@end

@implementation PRXActionCustomColors

- (PRXActionCustomColors)initWithBackgroundColor:(id)a3 textColor:(id)a4
{
  v6 = (UIColor *)a3;
  v7 = (UIColor *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PRXActionCustomColors;
  v8 = [(PRXActionCustomColors *)&v13 init];
  backgroundColor = v8->_backgroundColor;
  v8->_backgroundColor = v6;
  v10 = v6;

  textColor = v8->_textColor;
  v8->_textColor = v7;

  return v8;
}

+ (id)initWithBackgroundColor:(id)a3 textColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithBackgroundColor:v7 textColor:v6];

  return v8;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end