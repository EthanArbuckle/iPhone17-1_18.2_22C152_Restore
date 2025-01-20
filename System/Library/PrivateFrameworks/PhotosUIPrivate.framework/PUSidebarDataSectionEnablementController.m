@interface PUSidebarDataSectionEnablementController
- (BOOL)excludesHiddenAlbum;
- (BOOL)isPhotosPicker;
- (BOOL)registeredAsPrefObserver;
- (NSMapTable)sectionManagerByItemTypeForAccountStoreChange;
- (NSMapTable)sectionManagersByItemTypeForDefaultsChange;
- (PHPhotoLibrary)photoLibrary;
- (PUSidebarDataSectionEnablementController)initWithPhotoLibrary:(id)a3 isPhotosPicker:(BOOL)a4 excludesHiddenAlbum:(BOOL)a5;
- (void)_accountStoreDidChange:(id)a3;
- (void)_configureEnablementOfSectionManager:(id)a3 enablementItem:(int64_t)a4 setupObservation:(BOOL)a5;
- (void)_observeAccountsStoreForManager:(id)a3 enablementItem:(int64_t)a4;
- (void)_observeDefaultsForManager:(id)a3 enablementItem:(int64_t)a4;
- (void)configureEnablementOfSectionManager:(id)a3 enablementItem:(int64_t)a4;
- (void)dealloc;
- (void)preferencesDidChange;
- (void)setRegisteredAsPrefObserver:(BOOL)a3;
@end

@implementation PUSidebarDataSectionEnablementController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_sectionManagersByItemTypeForDefaultsChange, 0);
  objc_storeStrong((id *)&self->_sectionManagerByItemTypeForAccountStoreChange, 0);
}

- (void)setRegisteredAsPrefObserver:(BOOL)a3
{
  self->_registeredAsPrefObserver = a3;
}

- (BOOL)registeredAsPrefObserver
{
  return self->_registeredAsPrefObserver;
}

- (BOOL)excludesHiddenAlbum
{
  return self->_excludesHiddenAlbum;
}

- (BOOL)isPhotosPicker
{
  return self->_isPhotosPicker;
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (NSMapTable)sectionManagersByItemTypeForDefaultsChange
{
  return self->_sectionManagersByItemTypeForDefaultsChange;
}

- (NSMapTable)sectionManagerByItemTypeForAccountStoreChange
{
  return self->_sectionManagerByItemTypeForAccountStoreChange;
}

- (void)preferencesDidChange
{
  v3 = [(PUSidebarDataSectionEnablementController *)self sectionManagersByItemTypeForDefaultsChange];
  v4 = [v3 dictionaryRepresentation];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PUSidebarDataSectionEnablementController_preferencesDidChange__block_invoke;
  v5[3] = &unk_1E5F25108;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __64__PUSidebarDataSectionEnablementController_preferencesDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "_configureEnablementOfSectionManager:enablementItem:setupObservation:", v5, objc_msgSend(a2, "integerValue"), 0);
}

- (void)_accountStoreDidChange:(id)a3
{
  v4 = [(PUSidebarDataSectionEnablementController *)self sectionManagerByItemTypeForAccountStoreChange];
  id v5 = [v4 dictionaryRepresentation];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PUSidebarDataSectionEnablementController__accountStoreDidChange___block_invoke;
  v6[3] = &unk_1E5F25108;
  v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

void __67__PUSidebarDataSectionEnablementController__accountStoreDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "_configureEnablementOfSectionManager:enablementItem:setupObservation:", v5, objc_msgSend(a2, "integerValue"), 0);
}

- (void)_observeDefaultsForManager:(id)a3 enablementItem:(int64_t)a4
{
  id v6 = a3;
  v7 = [(PUSidebarDataSectionEnablementController *)self sectionManagersByItemTypeForDefaultsChange];
  v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v6 forKey:v8];

  if (![(PUSidebarDataSectionEnablementController *)self registeredAsPrefObserver])
  {
    [(PUSidebarDataSectionEnablementController *)self setRegisteredAsPrefObserver:1];
    PXRegisterPreferencesObserver();
  }
}

- (void)_observeAccountsStoreForManager:(id)a3 enablementItem:(int64_t)a4
{
  id v6 = a3;
  id v11 = [(PUSidebarDataSectionEnablementController *)self sectionManagerByItemTypeForAccountStoreChange];
  if (![v11 count])
  {
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v8 = *MEMORY[0x1E4F8ACE8];
    v9 = objc_msgSend(MEMORY[0x1E4F8A668], "pl_sharedAccountStore");
    [v7 addObserver:self selector:sel__accountStoreDidChange_ name:v8 object:v9];
  }
  v10 = [NSNumber numberWithInteger:a4];
  [v11 setObject:v6 forKey:v10];
}

