@interface PBFPosterGalleryDataProvider
+ (id)demoPreviewProvider;
- (BOOL)sectionShowsDescriptionLabel:(id)a3;
- (BOOL)sectionShowsTitleLabel:(id)a3;
- (NSMutableDictionary)posterPreviewForPosterUniqueIdentifier;
- (NSMutableDictionary)sectionIdentifierToItems;
- (NSMutableDictionary)sectionIdentifierToLocalizedSubtitle;
- (NSMutableDictionary)sectionIdentifierToLocalizedTitle;
- (NSMutableDictionary)sectionIdentifierToSectionType;
- (NSMutableOrderedSet)orderedSectionIdentifiers;
- (NSOrderedSet)sectionIdentifiers;
- (PBFComplicationSnapshotProviding)complicationSnapshotProvider;
- (PBFPosterGalleryDataProvider)init;
- (PBFPosterSnapshotProviding)snapshotProvider;
- (PFPosterExtensionProvider)extensionProvider;
- (id)acquireExtensionInstance:(id)a3 reason:(id)a4 error:(id *)a5;
- (id)buildSnapshot;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fetchSnapshotForPosterPreview:(id)a3 context:(id)a4 completion:(id)a5;
- (id)fetchSnapshotForPosterPreview:(id)a3 context:(id)a4 definition:(id)a5 completion:(id)a6;
- (id)itemsForSectionWithIdentifier:(id)a3;
- (id)localizedSubtitleForSectionWithIdentifier:(id)a3;
- (id)localizedTitleForSectionWithIdentifier:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)posterPreviews;
- (id)posterPreviewsForPath:(id)a3;
- (id)preparedComplicationPreviewImagesForPreview:(id)a3;
- (id)preparedSnapshotForPosterPreview:(id)a3 context:(id)a4;
- (id)preparedSnapshotForPosterPreview:(id)a3 context:(id)a4 definition:(id)a5;
- (id)previewForPreviewUniqueIdentifier:(id)a3;
- (id)sectionIdentifierForIndex:(int64_t)a3;
- (int64_t)sectionTypeForSectionWithIdentifier:(id)a3;
- (unint64_t)numberOfItemsInSectionWithIdentifier:(id)a3;
- (unint64_t)numberOfSections;
- (unint64_t)sectionIndexForIdentifier:(id)a3;
- (void)_decrementTransactionCount:(BOOL)a3;
- (void)_incrementTransactionCount:(BOOL)a3;
- (void)_markChangeDidOccur;
- (void)_notifyObserversDidUpdate;
- (void)_notifyObserversWillUpdate;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)fetchComplicationPreviewImagesForPreview:(id)a3 complicationSnapshotReceivedHandler:(id)a4 errorHandler:(id)a5 completion:(id)a6;
- (void)invalidate;
- (void)relinquishExtensionInstance:(id)a3 reason:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setComplicationSnapshotProvider:(id)a3;
- (void)setExtensionProvider:(id)a3;
- (void)setOrderedSectionIdentifiers:(id)a3;
- (void)setPosterPreviewForPosterUniqueIdentifier:(id)a3;
- (void)setSectionIdentifierToItems:(id)a3;
- (void)setSectionIdentifierToLocalizedSubtitle:(id)a3;
- (void)setSectionIdentifierToLocalizedTitle:(id)a3;
- (void)setSectionIdentifierToSectionType:(id)a3;
- (void)setSnapshotProvider:(id)a3;
@end

@implementation PBFPosterGalleryDataProvider

+ (id)demoPreviewProvider
{
  if (demoPreviewProvider_onceToken != -1) {
    dispatch_once(&demoPreviewProvider_onceToken, &__block_literal_global_39);
  }
  v2 = (void *)demoPreviewProvider_demoPreviewProvider;
  return v2;
}

