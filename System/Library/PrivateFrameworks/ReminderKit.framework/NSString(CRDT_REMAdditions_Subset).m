@interface NSString(CRDT_REMAdditions_Subset)
+ (void)rem_registerClassAtCRCoderIfNeeded;
@end

@implementation NSString(CRDT_REMAdditions_Subset)

+ (void)rem_registerClassAtCRCoderIfNeeded
{
  if (CR_NSString_registerClass_onceToken != -1) {
    dispatch_once(&CR_NSString_registerClass_onceToken, &__block_literal_global_16);
  }
}

@end