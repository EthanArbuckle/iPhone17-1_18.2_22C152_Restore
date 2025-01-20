@interface CADeveloperHUDProperties
@end

@implementation CADeveloperHUDProperties

uint64_t __37___CADeveloperHUDProperties_instance__block_invoke(uint64_t a1)
{
  +[_CADeveloperHUDProperties instance]::sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

void __37___CADeveloperHUDProperties_elements__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 addObject:];
}

@end