@interface SFDetailedRowCardSection(SearchUIViewClass)
- (id)_searchUIHorizontalViewClass;
- (uint64_t)_searchUIViewClass;
@end

@implementation SFDetailedRowCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

- (id)_searchUIHorizontalViewClass
{
  v1 = [a1 thumbnail];
  [v1 size];
  double v3 = v2;

  if (v3 <= 150.0)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }
  return v4;
}

@end