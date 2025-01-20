@interface AXRemoteElement(STAXPriv)
- (id)_accessibilityNextElementsForSpeakThis;
@end

@implementation AXRemoteElement(STAXPriv)

- (id)_accessibilityNextElementsForSpeakThis
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [a1 _accessibilityAncestorIsKindOf:objc_opt_class()];
  uint64_t v3 = [v2 sxaxNextSpeakThisElementFromElement:a1];
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&off_26D636208;
    uint64_t v5 = objc_msgSendSuper2(&v8, sel__accessibilityNextElementsForSpeakThis);
  }
  v6 = (void *)v5;

  return v6;
}

@end