@interface NUTitleViewUpdate
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldCancelPendingUpdates;
- (BOOL)shouldSpeakAccessibilityTitleWhenDisplayed;
- (NSString)accessibilityTitle;
- (NUTitleViewUpdate)init;
- (NUTitleViewUpdate)initWithAttributedText:(id)a3 styleType:(unint64_t)a4;
- (NUTitleViewUpdate)initWithImage:(id)a3;
- (NUTitleViewUpdate)initWithText:(id)a3 styleType:(unint64_t)a4;
- (NUTitleViewUpdate)initWithText:(id)a3 styleType:(unint64_t)a4 glyph:(id)a5;
- (NUTitleViewUpdate)initWithValue:(id)a3 valueType:(unint64_t)a4 styleType:(unint64_t)a5;
- (double)lingerTimeInterval;
- (id)value;
- (int64_t)textAlignment;
- (unint64_t)styleType;
- (unint64_t)valueType;
- (void)setAccessibilityTitle:(id)a3;
- (void)setCancelPendingUpdates:(BOOL)a3;
- (void)setLingerTimeInterval:(double)a3;
- (void)setSpeakAccessibilityTitleWhenDisplayed:(BOOL)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation NUTitleViewUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityTitle, 0);

  objc_storeStrong(&self->_value, 0);
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NUTitleViewUpdate *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(NUTitleViewUpdate *)self valueType];
      if (v6 == [(NUTitleViewUpdate *)v5 valueType])
      {
        v7 = (void *)MEMORY[0x263F8C6D0];
        v8 = [(NUTitleViewUpdate *)self value];
        v9 = [(NUTitleViewUpdate *)v5 value];
        char v10 = objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9);
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (id)value
{
  return self->_value;
}

- (BOOL)shouldSpeakAccessibilityTitleWhenDisplayed
{
  return self->_speakAccessibilityTitleWhenDisplayed;
}

- (double)lingerTimeInterval
{
  return self->_lingerTimeInterval;
}

- (BOOL)shouldCancelPendingUpdates
{
  return self->_cancelPendingUpdates;
}

- (NSString)accessibilityTitle
{
  return self->_accessibilityTitle;
}

- (void)setAccessibilityTitle:(id)a3
{
}

- (void)setCancelPendingUpdates:(BOOL)a3
{
  self->_cancelPendingUpdates = a3;
}

- (void)setSpeakAccessibilityTitleWhenDisplayed:(BOOL)a3
{
  self->_speakAccessibilityTitleWhenDisplayed = a3;
}

- (NUTitleViewUpdate)initWithValue:(id)a3 valueType:(unint64_t)a4 styleType:(unint64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NUTitleViewUpdate;
  char v10 = [(NUTitleViewUpdate *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_value, a3);
    unint64_t v12 = 3;
    if (v9) {
      unint64_t v12 = a4;
    }
    v11->_valueType = v12;
    v11->_styleType = a5;
    v11->_cancelPendingUpdates = 0;
    v11->_speakAccessibilityTitleWhenDisplayed = v12 == 1;
    v11->_lingerTimeInterval = 0.0;
    v11->_textAlignment = 1;
  }

  return v11;
}

- (NUTitleViewUpdate)initWithAttributedText:(id)a3 styleType:(unint64_t)a4
{
  return [(NUTitleViewUpdate *)self initWithValue:a3 valueType:4 styleType:a4];
}

- (NUTitleViewUpdate)init
{
  return [(NUTitleViewUpdate *)self initWithValue:0 valueType:3 styleType:2];
}

- (NUTitleViewUpdate)initWithImage:(id)a3
{
  return [(NUTitleViewUpdate *)self initWithValue:a3 valueType:0 styleType:2];
}

- (NUTitleViewUpdate)initWithText:(id)a3 styleType:(unint64_t)a4
{
  return [(NUTitleViewUpdate *)self initWithValue:a3 valueType:1 styleType:a4];
}

- (NUTitleViewUpdate)initWithText:(id)a3 styleType:(unint64_t)a4 glyph:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  char v10 = [[NUTextAndGlyph alloc] initWithText:v9 glyph:v8];

  v11 = [(NUTitleViewUpdate *)self initWithValue:v10 valueType:2 styleType:a4];
  return v11;
}

- (unint64_t)styleType
{
  return self->_styleType;
}

- (void)setLingerTimeInterval:(double)a3
{
  self->_lingerTimeInterval = a3;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

@end