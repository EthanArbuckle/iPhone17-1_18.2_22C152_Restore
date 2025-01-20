@interface _UITitleContent
+ (id)contentWithTitle:(id)a3 attributes:(id)a4 button:(id)a5;
- (NSString)title;
- (double)width;
- (id)description;
- (void)updateWithButton:(id)a3;
- (void)updateWithTitleAttributes:(id)a3 button:(id)a4;
@end

@implementation _UITitleContent

- (NSString)title
{
  attributedText = self->_attributedText;
  if (attributedText)
  {
    v3 = [(NSAttributedString *)attributedText string];
  }
  else
  {
    v3 = &stru_1ED0E84C0;
  }
  return (NSString *)v3;
}

- (double)width
{
  return self->_width;
}

+ (id)contentWithTitle:(id)a3 attributes:(id)a4 button:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init((Class)a1);
  if ([v8 length])
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8 attributes:v9];
    v13 = (void *)v11[1];
    v11[1] = v12;
  }
  else
  {
    v13 = (void *)v11[1];
    v11[1] = 0;
  }

  [v11 updateWithButton:v10];
  return v11;
}

- (void)updateWithButton:(id)a3
{
  if (self->_attributedText)
  {
    id v4 = a3;
    [v4 contentEdgeInsets];
    double v6 = v5;
    double v8 = v7;
    id v10 = [v4 _visualProvider];

    [v10 _intrinsicWidthForAttributedTitle:self->_attributedText];
    self->_width = v9 - v6 - v8;
  }
  else
  {
    self->_width = 0.0;
  }
}

- (void).cxx_destruct
{
}

- (void)updateWithTitleAttributes:(id)a3 button:(id)a4
{
  id v12 = a4;
  if (self->_attributedText)
  {
    double v6 = (objc_class *)MEMORY[0x1E4F28B18];
    id v7 = a3;
    id v8 = [v6 alloc];
    double v9 = [(NSAttributedString *)self->_attributedText string];
    id v10 = (NSAttributedString *)[v8 initWithString:v9 attributes:v7];

    attributedText = self->_attributedText;
    self->_attributedText = v10;
  }
  [(_UITitleContent *)self updateWithButton:v12];
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)_UITitleContent;
  uint64_t v4 = [(_UITitleContent *)&v9 description];
  double v5 = (void *)v4;
  attributedText = self->_attributedText;
  if (!attributedText) {
    attributedText = (NSAttributedString *)&stru_1ED0E84C0;
  }
  id v7 = [v3 stringWithFormat:@"%@ '%@' (%f)", v4, attributedText, *(void *)&self->_width];

  return v7;
}

@end