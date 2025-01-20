@interface NSPersonNameComponents(SMExtensions)
+ (id)sharedNameComponents;
@end

@implementation NSPersonNameComponents(SMExtensions)

+ (id)sharedNameComponents
{
  if (qword_1EBE387F0 != -1) {
    dispatch_once(&qword_1EBE387F0, &__block_literal_global_13);
  }
  v0 = (void *)_MergedGlobals_94;

  return v0;
}

@end