void __51__PBFPosterGalleryDataProvider_demoPreviewProvider__block_invoke()
{
  v55[6] = *MEMORY[0x1E4F143B8];
  v0 = objc_opt_new();
  v1 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:@"Smart Album" description:&stru_1F2A71F00];
  v55[0] = v1;
  v2 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:@"Emoji" description:&stru_1F2A71F00];
  v55[1] = v2;
  v3 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:@"Weather" description:&stru_1F2A71F00];
  v55[2] = v3;
  v4 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:@"Collections" description:&stru_1F2A71F00];
  v55[3] = v4;
  v5 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:@"Pride" description:&stru_1F2A71F00];
  v55[4] = v5;
  v6 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:@"Astronomy" description:&stru_1F2A71F00];
  v55[5] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:6];
  [v0 addSectionWithIdentifier:@"Featured Posters" localizedTitle:@"Featured Posters" type:1 items:v7];

  v8 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v54[0] = v8;
  v9 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v54[1] = v9;
  v10 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v54[2] = v10;
  v11 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v54[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:4];
  v13 = v0;
  [v0 addSectionWithIdentifier:@"Featured Photos" localizedTitle:@"Featured Photos" type:0 items:v12];

  v14 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v53[0] = v14;
  v15 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v53[1] = v15;
  v16 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v53[2] = v16;
  v17 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v53[3] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
  [v0 addSectionWithIdentifier:@"Weather & Astronomy" localizedTitle:@"Weather & Astronomy" type:0 items:v18];

  v19 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v52[0] = v19;
  v20 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v52[1] = v20;
  v21 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v52[2] = v21;
  v22 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v52[3] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];
  [v0 addSectionWithIdentifier:@"Emoji" localizedTitle:@"Emoji" type:0 items:v23];

  v24 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v51[0] = v24;
  v25 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v51[1] = v25;
  v26 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v51[2] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
  [v13 addSectionWithIdentifier:@"Pride" localizedTitle:@"Pride" type:0 items:v27];

  v28 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:@"This face is inspired by the colors of the Pan-African Flag. The shapes change as you move, creating a face that's unique to you."];
  v50 = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  [v13 addSectionWithIdentifier:@"Unity" localizedTitle:@"Unity" type:2 items:v29];

  v30 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v49[0] = v30;
  v31 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v49[1] = v31;
  v32 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v49[2] = v32;
  v33 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v49[3] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  [v13 addSectionWithIdentifier:@"Collections" localizedTitle:@"Collections" type:0 items:v34];

  v35 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v48[0] = v35;
  v36 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v48[1] = v36;
  v37 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v48[2] = v37;
  v38 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v48[3] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
  [v13 addSectionWithIdentifier:@"Color" localizedTitle:@"Color" type:0 items:v39];

  v40 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v41 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1F2A71F00, &stru_1F2A71F00, v40);
  v47[1] = v41;
  v42 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v47[2] = v42;
  v43 = +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:&stru_1F2A71F00 description:&stru_1F2A71F00];
  v47[3] = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
  [v13 addSectionWithIdentifier:@"Recents" localizedTitle:@"Recents" type:0 items:v44];

  uint64_t v45 = [v13 copy];
  v46 = (void *)demoPreviewProvider_demoPreviewProvider;
  demoPreviewProvider_demoPreviewProvider = v45;
}

- (PBFPosterGalleryDataProvider)init
{
  v18.receiver = self;
  v18.super_class = (Class)PBFPosterGalleryDataProvider;
  v2 = [(PBFPosterGalleryDataProvider *)&v18 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    orderedSectionIdentifiers = v2->_orderedSectionIdentifiers;
    v2->_orderedSectionIdentifiers = (NSMutableOrderedSet *)v3;

    uint64_t v5 = objc_opt_new();
    sectionIdentifierToSectionType = v2->_sectionIdentifierToSectionType;
    v2->_sectionIdentifierToSectionType = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    sectionIdentifierToItems = v2->_sectionIdentifierToItems;
    v2->_sectionIdentifierToItems = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    posterPreviewForPosterUniqueIdentifier = v2->_posterPreviewForPosterUniqueIdentifier;
    v2->_posterPreviewForPosterUniqueIdentifier = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    sectionIdentifierToLocalizedTitle = v2->_sectionIdentifierToLocalizedTitle;
    v2->_sectionIdentifierToLocalizedTitle = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    sectionIdentifierToLocalizedSubtitle = v2->_sectionIdentifierToLocalizedSubtitle;
    v2->_sectionIdentifierToLocalizedSubtitle = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    outstandingSnapshotRequests = v2->_outstandingSnapshotRequests;
    v2->_outstandingSnapshotRequests = (NSMutableSet *)v15;
  }
  return v2;
}

