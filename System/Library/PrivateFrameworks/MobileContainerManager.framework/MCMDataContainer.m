@interface MCMDataContainer
+ (int64_t)typeContainerClass;
- (BOOL)wipeAllMyContainerContent:(id *)a3;
@end

@implementation MCMDataContainer

+ (int64_t)typeContainerClass
{
  return 0;
}

- (BOOL)wipeAllMyContainerContent:(id *)a3
{
  [(MCMContainer *)self thisContainer];
  uint64_t v4 = container_delete_all_container_content();
  if (v4 == 1)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"MCMErrorDomain" code:v4 userInfo:0];
    if (a3 && v5)
    {
      id v5 = v5;
      *a3 = v5;
    }
  }

  return v4 == 1;
}

@end