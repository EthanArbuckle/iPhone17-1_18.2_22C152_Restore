@interface UIKBTutorialModalDisplayStyling
- (NSArray)backgroundEffects;
- (UIColor)backgroundColor;
- (UIColor)buttonTextColor;
- (UIColor)mainTextColor;
- (UIKBTutorialModalDisplayStyling)initWithKeyboardAppearance:(int64_t)a3;
- (id)backgroundBlurEffects:(int64_t)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundEffects:(id)a3;
- (void)setButtonTextColor:(id)a3;
- (void)setMainTextColor:(id)a3;
@end

@implementation UIKBTutorialModalDisplayStyling

- (UIKBTutorialModalDisplayStyling)initWithKeyboardAppearance:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)UIKBTutorialModalDisplayStyling;
  v4 = [(UIKBTutorialModalDisplayStyling *)&v16 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(UIKBTutorialModalDisplayStyling *)v4 backgroundBlurEffects:a3];
    backgroundEffects = v5->_backgroundEffects;
    v5->_backgroundEffects = (NSArray *)v6;

    uint64_t v8 = +[UIColor lightGrayColor];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v8;

    uint64_t v10 = +[UIColor labelColor];
    mainTextColor = v5->_mainTextColor;
    v5->_mainTextColor = (UIColor *)v10;

    uint64_t v12 = +[UIColor systemBlueColor];
    buttonTextColor = v5->_buttonTextColor;
    v5->_buttonTextColor = (UIColor *)v12;

    v14 = v5;
  }

  return v5;
}

- (id)backgroundBlurEffects:(int64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = +[UIBlurEffect effectWithStyle:1200];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (void)setBackgroundEffects:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)mainTextColor
{
  return self->_mainTextColor;
}

- (void)setMainTextColor:(id)a3
{
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (void)setButtonTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_mainTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
}

@end