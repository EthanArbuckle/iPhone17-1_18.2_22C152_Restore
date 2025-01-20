@interface ICLibraryAuthServiceBulkClientTokenResponse
- (ICLibraryAuthServiceBulkClientTokenResponse)initWithResponseDictionary:(id)a3;
- (NSDictionary)tokenResults;
- (NSString)serverInstance;
- (id)tokenResultForAccountDSID:(id)a3;
@end

@implementation ICLibraryAuthServiceBulkClientTokenResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedTokenResults, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

- (id)tokenResultForAccountDSID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parsedTokenResults objectForKey:a3];
}

- (NSDictionary)tokenResults
{
  v2 = (void *)[(NSMutableDictionary *)self->_parsedTokenResults copy];

  return (NSDictionary *)v2;
}

- (NSString)serverInstance
{
  return (NSString *)[(NSDictionary *)self->_responseDictionary ic_stringValueForKey:@"serverInstance"];
}

- (ICLibraryAuthServiceBulkClientTokenResponse)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(ICLibraryAuthServiceBulkClientTokenResponse *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

    v8 = [(NSDictionary *)v5->_responseDictionary ic_dictionaryValueForKey:@"result"];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    parsedTokenResults = v5->_parsedTokenResults;
    v5->_parsedTokenResults = (NSMutableDictionary *)v9;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__ICLibraryAuthServiceBulkClientTokenResponse_initWithResponseDictionary___block_invoke;
    v12[3] = &unk_1E5ACADD0;
    v13 = v5;
    [v8 enumerateKeysAndObjectsUsingBlock:v12];
  }
  return v5;
}

void __74__ICLibraryAuthServiceBulkClientTokenResponse_initWithResponseDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v10 longLongValue] >= 1
    && _NSIsNSDictionary())
  {
    uint64_t v6 = [v10 longLongValue];
    v7 = [[ICLibraryAuthServiceClientTokenResult alloc] initWithResponseDictionary:v5];
    v8 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v9 = [NSNumber numberWithLongLong:v6];
    [v8 setObject:v7 forKey:v9];
  }
}

@end