- (void)dealloc
{
  [(PBFPosterGalleryDataProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterGalleryDataProvider;
  [(PBFPosterGalleryDataProvider *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PBFPosterGalleryDataProvider allocWithZone:a3] init];
  uint64_t v5 = (void *)[(NSMutableOrderedSet *)self->_orderedSectionIdentifiers mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setOrderedSectionIdentifiers:v5];

  v6 = (void *)[(NSMutableDictionary *)self->_sectionIdentifierToItems mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setSectionIdentifierToItems:v6];

  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_sectionIdentifierToSectionType mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setSectionIdentifierToSectionType:v7];

  v8 = (void *)[(NSMutableDictionary *)self->_sectionIdentifierToLocalizedTitle mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setSectionIdentifierToLocalizedTitle:v8];

  uint64_t v9 = (void *)[(NSMutableDictionary *)self->_sectionIdentifierToLocalizedSubtitle mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setSectionIdentifierToLocalizedSubtitle:v9];

  v10 = (void *)[(NSMutableDictionary *)self->_posterPreviewForPosterUniqueIdentifier mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setPosterPreviewForPosterUniqueIdentifier:v10];

  [(PBFPosterGalleryDataProvider *)v4 setComplicationSnapshotProvider:self->_complicationSnapshotProvider];
  [(PBFPosterGalleryDataProvider *)v4 setSnapshotProvider:self->_snapshotProvider];
  [(PBFPosterGalleryDataProvider *)v4 setExtensionProvider:self->_extensionProvider];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(PBFPosterGalleryDataProvider *)+[PBFGalleryMutableDataProvider allocWithZone:a3] init];
  uint64_t v5 = (void *)[(NSMutableOrderedSet *)self->_orderedSectionIdentifiers mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setOrderedSectionIdentifiers:v5];

  v6 = (void *)[(NSMutableDictionary *)self->_sectionIdentifierToItems mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setSectionIdentifierToItems:v6];

  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_sectionIdentifierToSectionType mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setSectionIdentifierToSectionType:v7];

  v8 = (void *)[(NSMutableDictionary *)self->_sectionIdentifierToLocalizedTitle mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setSectionIdentifierToLocalizedTitle:v8];

  uint64_t v9 = (void *)[(NSMutableDictionary *)self->_sectionIdentifierToLocalizedSubtitle mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setSectionIdentifierToLocalizedSubtitle:v9];

  v10 = (void *)[(NSMutableDictionary *)self->_posterPreviewForPosterUniqueIdentifier mutableCopy];
  [(PBFPosterGalleryDataProvider *)v4 setPosterPreviewForPosterUniqueIdentifier:v10];

  [(PBFPosterGalleryDataProvider *)v4 setComplicationSnapshotProvider:self->_complicationSnapshotProvider];
  [(PBFPosterGalleryDataProvider *)v4 setSnapshotProvider:self->_snapshotProvider];
  [(PBFPosterGalleryDataProvider *)v4 setExtensionProvider:self->_extensionProvider];
  return v4;
}

- (unint64_t)numberOfSections
{
  return [(NSMutableOrderedSet *)self->_orderedSectionIdentifiers count];
}

- (unint64_t)sectionIndexForIdentifier:(id)a3
{
  return [(NSMutableOrderedSet *)self->_orderedSectionIdentifiers indexOfObject:a3];
}

- (NSOrderedSet)sectionIdentifiers
{
  v2 = (void *)[(NSMutableOrderedSet *)self->_orderedSectionIdentifiers copy];
  return (NSOrderedSet *)v2;
}

- (id)sectionIdentifierForIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    v6 = 0;
  }
  else
  {
    if ([(NSMutableOrderedSet *)self->_orderedSectionIdentifiers count] <= (unint64_t)a3)
    {
      v6 = 0;
    }
    else
    {
      v6 = [(NSMutableOrderedSet *)self->_orderedSectionIdentifiers objectAtIndex:a3];
    }
  }
  return v6;
}

- (id)itemsForSectionWithIdentifier:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sectionIdentifierToItems objectForKey:a3];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)localizedTitleForSectionWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sectionIdentifierToLocalizedTitle objectForKey:a3];
}

- (id)localizedSubtitleForSectionWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sectionIdentifierToLocalizedSubtitle objectForKey:a3];
}

