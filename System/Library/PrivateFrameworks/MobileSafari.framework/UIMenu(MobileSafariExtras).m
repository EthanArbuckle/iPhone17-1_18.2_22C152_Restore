@interface UIMenu(MobileSafariExtras)
+ (id)safari_menuWithTitle:()MobileSafariExtras image:identifier:options:cachedChildrenProvider:;
+ (id)safari_menuWithTitle:()MobileSafariExtras image:identifier:options:uncachedChildrenProvider:;
+ (id)sf_bookmarkMenuChildrenProvider;
+ (id)sf_tabMenuWithAdditionalChildrenProvider:()MobileSafariExtras;
+ (uint64_t)safari_menuWithCachedChildrenProvider:()MobileSafariExtras;
+ (uint64_t)safari_menuWithTitle:()MobileSafariExtras cachedChildrenProvider:;
+ (uint64_t)safari_menuWithTitle:()MobileSafariExtras uncachedChildrenProvider:;
+ (uint64_t)safari_menuWithUncachedChildrenProvider:()MobileSafariExtras;
+ (uint64_t)sf_bookmarkMenu;
+ (uint64_t)sf_tabMenu;
@end

@implementation UIMenu(MobileSafariExtras)

+ (id)sf_tabMenuWithAdditionalChildrenProvider:()MobileSafariExtras
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4FB1970];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__UIMenu_MobileSafariExtras__sf_tabMenuWithAdditionalChildrenProvider___block_invoke;
  v8[3] = &unk_1E54EDBB0;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "safari_menuWithTitle:image:identifier:options:cachedChildrenProvider:", &stru_1EDA07C28, 0, 0, 1, v8);

  return v6;
}

+ (uint64_t)safari_menuWithUncachedChildrenProvider:()MobileSafariExtras
{
  return objc_msgSend(a1, "safari_menuWithTitle:image:identifier:options:uncachedChildrenProvider:", &stru_1EDA07C28, 0, 0, 0, a3);
}

+ (id)safari_menuWithTitle:()MobileSafariExtras image:identifier:options:cachedChildrenProvider:
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  v12 = (void *)MEMORY[0x1E4FB16B8];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __99__UIMenu_MobileSafariExtras__safari_menuWithTitle_image_identifier_options_cachedChildrenProvider___block_invoke;
  v22[3] = &unk_1E54EDB68;
  id v23 = v11;
  id v13 = v11;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 elementWithProvider:v22];
  v18 = (void *)MEMORY[0x1E4FB1970];
  v24[0] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v20 = [v18 menuWithTitle:v16 image:v15 identifier:v14 options:a6 children:v19];

  return v20;
}

+ (id)safari_menuWithTitle:()MobileSafariExtras image:identifier:options:uncachedChildrenProvider:
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  v12 = (void *)MEMORY[0x1E4FB16B8];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __101__UIMenu_MobileSafariExtras__safari_menuWithTitle_image_identifier_options_uncachedChildrenProvider___block_invoke;
  v22[3] = &unk_1E54EDB68;
  id v23 = v11;
  id v13 = v11;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 elementWithUncachedProvider:v22];
  v18 = (void *)MEMORY[0x1E4FB1970];
  v24[0] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v20 = [v18 menuWithTitle:v16 image:v15 identifier:v14 options:a6 children:v19];

  return v20;
}

+ (uint64_t)safari_menuWithTitle:()MobileSafariExtras uncachedChildrenProvider:
{
  return objc_msgSend(a1, "safari_menuWithTitle:image:identifier:options:uncachedChildrenProvider:", a3, 0, 0, 0, a4);
}

+ (uint64_t)sf_tabMenu
{
  return objc_msgSend(a1, "sf_tabMenuWithAdditionalChildrenProvider:", 0);
}

+ (uint64_t)sf_bookmarkMenu
{
  return objc_msgSend(MEMORY[0x1E4FB1970], "safari_menuWithTitle:image:identifier:options:cachedChildrenProvider:", &stru_1EDA07C28, 0, 0, 1, &__block_literal_global_65);
}

+ (uint64_t)safari_menuWithCachedChildrenProvider:()MobileSafariExtras
{
  return objc_msgSend(a1, "safari_menuWithTitle:image:identifier:options:cachedChildrenProvider:", &stru_1EDA07C28, 0, 0, 0, a3);
}

+ (uint64_t)safari_menuWithTitle:()MobileSafariExtras cachedChildrenProvider:
{
  return objc_msgSend(a1, "safari_menuWithTitle:image:identifier:options:cachedChildrenProvider:", a3, 0, 0, 0, a4);
}

+ (id)sf_bookmarkMenuChildrenProvider
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1638];
  id v13 = _WBSLocalizedString();
  v1 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eyeglasses"];
  v2 = [v0 commandWithTitle:v13 image:v1 action:sel_addToReadingList_ propertyList:0];
  v14[0] = v2;
  id v3 = (void *)MEMORY[0x1E4FB1638];
  v4 = _WBSLocalizedString();
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"book"];
  v6 = [v3 commandWithTitle:v4 image:v5 action:sel_addToBookmarks_ propertyList:0];
  v14[1] = v6;
  v7 = (void *)MEMORY[0x1E4FB1638];
  v8 = _WBSLocalizedString();
  id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"book"];
  v10 = [v7 commandWithTitle:v8 image:v9 action:sel_addAllTabsToBookmarks_ propertyList:0];
  v14[2] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v11;
}

@end