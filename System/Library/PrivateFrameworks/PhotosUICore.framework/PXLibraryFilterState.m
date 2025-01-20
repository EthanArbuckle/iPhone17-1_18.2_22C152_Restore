@interface PXLibraryFilterState
- (BOOL)isEqual:(id)a3;
- (BOOL)isFiltering;
- (BOOL)isLibraryFilterActive:(int64_t)a3;
- (BOOL)isSharedLibraryBadgeEnabled;
- (NSString)description;
- (NSString)localizedDescription;
- (NSString)localizedFooterDescription;
- (PXLibraryFilterState)init;
- (PXLibraryFilterState)initWithSharedLibraryStatusProvider:(id)a3;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode)viewModeObservable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)predicateForUseCase:(unint64_t)a3;
- (int64_t)observableViewMode;
- (int64_t)viewMode;
- (unsigned)sharingFilter;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)preferencesDidChange;
- (void)setSharedLibraryBadgeEnabled:(BOOL)a3;
- (void)setViewMode:(int64_t)a3;
@end

@implementation PXLibraryFilterState

- (int64_t)observableViewMode
{
  return [(PXLibraryFilterObservableViewMode *)self->_viewModeObservable viewMode];
}

- (BOOL)isLibraryFilterActive:(int64_t)a3
{
  int64_t v4 = [(PXLibraryFilterState *)self viewMode];
  uint64_t v5 = a3 == 1;
  if (a3 == 2) {
    uint64_t v5 = 2;
  }
  return v4 == v5;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (PXLibraryFilterState *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t v6 = [(PXLibraryFilterState *)self viewMode];
      uint64_t v7 = [(PXLibraryFilterState *)v5 viewMode];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (unsigned)sharingFilter
{
  unint64_t v2 = [(PXLibraryFilterState *)self viewMode];
  return PXSharingFilterFromLibraryFilterViewMode(v2);
}

- (void)setViewMode:(int64_t)a3
{
  if (self->_viewMode != a3)
  {
    self->_viewMode = a3;
    -[PXLibraryFilterObservableViewMode setViewMode:](self->_viewModeObservable, "setViewMode:");
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__PXLibraryFilterState_setViewMode___block_invoke;
    v7[3] = &unk_1E5DD0FA8;
    v7[4] = self;
    [(PXLibraryFilterState *)self performChanges:v7];
    uint64_t v5 = [(PXLibraryFilterState *)self sharedLibraryStatusProvider];
    int v6 = [v5 hasSharedLibraryOrPreview];

    PXPreferencesSetLibraryFilterViewModeWithSharedLibraryOrPreview(a3, v6);
  }
}

- (void)preferencesDidChange
{
  v3 = [(PXLibraryFilterState *)self sharedLibraryStatusProvider];
  int v4 = [v3 hasSharedLibraryOrPreview];

  if (v4)
  {
    CFIndex LibraryFilterViewModeWithSharedLibraryOrPreview = PXPreferencesGetLibraryFilterViewModeWithSharedLibraryOrPreview(1);
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SharedLibraryBadgingEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v7 = AppBooleanValue == 0;
    }
    else {
      BOOL v7 = 0;
    }
    uint64_t v8 = !v7;
    [(PXLibraryFilterState *)self setViewMode:LibraryFilterViewModeWithSharedLibraryOrPreview];
    [(PXLibraryFilterState *)self setSharedLibraryBadgeEnabled:v8];
  }
  else
  {
    [(PXLibraryFilterState *)self setViewMode:0];
  }
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)initWithSharedLibraryStatusProvider:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXLibraryFilterState;
  int v6 = [(PXLibraryFilterState *)&v15 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharedLibraryStatusProvider, a3);
    int v8 = [v5 hasSharedLibraryOrPreview];
    [(PXSharedLibraryStatusProvider *)v7->_sharedLibraryStatusProvider registerChangeObserver:v7 context:PXSharedLibraryStatusProviderObservationContext_37820];
    v7->_viewMode = PXPreferencesGetLibraryFilterViewModeWithSharedLibraryOrPreview(v8);
    v9 = [[_TtC12PhotosUICore33PXLibraryFilterObservableViewMode alloc] initWithViewMode:v7->_viewMode];
    viewModeObservable = v7->_viewModeObservable;
    v7->_viewModeObservable = v9;

    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SharedLibraryBadgingEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v12 = AppBooleanValue == 0;
    }
    else {
      BOOL v12 = 0;
    }
    char v13 = !v12;
    v7->_sharedLibraryBadgeEnabled = v13;
    if (v5) {
      PXRegisterPreferencesObserver(v7);
    }
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(PXLibraryFilterState *)self sharedLibraryStatusProvider];

  if (v3) {
    PXUnregisterPreferencesObserver(self);
  }
  v4.receiver = self;
  v4.super_class = (Class)PXLibraryFilterState;
  [(PXLibraryFilterState *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_viewModeObservable, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [PXLibraryFilterState alloc];
  id v5 = [(PXLibraryFilterState *)self sharedLibraryStatusProvider];
  uint64_t v6 = [(PXLibraryFilterState *)v4 initWithSharedLibraryStatusProvider:v5];

  *(void *)(v6 + 104) = [(PXLibraryFilterState *)self viewMode];
  *(unsigned char *)(v6 + 96) = [(PXLibraryFilterState *)self isSharedLibraryBadgeEnabled];
  return (id)v6;
}

- (BOOL)isSharedLibraryBadgeEnabled
{
  return self->_sharedLibraryBadgeEnabled;
}

- (BOOL)isFiltering
{
  return ![(PXLibraryFilterState *)self isLibraryFilterActive:0];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 3) != 0 && (void *)PXSharedLibraryStatusProviderObservationContext_37820 == a5)
  {
    uint64_t v6 = [(PXLibraryFilterState *)self sharedLibraryStatusProvider];
    char v7 = [v6 hasSharedLibraryOrPreview];

    if ((v7 & 1) == 0)
    {
      [(PXLibraryFilterState *)self setViewMode:0];
    }
  }
}

