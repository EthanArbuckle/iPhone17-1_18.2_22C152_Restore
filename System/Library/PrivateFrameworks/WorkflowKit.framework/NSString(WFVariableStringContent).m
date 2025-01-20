@interface NSString(WFVariableStringContent)
- (void)wf_getContentItemsWithContext:()WFVariableStringContent completionHandler:;
@end

@implementation NSString(WFVariableStringContent)

- (void)wf_getContentItemsWithContext:()WFVariableStringContent completionHandler:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F5A848];
  v6 = a4;
  v7 = [v5 itemWithObject:a1];
  v9[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v6[2](v6, v8, 0);
}

@end