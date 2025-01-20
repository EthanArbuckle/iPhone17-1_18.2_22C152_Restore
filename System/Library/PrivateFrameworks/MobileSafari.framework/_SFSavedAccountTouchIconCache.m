@interface _SFSavedAccountTouchIconCache
- (BOOL)canHandleRequest:(id)a3;
- (id)_operationWithRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation _SFSavedAccountTouchIconCache

- (id)_operationWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(WBSTouchIconFetchOperation *)[_SFTouchIconFetchOperation alloc] initWithRequest:v6 allowFetchingOverCellularNetwork:0 completionHandler:v5];

  return v7;
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end