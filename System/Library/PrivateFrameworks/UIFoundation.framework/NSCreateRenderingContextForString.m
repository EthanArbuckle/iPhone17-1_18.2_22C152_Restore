@interface NSCreateRenderingContextForString
@end

@implementation NSCreateRenderingContextForString

void ____NSCreateRenderingContextForString_block_invoke(uint64_t a1, void *a2)
{
  id v8 = (id)[objc_allocWithZone((Class)_NSCachedAttributedString) initWithString:*(void *)(a1 + 32) attributes:*(void *)(a1 + 40)];
  uint64_t v4 = [v8 copyCachedInstance];
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(a1 + 32));
  if (v4)
  {

    id v6 = (id)v4;
  }
  else
  {
    objc_msgSend(v8, "fixAttributesInRange:", 0, Length);
    id v6 = v8;
  }
  id v9 = v6;
  [a2 setAttributedString:v6];
  [a2 setDefaultTighteningFactor:*(double *)(a1 + 56)];
  [a2 setLimitsLayoutForSuspiciousContents:1];
  LOBYTE(v7) = *(unsigned char *)(a1 + 83);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(a2, "createRenderingContextForCharacterRange:typesetterBehavior:usesScreenFonts:hasStrongRight:syncDirection:mirrorsTextAlignment:maximumWidth:", 0, Length, *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(unsigned __int8 *)(a1 + 82), *(double *)(a1 + 72), v7);
  [a2 setDefaultTighteningFactor:0.0];
  if (!v4 && !*(unsigned char *)(a1 + 84)) {
    [v9 cache];
  }
}

@end