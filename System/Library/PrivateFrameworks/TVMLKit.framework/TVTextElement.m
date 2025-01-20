@interface TVTextElement
- (NSAttributedString)attributedText;
- (id)attributedStringWithFont:(id)a3;
- (id)attributedStringWithFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5;
- (int64_t)textStyle;
@end

@implementation TVTextElement

- (NSAttributedString)attributedText
{
  v2 = [(TVViewElement *)self element];
  v3 = objc_msgSend(v2, "tv_attributedString");

  return (NSAttributedString *)v3;
}

- (int64_t)textStyle
{
  v2 = [(TVViewElement *)self element];
  int64_t v3 = objc_msgSend(v2, "tv_textStyle");

  return v3;
}

- (id)attributedStringWithFont:(id)a3
{
  id v4 = a3;
  v5 = [(TVViewElement *)self element];
  v6 = [v5 attributedStringWithFont:v4];

  return v6;
}

- (id)attributedStringWithFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(TVViewElement *)self element];
  v11 = [v10 attributedStringWithFont:v9 foregroundColor:v8 textAlignment:a5];

  return v11;
}

@end