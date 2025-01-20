@interface NTKCFaceDetailSportsFooterCell
+ (id)_attributedFooterText;
+ (id)reuseIdentifier;
- (NTKCFaceDetailSportsFooterCell)init;
- (id)_fontDescriptor;
@end

@implementation NTKCFaceDetailSportsFooterCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)_attributedFooterText
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v3 = NTKCCustomizationLocalizedString(@"SPORTS_OPEN_TITLE", @"Open TV app", v2);
  id v4 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v17 = *MEMORY[0x1E4FB0720];
  v18[0] = @"com.apple.tv://sportsfavorites";
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v6 = (void *)[v4 initWithString:v3 attributes:v5];

  v8 = NTKCCustomizationLocalizedString(@"SPORTS_HELPER_TEXT", @"You can select your favorite teams in the TV app.", v7);
  id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v15 = *MEMORY[0x1E4FB0700];
  v10 = BPSDetailTextColor();
  v16 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v12 = (void *)[v9 initWithString:v8 attributes:v11];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  [v12 appendAttributedString:v13];

  [v12 appendAttributedString:v6];
  return v12;
}

- (NTKCFaceDetailSportsFooterCell)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCFaceDetailSportsFooterCell;
  uint64_t v2 = [(NTKCFaceDetailDescriptionCell *)&v5 init];
  if (v2)
  {
    v3 = +[NTKCFaceDetailSportsFooterCell _attributedFooterText];
    [(NTKCFaceDetailDescriptionCell *)v2 setAttributedText:v3];
  }
  return v2;
}

- (id)_fontDescriptor
{
  return (id)[MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0]];
}

@end