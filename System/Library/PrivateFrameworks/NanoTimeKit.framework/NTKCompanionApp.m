@interface NTKCompanionApp
- (BOOL)fetchingIcon;
- (NSString)containerApplicationIdentifier;
- (NSString)name;
- (NSString)watchApplicationIdentifier;
- (NTKCompanionAppDelegate)delegate;
- (UIImage)icon;
- (id)complication;
- (void)setContainerApplicationIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchingIcon:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setWatchApplicationIdentifier:(id)a3;
@end

@implementation NTKCompanionApp

- (UIImage)icon
{
  v3 = self->_icon;
  if (!v3 && !self->_fetchingIcon)
  {
    v4 = [(NTKCompanionApp *)self watchApplicationIdentifier];

    if (v4)
    {
      [(NTKCompanionApp *)self setFetchingIcon:1];
      v5 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __23__NTKCompanionApp_icon__block_invoke;
      block[3] = &unk_1E62BFF20;
      block[4] = self;
      dispatch_async(v5, block);
    }
  }
  return v3;
}

void __23__NTKCompanionApp_icon__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F79F10] sharedInstance];
  v3 = [*(id *)(a1 + 32) watchApplicationIdentifier];
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v5 = [v4 traitCollection];
  [v5 displayScale];
  if (v6 <= 2.0) {
    uint64_t v7 = 42;
  }
  else {
    uint64_t v7 = 41;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __23__NTKCompanionApp_icon__block_invoke_2;
  v8[3] = &unk_1E62C3890;
  v8[4] = *(void *)(a1 + 32);
  [v2 getIconForBundleID:v3 iconVariant:v7 block:v8 timeout:60.0];
}

void __23__NTKCompanionApp_icon__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __23__NTKCompanionApp_icon__block_invoke_3;
  v6[3] = &unk_1E62C09C0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __23__NTKCompanionApp_icon__block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setIcon:");
    v2 = [*(id *)(a1 + 40) delegate];

    if (v2)
    {
      id v3 = [*(id *)(a1 + 40) delegate];
      [v3 companionAppUpdatedIcon:*(void *)(a1 + 40)];
    }
  }
  uint64_t v4 = *(void **)(a1 + 40);
  return [v4 setFetchingIcon:0];
}

- (id)complication
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setIcon:(id)a3
{
}

- (NSString)watchApplicationIdentifier
{
  return self->_watchApplicationIdentifier;
}

- (void)setWatchApplicationIdentifier:(id)a3
{
}

- (NSString)containerApplicationIdentifier
{
  return self->_containerApplicationIdentifier;
}

- (void)setContainerApplicationIdentifier:(id)a3
{
}

- (NTKCompanionAppDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCompanionAppDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)fetchingIcon
{
  return self->_fetchingIcon;
}

- (void)setFetchingIcon:(BOOL)a3
{
  self->_fetchingIcon = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_watchApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end