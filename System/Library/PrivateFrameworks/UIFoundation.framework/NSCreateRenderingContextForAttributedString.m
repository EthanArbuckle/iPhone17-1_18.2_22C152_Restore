@interface NSCreateRenderingContextForAttributedString
@end

@implementation NSCreateRenderingContextForAttributedString

void ____NSCreateRenderingContextForAttributedString_block_invoke(uint64_t a1, void *a2)
{
  id v8 = (id)[objc_allocWithZone((Class)_NSCachedAttributedString) initWithAttributedString:*(void *)(a1 + 32)];
  uint64_t v4 = [v8 copyCachedInstance];
  uint64_t v5 = [*(id *)(a1 + 32) length];
  if (v4)
  {

    id v6 = (id)v4;
  }
  else
  {
    objc_msgSend(v8, "fixAttributesInRange:", 0, v5);
    id v6 = v8;
  }
  id v9 = v6;
  [a2 setAttributedString:v6];
  [a2 setDefaultTighteningFactor:*(double *)(a1 + 48)];
  [a2 setLimitsLayoutForSuspiciousContents:1];
  LOBYTE(v7) = *(unsigned char *)(a1 + 75);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "createRenderingContextForCharacterRange:typesetterBehavior:usesScreenFonts:hasStrongRight:syncDirection:mirrorsTextAlignment:maximumWidth:", 0, v5, *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(unsigned __int8 *)(a1 + 74), *(double *)(a1 + 64), v7);
  [a2 setDefaultTighteningFactor:0.0];
  if (!v4 && !*(unsigned char *)(a1 + 76)) {
    [v9 cache];
  }
}

@end