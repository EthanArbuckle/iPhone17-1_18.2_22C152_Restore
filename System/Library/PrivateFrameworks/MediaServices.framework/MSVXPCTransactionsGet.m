@interface MSVXPCTransactionsGet
@end

@implementation MSVXPCTransactionsGet

uint64_t ___MSVXPCTransactionsGet_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
  v1 = (void *)_MSVXPCTransactionsGet___MSVXPCTransactions;
  _MSVXPCTransactionsGet___MSVXPCTransactions = v0;

  return os_state_add_handler();
}

_DWORD *___MSVXPCTransactionsGet_block_invoke_2()
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  uint64_t v0 = [(id)_MSVXPCTransactionsGet___MSVXPCTransactions allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  v1 = [v0 valueForKey:@"description"];
  uint64_t v14 = 0;
  v2 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v1 format:200 options:0 error:&v14];
  v3 = v2;
  v4 = 0;
  if (!v14)
  {
    v5 = malloc_type_calloc(1uLL, [v2 length] + 200, 0xBEBC90DDuLL);
    v4 = v5;
    if (v5)
    {
      _DWORD *v5 = 1;
      v5[1] = [v3 length];
      v6 = [@"MSVXPCTransaction" dataUsingEncoding:4];
      v7 = v6;
      if (v6)
      {
        id v8 = v6;
        v9 = (const void *)[v8 bytes];
        unint64_t v10 = [v8 length];
        if (v10 >= 0x3F) {
          size_t v11 = 63;
        }
        else {
          size_t v11 = v10;
        }
        memcpy(v4 + 34, v9, v11);
      }
      id v12 = v3;
      memcpy(v4 + 50, (const void *)[v12 bytes], objc_msgSend(v12, "length"));
    }
  }

  return v4;
}

@end