- (unint64_t)numberOfItemsInSectionWithIdentifier:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sectionIdentifierToItems objectForKey:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)previewForPreviewUniqueIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_posterPreviewForPosterUniqueIdentifier objectForKey:a3];
}

- (id)posterPreviewsForPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  posterPreviewForPosterUniqueIdentifier = self->_posterPreviewForPosterUniqueIdentifier;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __54__PBFPosterGalleryDataProvider_posterPreviewsForPath___block_invoke;
  v14 = &unk_1E6984370;
  id v15 = v4;
  id v16 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSMutableDictionary *)posterPreviewForPosterUniqueIdentifier enumerateKeysAndObjectsUsingBlock:&v11];
  uint64_t v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

void __54__PBFPosterGalleryDataProvider_posterPreviewsForPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v4 = [v9 posterDescriptorLookupInfo];
  uint64_t v5 = [v4 posterDescriptorPath];
  v6 = [v5 identity];
  id v7 = [*(id *)(a1 + 32) identity];
  int v8 = [v6 isEqual:v7];

  if (v8) {
    [*(id *)(a1 + 40) addObject:v9];
  }
}

- (id)posterPreviews
{
  uint64_t v3 = objc_opt_new();
  posterPreviewForPosterUniqueIdentifier = self->_posterPreviewForPosterUniqueIdentifier;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PBFPosterGalleryDataProvider_posterPreviews__block_invoke;
  v8[3] = &unk_1E6984398;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)posterPreviewForPosterUniqueIdentifier enumerateKeysAndObjectsUsingBlock:v8];
  v6 = (void *)[v5 copy];

  return v6;
}

uint64_t __46__PBFPosterGalleryDataProvider_posterPreviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (BOOL)sectionShowsTitleLabel:(id)a3
{
  return [(PBFPosterGalleryDataProvider *)self sectionTypeForSectionWithIdentifier:a3] == 1;
}

- (BOOL)sectionShowsDescriptionLabel:(id)a3
{
  return [(PBFPosterGalleryDataProvider *)self sectionTypeForSectionWithIdentifier:a3] == 2;
}

- (int64_t)sectionTypeForSectionWithIdentifier:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sectionIdentifierToSectionType objectForKey:a3];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)buildSnapshot
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  int64_t v4 = [(NSMutableOrderedSet *)self->_orderedSectionIdentifiers array];
  [v3 appendSectionsWithIdentifiers:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_orderedSectionIdentifiers;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = -[NSMutableDictionary objectForKey:](self->_sectionIdentifierToItems, "objectForKey:", v10, (void)v14);
        uint64_t v12 = [v11 valueForKey:@"previewUniqueIdentifier"];

        [v3 appendItemsWithIdentifiers:v12 intoSectionWithIdentifier:v10];
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversWillUpdate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 dataProviderWillUpdate:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversDidUpdate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_transactionsCount <= 0)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            [v8 dataProviderDidUpdate:self];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)_incrementTransactionCount:(BOOL)a3
{
  int64_t transactionsCount = self->_transactionsCount;
  self->_int64_t transactionsCount = transactionsCount + 1;
  if (transactionsCount) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = !a3;
  }
  if (!v4) {
    [(PBFPosterGalleryDataProvider *)self _notifyObserversWillUpdate];
  }
}

- (void)_decrementTransactionCount:(BOOL)a3
{
  BOOL v3 = a3;
  p_int64_t transactionsCount = &self->_transactionsCount;
  int64_t transactionsCount = self->_transactionsCount;
  int64_t v7 = transactionsCount - 1;
  self->_int64_t transactionsCount = transactionsCount - 1;
  if (transactionsCount <= 0)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PBFPosterGalleryDataProvider.m" lineNumber:330 description:@"Transactions unbalanced!"];

    int64_t v7 = self->_transactionsCount;
  }
  if (v7 <= 0)
  {
    *p_int64_t transactionsCount = 0;
    p_transactionsCount[1] = 0;
    if (v3)
    {
      [(PBFPosterGalleryDataProvider *)self _notifyObserversDidUpdate];
    }
  }
}

- (void)_markChangeDidOccur
{
}

- (id)preparedSnapshotForPosterPreview:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v7];
  long long v9 = [(PBFPosterGalleryDataProvider *)self preparedSnapshotForPosterPreview:v7 context:v6 definition:v8];

  return v9;
}

