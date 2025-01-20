@interface NSFileManager(PosterFoundation)
- (id)pf_createTransientDirectoryAtURL:()PosterFoundation error:;
@end

@implementation NSFileManager(PosterFoundation)

- (id)pf_createTransientDirectoryAtURL:()PosterFoundation error:
{
  id v6 = a3;
  int v7 = [a1 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:a4];
  v8 = 0;
  if (v7)
  {
    id v9 = objc_alloc(MEMORY[0x263F29CD8]);
    v10 = [v6 path];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __74__NSFileManager_PosterFoundation__pf_createTransientDirectoryAtURL_error___block_invoke;
    v12[3] = &unk_26546EDA0;
    v12[4] = a1;
    id v13 = v6;
    v8 = (void *)[v9 initWithIdentifier:v10 forReason:@"TransientDirectory" invalidationBlock:v12];
  }
  return v8;
}

@end