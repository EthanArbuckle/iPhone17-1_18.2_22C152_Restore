@interface SFCommandButtonItem(SearchUIButtonItem)
- (id)_searchUIButtonItemGeneratorClass;
@end

@implementation SFCommandButtonItem(SearchUIButtonItem)

- (id)_searchUIButtonItemGeneratorClass
{
  v1 = [a1 command];
  v2 = (void *)[v1 _searchUIButtonItemGeneratorClass];
  if (!v2) {
    v2 = objc_opt_class();
  }
  id v3 = v2;

  return v3;
}

@end