- (id)fetchSnapshotForPosterPreview:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:v10];
  long long v12 = [(PBFPosterGalleryDataProvider *)self fetchSnapshotForPosterPreview:v10 context:v9 definition:v11 completion:v8];

  return v12;
}

- (id)preparedSnapshotForPosterPreview:(id)a3 context:(id)a4 definition:(id)a5
{
  id v8 = a5;
  id v9 = +[PBFPosterSnapshotRequest snapshotRequestForPreview:a3 context:a4 definition:v8];
  id v10 = [(PBFPosterGalleryDataProvider *)self snapshotProvider];
  long long v11 = [v10 posterSnapshotForRequest:v9 definition:v8 error:0];

  return v11;
}

- (id)fetchSnapshotForPosterPreview:(id)a3 context:(id)a4 definition:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30 = v11;
  uint64_t v14 = +[PBFPosterSnapshotRequest snapshotRequestForPreview:v10 context:v11 definition:v12];
  long long v15 = self->_outstandingSnapshotRequests;
  long long v16 = self->_outstandingSnapshotRequests;
  objc_sync_enter(v16);
  [(NSMutableSet *)v15 addObject:v14];
  objc_sync_exit(v16);

  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
  objc_super v18 = [(PBFPosterGalleryDataProvider *)self snapshotProvider];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __92__PBFPosterGalleryDataProvider_fetchSnapshotForPosterPreview_context_definition_completion___block_invoke;
  v35[3] = &unk_1E69843C0;
  v36 = v15;
  id v19 = v17;
  id v37 = v19;
  id v20 = v14;
  id v38 = v20;
  id v39 = v13;
  id v21 = v13;
  v22 = v15;
  [v18 fetchPosterSnapshotForRequest:v20 definition:v12 completion:v35];
  v23 = [_PBFSafeAssertion alloc];
  v24 = [v10 previewUniqueIdentifier];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __92__PBFPosterGalleryDataProvider_fetchSnapshotForPosterPreview_context_definition_completion___block_invoke_2;
  v31[3] = &unk_1E69843E8;
  id v32 = v19;
  id v33 = v18;
  id v34 = v20;
  id v25 = v20;
  id v26 = v18;
  id v27 = v19;
  v28 = [(BSSimpleAssertion *)v23 initWithIdentifier:v24 forReason:@"fetchSnapshotForPosterPreview:context:completion: invalidatableAssertion" invalidationBlock:v31];

  return v28;
}

void __92__PBFPosterGalleryDataProvider_fetchSnapshotForPosterPreview_context_definition_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  [*(id *)(a1 + 40) setFlag:1];
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 48)];
  objc_sync_exit(v6);

  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

void __92__PBFPosterGalleryDataProvider_fetchSnapshotForPosterPreview_context_definition_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (([*(id *)(a1 + 32) getFlag] & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 40);
    BOOL v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 48)];
    id v5 = [v6 reason];
    [v3 cancelRequests:v4 reason:v5];
  }
}

- (void)fetchComplicationPreviewImagesForPreview:(id)a3 complicationSnapshotReceivedHandler:(id)a4 errorHandler:(id)a5 completion:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = (void (**)(id, void, id))a4;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  id v13 = +[PBFComplicationSnapshotRequest requestsForPreview:a3];
  if ([v13 count])
  {
    id v27 = v11;
    id v26 = v13;
    uint64_t v14 = (void *)[v13 mutableCopy];
    id v25 = self;
    long long v15 = [(PBFPosterGalleryDataProvider *)self complicationSnapshotProvider];
    long long v16 = [v15 preparedComplicationSnapshotsForRequests:v14];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v17 = [v16 keyEnumerator];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          [v14 removeObject:v22];
          if (v10)
          {
            a5 = [v16 objectForKey:v22];
            v10[2](v10, v22, a5);
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }

    if ([v14 count])
    {
      v23 = [(PBFPosterGalleryDataProvider *)v25 complicationSnapshotProvider];
      id v11 = v27;
      if (v10)
      {
        v24 = v30;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke;
        v30[3] = &unk_1E6984410;
        a5 = &v31;
        v31 = v10;
      }
      else
      {
        v24 = 0;
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke_2;
      v28[3] = &unk_1E6984438;
      id v29 = v27;
      [v23 fetchComplicationSnapshotsForRequests:v14 complicationSnapshotReceivedHandler:v24 errorHandler:v28 completionHandler:v12];

      id v13 = v26;
      if (v10) {

      }
      goto LABEL_21;
    }

    id v11 = v27;
    id v13 = v26;
  }
  if (v12) {
    v12[2](v12, 0);
  }
LABEL_21:
}

