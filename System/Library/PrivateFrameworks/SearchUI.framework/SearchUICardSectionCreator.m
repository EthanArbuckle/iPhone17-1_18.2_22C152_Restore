@interface SearchUICardSectionCreator
+ (Class)viewClassForCardSection:(id)a3 horizontal:(BOOL)a4;
+ (id)cardSectionViewForModel:(id)a3 feedbackDelegate:(id)a4;
@end

@implementation SearchUICardSectionCreator

+ (Class)viewClassForCardSection:(id)a3 horizontal:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)[v5 _searchUIHorizontalViewClass];
    if (!v7) {
      v7 = (void *)[v6 _searchUIViewClass];
    }
    id v8 = v7;
  }
  else
  {
    id v8 = [v5 _searchUIViewClass];
  }
  v9 = v8;

  return (Class)v9;
}

+ (id)cardSectionViewForModel:(id)a3 feedbackDelegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "cardSectionViewClass")), "initWithRowModel:feedbackDelegate:", v6, v5);

  return v7;
}

@end