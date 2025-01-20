@interface NSReadAttributedStringFromHTMLData
@end

@implementation NSReadAttributedStringFromHTMLData

id ___NSReadAttributedStringFromHTMLData_block_invoke(uint64_t a1)
{
  _NSReadAttributedStringFromHTMLData_connectionQueue = (uint64_t)dispatch_queue_create("_NSReadAttributedStringFromHTMLData", MEMORY[0x1E4F14430]);
  uint64_t v2 = [MEMORY[0x1E4F28B18] _allowedTokensClasses];
  v3 = (void *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD8BA08];
  [v3 setClasses:*(void *)(a1 + 32) forSelector:sel_renderHTML_options_extensionTokens_withReply_ argumentIndex:1 ofReply:0];
  [v3 setClasses:v2 forSelector:sel_renderHTML_options_extensionTokens_withReply_ argumentIndex:2 ofReply:0];
  [v3 setClasses:*(void *)(a1 + 32) forSelector:sel_renderHTML_options_extensionTokens_withReply_ argumentIndex:0 ofReply:1];
  id result = v3;
  _NSReadAttributedStringFromHTMLData_connectionInterface = (uint64_t)result;
  return result;
}

uint64_t ___NSReadAttributedStringFromHTMLData_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void ___NSReadAttributedStringFromHTMLData_block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v3 = *(NSObject **)(a1 + 32);

  dispatch_release(v3);
}

uint64_t ___NSReadAttributedStringFromHTMLData_block_invoke_4(uint64_t a1)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleURL");
  v3 = (void *)[*(id *)(a1 + 32) objectForKeyedSubscript:NSBaseURLDocumentOption];
  if ([v3 isFileURL]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  if (v4)
  {
    v32[0] = v2;
    v32[1] = v4;
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = (void **)v32;
    uint64_t v7 = 2;
  }
  else
  {
    v31 = v2;
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = &v31;
    uint64_t v7 = 1;
  }
  uint64_t v8 = [v5 arrayWithObjects:v6 count:v7];
  v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1 + 32)];
  [v9 setObject:v8 forKeyedSubscript:@"_WKReadAccessFileURLsOption"];
  long long v29 = 0u;
  long long v30 = 0u;
  v10 = *(void **)(a1 + 40);
  if (v10) {
    [v10 auditToken];
  }
  v11 = (void *)[MEMORY[0x1E4F1CA48] array];
  v12 = (void *)[v2 path];
  long long v27 = v29;
  long long v28 = v30;
  v13 = _extensionTokenForPath(&v27, v12);
  if (v13) {
    [v11 addObject:v13];
  }
  v14 = (void *)[v4 path];
  long long v27 = v29;
  long long v28 = v30;
  v15 = _extensionTokenForPath(&v27, v14);
  if (v15) {
    [v11 addObject:v15];
  }
  v16 = NSTemporaryDirectory();
  long long v27 = v29;
  long long v28 = v30;
  v17 = _extensionTokenForPath(&v27, v16);
  if (v17) {
    [v11 addObject:v17];
  }
  id v18 = (id)[v11 copy];
  v19 = *(void **)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 56);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  long long v21 = *(_OWORD *)(a1 + 64);
  long long v25 = *(_OWORD *)(a1 + 80);
  v23[2] = ___NSReadAttributedStringFromHTMLData_block_invoke_5;
  v23[3] = &unk_1E55C6798;
  v23[4] = *(void *)(a1 + 32);
  char v26 = *(unsigned char *)(a1 + 96);
  long long v24 = v21;
  return [v19 renderHTML:v20 options:v9 extensionTokens:v18 withReply:v23];
}

void ___NSReadAttributedStringFromHTMLData_block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  if (![a2 objectForKeyedSubscript:@"DocumentType"])
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"DocumentType"];
    if (v6) {
      v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
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
    id v6 = (id)[v10 copy];
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [a3 mutableCopy];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [v6 copy];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [a4 copy];
  if (!*(unsigned char *)(a1 + 72))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    v12 = *(NSObject **)(a1 + 40);
    dispatch_release(v12);
  }
}

@end