uint64_t __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = PBFLogGallery();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)v6, v7);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (id)preparedComplicationPreviewImagesForPreview:(id)a3
{
  BOOL v4 = +[PBFComplicationSnapshotRequest requestsForPreview:a3];
  id v5 = [(PBFPosterGalleryDataProvider *)self complicationSnapshotProvider];
  id v6 = [v5 preparedComplicationSnapshotsForRequests:v4];

  return v6;
}

- (id)acquireExtensionInstance:(id)a3 reason:(id)a4 error:(id *)a5
{
  return (id)[(PFPosterExtensionProvider *)self->_extensionProvider acquireInstanceForExtensionWithIdentifier:a3 reason:a4 error:a5];
}

- (void)relinquishExtensionInstance:(id)a3 reason:(id)a4
{
}

- (void)invalidate
{
  BOOL v3 = self->_outstandingSnapshotRequests;
  objc_sync_enter(v3);
  if ([(NSMutableSet *)self->_outstandingSnapshotRequests count])
  {
    BOOL v4 = [(PBFPosterGalleryDataProvider *)self snapshotProvider];
    [v4 cancelRequests:self->_outstandingSnapshotRequests reason:@"PBFPosterGalleryDataProvider invalidated"];

    [(NSMutableSet *)self->_outstandingSnapshotRequests removeAllObjects];
  }
  objc_sync_exit(v3);

  id v5 = [(PBFPosterGalleryDataProvider *)self complicationSnapshotProvider];
  [v5 invalidate];

  id v6 = [(PBFPosterGalleryDataProvider *)self snapshotProvider];
  [v6 purgeSnapshotCacheForType:1];

  id v7 = [(PBFPosterGalleryDataProvider *)self snapshotProvider];
  [v7 purgeSnapshotCacheForType:2];
}

- (NSMutableOrderedSet)orderedSectionIdentifiers
{
  return self->_orderedSectionIdentifiers;
}

- (void)setOrderedSectionIdentifiers:(id)a3
{
}

- (NSMutableDictionary)sectionIdentifierToSectionType
{
  return self->_sectionIdentifierToSectionType;
}

- (void)setSectionIdentifierToSectionType:(id)a3
{
}

- (NSMutableDictionary)sectionIdentifierToItems
{
  return self->_sectionIdentifierToItems;
}

- (void)setSectionIdentifierToItems:(id)a3
{
}

- (NSMutableDictionary)posterPreviewForPosterUniqueIdentifier
{
  return self->_posterPreviewForPosterUniqueIdentifier;
}

- (void)setPosterPreviewForPosterUniqueIdentifier:(id)a3
{
}

- (NSMutableDictionary)sectionIdentifierToLocalizedTitle
{
  return self->_sectionIdentifierToLocalizedTitle;
}

- (void)setSectionIdentifierToLocalizedTitle:(id)a3
{
}

- (NSMutableDictionary)sectionIdentifierToLocalizedSubtitle
{
  return self->_sectionIdentifierToLocalizedSubtitle;
}

- (void)setSectionIdentifierToLocalizedSubtitle:(id)a3
{
}

- (PBFPosterSnapshotProviding)snapshotProvider
{
  return self->_snapshotProvider;
}

- (void)setSnapshotProvider:(id)a3
{
}

- (PBFComplicationSnapshotProviding)complicationSnapshotProvider
{
  return self->_complicationSnapshotProvider;
}

- (void)setComplicationSnapshotProvider:(id)a3
{
}

- (PFPosterExtensionProvider)extensionProvider
{
  return self->_extensionProvider;
}

- (void)setExtensionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_complicationSnapshotProvider, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToLocalizedSubtitle, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToLocalizedTitle, 0);
  objc_storeStrong((id *)&self->_posterPreviewForPosterUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToItems, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToSectionType, 0);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_outstandingSnapshotRequests, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "Error fetching request %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end