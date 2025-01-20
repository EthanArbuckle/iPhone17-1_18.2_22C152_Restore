@interface SearchUILeadingEncapsulatedTextViewController
+ (BOOL)supportsRowModel:(id)a3;
- (BOOL)shouldCenterAlignToTitle;
- (id)setupView;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUILeadingEncapsulatedTextViewController

+ (BOOL)supportsRowModel:(id)a3
{
  v3 = [a3 pinText];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)setupView
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)shouldCenterAlignToTitle
{
  return 1;
}

- (void)updateWithRowModel:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SearchUILeadingEncapsulatedTextViewController;
  id v4 = a3;
  [(SearchUILeadingViewController *)&v16 updateWithRowModel:v4];
  v5 = [v4 pinText];

  v6 = NSString;
  v7 = [v5 lowercaseString];
  v8 = [v6 stringWithFormat:@"%@.square.fill", v7];

  v9 = +[SearchUISymbolImage uiImageWithSymbolName:v8];

  v10 = objc_opt_new();
  v11 = v10;
  if (v9)
  {
    v12 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB2908]];
    v13 = [[SearchUISymbolImage alloc] initWithSymbolName:v8 font:v12 scale:2];
    [v11 setGlyph:v13];
  }
  else
  {
    [v10 setText:v5];
    [v11 setEncapsulationStyle:2];
    v12 = [MEMORY[0x1E4FAE090] preferredMonospacedFontForTextStyle:*MEMORY[0x1E4FB2908]];
  }
  v14 = [(SearchUILeadingViewController *)self view];
  [v14 setSfText:v11];

  v15 = [(SearchUILeadingViewController *)self view];
  [v15 setFont:v12];
}

@end