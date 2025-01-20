@interface SFVerticalLayoutCardSection(SearchUIHorizontallyScrollingSectionModel)
- (uint64_t)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier;
@end

@implementation SFVerticalLayoutCardSection(SearchUIHorizontallyScrollingSectionModel)

- (uint64_t)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  v2 = [a1 thumbnail];
  [v2 size];
  double v4 = v3;

  v5 = [a1 title];
  v6 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v5];
  if ([v6 hasContent])
  {
  }
  else
  {
    v7 = [a1 footnote];
    v8 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v7];
    char v9 = [v8 hasContent];

    if ((v9 & 1) == 0) {
      return [MEMORY[0x1E4FAE198] isMacOS];
    }
  }
  if (v4 <= 200.0)
  {
    uint64_t result = [a1 contentsLeading];
    if ((result & 1) == 0) {
      return objc_msgSend(MEMORY[0x1E4FAE198], "isMacOS", 1.0);
    }
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&off_1F40E27A8;
    return (uint64_t)objc_msgSendSuper2(&v11, sel_searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier);
  }
  return result;
}

@end