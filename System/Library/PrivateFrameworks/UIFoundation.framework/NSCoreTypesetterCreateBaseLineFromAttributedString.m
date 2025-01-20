@interface NSCoreTypesetterCreateBaseLineFromAttributedString
@end

@implementation NSCoreTypesetterCreateBaseLineFromAttributedString

void ____NSCoreTypesetterCreateBaseLineFromAttributedString_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2) {
    return;
  }
  v4 = a2;
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "string"), "characterAtIndex:", a3) != 65532)return; {
  if ([v4 _isEmojiImage])
  }
    goto LABEL_6;
  uint64_t v6 = [v4 adaptiveImageGlyph];
  if (v6)
  {
    v4 = (void *)v6;
LABEL_6:
    v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v7)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [[_NSCachedAttributedString alloc] initWithAttributedString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8)+ 40)];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 40);
      v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    uint64_t v8 = *MEMORY[0x1E4F243C0];
    objc_msgSend(v7, "addAttribute:value:range:", v8, v4, a3, 1);
    return;
  }
  v9 = (void *)[*(id *)(a1 + 32) textLayoutFragment];
  if (v9) {
    v10 = (NSCountableTextLocation *)(id)objc_msgSend((id)objc_msgSend(v9, "textParagraph"), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a3, 0, 0);
  }
  else {
    v10 = [[NSCountableTextLocation alloc] initWithIndex:a3];
  }
  v14 = v10;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "textAttachmentLayoutInfoForLocation:attributes:", v10, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "attributesAtIndex:effectiveRange:", a3, 0)), "runDelegate");
  if (v11)
  {
    uint64_t v12 = v11;
    v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v13)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [[_NSCachedAttributedString alloc] initWithAttributedString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8)+ 40)];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 40);
      v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E4F247B0], v12, a3, 1);
  }
}

@end