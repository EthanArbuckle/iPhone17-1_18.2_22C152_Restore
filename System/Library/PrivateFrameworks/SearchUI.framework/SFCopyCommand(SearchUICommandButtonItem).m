@interface SFCopyCommand(SearchUICommandButtonItem)
- (uint64_t)_searchUIButtonItemGeneratorClass;
@end

@implementation SFCopyCommand(SearchUICommandButtonItem)

- (uint64_t)_searchUIButtonItemGeneratorClass
{
  return objc_opt_class();
}

@end