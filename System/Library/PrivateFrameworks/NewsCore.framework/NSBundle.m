@interface NSBundle
@end

@implementation NSBundle

void __71__NSBundle_FeldsparInternalExtras__fc_feldsparCoreInternalExtrasBundle__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F28B50]);
  FCURLForInternalExtrasBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v4 path];
  uint64_t v2 = [v0 initWithPath:v1];
  v3 = (void *)qword_1EB5D17A8;
  qword_1EB5D17A8 = v2;
}

@end