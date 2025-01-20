@interface IKViewElement
@end

@implementation IKViewElement

void __58__IKViewElement_VSAdditions__vs_selectedChildElementIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF4A0];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"Unexpectedly, obj was %@, instead of IKViewElement.", v8 format];
  }
  if (objc_msgSend(v9, "vs_BOOLAttributeValueForKey:", @"selected")) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

@end