@interface RFSimpleItemVisualElementCardSection(SearchUIHorizontallyScrollingSectionModel)
- (double)searchUIHorizontallyScrollingSectionModel_interItemSpacing;
- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier;
@end

@implementation RFSimpleItemVisualElementCardSection(SearchUIHorizontallyScrollingSectionModel)

- (double)searchUIHorizontallyScrollingSectionModel_interItemSpacing
{
  return 6.0;
}

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  v2 = [a1 image];
  v3 = objc_msgSend(v2, "visual_elements");
  v4 = [v3 objectAtIndexedSubscript:0];
  v5 = objc_msgSend(v4, "image_element");
  v6 = [v5 sources];
  v7 = [v6 objectAtIndexedSubscript:0];
  v8 = [v7 url];
  unsigned int v9 = objc_msgSend(v8, "image_style");

  if (v9 > 0x1E) {
    return 0.5;
  }
  if (((1 << v9) & 0x44A000E1) != 0)
  {
    int v10 = [MEMORY[0x1E4FAE198] isMacOS];
    double result = 0.666666667;
    if (v10) {
      return 0.8;
    }
    return result;
  }
  if (((1 << v9) & 0x2000E00) != 0)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_1F40EBB40;
    objc_msgSendSuper2(&v12, sel_searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier);
    return result;
  }
  double result = 1.0;
  if (((1 << v9) & 0x1000100) == 0) {
    return 0.5;
  }
  return result;
}

@end