@interface _PXArrayNoIncrementalChangeDetails
- (BOOL)hasIncrementalChanges;
- (unint64_t)indexAfterApplyingChangesToIndex:(unint64_t)a3;
- (unint64_t)indexAfterRevertingChangesFromIndex:(unint64_t)a3;
@end

@implementation _PXArrayNoIncrementalChangeDetails

- (BOOL)hasIncrementalChanges
{
  return 0;
}

- (unint64_t)indexAfterRevertingChangesFromIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)indexAfterApplyingChangesToIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

@end