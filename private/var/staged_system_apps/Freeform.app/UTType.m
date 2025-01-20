@interface UTType
- (BOOL)crl_conformsToAnyUTType:(id)a3;
@end

@implementation UTType

- (BOOL)crl_conformsToAnyUTType:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[UTType conformsToType:](self, "conformsToType:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

@end