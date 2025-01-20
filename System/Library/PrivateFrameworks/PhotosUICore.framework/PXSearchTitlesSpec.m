@interface PXSearchTitlesSpec
+ (id)searchDefaultTitleAttributes;
+ (id)searchItalicTitleAttributes;
+ (id)searchItalicTitleLabelFont;
+ (id)searchTitleLabelFont;
@end

@implementation PXSearchTitlesSpec

+ (id)searchItalicTitleLabelFont
{
}

+ (id)searchTitleLabelFont
{
}

+ (id)searchDefaultTitleAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FB06F8];
  v2 = [a1 searchTitleLabelFont];
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FB0700];
  v3 = [MEMORY[0x1E4FB1618] labelColor];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)searchItalicTitleAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FB06F8];
  v2 = +[PXSearchTitlesSpec searchItalicTitleLabelFont];
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FB0700];
  v3 = [MEMORY[0x1E4FB1618] labelColor];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

@end