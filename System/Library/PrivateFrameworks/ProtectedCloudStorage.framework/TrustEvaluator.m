@interface TrustEvaluator
+ (BOOL)validatePublicKey:(id)a3 trustRefs:(id)a4;
@end

@implementation TrustEvaluator

+ (BOOL)validatePublicKey:(id)a3 trustRefs:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && [v6 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(__SecTrust **)(*((void *)&v23 + 1) + 8 * i);
          if (v12)
          {
            v13 = SecTrustCopyKey(v12);
            if (v13)
            {
              v14 = v13;
              CFErrorRef error = 0;
              CFDataRef v15 = SecKeyCopyExternalRepresentation(v13, &error);
              CFRelease(v14);
              CFErrorRef v16 = error;
              if (v15) {
                BOOL v17 = error == 0;
              }
              else {
                BOOL v17 = 0;
              }
              if (v17)
              {
                PublicWithData = (const void *)PCSKeyCreatePublicWithData(v15, 0);
                CFRelease(v15);
                if (PublicWithData)
                {
                  v19 = _PCSKeyCopyExportedPublicKey((uint64_t)PublicWithData);
                  CFRelease(PublicWithData);
                  char v20 = [v5 isEqual:v19];

                  if (v20)
                  {
                    LOBYTE(v9) = 1;
                    goto LABEL_25;
                  }
                }
              }
              else
              {
                if (v15)
                {
                  CFRelease(v15);
                  CFErrorRef v16 = error;
                }
                if (v16)
                {
                  NSLog(&cfstr_ErrorWhenCopyi.isa, v16);
                  CFRelease(error);
                }
              }
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_25:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

@end