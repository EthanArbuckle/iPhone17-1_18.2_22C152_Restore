@interface WFOnScreenContentService
@end

@implementation WFOnScreenContentService

uint64_t __108__WFOnScreenContentService_WFContentCollection__getOnScreenContentForInputContentClasses_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    [*(id *)(a1 + 32) populateOutputFromNodeRecursively:a2 outputCollection:*(void *)(a1 + 40)];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

NSString *__108__WFOnScreenContentService_WFContentCollection__getOnScreenContentForInputContentClasses_completionHandler___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

@end