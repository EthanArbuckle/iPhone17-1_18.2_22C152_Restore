@interface SFSportsFollowButtonItem(SearchUIButtonItem)
- (uint64_t)_searchUIButtonItemGeneratorClass;
@end

@implementation SFSportsFollowButtonItem(SearchUIButtonItem)

- (uint64_t)_searchUIButtonItemGeneratorClass
{
  return objc_opt_class();
}

@end