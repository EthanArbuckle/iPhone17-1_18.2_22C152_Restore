@interface STStorageTip
- (NSString)identifier;
- (NSString)infoText;
- (NSString)representedApp;
- (NSString)title;
- (PSSpecifier)infoSpecifier;
- (PSSpecifier)specifier;
- (STStorageTip)init;
- (STStorageTipUIDelegate)uiDelegate;
- (UIImage)icon;
- (id)propertyForKey:(id)a3;
- (int64_t)size;
- (void)_reload:(id)a3;
- (void)reload;
- (void)setIcon:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInfoText:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setRepresentedApp:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setSpecifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUiDelegate:(id)a3;
@end

@implementation STStorageTip

- (void)_reload:(id)a3
{
  p_specLock = &self->_specLock;
  os_unfair_lock_lock(&self->_specLock);
  id v14 = [(STStorageTip *)self specifier];
  v5 = [(STStorageTip *)self infoSpecifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_uiDelegate);
    [v8 tipDidUpdate:self];
  }
  uint64_t v9 = *MEMORY[0x263F602B0];
  v10 = [v14 propertyForKey:*MEMORY[0x263F602B0]];
  v11 = v10;
  if (v10) {
    [v10 refreshCellContentsWithSpecifier:v14];
  }
  v12 = [v5 propertyForKey:v9];
  v13 = v12;
  if (v12) {
    [v12 refreshCellContentsWithSpecifier:v5];
  }
  os_unfair_lock_unlock(p_specLock);
}

- (PSSpecifier)specifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 40, 1);
}

- (PSSpecifier)infoSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_specLock);
  specifier = self->_specifier;
  if (v8)
  {
    [(PSSpecifier *)specifier setProperty:v8 forKey:v6];
    [(PSSpecifier *)self->_infoSpecifier setProperty:v8 forKey:v6];
  }
  else
  {
    [(PSSpecifier *)specifier removePropertyForKey:v6];
    [(PSSpecifier *)self->_infoSpecifier removePropertyForKey:v6];
  }

  os_unfair_lock_unlock(&self->_specLock);
  [(STStorageTip *)self reload];
}

- (void)reload
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__STStorageTip_reload__block_invoke;
  block[3] = &unk_264302328;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (id)propertyForKey:(id)a3
{
  p_specLock = &self->_specLock;
  id v5 = a3;
  os_unfair_lock_lock(p_specLock);
  id v6 = [(PSSpecifier *)self->_specifier propertyForKey:v5];

  os_unfair_lock_unlock(p_specLock);

  return v6;
}

- (int64_t)size
{
  v2 = [(STStorageTip *)self propertyForKey:@"stSize"];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (STStorageTip)init
{
  v7.receiver = self;
  v7.super_class = (Class)STStorageTip;
  v2 = [(STStorageTip *)&v7 init];
  int64_t v3 = v2;
  if (v2)
  {
    v2->_specLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26C91D0A0 target:v2 set:0 get:0 detail:0 cell:-1 edit:0];
    infoSpecifier = v3->_infoSpecifier;
    v3->_infoSpecifier = (PSSpecifier *)v4;

    [(PSSpecifier *)v3->_infoSpecifier setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(STStorageTip *)self propertyForKey:@"stTitle"];
}

- (void)setInfoText:(id)a3
{
}

- (NSString)infoText
{
  return (NSString *)[(STStorageTip *)self propertyForKey:@"stInfo"];
}

- (void)setSize:(int64_t)a3
{
  id v4 = [NSNumber numberWithLongLong:a3];
  [(STStorageTip *)self setProperty:v4 forKey:@"stSize"];
}

- (void)setIcon:(id)a3
{
}

- (UIImage)icon
{
  return (UIImage *)[(STStorageTip *)self propertyForKey:@"stIcon"];
}

- (void)setRepresentedApp:(id)a3
{
}

- (NSString)representedApp
{
  return (NSString *)[(STStorageTip *)self propertyForKey:@"stRepresentedApp"];
}

uint64_t __22__STStorageTip_reload__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__reload_ object:0];
  v2 = *(void **)(a1 + 32);

  return [v2 performSelector:sel__reload_ withObject:0 afterDelay:0.03];
}

- (STStorageTipUIDelegate)uiDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);

  return (STStorageTipUIDelegate *)WeakRetained;
}

- (void)setUiDelegate:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (void)setSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_uiDelegate);

  objc_storeStrong((id *)&self->_infoSpecifier, 0);
}

@end