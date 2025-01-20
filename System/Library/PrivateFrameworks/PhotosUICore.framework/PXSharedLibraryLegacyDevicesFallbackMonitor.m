@interface PXSharedLibraryLegacyDevicesFallbackMonitor
+ (id)legacyDevicesFallbackMonitorIfEnabledWithSharedLibraryOrPreviewPresent:(BOOL)a3;
- (NSArray)devices;
- (PXSharedLibraryLegacyDevicesFallbackMonitor)init;
- (id)_init;
- (int64_t)state;
- (void)_updateLegacyDevices:(id)a3 error:(id)a4;
- (void)setDevices:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation PXSharedLibraryLegacyDevicesFallbackMonitor

- (void).cxx_destruct
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (int64_t)state
{
  return self->_state;
}

- (void)_updateLegacyDevices:(id)a3 error:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  uint64_t v7 = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PXSharedLibraryLegacyDevicesFallbackMonitor__updateLegacyDevices_error___block_invoke;
  v9[3] = &unk_1E5DD0510;
  if (v6) {
    uint64_t v7 = 2;
  }
  id v10 = v5;
  uint64_t v11 = v7;
  v9[4] = self;
  id v8 = v5;
  [(PXSharedLibraryLegacyDevicesFallbackMonitor *)self performChanges:v9];
}

uint64_t __74__PXSharedLibraryLegacyDevicesFallbackMonitor__updateLegacyDevices_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setDevices:v3];
}

- (void)setDevices:(id)a3
{
  v9 = (NSArray *)a3;
  v4 = self->_devices;
  devices = v9;
  if (v4 != v9)
  {
    uint64_t v6 = v4;
    char v7 = [(NSArray *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    id v8 = (NSArray *)[(NSArray *)v9 copy];
    devices = self->_devices;
    self->_devices = v8;
  }

LABEL_5:
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(PXSharedLibraryLegacyDevicesFallbackMonitor *)self signalChange:1];
  }
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryLegacyDevicesFallbackMonitor;
  v2 = [(PXSharedLibraryLegacyDevicesFallbackMonitor *)&v7 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__PXSharedLibraryLegacyDevicesFallbackMonitor__init__block_invoke;
    v4[3] = &unk_1E5DC1F90;
    objc_copyWeak(&v5, &location);
    PXSharedLibraryFetchLegacyDevices(v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __52__PXSharedLibraryLegacyDevicesFallbackMonitor__init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _updateLegacyDevices:v6 error:v5];
}

- (PXSharedLibraryLegacyDevicesFallbackMonitor)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryLegacyDevicesFallbackMonitor.m", 28, @"%s is not available as initializer", "-[PXSharedLibraryLegacyDevicesFallbackMonitor init]");

  abort();
}

+ (id)legacyDevicesFallbackMonitorIfEnabledWithSharedLibraryOrPreviewPresent:(BOOL)a3
{
  int v4 = _os_feature_enabled_impl();
  id v5 = 0;
  if (v4 && !a3) {
    id v5 = [[PXSharedLibraryLegacyDevicesFallbackMonitor alloc] _init];
  }
  return v5;
}

@end