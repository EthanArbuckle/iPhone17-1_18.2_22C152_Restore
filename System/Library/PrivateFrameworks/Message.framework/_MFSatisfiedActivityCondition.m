@interface _MFSatisfiedActivityCondition
- (BOOL)isSatisfied;
- (EFObservable)conditionsObservable;
@end

@implementation _MFSatisfiedActivityCondition

- (BOOL)isSatisfied
{
  return 1;
}

- (EFObservable)conditionsObservable
{
  return (EFObservable *)[MEMORY[0x1E4F60DD8] observableWithResult:MEMORY[0x1E4F1CC38]];
}

@end