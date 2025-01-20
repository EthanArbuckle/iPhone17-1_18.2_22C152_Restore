@interface SFShowPhotosOneUpViewCommand(SearchUICommandClass)
- (id)_matchedPerson;
- (uint64_t)_searchUICommandHandlerClass;
@end

@implementation SFShowPhotosOneUpViewCommand(SearchUICommandClass)

- (uint64_t)_searchUICommandHandlerClass
{
  return objc_opt_class();
}

- (id)_matchedPerson
{
  v2 = [a1 matchedPeople];
  if ([v2 count] == 1)
  {
    v3 = [a1 matchedPeople];
    v4 = [v3 firstObject];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end