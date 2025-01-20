@interface UIMenu(Utilities)
+ (id)vk_menuWithItems:()Utilities title:subtitle:image:;
+ (uint64_t)vk_menuWithItems:()Utilities title:;
+ (uint64_t)vk_menuWithItems:()Utilities title:subtitle:;
- (id)vk_addItems:()Utilities;
- (id)vk_addNonNilItems:()Utilities;
- (void)vk_addNonNilItem:()Utilities;
@end

@implementation UIMenu(Utilities)

+ (uint64_t)vk_menuWithItems:()Utilities title:
{
  return objc_msgSend(a1, "vk_menuWithItems:title:subtitle:image:", a3, a4, 0, 0);
}

+ (uint64_t)vk_menuWithItems:()Utilities title:subtitle:
{
  return objc_msgSend(a1, "vk_menuWithItems:title:subtitle:image:", a3, a4, a5, 0);
}

+ (id)vk_menuWithItems:()Utilities title:subtitle:image:
{
  id v9 = a5;
  v10 = &stru_1F35566F8;
  if (a4) {
    v10 = a4;
  }
  v11 = v10;
  id v12 = a6;
  id v13 = a3;
  v14 = [MEMORY[0x1E4F42B80] menuWithTitle:v11 image:v12 identifier:0 options:0 children:v13];

  if (objc_opt_respondsToSelector()) {
    [v14 setSubtitle:v9];
  }

  return v14;
}

- (id)vk_addNonNilItems:()Utilities
{
  id v4 = a1;
  v5 = v4;
  if (a3)
  {
    uint64_t v6 = objc_msgSend(v4, "vk_addItems:", a3);

    v5 = (void *)v6;
  }
  return v5;
}

- (void)vk_addNonNilItem:()Utilities
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

    id v7 = (id)objc_msgSend(a1, "vk_addItems:", v6, v9, v10);
  }
  return a1;
}

- (id)vk_addItems:()Utilities
{
  id v4 = a3;
  uint64_t v5 = [a1 children];
  uint64_t v6 = (void *)v5;
  id v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    id v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = objc_msgSend(v8, "vk_arrayByAddingObjectsFromNonNilArray:", v4);

  uint64_t v10 = [a1 menuByReplacingChildren:v9];

  return v10;
}

@end