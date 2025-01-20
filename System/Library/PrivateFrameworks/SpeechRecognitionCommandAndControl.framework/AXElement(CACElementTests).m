@interface AXElement(CACElementTests)
+ (id)_testCombinationsFromTitle:()CACElementTests isCarPlayConnected:;
@end

@implementation AXElement(CACElementTests)

+ (id)_testCombinationsFromTitle:()CACElementTests isCarPlayConnected:
{
  v5 = (objc_class *)MEMORY[0x263F21668];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = [v7 _combinationsFromTitle:v6 isCarPlayConnected:a4];

  return v8;
}

@end