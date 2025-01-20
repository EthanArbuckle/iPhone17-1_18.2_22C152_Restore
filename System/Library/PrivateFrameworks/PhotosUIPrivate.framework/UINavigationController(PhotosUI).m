@interface UINavigationController(PhotosUI)
- (BOOL)pu_popToViewControllerIfAllowed:()PhotosUI animated:forced:;
@end

@implementation UINavigationController(PhotosUI)

- (BOOL)pu_popToViewControllerIfAllowed:()PhotosUI animated:forced:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [a1 viewControllers];
  char v10 = [v9 containsObject:v8];

  if (v10)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v21) = 1;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__UINavigationController_PhotosUI__pu_popToViewControllerIfAllowed_animated_forced___block_invoke;
    v16[3] = &unk_1E5F2EAB0;
    char v19 = a5;
    v18 = buf;
    id v11 = v8;
    id v17 = v11;
    objc_msgSend(a1, "pl_visitControllerHierarchyWithBlock:", v16);
    BOOL v12 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      objc_msgSend(a1, "pu_popToViewController:animated:interactive:", v11, a4, 0);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [a1 viewControllers];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2112;
      v21 = v14;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "Trying to pop to a view controller %@ that isn't in the view controllers of %@: %@", buf, 0x20u);
    }
    BOOL v12 = 0;
  }

  return v12;
}

@end