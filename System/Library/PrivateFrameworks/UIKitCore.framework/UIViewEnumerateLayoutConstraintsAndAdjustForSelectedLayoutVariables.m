@interface UIViewEnumerateLayoutConstraintsAndAdjustForSelectedLayoutVariables
@end

@implementation UIViewEnumerateLayoutConstraintsAndAdjustForSelectedLayoutVariables

uint64_t ___UIViewEnumerateLayoutConstraintsAndAdjustForSelectedLayoutVariables_block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  for (uint64_t result = a1[4]; result; uint64_t result = [v10 superview])
  {
    v10 = (void *)result;
    v3 = objc_msgSend((id)objc_msgSend((id)result, "_constraintsExceptingSubviewAutoresizingConstraints"), "copy");
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
          if (v8)
          {
            objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "firstItem"), "_referenceView");
            [v8 firstAttribute];
            objc_msgSend((id)objc_msgSend(v8, "secondItem"), "_referenceView");
          }
          else
          {
            [0 firstAttribute];
          }
          [v8 secondAttribute];
          if (((*(uint64_t (**)(void))(a1[5] + 16))() & 1) != 0 || (*(unsigned int (**)(void))(a1[5] + 16))()) {
            (*(void (**)(void))(a1[6] + 16))();
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v9 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        uint64_t v5 = v9;
      }
      while (v9);
    }

    if (v10 != (void *)a1[4])
    {
      uint64_t result = [v10 _hostsLayoutEngine];
      if (result) {
        break;
      }
    }
  }
  return result;
}

@end