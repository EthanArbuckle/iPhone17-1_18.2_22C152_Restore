@interface MFSearchableIndexItem
@end

@implementation MFSearchableIndexItem

MFSearchableIndexItem_iOS *__67__MFSearchableIndexItem_iOS_searchableIndexItemsFromMessages_type___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) _bodyDataForMessage:v3];
  v5 = [(EDSearchableIndexItem *)[MFSearchableIndexItem_iOS alloc] initWithMessage:v3 bodyData:v4 fetchBody:1];
  [(EDSearchableIndexItem *)v5 setIndexingType:*(void *)(a1 + 40)];

  return v5;
}

void __32__MFSearchableIndexItem_iOS_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_31;
  log_log_31 = (uint64_t)v1;
}

void __54__MFSearchableIndexItem_iOS_fetchIndexableAttachments__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  [*(id *)(a1 + 32) finishWithResult:v9 error:v8];
}

id __54__MFSearchableIndexItem_iOS_fetchIndexableAttachments__block_invoke_2()
{
  v0 = [MEMORY[0x1E4F60D70] nullFuture];
  return v0;
}

@end