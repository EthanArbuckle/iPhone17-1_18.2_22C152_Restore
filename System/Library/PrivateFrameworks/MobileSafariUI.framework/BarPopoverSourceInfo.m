@interface BarPopoverSourceInfo
- (BOOL)shouldDismissIfSourceRemovedAfterRepositioning;
- (BarPopoverSourceInfo)initWithBrowserController:(id)a3 barItem:(int64_t)a4;
- (CGRect)popoverSourceRect;
- (NSString)description;
- (UIBarButtonItem)barButtonItem;
- (UIView)popoverSourceView;
- (id)_sourceInfo;
- (void)_sourceInfo;
@end

@implementation BarPopoverSourceInfo

- (BarPopoverSourceInfo)initWithBrowserController:(id)a3 barItem:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BarPopoverSourceInfo;
  v8 = [(BarPopoverSourceInfo *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_barItem = a4;
    objc_storeStrong((id *)&v8->_browserController, a3);
    if (a4 == 11 && (_SFDeviceIsPad() & 1) == 0) {
      v9->_shouldDismissIfSourceRemovedAfterRepositioning = 1;
    }
    v10 = v9;
  }

  return v9;
}

- (id)_sourceInfo
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(BrowserController *)self->_browserController rootViewController];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = objc_msgSend(v3, "bars", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) popoverSourceInfoForBarItem:self->_barItem];
        if (v9)
        {
          v11 = (void *)v9;

          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v10 = WBS_LOG_CHANNEL_PREFIXUserInterface();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    [(BarPopoverSourceInfo *)(uint64_t)self _sourceInfo];
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = _SFStringForBarItem();
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p barItem = %@>", v5, self, v6];;

  return (NSString *)v7;
}

- (UIBarButtonItem)barButtonItem
{
  v2 = [(BarPopoverSourceInfo *)self _sourceInfo];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 barButtonItem];
  }
  else
  {
    v3 = 0;
  }

  return (UIBarButtonItem *)v3;
}

- (UIView)popoverSourceView
{
  v2 = [(BarPopoverSourceInfo *)self _sourceInfo];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 popoverSourceView];
  }
  else
  {
    v3 = 0;
  }

  return (UIView *)v3;
}

- (CGRect)popoverSourceRect
{
  v2 = [(BarPopoverSourceInfo *)self _sourceInfo];
  if (objc_opt_respondsToSelector())
  {
    [v2 popoverSourceRect];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB20];
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)shouldDismissIfSourceRemovedAfterRepositioning
{
  return self->_shouldDismissIfSourceRemovedAfterRepositioning;
}

- (void).cxx_destruct
{
}

- (void)_sourceInfo
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2) {
    double v5 = @"is NOT";
  }
  else {
    double v5 = @"is";
  }
  double v6 = a3;
  double v7 = [a2 navigationController];
  int v9 = 138543874;
  if (v7) {
    double v8 = @"is NOT";
  }
  else {
    double v8 = @"is";
  }
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  double v12 = v5;
  __int16 v13 = 2114;
  double v14 = v8;
  _os_log_fault_impl(&dword_1E102C000, v6, OS_LOG_TYPE_FAULT, "%{public}@: No inner source info (view controller %{public}@ nil; navigation bar %{public}@ nil)",
    (uint8_t *)&v9,
    0x20u);
}

@end