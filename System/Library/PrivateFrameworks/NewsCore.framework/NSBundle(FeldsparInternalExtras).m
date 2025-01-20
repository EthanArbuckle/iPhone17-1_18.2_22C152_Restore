@interface NSBundle(FeldsparInternalExtras)
+ (id)fc_feldsparCoreInternalExtrasBundle;
@end

@implementation NSBundle(FeldsparInternalExtras)

+ (id)fc_feldsparCoreInternalExtrasBundle
{
  if (qword_1EB5D17A0 != -1) {
    dispatch_once(&qword_1EB5D17A0, &__block_literal_global_107);
  }
  v0 = (void *)qword_1EB5D17A8;
  return v0;
}

@end