@interface IDSAccountController
- (BOOL)_gkIsReadyForService:(id)a3;
@end

@implementation IDSAccountController

- (BOOL)_gkIsReadyForService:(id)a3
{
  id v4 = a3;
  v5 = [(IDSAccountController *)self accounts];
  id v6 = [v5 copy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) serviceName:v14];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v8;
}

@end