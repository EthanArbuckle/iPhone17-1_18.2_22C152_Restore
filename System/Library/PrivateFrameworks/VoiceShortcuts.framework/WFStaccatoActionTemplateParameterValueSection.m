@interface WFStaccatoActionTemplateParameterValueSection
@end

@implementation WFStaccatoActionTemplateParameterValueSection

id __95__WFStaccatoActionTemplateParameterValueSection_WorkflowKit__initWithSection_action_parameter___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4FB4990];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithAction:*(void *)(a1 + 32) state:v4 parameter:*(void *)(a1 + 40)];

  return v5;
}

@end