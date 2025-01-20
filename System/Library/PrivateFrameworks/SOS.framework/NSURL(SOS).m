@interface NSURL(SOS)
- (id)sos_urlActivationReason;
- (uint64_t)isSOS;
@end

@implementation NSURL(SOS)

- (uint64_t)isSOS
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  v2 = [v1 scheme];
  uint64_t v3 = [v2 isEqualToString:@"telSOS"];

  return v3;
}

- (id)sos_urlActivationReason
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  v2 = [v1 scheme];
  int v3 = [v2 isEqualToString:@"telSOS"];

  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = objc_msgSend(v1, "queryItems", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v10 = [v9 name];
          char v11 = [v10 isEqualToString:@"reason"];

          if (v11)
          {
            v12 = [v9 value];
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    v12 = 0;
LABEL_13:
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end