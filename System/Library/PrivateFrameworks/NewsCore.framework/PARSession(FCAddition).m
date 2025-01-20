@interface PARSession(FCAddition)
+ (id)fc_sharedParsecSession;
@end

@implementation PARSession(FCAddition)

+ (id)fc_sharedParsecSession
{
  if (_MergedGlobals_184 != -1) {
    dispatch_once(&_MergedGlobals_184, &__block_literal_global_101);
  }
  v0 = (void *)qword_1EB5D1770;
  return v0;
}

@end