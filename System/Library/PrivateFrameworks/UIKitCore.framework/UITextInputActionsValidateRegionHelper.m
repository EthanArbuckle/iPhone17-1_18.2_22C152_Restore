@interface UITextInputActionsValidateRegionHelper
@end

@implementation UITextInputActionsValidateRegionHelper

void ___UITextInputActionsValidateRegionHelper_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(([A-Z]{2})|([0-9]{3})|([A-Z][a-z]{3}))$" options:0 error:0];
  v1 = (void *)qword_1EB264C50;
  qword_1EB264C50 = v0;
}

@end