@interface TIAccessibilityHandler
- (void)requestLabelForProactiveCandidateWithSlotID:(unsigned int)a3 completionHandler:(id)a4;
@end

@implementation TIAccessibilityHandler

- (void)requestLabelForProactiveCandidateWithSlotID:(unsigned int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = +[TIKeyboardSecureCandidateRenderer allRenderers];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) accessibilityLabelForSlotID:v4];
          if (v11)
          {
            v12 = (void *)v11;
            goto LABEL_12;
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    v12 = 0;
LABEL_12:

    v5[2](v5, v12);
  }
}

@end