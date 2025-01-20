@interface NSAttributedString
@end

@implementation NSAttributedString

void __87__NSAttributedString_PKUIUtilities__pkui_sizeThatFits_withNumberOfLines_forceWordWrap___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *MEMORY[0x1E4FB0738];
  id v13 = v7;
  v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];

  if (v9)
  {
    v10 = [v13 objectForKeyedSubscript:v8];
    v11 = (void *)[v10 mutableCopy];

    [v11 setLineBreakMode:0];
    v12 = (void *)[v13 mutableCopy];
    [v12 setObject:v11 forKeyedSubscript:v8];
    objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v12, a3, a4);
  }
}

@end