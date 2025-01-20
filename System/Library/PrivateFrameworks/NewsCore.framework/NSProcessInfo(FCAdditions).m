@interface NSProcessInfo(FCAdditions)
- (id)fc_processLaunchDate;
@end

@implementation NSProcessInfo(FCAdditions)

- (id)fc_processLaunchDate
{
  if (qword_1EB5D1248 != -1) {
    dispatch_once(&qword_1EB5D1248, &__block_literal_global_46);
  }
  v0 = (void *)_MergedGlobals_159;
  return v0;
}

@end