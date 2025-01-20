@interface MAFloatVector(Espresso)
- (uint64_t)initWithDataTensor:()Espresso;
@end

@implementation MAFloatVector(Espresso)

- (uint64_t)initWithDataTensor:()Espresso
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(v4, "shape", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v9 *= [*(id *)(*((void *)&v13 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 1;
  }

  uint64_t v11 = objc_msgSend(a1, "initWithFloats:count:", objc_msgSend(v4, "dataPointer"), v9);
  return v11;
}

@end