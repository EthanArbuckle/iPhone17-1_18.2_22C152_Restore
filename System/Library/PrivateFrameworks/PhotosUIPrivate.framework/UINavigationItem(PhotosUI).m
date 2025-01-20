@interface UINavigationItem(PhotosUI)
- (uint64_t)_pu_shouldUpdateBarButtonItems:()PhotosUI withNewBarButtonItems:;
- (uint64_t)pu_shouldUpdateLeftBarButtonItems:()PhotosUI;
- (uint64_t)pu_shouldUpdateRightBarButtonItems:()PhotosUI;
- (void)pu_setDefaultBackBarButtonItemWithTitle:()PhotosUI;
@end

@implementation UINavigationItem(PhotosUI)

- (void)pu_setDefaultBackBarButtonItemWithTitle:()PhotosUI
{
  v4 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithTitle:v5 style:0 target:0 action:0];

  [a1 setBackBarButtonItem:v6];
}

- (uint64_t)_pu_shouldUpdateBarButtonItems:()PhotosUI withNewBarButtonItems:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 != [v6 count])
  {
LABEL_12:
    uint64_t v15 = 1;
    goto LABEL_13;
  }
  if ([v5 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      v9 = [v5 objectAtIndexedSubscript:v8];
      v10 = [v6 objectAtIndexedSubscript:v8];
      if (![v9 isSystemItem]
        || ![v10 isSystemItem]
        || (uint64_t v11 = [v9 systemItem], v11 != objc_msgSend(v10, "systemItem"))
        || ([v9 width], double v13 = v12, objc_msgSend(v10, "width"), v13 != v14))
      {
        if (v9 != v10) {
          break;
        }
      }

      if (++v8 >= (unint64_t)[v5 count]) {
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
LABEL_10:
  uint64_t v15 = 0;
LABEL_13:

  return v15;
}

- (uint64_t)pu_shouldUpdateRightBarButtonItems:()PhotosUI
{
  id v4 = a3;
  id v5 = [a1 rightBarButtonItems];
  uint64_t v6 = objc_msgSend(a1, "_pu_shouldUpdateBarButtonItems:withNewBarButtonItems:", v5, v4);

  return v6;
}

- (uint64_t)pu_shouldUpdateLeftBarButtonItems:()PhotosUI
{
  id v4 = a3;
  id v5 = [a1 leftBarButtonItems];
  uint64_t v6 = objc_msgSend(a1, "_pu_shouldUpdateBarButtonItems:withNewBarButtonItems:", v5, v4);

  return v6;
}

@end