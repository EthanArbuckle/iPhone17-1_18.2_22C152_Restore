@interface StringToDictionaryRepresentation
@end

@implementation StringToDictionaryRepresentation

void ___StringToDictionaryRepresentation_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  char v6 = [v16 isEqualToString:&stru_1F00B0030];
  v7 = v16;
  if ((v6 & 1) == 0)
  {
    v8 = [v16 componentsSeparatedByString:@"="];
    if ([v8 count] == 2)
    {
      v9 = [v8 objectAtIndexedSubscript:0];
      v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v9];

      if (v10)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        v15 = [NSString stringWithUTF8String:"NSDictionary<NSString *,id> * _Nullable _StringToDictionaryRepresentation(NSString *__strong)_block_invoke"];
        [v14 handleFailureInFunction:v15, @"PXCPLStatus_Serialization.m", 152, @"Invalid parameter not satisfying: %@", @"dictionaryRepresentation[key] == nil" file lineNumber description];
      }
      v11 = [v8 objectAtIndexedSubscript:1];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v11 forKeyedSubscript:v9];
    }
    else
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = 0;

      *a4 = 1;
    }

    v7 = v16;
  }
}

@end