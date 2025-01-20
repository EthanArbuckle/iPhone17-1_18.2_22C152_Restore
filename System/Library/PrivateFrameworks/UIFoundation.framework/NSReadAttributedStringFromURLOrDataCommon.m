@interface NSReadAttributedStringFromURLOrDataCommon
@end

@implementation NSReadAttributedStringFromURLOrDataCommon

void ___NSReadAttributedStringFromURLOrDataCommon_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v5 = a3;
  if (![a3 objectForKeyedSubscript:@"DocumentType"])
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"DocumentType"];
    if (v5) {
      v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
    }
    else {
      v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    }
    v10 = v9;
    if (v8) {
      v11 = (__CFString *)v8;
    }
    else {
      v11 = @"NSHTML";
    }
    [v9 setObject:v11 forKeyedSubscript:@"DocumentType"];
    id v5 = (id)[v10 copy];
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [a2 mutableCopy];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v5;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = a4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  v12 = *(NSObject **)(a1 + 40);

  dispatch_release(v12);
}

uint64_t ___NSReadAttributedStringFromURLOrDataCommon_block_invoke_2(void *a1, void *a2)
{
  return [a2 loadData:a1[4] MIMEType:@"application/x-webarchive" characterEncodingName:a1[5] baseURL:a1[6]];
}

@end