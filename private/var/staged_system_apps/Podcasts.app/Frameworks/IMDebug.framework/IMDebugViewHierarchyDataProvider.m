@interface IMDebugViewHierarchyDataProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation IMDebugViewHierarchyDataProvider

- (id)debugDataFileName
{
  return @"ViewHierarchy.txt";
}

- (id)debugData
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = &stru_10760;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__IMDebugViewHierarchyDataProvider_debugData__block_invoke;
  block[3] = &unk_10578;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v2 = [(id)v6[5] dataUsingEncoding:4];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __45__IMDebugViewHierarchyDataProvider_debugData__block_invoke(uint64_t a1)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = +[DebugUtil allViewControllers];
  id v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v5);
        uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        v10 = +[NSString stringWithFormat:@"\n\nView Hierarchy for: %@\n", v9];
        uint64_t v11 = [v7 stringByAppendingString:v10];
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
        v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        v14 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        v15 = [v6 view];
        v16 = [v15 recursiveDescription];
        uint64_t v17 = [v14 stringByAppendingString:v16];
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
        v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;

        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }
}

@end