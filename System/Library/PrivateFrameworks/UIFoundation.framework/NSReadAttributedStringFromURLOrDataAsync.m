@interface NSReadAttributedStringFromURLOrDataAsync
@end

@implementation NSReadAttributedStringFromURLOrDataAsync

id ___NSReadAttributedStringFromURLOrDataAsync_block_invoke(uint64_t a1)
{
  _NSReadAttributedStringFromURLOrDataAsync_connectionQueue = (uint64_t)dispatch_queue_create("_NSReadAttributedStringFromURLOrDataAsync", MEMORY[0x1E4F14430]);
  uint64_t v2 = [MEMORY[0x1E4F28B18] _allowedTokensClasses];
  v3 = (void *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD8BA08];
  [v3 setClasses:*(void *)(a1 + 32) forSelector:sel_readFromData_orFileURL_options_extensionTokens_withReply_ argumentIndex:2 ofReply:0];
  [v3 setClasses:v2 forSelector:sel_readFromData_orFileURL_options_extensionTokens_withReply_ argumentIndex:3 ofReply:0];
  [v3 setClasses:*(void *)(a1 + 32) forSelector:sel_readFromData_orFileURL_options_extensionTokens_withReply_ argumentIndex:1 ofReply:1];
  id result = v3;
  _NSReadAttributedStringFromURLOrDataAsync_connectionInterface = (uint64_t)result;
  return result;
}

uint64_t ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelWithError:a2];
}

uint64_t ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_3(uint64_t a1)
{
  v31[2] = *MEMORY[0x1E4F143B8];
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
    v31[0] = v2;
    v31[1] = v4;
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = (void **)v31;
    uint64_t v7 = 2;
  }
  else
  {
    v30 = v2;
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = &v30;
    uint64_t v7 = 1;
  }
  uint64_t v8 = [v5 arrayWithObjects:v6 count:v7];
  v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1 + 32)];
  [v9 setObject:v8 forKeyedSubscript:@"_WKReadAccessFileURLsOption"];
  long long v28 = 0u;
  long long v29 = 0u;
  v10 = *(void **)(a1 + 40);
  if (v10) {
    [v10 auditToken];
  }
  v11 = (void *)[MEMORY[0x1E4F1CA48] array];
  v12 = (void *)[*(id *)(a1 + 48) path];
  long long v26 = v28;
  long long v27 = v29;
  v13 = _extensionTokenForPath(&v26, v12);
  if (v13) {
    [v11 addObject:v13];
  }
  v14 = (void *)[v2 path];
  long long v26 = v28;
  long long v27 = v29;
  v15 = _extensionTokenForPath(&v26, v14);
  if (v15) {
    [v11 addObject:v15];
  }
  v16 = (void *)[v4 path];
  long long v26 = v28;
  long long v27 = v29;
  v17 = _extensionTokenForPath(&v26, v16);
  if (v17) {
    [v11 addObject:v17];
  }
  v18 = NSTemporaryDirectory();
  long long v26 = v28;
  long long v27 = v29;
  v19 = _extensionTokenForPath(&v26, v18);
  if (v19) {
    [v11 addObject:v19];
  }
  id v20 = (id)[v11 copy];
  v21 = *(void **)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 64);
  uint64_t v23 = *(void *)(a1 + 48);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_4;
  v25[3] = &unk_1E55C66A8;
  v25[4] = *(void *)(a1 + 72);
  return [v21 readFromData:v22 orFileURL:v23 options:v9 extensionTokens:v20 withReply:v25];
}

uint64_t ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) deliverAttributedString:a2 documentAttributes:a3 error:a4];
}

@end