- (void)_configureEnablementOfSectionManager:(id)a3 enablementItem:(int64_t)a4 setupObservation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v19 = v8;
  switch(a4)
  {
    case 0:
    case 3:
    case 13:
    case 21:
      uint64_t v9 = [(PUSidebarDataSectionEnablementController *)self isPhotosPicker] ^ 1;
      goto LABEL_11;
    case 1:
      if ([(PUSidebarDataSectionEnablementController *)self isPhotosPicker])
      {
        id v8 = v19;
LABEL_14:
        uint64_t v9 = 1;
LABEL_27:
        uint64_t v14 = [v8 setEnabled:v9];
      }
      else
      {
        uint64_t v14 = [v19 setEnabled:MEMORY[0x1B3E7B4F0]()];
        v15 = v19;
        if (v5)
        {
          v16 = self;
          int64_t v17 = 1;
LABEL_33:
          uint64_t v14 = [(PUSidebarDataSectionEnablementController *)v16 _observeDefaultsForManager:v15 enablementItem:v17];
        }
      }
LABEL_28:
      MEMORY[0x1F4181820](v14);
      return;
    case 2:
      if ([(PUSidebarDataSectionEnablementController *)self excludesHiddenAlbum]) {
        goto LABEL_25;
      }
      uint64_t v14 = [v19 setEnabled:PXPreferencesIsHiddenAlbumVisible()];
      v15 = v19;
      if (!v5) {
        goto LABEL_28;
      }
      v16 = self;
      int64_t v17 = 2;
      goto LABEL_33;
    case 5:
    case 6:
      v10 = [(PUSidebarDataSectionEnablementController *)self photoLibrary];
      id v11 = [v10 photoLibraryURL];

      BOOL v12 = [(PUSidebarDataSectionEnablementController *)self isPhotosPicker];
      if (a4 == 5 && v12) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = [MEMORY[0x1E4F8AAB0] sharedStreamsEnabledForPhotoLibraryURL:v11];
      }
      [v19 setEnabled:v13];
      if (v5) {
        [(PUSidebarDataSectionEnablementController *)self _observeAccountsStoreForManager:v19 enablementItem:a4];
      }

      goto LABEL_28;
    case 9:
    case 10:
    case 19:
      goto LABEL_14;
    case 11:
    case 12:
      if ([(PUSidebarDataSectionEnablementController *)self isPhotosPicker]) {
        goto LABEL_25;
      }
      uint64_t v14 = [v19 setEnabled:MEMORY[0x1B3E7B4F0]()];
      v15 = v19;
      if (!v5) {
        goto LABEL_28;
      }
      v16 = self;
      int64_t v17 = a4;
      goto LABEL_33;
    case 14:
    case 20:
      uint64_t v18 = [(PUSidebarDataSectionEnablementController *)self isPhotosPicker];
      goto LABEL_10;
    case 15:
    case 17:
      goto LABEL_26;
    case 16:
      if ([(PUSidebarDataSectionEnablementController *)self isPhotosPicker])
      {
LABEL_25:
        id v8 = v19;
LABEL_26:
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v18 = MEMORY[0x1B3E7B510]();
LABEL_10:
        uint64_t v9 = v18;
LABEL_11:
        id v8 = v19;
      }
      goto LABEL_27;
    default:
      uint64_t v14 = [(PUSidebarDataSectionEnablementController *)self isPhotosPicker];
      if (!v14) {
        goto LABEL_28;
      }
      id v8 = v19;
      goto LABEL_26;
  }
}

- (void)configureEnablementOfSectionManager:(id)a3 enablementItem:(int64_t)a4
{
}

- (void)dealloc
{
  if ([(PUSidebarDataSectionEnablementController *)self registeredAsPrefObserver]) {
    PXUnregisterPreferencesObserver();
  }
  v3.receiver = self;
  v3.super_class = (Class)PUSidebarDataSectionEnablementController;
  [(PUSidebarDataSectionEnablementController *)&v3 dealloc];
}

- (PUSidebarDataSectionEnablementController)initWithPhotoLibrary:(id)a3 isPhotosPicker:(BOOL)a4 excludesHiddenAlbum:(BOOL)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PUSidebarDataSectionEnablementController;
  uint64_t v9 = [(PUSidebarDataSectionEnablementController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_photoLibrary, v8);
    v10->_isPhotosPicker = a4;
    v10->_excludesHiddenAlbum = a5;
    uint64_t v11 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    sectionManagerByItemTypeForAccountStoreChange = v10->_sectionManagerByItemTypeForAccountStoreChange;
    v10->_sectionManagerByItemTypeForAccountStoreChange = (NSMapTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    sectionManagersByItemTypeForDefaultsChange = v10->_sectionManagersByItemTypeForDefaultsChange;
    v10->_sectionManagersByItemTypeForDefaultsChange = (NSMapTable *)v13;
  }
  return v10;
}

@end