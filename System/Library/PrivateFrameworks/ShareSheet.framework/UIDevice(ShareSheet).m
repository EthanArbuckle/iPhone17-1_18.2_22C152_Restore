@interface UIDevice(ShareSheet)
- (uint64_t)sh_hostUserInterfaceIdiom;
- (void)setSh_hostUserInterfaceIdiom:()ShareSheet;
@end

@implementation UIDevice(ShareSheet)

- (uint64_t)sh_hostUserInterfaceIdiom
{
  v1 = objc_getAssociatedObject(a1, (const void *)SHSheetUserInterfaceIdiomPropertyKey);
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 integerValue];
  }
  else
  {
    v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v3 = [v4 userInterfaceIdiom];
  }
  return v3;
}

- (void)setSh_hostUserInterfaceIdiom:()ShareSheet
{
  v2 = (const void *)SHSheetUserInterfaceIdiomPropertyKey;
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);
}

@end