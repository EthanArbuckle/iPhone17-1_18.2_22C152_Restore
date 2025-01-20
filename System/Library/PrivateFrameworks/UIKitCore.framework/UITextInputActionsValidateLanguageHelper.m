@interface UITextInputActionsValidateLanguageHelper
@end

@implementation UITextInputActionsValidateLanguageHelper

void ___UITextInputActionsValidateLanguageHelper_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^[a-z]{2,3}([_-][A-Z][a-z]{3})?$" options:0 error:0];
  v1 = (void *)_MergedGlobals_1297;
  _MergedGlobals_1297 = v0;
}

@end