- (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode)viewModeObservable
{
  return self->_viewModeObservable;
}

- (NSString)localizedFooterDescription
{
  int64_t v3 = [(PXLibraryFilterState *)self viewMode];
  switch(v3)
  {
    case 2:
      id v5 = [(PXLibraryFilterState *)self sharedLibraryStatusProvider];
      if ([v5 hasPreview]) {
        uint64_t v6 = @"PXSharedLibrary_FilterFooter_Preview";
      }
      else {
        uint64_t v6 = @"PXSharedLibrary_FilterFooter_Shared";
      }
      PXLocalizedSharedLibraryString(v6);
      char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    case 1:
      objc_super v4 = @"PXSharedLibrary_FilterFooter_Personal";
      goto LABEL_10;
    case 0:
      objc_super v4 = @"PXSharedLibrary_FilterFooter_All";
LABEL_10:
      PXLocalizedSharedLibraryString(v4);
      char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
  }
  char v7 = &stru_1F00B0030;
LABEL_12:
  return (NSString *)v7;
}

- (NSString)localizedDescription
{
  int64_t v3 = [(PXLibraryFilterState *)self viewMode];
  switch(v3)
  {
    case 2:
      id v5 = [(PXLibraryFilterState *)self sharedLibraryStatusProvider];
      [v5 hasPreview];
      PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterMenu_Shared");
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 1:
      objc_super v4 = @"PXSharedLibrary_FilterMenu_Personal";
      goto LABEL_7;
    case 0:
      objc_super v4 = @"PXSharedLibrary_FilterMenu_All";
LABEL_7:
      PXLocalizedSharedLibraryString(v4);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
  }
  uint64_t v6 = &stru_1F00B0030;
LABEL_9:
  return (NSString *)v6;
}

- (id)predicateForUseCase:(unint64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"PXLibraryFilterState.m", 171, @"Use of this method is deprecated: %@", v6 object file lineNumber description];

  return 0;
}

- (void)setSharedLibraryBadgeEnabled:(BOOL)a3
{
  if (self->_sharedLibraryBadgeEnabled != a3)
  {
    BOOL v3 = a3;
    self->_sharedLibraryBadgeEnabled = a3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__PXLibraryFilterState_setSharedLibraryBadgeEnabled___block_invoke;
    v4[3] = &unk_1E5DD0FA8;
    v4[4] = self;
    [(PXLibraryFilterState *)self performChanges:v4];
    PXPreferencesSetBool(@"SharedLibraryBadgingEnabled", v3);
  }
}

uint64_t __53__PXLibraryFilterState_setSharedLibraryBadgeEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:2];
}

uint64_t __36__PXLibraryFilterState_setViewMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:1];
}

- (NSString)description
{
  unint64_t v2 = [(PXLibraryFilterState *)self viewMode];
  if (v2 > 2)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = objc_msgSend(NSString, "stringWithFormat:", off_1E5DB2AF8[v2], objc_opt_class());
  }
  return (NSString *)v3;
}

- (PXLibraryFilterState)init
{
  return [(PXLibraryFilterState *)self initWithSharedLibraryStatusProvider:0];
}

@end