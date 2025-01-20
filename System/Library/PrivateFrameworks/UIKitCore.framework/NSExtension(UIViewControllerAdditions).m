@interface NSExtension(UIViewControllerAdditions)
- (id)__UIKit_upcall_icons;
- (uint64_t)_instantiateAccessoryViewControllerWithInputItems:()UIViewControllerAdditions connectionHandler:;
- (uint64_t)instantiateViewControllerWithInputItems:()UIViewControllerAdditions connectionHandler:;
- (uint64_t)instantiateViewControllerWithInputItems:()UIViewControllerAdditions listenerEndpoint:connectionHandler:;
- (uint64_t)instantiateViewControllerWithInputItems:()UIViewControllerAdditions traitCollection:connectionHandler:;
- (void)_instantiateViewControllerWithInputItems:()UIViewControllerAdditions asAccessory:traitCollection:listenerEndpoint:connectionHandler:;
@end

@implementation NSExtension(UIViewControllerAdditions)

- (uint64_t)instantiateViewControllerWithInputItems:()UIViewControllerAdditions listenerEndpoint:connectionHandler:
{
  return [a1 _instantiateViewControllerWithInputItems:a3 asAccessory:0 traitCollection:0 listenerEndpoint:a4 connectionHandler:a5];
}

- (void)_instantiateViewControllerWithInputItems:()UIViewControllerAdditions asAccessory:traitCollection:listenerEndpoint:connectionHandler:
{
  id v13 = a5;
  id v14 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke;
  aBlock[3] = &unk_1E52ECC40;
  char v24 = a4;
  aBlock[4] = a1;
  id v21 = v13;
  id v22 = v14;
  uint64_t v23 = a2;
  id v15 = v14;
  id v16 = v13;
  id v17 = a6;
  id v18 = a3;
  v19 = _Block_copy(aBlock);
  [a1 beginExtensionRequestWithOptions:2 inputItems:v18 listenerEndpoint:v17 completion:v19];
}

- (uint64_t)instantiateViewControllerWithInputItems:()UIViewControllerAdditions connectionHandler:
{
  return [a1 instantiateViewControllerWithInputItems:a3 listenerEndpoint:0 connectionHandler:a4];
}

- (uint64_t)_instantiateAccessoryViewControllerWithInputItems:()UIViewControllerAdditions connectionHandler:
{
  return [a1 _instantiateViewControllerWithInputItems:a3 asAccessory:1 traitCollection:0 listenerEndpoint:0 connectionHandler:a4];
}

- (uint64_t)instantiateViewControllerWithInputItems:()UIViewControllerAdditions traitCollection:connectionHandler:
{
  return [a1 _instantiateViewControllerWithInputItems:a3 asAccessory:0 traitCollection:a4 listenerEndpoint:0 connectionHandler:a5];
}

- (id)__UIKit_upcall_icons
{
  objc_getAssociatedObject(a1, &kNSExtensionIconsKey);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3 = (void *)MEMORY[0x1E4F22458];
    v4 = [a1 _plugIn];
    v5 = [v4 valueForKey:@"uuid"];
    v6 = [v3 pluginKitProxyForUUID:v5];

    v7 = [v6 containingBundle];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 bundleIdentifier];
      v10 = +[UIScreen mainScreen];
      [v10 scale];
      v11 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 10);

      if (v11) {
        [v2 addObject:v11];
      }
    }
    objc_setAssociatedObject(a1, &kNSExtensionIconsKey, v2, (void *)1);
  }
  return v2;
}

@end