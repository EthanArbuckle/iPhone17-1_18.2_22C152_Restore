@interface NCClearableMaterialLabel
- (void)setTextColor:(id)a3;
@end

@implementation NCClearableMaterialLabel

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4FB1618] labelColor];
  }
  v5 = [(NCClearableMaterialLabel *)self attributedText];
  v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  uint64_t v8 = [v5 length];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __41__NCClearableMaterialLabel_setTextColor___block_invoke;
  v14 = &unk_1E6A92370;
  id v15 = v6;
  id v16 = v4;
  id v9 = v4;
  id v10 = v6;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, &v11);
  -[NCClearableMaterialLabel setAttributedText:](self, "setAttributedText:", v10, v11, v12, v13, v14);
}

void __41__NCClearableMaterialLabel_setTextColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4FB1618];
  id v8 = a2;
  id v9 = [v7 clearColor];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = *MEMORY[0x1E4FB0700];
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    objc_msgSend(v12, "addAttribute:value:range:", v11, v13, a3, a4);
  }
}

@end