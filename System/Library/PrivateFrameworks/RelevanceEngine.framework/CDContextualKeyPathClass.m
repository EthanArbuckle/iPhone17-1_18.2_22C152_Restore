@interface CDContextualKeyPathClass
@end

@implementation CDContextualKeyPathClass

REHTMLTagElement *__get_CDContextualKeyPathClass_block_invoke(uint64_t a1)
{
  CoreDuetContextLibrary();
  result = (REHTMLTagElement *)objc_getClass("_CDContextualKeyPath");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_CDContextualKeyPathClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (REHTMLTagElement *)__get_CDContextualKeyPathClass_block_invoke_cold_1();
    return [(REHTMLTagElement *)v3 initWithTag:v5 content:v6];
  }
  return result;
}

uint64_t __get_CDContextualKeyPathClass_block_invoke_cold_1()
{
  v0 = abort_report_np();
  return -[REActivitySummaryPredictor _startActivitySummaryQueryWithRetries:](v0);
}

@end