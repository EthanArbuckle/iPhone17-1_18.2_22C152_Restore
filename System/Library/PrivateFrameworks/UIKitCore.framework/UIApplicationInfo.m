@interface UIApplicationInfo
@end

@implementation UIApplicationInfo

uint64_t __33___UIApplicationInfo_folderNames__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_loadFolderNamesIfNecessary");
}

uint64_t __40___UIApplicationInfo_fallbackFolderName__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_loadFolderNamesIfNecessary");
}

id __54___UIApplicationInfo__lock_loadFolderNamesIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_UIApplicationInfo _localizedFolderNameForName:a2];
}

id __54___UIApplicationInfo__lock_loadFolderNamesIfNecessary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = +[_UIApplicationInfo _genreNameForID:](_UIApplicationInfo, "_genreNameForID:", [a2 integerValue]);
    a2 = (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  if (a2) {
    v8 = a2;
  }
  else {
    v8 = v5;
  }
  id v9 = v8;

  return v9;
}

@end