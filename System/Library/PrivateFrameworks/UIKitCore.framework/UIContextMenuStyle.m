@interface UIContextMenuStyle
@end

@implementation UIContextMenuStyle

void __50___UIContextMenuStyle_setPreferredAttachmentEdge___block_invoke(uint64_t a1)
{
  v2 = _UIMainBundleIdentifier();
  char v3 = [&unk_1ED3EEFC0 containsObject:v2];

  if ((v3 & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_UIContextMenuStyle.m" lineNumber:86 description:@"This SPI may only be used by approved processes!"];
  }
}

@end