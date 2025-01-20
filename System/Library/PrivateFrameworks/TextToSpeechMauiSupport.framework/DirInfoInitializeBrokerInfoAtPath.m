@interface DirInfoInitializeBrokerInfoAtPath
@end

@implementation DirInfoInitializeBrokerInfoAtPath

uint64_t ___DirInfoInitializeBrokerInfoAtPath_block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasSuffix:@"hdr"];
}

void ___DirInfoInitializeBrokerInfoAtPath_block_invoke_1007(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  if ([v12 numberOfRanges] == 2)
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v12 rangeAtIndex:1];
    uint64_t v9 = objc_msgSend(v6, "substringWithRange:", v7, v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

@end