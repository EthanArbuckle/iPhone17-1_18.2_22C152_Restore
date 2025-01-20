@interface MFAccountFactory_iOS
- (id)accountWithIdentifier:(id)a3;
- (id)accountWithSystemAccount:(id)a3;
@end

@implementation MFAccountFactory_iOS

- (id)accountWithIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v22 = 0;
  v4 = +[MailAccount activeAccountsWithError:&v22];
  id v5 = v22;
  v17 = (void *)[v4 mutableCopy];

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v17;
    v6 = 0;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v12 = [v11 identifier];
          int v13 = [v12 isEqualToString:v3];

          if (v13)
          {
            id v14 = v11;

            v6 = v14;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v8);
    }
  }
  id v15 = v6;

  return v15;
}

- (id)accountWithSystemAccount:(id)a3
{
  v4 = [a3 identifier];
  id v5 = [(MFAccountFactory_iOS *)self accountWithIdentifier:v4];

  return v5;
}

@end