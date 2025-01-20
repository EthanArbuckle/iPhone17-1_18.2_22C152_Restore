@interface TSKNullActionLayerDelegate
+ (id)layerDelegate;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation TSKNullActionLayerDelegate

+ (id)layerDelegate
{
  id result = (id)layerDelegate_sharedInstance;
  if (!layerDelegate_sharedInstance)
  {
    id result = objc_alloc_init(TSKNullActionLayerDelegate);
    layerDelegate_sharedInstance = (uint64_t)result;
  }
  return result;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

@end