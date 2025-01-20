@interface UILabel(RangeBold)
- (void)setBoldSubString:()RangeBold;
- (void)setColor:()RangeBold toSubstring:;
@end

@implementation UILabel(RangeBold)

- (void)setBoldSubString:()RangeBold
{
  id v4 = a3;
  v5 = [a1 text];
  uint64_t v6 = [v5 rangeOfString:v4];
  uint64_t v8 = v7;

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)MEMORY[0x263F81708];
    v10 = [a1 font];
    v11 = [v10 fontDescriptor];
    v12 = [v11 fontDescriptorWithSymbolicTraits:2];
    v13 = [a1 font];
    [v13 pointSize];
    objc_msgSend(v9, "fontWithDescriptor:size:", v12);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    v14 = [a1 attributedText];

    if (v14)
    {
      v15 = [a1 attributedText];
      uint64_t v16 = [v15 mutableCopy];
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x263F089B8]);
      v15 = [a1 text];
      uint64_t v16 = [v17 initWithString:v15];
    }
    v18 = (void *)v16;

    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x263F814F0], v20, v6, v8);
    v19 = (void *)[v18 copy];
    [a1 setAttributedText:v19];
  }
}

- (void)setColor:()RangeBold toSubstring:
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = [a1 text];
  uint64_t v8 = [v7 rangeOfString:v6 options:4];
  uint64_t v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [a1 attributedText];

    if (v11)
    {
      v12 = [a1 attributedText];
      uint64_t v13 = [v12 mutableCopy];
    }
    else
    {
      id v14 = objc_alloc(MEMORY[0x263F089B8]);
      v12 = [a1 text];
      uint64_t v13 = [v14 initWithString:v12];
    }
    v15 = (void *)v13;

    objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x263F81500], v17, v8, v10);
    uint64_t v16 = (void *)[v15 copy];
    [a1 setAttributedText:v16];
  }
}

@end