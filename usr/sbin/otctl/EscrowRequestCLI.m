@interface EscrowRequestCLI
- (EscrowRequestCLI)initWithEscrowRequest:(id)a3;
- (SecEscrowRequest)escrowRequest;
- (int)reset;
- (int)status;
- (int)storePrerecordsInEscrow;
- (int)trigger;
- (void)setEscrowRequest:(id)a3;
@end

@implementation EscrowRequestCLI

- (void).cxx_destruct
{
}

- (void)setEscrowRequest:(id)a3
{
}

- (SecEscrowRequest)escrowRequest
{
  return (SecEscrowRequest *)objc_getProperty(self, a2, 8, 1);
}

- (int)storePrerecordsInEscrow
{
  v2 = [(EscrowRequestCLI *)self escrowRequest];
  id v8 = 0;
  unsigned int v3 = [v2 storePrerecordsInEscrow:&v8];
  id v4 = v8;

  if (v4)
  {
    id v5 = [v4 description];
    printf("Errored: %s\n", (const char *)[v5 UTF8String]);

    int v6 = 1;
  }
  else
  {
    printf("Complete: %d records written.\n", v3);
    int v6 = 0;
  }

  return v6;
}

- (int)reset
{
  v2 = [(EscrowRequestCLI *)self escrowRequest];
  id v7 = 0;
  [v2 resetAllRequests:&v7];
  id v3 = v7;

  if (v3)
  {
    id v4 = [v3 description];
    printf("Errored: %s\n", (const char *)[v4 UTF8String]);

    int v5 = 1;
  }
  else
  {
    puts("Complete.");
    int v5 = 0;
  }

  return v5;
}

- (int)status
{
  v2 = [(EscrowRequestCLI *)self escrowRequest];
  id v21 = 0;
  id v3 = [v2 fetchStatuses:&v21];
  id v4 = v21;

  if (v4)
  {
    id v5 = [v4 description];
    printf("Errored: %s\n", (const char *)[v5 UTF8String]);

    int v6 = 1;
  }
  else
  {
    if ([v3 count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = [v3 allKeys];
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(id *)(*((void *)&v17 + 1) + 8 * i);
            v13 = (const char *)[v12 UTF8String];
            v14 = [v3 objectForKeyedSubscript:v12];
            id v15 = [v14 description];
            printf("Request %s: %s\n", v13, (const char *)[v15 UTF8String]);
          }
          id v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v9);
      }
    }
    else
    {
      puts("No requests are waiting for a passcode.");
    }
    int v6 = 0;
  }

  return v6;
}

- (int)trigger
{
  v2 = [(EscrowRequestCLI *)self escrowRequest];
  id v7 = 0;
  [v2 triggerEscrowUpdate:@"cli" error:&v7];
  id v3 = v7;

  if (v3)
  {
    id v4 = [v3 description];
    printf("Errored: %s", (const char *)[v4 UTF8String]);

    int v5 = 1;
  }
  else
  {
    puts("Complete.");
    int v5 = 0;
  }

  return v5;
}

- (EscrowRequestCLI)initWithEscrowRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EscrowRequestCLI;
  int v6 = [(EscrowRequestCLI *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_escrowRequest, a3);
  }

  return v7;
}

@end