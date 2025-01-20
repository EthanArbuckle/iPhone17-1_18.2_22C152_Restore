@interface SearchUIOfferButtonView
- (BOOL)adjustsFontSizeToFitWidth;
- (CGSize)intrinsicContentSize;
- (NSString)symbolImageName;
- (SearchUIOfferButtonView)init;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setSymbolImageName:(id)a3;
@end

@implementation SearchUIOfferButtonView

- (SearchUIOfferButtonView)init
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIOfferButtonView;
  v2 = [(TLKStoreButton *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(TLKStoreButton *)v2 setCornerRadius:7.0];
    v4 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB28D8] isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:1];
    [(TLKStoreButton *)v3 setFont:v4];
  }
  return v3;
}

- (void)setSymbolImageName:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)&self->_symbolImageName, a3);
  id v5 = a3;
  objc_super v6 = objc_opt_new();
  v7 = [SearchUISymbolImage alloc];
  v8 = [(TLKStoreButton *)self font];
  v9 = [(SearchUISymbolImage *)v7 initWithSymbolName:v5 font:v8 scale:0];
  [v6 setGlyph:v9];

  v10 = objc_opt_new();
  v13[0] = v6;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v10 setFormattedTextPieces:v11];

  v12 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v10];

  [(TLKStoreButton *)self setRichTitle:v12];
}

- (CGSize)intrinsicContentSize
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FAE100];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  v4 = [(TLKStoreButton *)self font];
  v12[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [@" " sizeWithAttributes:v5];
  [v3 deviceScaledRoundedValue:self forView:v6 + 11.5];
  double v8 = v7;

  double v9 = *MEMORY[0x1E4FB30D8];
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  self->_adjustsFontSizeToFitWidth = a3;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void).cxx_destruct
{
}

@end