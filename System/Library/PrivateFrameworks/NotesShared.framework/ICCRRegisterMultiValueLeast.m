@interface ICCRRegisterMultiValueLeast
- (id)contents;
@end

@implementation ICCRRegisterMultiValueLeast

- (id)contents
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(ICCRRegisterMultiValue *)self values];
  v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (!v3 || [v3 compare:*(void *)(*((void *)&v10 + 1) + 8 * i)] == 1)
        {
          id v8 = v7;

          v3 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return v3;
}

@end