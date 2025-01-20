@interface UIHIDInputEventString
@end

@implementation UIHIDInputEventString

void _UIHIDInputEventString_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 != a4)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDTransformer", (unint64_t *)&_UIHIDInputEventString_block_invoke_2___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v9 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = _UIStateString[a3];
        v11 = _UIHIDInputEventString[a5];
        id v12 = _UIStateString[a4];
        int v13 = 138412802;
        id v14 = v10;
        __int16 v15 = 2112;
        v16 = v11;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "State Transition: %@[%@] -> %@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

@end