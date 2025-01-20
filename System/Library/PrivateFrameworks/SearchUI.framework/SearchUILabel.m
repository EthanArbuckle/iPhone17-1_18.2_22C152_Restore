@interface SearchUILabel
- (SFText)sfText;
- (void)setSfText:(id)a3;
@end

@implementation SearchUILabel

- (void).cxx_destruct
{
}

- (void)setSfText:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_sfText, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v5];
    [(TLKLabel *)self setRichText:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = objc_opt_new();
      uint64_t v7 = +[SearchUITLKMultilineTextConverter formattedTextForSearchUIText:v5];
      v8 = (void *)v7;
      if (v7)
      {
        v10[0] = v7;
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
        [v6 setFormattedTextItems:v9];
      }
      else
      {
        [v6 setFormattedTextItems:0];
      }
      [(TLKLabel *)self setRichText:v6];
    }
    else
    {
      v6 = +[SearchUITLKMultilineTextConverter textForSearchUIText:v5];
      [(TLKLabel *)self setMultilineText:v6];
    }
  }
}

- (SFText)sfText
{
  return self->_sfText;
}

@end