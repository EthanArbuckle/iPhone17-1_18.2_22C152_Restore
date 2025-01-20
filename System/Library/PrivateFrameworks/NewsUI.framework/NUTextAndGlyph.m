@interface NUTextAndGlyph
- (NSAttributedString)attributedText;
- (NSString)text;
- (NUTextAndGlyph)init;
- (NUTextAndGlyph)initWithAttributedText:(id)a3 glyph:(id)a4;
- (NUTextAndGlyph)initWithAttributedText:(id)a3 text:(id)a4 glyph:(id)a5;
- (NUTextAndGlyph)initWithText:(id)a3 glyph:(id)a4;
- (UIImage)glyph;
- (unint64_t)alignment;
- (void)setAlignment:(unint64_t)a3;
@end

@implementation NUTextAndGlyph

- (NUTextAndGlyph)initWithAttributedText:(id)a3 text:(id)a4 glyph:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NUTextAndGlyph;
  v12 = [(NUTextAndGlyph *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_attributedText, a3);
    objc_storeStrong((id *)&v13->_text, a4);
    objc_storeStrong((id *)&v13->_glyph, a5);
    v13->_alignment = 0;
  }

  return v13;
}

- (NUTextAndGlyph)initWithAttributedText:(id)a3 glyph:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 string];
  id v9 = [(NUTextAndGlyph *)self initWithAttributedText:v7 text:v8 glyph:v6];

  return v9;
}

- (NUTextAndGlyph)initWithText:(id)a3 glyph:(id)a4
{
  return [(NUTextAndGlyph *)self initWithAttributedText:0 text:a3 glyph:a4];
}

- (NUTextAndGlyph)init
{
  return [(NUTextAndGlyph *)self initWithAttributedText:0 text:0 glyph:0];
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)text
{
  return self->_text;
}

- (UIImage)glyph
{
  return self->_glyph;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end