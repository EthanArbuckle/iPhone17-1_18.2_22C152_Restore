@interface WebBookmark
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)modifiedAttributesToFieldNames;
+ (id)_allowedSiteBookmarkWithTitle:(id)a3 address:(id)a4;
+ (id)_trimmedPreviewText:(id)a3;
+ (id)_trimmedTitle:(id)a3;
- (BOOL)_usedForInMemoryChangeTracking;
- (BOOL)attributesMarkedAsModified:(unint64_t)a3;
- (BOOL)fetchedIconData;
- (BOOL)hasFetchedMetadata;
- (BOOL)hasShareRecord;
- (BOOL)isAddedLocally;
- (BOOL)isBookmarksBarFolder;
- (BOOL)isBookmarksMenuFolder;
- (BOOL)isBuiltinBookmark;
- (BOOL)isDeletable;
- (BOOL)isDeleted;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBookmark:(id)a3;
- (BOOL)isFolder;
- (BOOL)isFrequentlyVisitedSitesFolder;
- (BOOL)isFullArchiveAvailable;
- (BOOL)isHidden;
- (BOOL)isInserted;
- (BOOL)isMarkedAsRead;
- (BOOL)isPinned;
- (BOOL)isReadingListFolder;
- (BOOL)isReadingListItem;
- (BOOL)isSyncable;
- (BOOL)isWebFilterAllowedSitesFolder;
- (BOOL)needsSecureDelete;
- (BOOL)needsSyncUpdate;
- (BOOL)omitFromUI;
- (BOOL)shouldArchive;
- (BOOL)shouldReattemptArchiveWithAutomaticArchivingEnabled:(BOOL)a3;
- (BOOL)showIconOnly;
- (BOOL)wasLoadedFromDatabase;
- (NSArray)fields;
- (NSArray)modifiedFields;
- (NSData)iconData;
- (NSData)startPageSectionsDataRepresentation;
- (NSData)syncData;
- (NSDate)dateAdded;
- (NSDate)dateLastArchived;
- (NSDate)dateLastFetched;
- (NSDate)dateLastViewed;
- (NSDate)readingListDateLastViewed;
- (NSDate)tabDateLastViewed;
- (NSDictionary)dictionaryRepresentationForInMemoryChangeTracking;
- (NSDictionary)extraAttributes;
- (NSDictionary)localAttributes;
- (NSDictionary)nextPageURLs;
- (NSNumber)backgroundImageModifiedState;
- (NSNumber)frequentlyVisitedSiteScore;
- (NSNumber)isSelectedFavoritesFolder;
- (NSNumber)minimumSyncAPIVersion;
- (NSNumber)syncState;
- (NSString)UUID;
- (NSString)address;
- (NSString)creationDeviceIdentifier;
- (NSString)customFavoritesFolderServerID;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)deviceTypeIdentifier;
- (NSString)displayTitle;
- (NSString)localPreviewText;
- (NSString)localizedTitle;
- (NSString)offlineArchiveDirectoryPath;
- (NSString)pinnedAddress;
- (NSString)pinnedTitle;
- (NSString)previewText;
- (NSString)privacyPreservingDescription;
- (NSString)readingListIconURL;
- (NSString)readingListIconUUID;
- (NSString)serverID;
- (NSString)symbolImageName;
- (NSString)syncKey;
- (NSString)title;
- (WBBookmarkSyncData)wbSyncData;
- (WBSCRDTField)labelField;
- (WBSCRDTField)locationField;
- (WBSCRDTGeneration)backgroundImageGeneration;
- (WBSCRDTGeneration)lastReadGeneration;
- (WBSCRDTPosition)syncPosition;
- (WebBookmark)init;
- (WebBookmark)initWithBookmark:(id)a3;
- (WebBookmark)initWithCoder:(id)a3;
- (WebBookmark)initWithDictionaryRepresentationForInMemoryChangeTracking:(id)a3;
- (WebBookmark)initWithSQLiteStatement:(sqlite3_stmt *)a3 deviceIdentifier:(id)a4 collectionType:(int64_t)a5;
- (WebBookmark)initWithSQLiteStatement:(sqlite3_stmt *)a3 deviceIdentifier:(id)a4 collectionType:(int64_t)a5 skipDecodingSyncData:(BOOL)a6;
- (WebBookmark)initWithSQLiteStatement:(sqlite3_stmt *)a3 deviceIdentifier:(id)a4 hasIcon:(BOOL)a5 collectionType:(int64_t)a6 skipDecodingSyncData:(BOOL)a7;
- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 collectionType:(int64_t)a5;
- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 collectionType:(int64_t)a6;
- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 deviceIdentifier:(id)a6 collectionType:(int64_t)a7;
- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 folder:(BOOL)a6 deviceIdentifier:(id)a7 collectionType:(int64_t)a8;
- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 subtype:(int64_t)a6 deviceIdentifier:(id)a7 collectionType:(int64_t)a8;
- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 subtype:(int64_t)a6 deviceIdentifier:(id)a7 collectionType:(int64_t)a8 score:(id)a9;
- (id)_fieldWithValue:(id)a3 generationKey:(id)a4 modifiedAttributes:(unint64_t)a5 syncData:(id)a6;
- (id)_fieldWithValueProvider:(id)a3 valueUpdater:(id)a4 generationKey:(id)a5 modifiedAttributes:(unint64_t)a6 syncData:(id)a7;
- (id)_fieldsForAttributes:(unint64_t)a3;
- (id)_initForCopy;
- (id)_labelGenerationKey;
- (id)_readingListPropertyNamed:(id)a3;
- (id)_stringForReadingListArchiveStatus:(int64_t)a3;
- (id)backgroundImageModifiedStateProvider;
- (id)backgroundImageModifiedStateUpdater;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customFavoritesFolderServerIDProvider;
- (id)customFavoritesFolderServerIDUpdater;
- (id)customStartPageSectionsDataProvider;
- (id)customStartPageSectionsDataUpdater;
- (id)dateAddedProvider;
- (id)dateAddedUpdater;
- (id)dateLastViewedProvider;
- (id)dateLastViewedUpdater;
- (id)descriptionPreservingPrivacy:(BOOL)a3;
- (id)fieldForAttribute:(unint64_t)a3;
- (id)generationKeyForField:(id)a3;
- (id)iconURLProvider;
- (id)iconURLUpdater;
- (id)initBuiltinBookmarkWithTitle:(id)a3 address:(id)a4;
- (id)initBuiltinDeviceBookmarkWithTitle:(id)a3 address:(id)a4;
- (id)initCarrierBookmarkWithTitle:(id)a3 address:(id)a4;
- (id)initFolderWithParentID:(int)a3 collectionType:(int64_t)a4;
- (id)initFolderWithParentID:(int)a3 deviceIdentifier:(id)a4 collectionType:(int64_t)a5;
- (id)initFolderWithParentID:(int)a3 subtype:(int64_t)a4 deviceIdentifier:(id)a5 collectionType:(int64_t)a6;
- (id)initReadingListBookmarkWithTitle:(id)a3 address:(id)a4 previewText:(id)a5;
- (id)initWhiteListBookmarkWithTitle:(id)a3 address:(id)a4;
- (id)isSelectedFavoritesFolderProvider;
- (id)previewTextProvider;
- (id)previewTextUpdater;
- (id)selectedFavoritesFolderUpdater;
- (id)shortTypeDescription;
- (id)showIconOnlyProvider;
- (id)showIconOnlyUpdater;
- (id)symbolImageNameProvider;
- (id)symbolImageNameUpdater;
- (id)tabDateLastViewedProvider;
- (id)tabDateLastViewedUpdater;
- (id)webarchivePathForNextPageURL:(id)a3;
- (id)webarchivePathInReaderForm:(BOOL)a3 fileExists:(BOOL *)a4;
- (int)identifier;
- (int)lastSelectedChildID;
- (int)parentID;
- (int)specialID;
- (int64_t)_mergeFields:(id)a3 withFields:(id)a4 forBookmark:(id)a5;
- (int64_t)archiveStatus;
- (int64_t)bookmarkType;
- (int64_t)collectionType;
- (int64_t)folderType;
- (int64_t)itemType;
- (int64_t)mergeAttributes:(unint64_t)a3 withBookmark:(id)a4;
- (int64_t)subtype;
- (int64_t)webFilterStatus;
- (unint64_t)_attributesForField:(id)a3;
- (unint64_t)_sizeForFileOrDirectory:(id)a3 withAttributes:(id)a4;
- (unint64_t)archiveSize;
- (unint64_t)hash;
- (unint64_t)modifiedAttributes;
- (unsigned)orderIndex;
- (void)_modifyExtraReadingListAttributes:(id)a3;
- (void)_modifyLocalReadingListAttributes:(id)a3;
- (void)_removeDirectoryAtPath:(id)a3;
- (void)_setHidden:(BOOL)a3;
- (void)_setID:(int)a3;
- (void)_setInserted:(BOOL)a3;
- (void)_setOrderIndex:(unsigned int)a3;
- (void)_setParentID:(int)a3;
- (void)_setParentID:(int)a3 incrementGeneration:(BOOL)a4;
- (void)_setServerID:(id)a3;
- (void)_setSyncData:(id)a3 cachedWBSyncData:(id)a4;
- (void)_setSyncable:(BOOL)a3;
- (void)_setUUID:(id)a3;
- (void)_setUpFieldsWithLabel:(id)a3 lastSelectedChild:(int)a4 location:(id)a5 syncData:(id)a6;
- (void)_setUsedForInMemoryChangeTracking:(BOOL)a3;
- (void)_updateExtraAttributeValuesUsingBlock:(id)a3;
- (void)cleanUpRedundantPreviewText;
- (void)clearArchive;
- (void)clearArchiveSynchronously;
- (void)clearModifiedAttributes;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getReadOnlyCachedBookmarkSyncDataUsingBlock:(id)a3;
- (void)lockFields;
- (void)markAsRead;
- (void)markAttributesAsModified:(unint64_t)a3;
- (void)markSpecial:(int)a3;
- (void)mergeWithBookmark:(id)a3;
- (void)performWithFieldsWriteLock:(id)a3;
- (void)setAddedLocally:(BOOL)a3;
- (void)setAddress:(id)a3;
- (void)setAddress:(id)a3 incrementGeneration:(BOOL)a4;
- (void)setArchiveStatus:(int64_t)a3;
- (void)setBackgroundImageModifiedState:(id)a3;
- (void)setCreationDeviceIdentifier:(id)a3;
- (void)setCustomFavoritesFolderServerID:(id)a3;
- (void)setDateAdded:(id)a3;
- (void)setDateLastArchived:(id)a3;
- (void)setDateLastFetched:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceTypeIdentifier:(id)a3;
- (void)setExtraAttributes:(id)a3;
- (void)setExtraAttributesValue:(id)a3 forKey:(id)a4;
- (void)setFetchedIconData:(BOOL)a3;
- (void)setHasFetchedMetadata:(BOOL)a3;
- (void)setIconData:(id)a3;
- (void)setLastReadGeneration:(id)a3;
- (void)setLastSelectedChildID:(int)a3;
- (void)setLocalAttributes:(id)a3;
- (void)setLocalAttributesValue:(id)a3 forKey:(id)a4;
- (void)setLocalPreviewText:(id)a3;
- (void)setMinimumSyncAPIVersion:(id)a3;
- (void)setModifiedAttributes:(unint64_t)a3;
- (void)setNeedsSyncUpdate:(BOOL)a3;
- (void)setNextPageURLs:(id)a3;
- (void)setPinned:(BOOL)a3 title:(id)a4 address:(id)a5;
- (void)setPreviewText:(id)a3;
- (void)setReadingListDateLastViewed:(id)a3;
- (void)setReadingListIconURL:(id)a3;
- (void)setReadingListIconUUID:(id)a3;
- (void)setSelectedFavoritesFolder:(id)a3;
- (void)setServerID:(id)a3;
- (void)setShouldArchive:(BOOL)a3;
- (void)setShowIconOnly:(BOOL)a3;
- (void)setStartPageSectionsDataRepresentation:(id)a3;
- (void)setSubtype:(int64_t)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setSyncData:(id)a3;
- (void)setSyncKey:(id)a3;
- (void)setSyncPosition:(id)a3;
- (void)setSyncPosition:(id)a3 incrementGeneration:(BOOL)a4;
- (void)setSyncState:(id)a3;
- (void)setTabDateLastViewed:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 incrementGeneration:(BOOL)a4;
- (void)setTitle:(id)a3 previewText:(id)a4 dateLastFetched:(id)a5;
- (void)setWebFilterStatus:(int64_t)a3;
- (void)unlockFields;
- (void)updateGenerationsInSyncData:(id)a3 forAttributes:(unint64_t)a4;
@end

@implementation WebBookmark

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_tabDateLastViewedField, 0);
  objc_storeStrong((id *)&self->_showIconOnlyField, 0);
  objc_storeStrong((id *)&self->_startPageSectionsDataField, 0);
  objc_storeStrong((id *)&self->_customFavoritesFolderServerIDField, 0);
  objc_storeStrong((id *)&self->_symbolImageNameField, 0);
  objc_storeStrong((id *)&self->_syncStateField, 0);
  objc_storeStrong((id *)&self->_previewTextField, 0);
  objc_storeStrong((id *)&self->_minimumSyncAPIVersionField, 0);
  objc_storeStrong((id *)&self->_locationField, 0);
  objc_storeStrong((id *)&self->_lastSelectedChildField, 0);
  objc_storeStrong((id *)&self->_labelField, 0);
  objc_storeStrong((id *)&self->_isSelectedFavoritesFolderField, 0);
  objc_storeStrong((id *)&self->_iconURLField, 0);
  objc_storeStrong((id *)&self->_dateLastViewedField, 0);
  objc_storeStrong((id *)&self->_dateAddedField, 0);
  objc_storeStrong((id *)&self->_backgroundImageModifiedField, 0);
  objc_storeStrong((id *)&self->_localAttributes, 0);
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_cachedWBSyncData, 0);
  objc_storeStrong((id *)&self->_syncData, 0);
  objc_storeStrong((id *)&self->_syncKey, 0);
  objc_storeStrong((id *)&self->_serverID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (BOOL)isPinned
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = [(NSDictionary *)self->_extraAttributes objectForKeyedSubscript:@"IsPinned"];
  char v4 = [v3 BOOLValue];

  os_unfair_recursive_lock_unlock();
  return v4;
}

void __83__WebBookmark_Internal___setUpFieldsWithLabel_lastSelectedChild_location_syncData___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 backgroundImageModifiedStateProvider];
  char v4 = [*(id *)(a1 + 32) backgroundImageModifiedStateUpdater];
  uint64_t v5 = [v2 _fieldWithValueProvider:v3 valueUpdater:v4 generationKey:@"BackgroundImage" modifiedAttributes:0x2000 syncData:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v5;

  v8 = *(void **)(a1 + 32);
  v9 = [v8 dateAddedProvider];
  v10 = [*(id *)(a1 + 32) dateAddedUpdater];
  uint64_t v11 = [v8 _fieldWithValueProvider:v9 valueUpdater:v10 generationKey:@"DateAdded" modifiedAttributes:16 syncData:*(void *)(a1 + 40)];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 184);
  *(void *)(v12 + 184) = v11;

  v14 = *(void **)(a1 + 32);
  v15 = [v14 dateLastViewedProvider];
  v16 = [*(id *)(a1 + 32) dateLastViewedUpdater];
  uint64_t v17 = [v14 _fieldWithValueProvider:v15 valueUpdater:v16 generationKey:@"DateLastViewed" modifiedAttributes:8 syncData:*(void *)(a1 + 40)];
  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 192);
  *(void *)(v18 + 192) = v17;

  v20 = *(void **)(a1 + 32);
  v21 = [v20 iconURLProvider];
  v22 = [*(id *)(a1 + 32) iconURLUpdater];
  uint64_t v23 = [v20 _fieldWithValueProvider:v21 valueUpdater:v22 generationKey:@"ImageURL" modifiedAttributes:128 syncData:*(void *)(a1 + 40)];
  uint64_t v24 = *(void *)(a1 + 32);
  v25 = *(void **)(v24 + 200);
  *(void *)(v24 + 200) = v23;

  v26 = *(void **)(a1 + 32);
  v27 = [v26 isSelectedFavoritesFolderProvider];
  v28 = [*(id *)(a1 + 32) selectedFavoritesFolderUpdater];
  uint64_t v29 = [v26 _fieldWithValueProvider:v27 valueUpdater:v28 generationKey:@"IsSelectedFavoritesFolder" modifiedAttributes:32 syncData:*(void *)(a1 + 40)];
  uint64_t v30 = *(void *)(a1 + 32);
  v31 = *(void **)(v30 + 208);
  *(void *)(v30 + 208) = v29;

  v32 = *(void **)(a1 + 32);
  uint64_t v33 = *(void *)(a1 + 48);
  v34 = [v32 _labelGenerationKey];
  uint64_t v35 = [v32 _fieldWithValue:v33 generationKey:v34 modifiedAttributes:65539 syncData:*(void *)(a1 + 40)];
  uint64_t v36 = *(void *)(a1 + 32);
  v37 = *(void **)(v36 + 216);
  *(void *)(v36 + 216) = v35;

  v38 = *(void **)(a1 + 32);
  v39 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  uint64_t v40 = [v38 _fieldWithValue:v39 generationKey:@"LastSelectedTab" modifiedAttributes:512 syncData:*(void *)(a1 + 40)];
  uint64_t v41 = *(void *)(a1 + 32);
  v42 = *(void **)(v41 + 224);
  *(void *)(v41 + 224) = v40;

  uint64_t v43 = [*(id *)(a1 + 32) _fieldWithValue:*(void *)(a1 + 56) generationKey:@"ParentAndPosition" modifiedAttributes:68 syncData:*(void *)(a1 + 40)];
  uint64_t v44 = *(void *)(a1 + 32);
  v45 = *(void **)(v44 + 232);
  *(void *)(v44 + 232) = v43;

  v46 = *(void **)(a1 + 32);
  v47 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "minimumAPIVersion"));
  uint64_t v48 = [v46 _fieldWithValue:v47 generationKey:@"MinimumAPIVersion" modifiedAttributes:0x8000 syncData:*(void *)(a1 + 40)];
  uint64_t v49 = *(void *)(a1 + 32);
  v50 = *(void **)(v49 + 240);
  *(void *)(v49 + 240) = v48;

  v51 = *(void **)(a1 + 32);
  v52 = [v51 previewTextProvider];
  v53 = [*(id *)(a1 + 32) previewTextUpdater];
  uint64_t v54 = [v51 _fieldWithValueProvider:v52 valueUpdater:v53 generationKey:@"PreviewText" modifiedAttributes:256 syncData:*(void *)(a1 + 40)];
  uint64_t v55 = *(void *)(a1 + 32);
  v56 = *(void **)(v55 + 248);
  *(void *)(v55 + 248) = v54;

  v57 = *(void **)(a1 + 32);
  v58 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "state"));
  uint64_t v59 = [v57 _fieldWithValue:v58 generationKey:@"Deleted" modifiedAttributes:0x4000 syncData:*(void *)(a1 + 40)];
  uint64_t v60 = *(void *)(a1 + 32);
  v61 = *(void **)(v60 + 256);
  *(void *)(v60 + 256) = v59;

  v62 = *(void **)(a1 + 32);
  v63 = [v62 symbolImageNameProvider];
  v64 = [*(id *)(a1 + 32) symbolImageNameUpdater];
  uint64_t v65 = [v62 _fieldWithValueProvider:v63 valueUpdater:v64 generationKey:@"SymbolImageName" modifiedAttributes:4096 syncData:*(void *)(a1 + 40)];
  uint64_t v66 = *(void *)(a1 + 32);
  v67 = *(void **)(v66 + 264);
  *(void *)(v66 + 264) = v65;

  v68 = *(void **)(a1 + 32);
  v69 = [v68 customFavoritesFolderServerIDProvider];
  v70 = [*(id *)(a1 + 32) customFavoritesFolderServerIDUpdater];
  uint64_t v71 = [v68 _fieldWithValueProvider:v69 valueUpdater:v70 generationKey:@"CustomFavoritesFolderServerID" modifiedAttributes:0x40000 syncData:*(void *)(a1 + 40)];
  uint64_t v72 = *(void *)(a1 + 32);
  v73 = *(void **)(v72 + 272);
  *(void *)(v72 + 272) = v71;

  v74 = *(void **)(a1 + 32);
  v75 = [v74 customStartPageSectionsDataProvider];
  v76 = [*(id *)(a1 + 32) customStartPageSectionsDataUpdater];
  uint64_t v77 = [v74 _fieldWithValueProvider:v75 valueUpdater:v76 generationKey:@"CustomStartPageSectionsData" modifiedAttributes:0x80000 syncData:*(void *)(a1 + 40)];
  uint64_t v78 = *(void *)(a1 + 32);
  v79 = *(void **)(v78 + 280);
  *(void *)(v78 + 280) = v77;

  v80 = *(void **)(a1 + 32);
  v81 = [v80 showIconOnlyProvider];
  v82 = [*(id *)(a1 + 32) showIconOnlyUpdater];
  uint64_t v83 = [v80 _fieldWithValueProvider:v81 valueUpdater:v82 generationKey:@"ShowIconOnly" modifiedAttributes:0x200000 syncData:*(void *)(a1 + 40)];
  uint64_t v84 = *(void *)(a1 + 32);
  v85 = *(void **)(v84 + 288);
  *(void *)(v84 + 288) = v83;

  v86 = *(void **)(a1 + 32);
  id v91 = [v86 tabDateLastViewedProvider];
  v87 = [*(id *)(a1 + 32) tabDateLastViewedUpdater];
  uint64_t v88 = [v86 _fieldWithValueProvider:v91 valueUpdater:v87 generationKey:@"DateLastViewed" modifiedAttributes:8 syncData:*(void *)(a1 + 40)];
  uint64_t v89 = *(void *)(a1 + 32);
  v90 = *(void **)(v89 + 296);
  *(void *)(v89 + 296) = v88;
}

- (id)_fieldWithValue:(id)a3 generationKey:(id)a4 modifiedAttributes:(unint64_t)a5 syncData:(id)a6
{
  v10 = (objc_class *)MEMORY[0x263F66608];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 alloc];
  v15 = [v11 generationForKey:v12];

  v16 = [(WebBookmark *)self deviceIdentifier];
  uint64_t v17 = (void *)[v14 initWithValue:v13 generation:v15 deviceIdentifier:v16];

  uint64_t v18 = [NSNumber numberWithUnsignedLongLong:a5];
  [v17 setObject:v18 forKeyedSubscript:@"Attributes"];

  [v17 setObject:v12 forKeyedSubscript:@"GenerationKey"];
  return v17;
}

- (id)_fieldWithValueProvider:(id)a3 valueUpdater:(id)a4 generationKey:(id)a5 modifiedAttributes:(unint64_t)a6 syncData:(id)a7
{
  id v12 = (objc_class *)MEMORY[0x263F66608];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 alloc];
  uint64_t v18 = [v13 generationForKey:v14];

  v19 = [(WebBookmark *)self deviceIdentifier];
  v20 = (void *)[v17 initWithValueSource:self valueProvider:v16 valueUpdater:v15 generation:v18 deviceIdentifier:v19];

  v21 = [NSNumber numberWithUnsignedLongLong:a6];
  [v20 setObject:v21 forKeyedSubscript:@"Attributes"];

  [v20 setObject:v14 forKeyedSubscript:@"GenerationKey"];
  return v20;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (id)previewTextUpdater
{
  return &__block_literal_global_55;
}

- (id)previewTextProvider
{
  return &__block_literal_global_53_0;
}

- (id)iconURLUpdater
{
  return &__block_literal_global_51;
}

- (id)iconURLProvider
{
  return &__block_literal_global_48;
}

- (id)dateLastViewedUpdater
{
  return &__block_literal_global_45;
}

- (id)dateLastViewedProvider
{
  return &__block_literal_global_43_0;
}

- (id)dateAddedUpdater
{
  return &__block_literal_global_40_0;
}

- (id)dateAddedProvider
{
  return &__block_literal_global_19;
}

- (id)tabDateLastViewedUpdater
{
  return &__block_literal_global_307;
}

- (id)tabDateLastViewedProvider
{
  return &__block_literal_global_304;
}

- (id)symbolImageNameUpdater
{
  return &__block_literal_global_317;
}

- (id)symbolImageNameProvider
{
  return &__block_literal_global_314;
}

- (id)showIconOnlyUpdater
{
  return &__block_literal_global_301;
}

- (id)showIconOnlyProvider
{
  return &__block_literal_global_299;
}

- (id)selectedFavoritesFolderUpdater
{
  return &__block_literal_global_297;
}

- (id)isSelectedFavoritesFolderProvider
{
  return &__block_literal_global_294;
}

- (id)customStartPageSectionsDataUpdater
{
  return &__block_literal_global_327;
}

- (id)customStartPageSectionsDataProvider
{
  return &__block_literal_global_324;
}

- (id)customFavoritesFolderServerIDUpdater
{
  return &__block_literal_global_321;
}

- (id)customFavoritesFolderServerIDProvider
{
  return &__block_literal_global_319;
}

- (id)backgroundImageModifiedStateUpdater
{
  return &__block_literal_global_311;
}

- (id)backgroundImageModifiedStateProvider
{
  return &__block_literal_global_309;
}

- (id)_labelGenerationKey
{
  os_unfair_recursive_lock_lock_with_options();
  if (self->_folder) {
    v3 = @"TitleAndIdentityHash";
  }
  else {
    v3 = @"TitleURLAndIdentityHash";
  }
  char v4 = v3;
  os_unfair_recursive_lock_unlock();
  return v4;
}

- (WebBookmark)initWithSQLiteStatement:(sqlite3_stmt *)a3 deviceIdentifier:(id)a4 collectionType:(int64_t)a5 skipDecodingSyncData:(BOOL)a6
{
  return [(WebBookmark *)self initWithSQLiteStatement:a3 deviceIdentifier:a4 hasIcon:1 collectionType:a5 skipDecodingSyncData:a6];
}

- (id)descriptionPreservingPrivacy:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  uint64_t v6 = [(WebBookmark *)self shortTypeDescription];
  [v5 appendFormat:@"%@ %d (%d)", v6, self->_id, -[WebBookmark orderIndex](self, "orderIndex")];

  if (v3)
  {
    [v5 appendFormat:@" '%@' [%@] [%@]", &stru_26CC2ED50, self->_UUID, self->_serverID];
  }
  else
  {
    v7 = [(WebBookmark *)self title];
    [v5 appendFormat:@" '%@' [%@] [%@]", v7, self->_UUID, self->_serverID];
  }
  return v5;
}

- (id)shortTypeDescription
{
  int specialID = self->_specialID;
  switch(specialID)
  {
    case 1:
      return @"B";
    case 2:
      return @"M";
    case 3:
      return @"R";
    case 4:
      return @"W";
  }
  if (self->_folder) {
    return @"+";
  }
  return @"-";
}

- (unsigned)orderIndex
{
  LODWORD(self) = self->_orderIndex;
  os_unfair_recursive_lock_unlock();
  return self;
}

uint64_t __35__WebBookmark_Internal__wbSyncData__block_invoke()
{
  return os_unfair_recursive_lock_unlock();
}

- (NSString)serverID
{
  return self->_serverID;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (int)parentID
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = [(WBSCRDTField *)self->_locationField value];
  int v4 = [v3 parentID];

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (BOOL)isFolder
{
  return self->_folder;
}

- (NSString)address
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = [(WBSCRDTField *)self->_labelField value];
  uint64_t v4 = [v3 address];
  uint64_t v5 = (void *)v4;
  uint64_t v6 = &stru_26CC2ED50;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  v7 = v6;

  os_unfair_recursive_lock_unlock();
  return (NSString *)v7;
}

- (NSString)title
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = [(WBSCRDTField *)self->_labelField value];
  uint64_t v4 = [v3 title];
  uint64_t v5 = (void *)v4;
  uint64_t v6 = &stru_26CC2ED50;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  v7 = v6;

  os_unfair_recursive_lock_unlock();
  return (NSString *)v7;
}

- (NSDictionary)extraAttributes
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_extraAttributes;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)isInserted
{
  return self->_inserted;
}

- (BOOL)isSyncable
{
  return self->_syncable;
}

- (WebBookmark)initWithSQLiteStatement:(sqlite3_stmt *)a3 deviceIdentifier:(id)a4 collectionType:(int64_t)a5
{
  return [(WebBookmark *)self initWithSQLiteStatement:a3 deviceIdentifier:a4 hasIcon:1 collectionType:a5 skipDecodingSyncData:0];
}

- (int)identifier
{
  return self->_id;
}

- (int64_t)webFilterStatus
{
  return self->_webFilterStatus;
}

- (BOOL)isAddedLocally
{
  return self->_addedLocally;
}

- (int64_t)archiveStatus
{
  return self->_archiveStatus;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (BOOL)fetchedIconData
{
  return self->_fetchedIconData;
}

- (BOOL)omitFromUI
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = [(NSDictionary *)self->_extraAttributes objectForKeyedSubscript:@"com.apple.bookmarks.OmitFromUI"];
  char v4 = [v3 BOOLValue];

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (BOOL)needsSyncUpdate
{
  return self->_needsSyncUpdate;
}

- (unint64_t)modifiedAttributes
{
  return self->_modifiedAttributes;
}

- (int)lastSelectedChildID
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = [(WBSCRDTField *)self->_lastSelectedChildField value];
  int v4 = [v3 intValue];

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (void)setLastSelectedChildID:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__WebBookmark_setLastSelectedChildID___block_invoke;
  v3[3] = &unk_2643DA5E0;
  int v4 = a3;
  v3[4] = self;
  [(WebBookmark *)self performWithFieldsWriteLock:v3];
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)_setInserted:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__WebBookmark_Internal___setInserted___block_invoke;
  v3[3] = &unk_2643DA368;
  v3[4] = self;
  BOOL v4 = a3;
  [(WebBookmark *)self performWithFieldsWriteLock:v3];
}

- (void)_setID:(int)a3
{
  int v5 = [(WebBookmark *)self parentID];
  if (a3 != 0x7FFFFFFF && v5 == a3)
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WebBookmark(Internal) _setID:](a3, v6);
    }
  }
  os_unfair_recursive_lock_lock_with_options();
  self->_id = a3;
  os_unfair_recursive_lock_unlock();
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)_setUUID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__WebBookmark_Internal___setUUID___block_invoke;
  v6[3] = &unk_2643D9CF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

- (void)setModifiedAttributes:(unint64_t)a3
{
  self->_modifiedAttributes = a3;
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 deviceIdentifier:(id)a6 collectionType:(int64_t)a7
{
  return [(WebBookmark *)self initWithTitle:a3 address:a4 parentID:*(void *)&a5 folder:0 deviceIdentifier:a6 collectionType:a7];
}

- (void)setExtraAttributesValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__WebBookmark_setExtraAttributesValue_forKey___block_invoke;
  v10[3] = &unk_2643DA608;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(WebBookmark *)self performWithFieldsWriteLock:v10];
}

- (NSString)pinnedTitle
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = [(NSDictionary *)self->_extraAttributes objectForKeyedSubscript:@"PinnedTitle"];
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

- (NSString)pinnedAddress
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = [(NSDictionary *)self->_extraAttributes objectForKeyedSubscript:@"PinnedAddress"];
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WebBookmark *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(WebBookmark *)self isEqualToBookmark:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(WebBookmark *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToBookmark:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  BOOL v5 = [(WebBookmark *)self UUID];
  id v6 = [v4 UUID];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)privacyPreservingDescription
{
  return (NSString *)[(WebBookmark *)self descriptionPreservingPrivacy:1];
}

- (int)specialID
{
  return self->_specialID;
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 folder:(BOOL)a6 deviceIdentifier:(id)a7 collectionType:(int64_t)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)WebBookmark;
  id v17 = [(WebBookmark *)&v29 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_fieldsWriteLock = 0;
    v17->_folder = a6;
    v17->_id = 0x7FFFFFFF;
    v19 = +[WebBookmarkCollection _uniqueExternalUUID];
    [(WebBookmark *)v18 _setUUID:v19];

    v18->_int specialID = 0;
    if (a8 == 1)
    {
      v20 = [MEMORY[0x263F08C38] UUID];
      uint64_t v21 = [v20 UUIDString];
      serverID = v18->_serverID;
      v18->_serverID = (NSString *)v21;
    }
    uint64_t v23 = [v16 copy];
    deviceIdentifier = v18->_deviceIdentifier;
    v18->_deviceIdentifier = (NSString *)v23;

    *(_DWORD *)&v18->_editable = 16777473;
    v25 = objc_alloc_init(WBBookmarkLabel);
    v26 = objc_alloc_init(WBBookmarkLocation);
    [(WebBookmark *)v18 _setUpFieldsWithLabel:v25 lastSelectedChild:0x7FFFFFFFLL location:v26 syncData:0];
    [(WebBookmark *)v18 setTitle:v14];
    [(WebBookmark *)v18 setAddress:v15];
    [(WebBookmark *)v18 _setParentID:v11];
    [(WebBookmark *)v18 _setOrderIndex:0];
    v18->_collectionType = a8;
    *(_WORD *)&v18->_inserted = 0;
    v27 = v18;
  }
  return v18;
}

- (void)_setParentID:(int)a3 incrementGeneration:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__WebBookmark_Internal___setParentID_incrementGeneration___block_invoke;
  v4[3] = &unk_2643DB7D8;
  int v5 = a3;
  v4[4] = self;
  BOOL v6 = a4;
  [(WebBookmark *)self performWithFieldsWriteLock:v4];
}

- (void)_setOrderIndex:(unsigned int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__WebBookmark_Internal___setOrderIndex___block_invoke;
  v3[3] = &unk_2643DA5E0;
  unsigned int v4 = a3;
  v3[4] = self;
  [(WebBookmark *)self performWithFieldsWriteLock:v3];
}

- (void)_setParentID:(int)a3
{
}

- (void)setTitle:(id)a3 incrementGeneration:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__WebBookmark_setTitle_incrementGeneration___block_invoke;
  v8[3] = &unk_2643DA5B8;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(WebBookmark *)self performWithFieldsWriteLock:v8];
}

- (void)setTitle:(id)a3
{
}

- (void)setAddress:(id)a3 incrementGeneration:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__WebBookmark_setAddress_incrementGeneration___block_invoke;
  v8[3] = &unk_2643DA5B8;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(WebBookmark *)self performWithFieldsWriteLock:v8];
}

- (void)setAddress:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) _initForCopy];
  *(unsigned char *)(v4 + 16) = self->_folder;
  uint64_t v5 = [(NSString *)self->_UUID copy];
  id v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  uint64_t v7 = [(NSString *)self->_serverID copy];
  id v8 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v7;

  uint64_t v9 = [(NSString *)self->_syncKey copy];
  BOOL v10 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v9;

  uint64_t v11 = [(NSData *)self->_syncData copy];
  id v12 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v11;

  *(unsigned char *)(v4 + 64) = self->_editable;
  *(unsigned char *)(v4 + 65) = self->_deletable;
  *(unsigned char *)(v4 + 66) = self->_hidden;
  *(unsigned char *)(v4 + 67) = self->_syncable;
  *(unsigned char *)(v4 + 69) = self->_fetchedIconData;
  *(unsigned char *)(v4 + 80) = self->_addedLocally;
  *(void *)(v4 + 88) = self->_archiveStatus;
  *(void *)(v4 + 96) = self->_webFilterStatus;
  uint64_t v13 = [(NSDictionary *)self->_extraAttributes copy];
  id v14 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v13;

  uint64_t v15 = [(NSDictionary *)self->_localAttributes copy];
  id v16 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = v15;

  *(_DWORD *)(v4 + 120) = self->_id;
  *(_DWORD *)(v4 + 124) = self->_specialID;
  *(_DWORD *)(v4 + 128) = self->_orderIndex;
  *(unsigned char *)(v4 + 152) = self->_inserted;
  *(unsigned char *)(v4 + 153) = self->_loadedFromDatabase;
  *(unsigned char *)(v4 + 154) = self->_needsSyncUpdate;
  *(void *)(v4 + 160) = self->_modifiedAttributes;
  *(unsigned char *)(v4 + 168) = self->_usedForInMemoryChangeTracking;
  uint64_t v17 = [(NSString *)self->_deviceIdentifier copy];
  uint64_t v18 = *(void **)(v4 + 304);
  *(void *)(v4 + 304) = v17;

  *(void *)(v4 + 144) = self->_collectionType;
  v19 = [(WebBookmark *)self wbSyncData];
  uint64_t v20 = [v19 readOnlyProxy];
  uint64_t v21 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v20;

  uint64_t v22 = [(WBSCRDTField *)self->_backgroundImageModifiedField copyWithValueSource:v4];
  uint64_t v23 = *(void **)(v4 + 176);
  *(void *)(v4 + 176) = v22;

  uint64_t v24 = [(WBSCRDTField *)self->_dateAddedField copyWithValueSource:v4];
  v25 = *(void **)(v4 + 184);
  *(void *)(v4 + 184) = v24;

  uint64_t v26 = [(WBSCRDTField *)self->_dateLastViewedField copyWithValueSource:v4];
  v27 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = v26;

  uint64_t v28 = [(WBSCRDTField *)self->_iconURLField copyWithValueSource:v4];
  objc_super v29 = *(void **)(v4 + 200);
  *(void *)(v4 + 200) = v28;

  uint64_t v30 = [(WBSCRDTField *)self->_isSelectedFavoritesFolderField copyWithValueSource:v4];
  v31 = *(void **)(v4 + 208);
  *(void *)(v4 + 208) = v30;

  uint64_t v32 = [(WBSCRDTField *)self->_labelField copy];
  uint64_t v33 = *(void **)(v4 + 216);
  *(void *)(v4 + 216) = v32;

  uint64_t v34 = [(WBSCRDTField *)self->_lastSelectedChildField copy];
  uint64_t v35 = *(void **)(v4 + 224);
  *(void *)(v4 + 224) = v34;

  uint64_t v36 = [(WBSCRDTField *)self->_locationField copy];
  v37 = *(void **)(v4 + 232);
  *(void *)(v4 + 232) = v36;

  uint64_t v38 = [(WBSCRDTField *)self->_minimumSyncAPIVersionField copy];
  v39 = *(void **)(v4 + 240);
  *(void *)(v4 + 240) = v38;

  uint64_t v40 = [(WBSCRDTField *)self->_previewTextField copyWithValueSource:v4];
  uint64_t v41 = *(void **)(v4 + 248);
  *(void *)(v4 + 248) = v40;

  uint64_t v42 = [(WBSCRDTField *)self->_syncStateField copy];
  uint64_t v43 = *(void **)(v4 + 256);
  *(void *)(v4 + 256) = v42;

  uint64_t v44 = [(WBSCRDTField *)self->_symbolImageNameField copyWithValueSource:v4];
  v45 = *(void **)(v4 + 264);
  *(void *)(v4 + 264) = v44;

  uint64_t v46 = [(WBSCRDTField *)self->_customFavoritesFolderServerIDField copyWithValueSource:v4];
  v47 = *(void **)(v4 + 272);
  *(void *)(v4 + 272) = v46;

  uint64_t v48 = [(WBSCRDTField *)self->_startPageSectionsDataField copyWithValueSource:v4];
  uint64_t v49 = *(void **)(v4 + 280);
  *(void *)(v4 + 280) = v48;

  uint64_t v50 = [(WBSCRDTField *)self->_showIconOnlyField copyWithValueSource:v4];
  v51 = *(void **)(v4 + 288);
  *(void *)(v4 + 288) = v50;

  uint64_t v52 = [(WBSCRDTField *)self->_tabDateLastViewedField copyWithValueSource:v4];
  v53 = *(void **)(v4 + 296);
  *(void *)(v4 + 296) = v52;

  uint64_t v54 = [(id)v4 fields];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v62;
    do
    {
      uint64_t v58 = 0;
      do
      {
        if (*(void *)v62 != v57) {
          objc_enumerationMutation(v54);
        }
        [*(id *)(*((void *)&v61 + 1) + 8 * v58++) setShouldIncrementGeneration:1];
      }
      while (v56 != v58);
      uint64_t v56 = [v54 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v56);
  }
  uint64_t v59 = [v19 shareRecord];
  *(unsigned char *)(v4 + 68) = v59 != 0;

  *(void *)(v4 + 136) = self->_subtype;
  return (id)v4;
}

- (void)dealloc
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __22__WebBookmark_dealloc__block_invoke;
  v4[3] = &unk_2643D9B48;
  v4[4] = self;
  [(WebBookmark *)self performWithFieldsWriteLock:v4];
  v3.receiver = self;
  v3.super_class = (Class)WebBookmark;
  [(WebBookmark *)&v3 dealloc];
}

- (WebBookmark)initWithSQLiteStatement:(sqlite3_stmt *)a3 deviceIdentifier:(id)a4 hasIcon:(BOOL)a5 collectionType:(int64_t)a6 skipDecodingSyncData:(BOOL)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  v55.receiver = self;
  v55.super_class = (Class)WebBookmark;
  uint64_t v13 = [(WebBookmark *)&v55 init];
  id v14 = v13;
  if (v13)
  {
    [(WebBookmark *)v13 setDeviceIdentifier:v12];
    v14->_folder = sqlite3_column_int(a3, 0) != 0;
    uint64_t v52 = WBUTF8StringFromSQLStatement(a3, 1);
    v51 = WBUTF8StringFromSQLStatement(a3, 2);
    v14->_id = sqlite3_column_int(a3, 3);
    v14->_editable = sqlite3_column_int(a3, 4) != 0;
    v14->_deletable = sqlite3_column_int(a3, 5) != 0;
    v14->_hidden = sqlite3_column_int(a3, 6) != 0;
    int v15 = sqlite3_column_int(a3, 7);
    v14->_orderIndex = sqlite3_column_int(a3, 8);
    uint64_t v16 = WBUTF8StringFromSQLStatement(a3, 9);
    UUID = v14->_UUID;
    v14->_UUID = (NSString *)v16;

    v14->_int specialID = sqlite3_column_int(a3, 10);
    v14->_inserted = 1;
    v14->_loadedFromDatabase = 1;
    v14->_collectionType = a6;
    uint64_t v18 = newStringFromNullableColumn(a3, 11);
    serverID = v14->_serverID;
    v14->_serverID = (NSString *)v18;

    uint64_t v20 = newStringFromNullableColumn(a3, 12);
    syncKey = v14->_syncKey;
    v14->_syncKey = (NSString *)v20;

    uint64_t v22 = WBDataFromNullableColumn(a3, 13);
    syncData = v14->_syncData;
    v14->_syncData = (NSData *)v22;

    uint64_t v24 = WBDataFromNullableColumn(a3, 14);
    id v50 = v12;
    unsigned int v49 = v15;
    uint64_t v48 = (void *)v24;
    if (v24)
    {
      id v54 = 0;
      v25 = [MEMORY[0x263F08AC0] propertyListWithData:v24 options:0 format:0 error:&v54];
      id v26 = v54;
      [(WebBookmark *)v14 setExtraAttributes:v25];

      v27 = [(WebBookmark *)v14 extraAttributes];

      if (!v27)
      {
        uint64_t v28 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[WebBookmark(Internal) initWithSQLiteStatement:deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:](v28, v26);
        }
      }
    }
    else
    {
      id v26 = 0;
    }
    objc_super v29 = WBDataFromNullableColumn(a3, 15);
    if (v29)
    {
      id v53 = 0;
      uint64_t v30 = [MEMORY[0x263F08AC0] propertyListWithData:v29 options:0 format:0 error:&v53];
      id v31 = v53;

      [(WebBookmark *)v14 setLocalAttributes:v30];
      uint64_t v32 = [(WebBookmark *)v14 localAttributes];

      if (!v32)
      {
        uint64_t v33 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[WebBookmark(Internal) initWithSQLiteStatement:deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:](v33, v31);
        }
      }
    }
    else
    {
      id v31 = v26;
    }
    v14->_fetchedIconData = sqlite3_column_int(a3, 16) != 0;
    if (v9)
    {
      uint64_t v34 = WBDataFromNullableColumn(a3, 17);
      iconData = v14->_iconData;
      v14->_iconData = (NSData *)v34;

      int v36 = 18;
    }
    else
    {
      int v36 = 17;
    }
    v14->_addedLocally = sqlite3_column_int(a3, v36) != 0;
    v14->_archiveStatus = sqlite3_column_int(a3, v36 + 1);
    v14->_syncable = sqlite3_column_int(a3, v36 + 2) != 0;
    v14->_webFilterStatus = sqlite3_column_int(a3, v36 + 3);
    v14->_modifiedAttributes = sqlite3_column_int64(a3, v36 | 4u);
    int v37 = v36 + 6;
    unsigned int v38 = sqlite3_column_int(a3, v36 + 5);
    if (v38) {
      uint64_t v39 = v38;
    }
    else {
      uint64_t v39 = 0x7FFFFFFFLL;
    }
    uint64_t v40 = [[WBBookmarkLabel alloc] initWithTitle:v52 address:v51 pinned:[(WebBookmark *)v14 isPinned]];
    if (a7)
    {
      uint64_t v41 = 0;
    }
    else
    {
      uint64_t v41 = [(WebBookmark *)v14 wbSyncData];
    }
    uint64_t v42 = [WBBookmarkLocation alloc];
    uint64_t v43 = [v41 position];
    uint64_t v44 = [(WBBookmarkLocation *)v42 initWithParentID:v49 position:v43];

    [(WebBookmark *)v14 _setUpFieldsWithLabel:v40 lastSelectedChild:v39 location:v44 syncData:v41];
    v45 = [v41 shareRecord];
    v14->_hasShareRecord = v45 != 0;

    v14->_subtype = sqlite3_column_int(a3, v37);
    uint64_t v46 = v14;

    id v12 = v50;
  }

  return v14;
}

- (void)setDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__WebBookmark_setDeviceIdentifier___block_invoke;
  v6[3] = &unk_2643D9CF8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

- (void)_setUpFieldsWithLabel:(id)a3 lastSelectedChild:(int)a4 location:(id)a5 syncData:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__WebBookmark_Internal___setUpFieldsWithLabel_lastSelectedChild_location_syncData___block_invoke;
  v16[3] = &unk_2643DB900;
  v16[4] = self;
  id v17 = v12;
  int v20 = a4;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  [(WebBookmark *)self performWithFieldsWriteLock:v16];
}

- (void)performWithFieldsWriteLock:(id)a3
{
  objc_super v3 = (void (**)(void))a3;
  os_unfair_recursive_lock_lock_with_options();
  v3[2](v3);

  os_unfair_recursive_lock_unlock();
}

void __35__WebBookmark_setDeviceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((WBSIsEqual() & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 304);
    *(void *)(v3 + 304) = v2;

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = objc_msgSend(*(id *)(a1 + 40), "fields", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setDeviceIdentifier:*(void *)(a1 + 32)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (NSArray)fields
{
  os_unfair_recursive_lock_lock_with_options();
  backgroundImageModifiedField = self->_backgroundImageModifiedField;
  id v18 = (void *)MEMORY[0x263EFF8C0];
  long long v16 = *(_OWORD *)&self->_dateAddedField;
  long long v14 = *(_OWORD *)&self->_labelField;
  long long v15 = *(_OWORD *)&self->_iconURLField;
  locationField = self->_locationField;
  previewTextField = self->_previewTextField;
  syncStateField = self->_syncStateField;
  symbolImageNameField = self->_symbolImageNameField;
  customFavoritesFolderServerIDField = self->_customFavoritesFolderServerIDField;
  startPageSectionsDataField = self->_startPageSectionsDataField;
  showIconOnlyField = self->_showIconOnlyField;
  tabDateLastViewedField = self->_tabDateLastViewedField;
  long long v11 = [MEMORY[0x263EFF9D0] null];
  long long v12 = objc_msgSend(v18, "safari_arrayWithObjectsUnlessNil:", backgroundImageModifiedField, v16, v15, v14, locationField, previewTextField, syncStateField, symbolImageNameField, customFavoritesFolderServerIDField, startPageSectionsDataField, showIconOnlyField, tabDateLastViewedField, v11);

  os_unfair_recursive_lock_unlock();
  return (NSArray *)v12;
}

- (WBBookmarkSyncData)wbSyncData
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = objc_alloc_init(MEMORY[0x263F663B8]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__WebBookmark_Internal__wbSyncData__block_invoke;
  v10[3] = &unk_2643D9B48;
  v10[4] = self;
  [v3 setHandler:v10];
  cachedWBSyncData = self->_cachedWBSyncData;
  if (cachedWBSyncData) {
    goto LABEL_4;
  }
  if ([(NSData *)self->_syncData length])
  {
    id v5 = +[WBBookmarkSyncData syncDataWithContentsOfData:self->_syncData];
    uint64_t v6 = [v5 readOnlyProxy];
    uint64_t v7 = self->_cachedWBSyncData;
    self->_cachedWBSyncData = v6;

    cachedWBSyncData = self->_cachedWBSyncData;
LABEL_4:
    uint64_t v8 = cachedWBSyncData;
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_5:

  return v8;
}

void __22__WebBookmark_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 224);
  *(void *)(v4 + 224) = 0;
}

- (NSDictionary)localAttributes
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_localAttributes;
  os_unfair_recursive_lock_unlock();
  return v3;
}

uint64_t __34__WebBookmark_setExtraAttributes___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToDictionary:*(void *)(*(void *)(a1 + 40) + 104)];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(a1 + 40) + 104) = [*(id *)(a1 + 32) copy];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)setExtraAttributes:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__WebBookmark_setExtraAttributes___block_invoke;
  v6[3] = &unk_2643D9CF8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

- (void)setLocalAttributes:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = (NSDictionary *)[v4 copy];

  localAttributes = self->_localAttributes;
  self->_localAttributes = v5;

  os_unfair_recursive_lock_unlock();
}

void __40__WebBookmark_markAttributesAsModified___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 160) |= *(void *)(a1 + 40);
  if ((*(unsigned char *)(a1 + 40) & 3) != 0
    && objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "safari_BOOLForKey:", @"com.apple.bookmarks.IsBuiltinBookmark"))
  {
    uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 112) mutableCopy];
    [v2 removeObjectForKey:@"com.apple.bookmarks.IsBuiltinBookmark"];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 112);
    *(void *)(v3 + 112) = v2;
  }
}

void __34__WebBookmark_Internal___setUUID___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 24) isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = (id *)(*(void *)(a1 + 32) + 24);
    objc_storeStrong(v3, v2);
  }
}

void __58__WebBookmark_Internal___setParentID_incrementGeneration___block_invoke(uint64_t a1)
{
  uint64_t v2 = (int *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 40);
  id v4 = *(_DWORD **)(a1 + 32);
  if (v3 != 0x7FFFFFFF && v3 == v4[30])
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__WebBookmark_Internal___setParentID_incrementGeneration___block_invoke_cold_1(v2, v6);
    }
    int v3 = *(_DWORD *)(a1 + 40);
    id v4 = *(_DWORD **)(a1 + 32);
  }
  if (v3 != [v4 parentID])
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 232) value];
    uint64_t v8 = [v7 locationWithParentID:*(unsigned int *)(a1 + 40)];

    [*(id *)(*(void *)(a1 + 32) + 232) setValue:v8 incrementGenerationIfNeeded:*(unsigned __int8 *)(a1 + 44)];
    *(unsigned char *)(*(void *)(a1 + 32) + 154) = 1;
    [*(id *)(a1 + 32) markAttributesAsModified:64];
  }
}

- (void)markAttributesAsModified:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__WebBookmark_markAttributesAsModified___block_invoke;
  v3[3] = &unk_2643DA4C8;
  v3[4] = self;
  void v3[5] = a3;
  [(WebBookmark *)self performWithFieldsWriteLock:v3];
}

uint64_t __40__WebBookmark_Internal___setOrderIndex___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 128))
  {
    *(_DWORD *)(v2 + 128) = v1;
    *(unsigned char *)(*(void *)(result + 32) + 154) = 1;
    return [*(id *)(result + 32) markAttributesAsModified:4];
  }
  return result;
}

void __38__WebBookmark_setLastSelectedChildID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(int *)(a1 + 40);
  int v3 = [*(id *)(*(void *)(a1 + 32) + 224) value];
  uint64_t v4 = [v3 integerValue];

  if (v4 != v2)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 40);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0x7FFFFFFFLL;
    }
    id v7 = [NSNumber numberWithInt:v6];
    [*(id *)(*(void *)(a1 + 32) + 224) setValue:v7];

    [*(id *)(*(void *)(a1 + 32) + 224) incrementGenerationIfNeeded];
    *(unsigned char *)(*(void *)(a1 + 32) + 154) = 1;
    uint64_t v8 = *(void **)(a1 + 32);
    [v8 markAttributesAsModified:512];
  }
}

void __46__WebBookmark_setExtraAttributesValue_forKey___block_invoke(void *a1)
{
  uint64_t v2 = (void *)[*(id *)(a1[4] + 104) mutableCopy];
  int v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v8 = v4;

  [v8 setObject:a1[6] forKeyedSubscript:a1[5]];
  uint64_t v5 = [v8 copy];
  uint64_t v6 = a1[4];
  id v7 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v5;
}

void __46__WebBookmark_setAddress_incrementGeneration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) address];
  char v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    if (v4[18] && v4[17] != 1)
    {
      id v9 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "wb_bestURLForUserTypedString");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v4 = *(void **)(a1 + 32);
    }
    if (![v4 isReadingListItem]
      || objc_msgSend(v9, "_webBookmarks_isHTTPFamilyURL"))
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 216) value];
      uint64_t v6 = [v9 absoluteString];
      id v7 = v6;
      if (!v6)
      {
        if (*(void *)(a1 + 40)) {
          id v7 = *(__CFString **)(a1 + 40);
        }
        else {
          id v7 = &stru_26CC2ED50;
        }
      }
      id v8 = [v5 labelWithAddress:v7];

      [*(id *)(*(void *)(a1 + 32) + 216) setValue:v8 incrementGenerationIfNeeded:*(unsigned __int8 *)(a1 + 48)];
      if (([*(id *)(a1 + 32) isPinned] & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 154) = 1;
        [*(id *)(a1 + 32) markAttributesAsModified:2];
      }
    }
  }
}

void __44__WebBookmark_setTitle_incrementGeneration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) title];
  char v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 216) value];
    uint64_t v5 = v4;
    if (*(void *)(a1 + 40)) {
      uint64_t v6 = *(__CFString **)(a1 + 40);
    }
    else {
      uint64_t v6 = &stru_26CC2ED50;
    }
    id v7 = [v4 labelWithTitle:v6];

    [*(id *)(*(void *)(a1 + 32) + 216) setValue:v7 incrementGenerationIfNeeded:*(unsigned __int8 *)(a1 + 48)];
    if (([*(id *)(a1 + 32) isPinned] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 154) = 1;
      [*(id *)(a1 + 32) markAttributesAsModified:1];
    }
  }
}

uint64_t __38__WebBookmark_Internal___setSyncable___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 67) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __38__WebBookmark_Internal___setInserted___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 152) = *(unsigned char *)(result + 40);
  return result;
}

- (id)_initForCopy
{
  v6.receiver = self;
  v6.super_class = (Class)WebBookmark;
  uint64_t v2 = [(WebBookmark *)&v6 init];
  char v3 = v2;
  if (v2)
  {
    v2->_fieldsWriteLock = 0;
    id v4 = v2;
  }

  return v3;
}

- (NSString)symbolImageName
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(WBSCRDTField *)self->_symbolImageNameField value];
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

- (NSString)customFavoritesFolderServerID
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(WBSCRDTField *)self->_customFavoritesFolderServerIDField value];
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

id __62__WebBookmark_Internal__customFavoritesFolderServerIDProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [v2[13] objectForKeyedSubscript:@"CustomFavoritesFolderServerID"];
  os_unfair_recursive_lock_unlock();

  return v3;
}

id __48__WebBookmark_Internal__symbolImageNameProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [v2[13] objectForKeyedSubscript:@"SymbolImageName"];
  os_unfair_recursive_lock_unlock();

  return v3;
}

- (NSString)displayTitle
{
  char v3 = [(WebBookmark *)self address];
  uint64_t v4 = [v3 length];

  if (v4) {
    [(WebBookmark *)self title];
  }
  else {
  uint64_t v5 = _WBSLocalizedString();
  }
  return (NSString *)v5;
}

- (void)_setSyncable:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__WebBookmark_Internal___setSyncable___block_invoke;
  v3[3] = &unk_2643DA368;
  v3[4] = self;
  BOOL v4 = a3;
  [(WebBookmark *)self performWithFieldsWriteLock:v3];
}

- (BOOL)isReadingListFolder
{
  LOBYTE(self) = self->_specialID == 3;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isReadingListItem
{
  uint64_t v2 = [(NSDictionary *)self->_extraAttributes objectForKey:@"com.apple.ReadingList"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 collectionType:(int64_t)a5
{
  return [(WebBookmark *)self initWithTitle:a3 address:a4 parentID:0 collectionType:a5];
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 collectionType:(int64_t)a6
{
  return [(WebBookmark *)self initWithTitle:a3 address:a4 parentID:*(void *)&a5 folder:0 deviceIdentifier:0 collectionType:a6];
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 subtype:(int64_t)a6 deviceIdentifier:(id)a7 collectionType:(int64_t)a8
{
  id v9 = [(WebBookmark *)self initWithTitle:a3 address:a4 parentID:*(void *)&a5 deviceIdentifier:a7 collectionType:a8];
  long long v10 = v9;
  if (v9)
  {
    v9->_subtype = a6;
    long long v11 = v9;
  }

  return v10;
}

- (WebBookmark)initWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 subtype:(int64_t)a6 deviceIdentifier:(id)a7 collectionType:(int64_t)a8 score:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v16 = a9;
  id v17 = [(WebBookmark *)self initWithTitle:a3 address:a4 parentID:v12 subtype:a6 deviceIdentifier:a7 collectionType:a8];
  id v18 = v17;
  if (v17)
  {
    [(WebBookmark *)v17 setLocalAttributesValue:v16 forKey:@"com.apple.bookmarks.FrequentlyVisitedSiteScore"];
    id v19 = v18;
  }

  return v18;
}

- (id)initFolderWithParentID:(int)a3 subtype:(int64_t)a4 deviceIdentifier:(id)a5 collectionType:(int64_t)a6
{
  id v7 = [(WebBookmark *)self initFolderWithParentID:*(void *)&a3 deviceIdentifier:a5 collectionType:a6];
  id v8 = v7;
  if (v7)
  {
    v7[17] = a4;
    id v9 = v7;
  }

  return v8;
}

- (id)initFolderWithParentID:(int)a3 collectionType:(int64_t)a4
{
  return [(WebBookmark *)self initFolderWithParentID:*(void *)&a3 deviceIdentifier:0 collectionType:a4];
}

- (id)initFolderWithParentID:(int)a3 deviceIdentifier:(id)a4 collectionType:(int64_t)a5
{
  return [(WebBookmark *)self initWithTitle:&stru_26CC2ED50 address:&stru_26CC2ED50 parentID:*(void *)&a3 folder:1 deviceIdentifier:a4 collectionType:a5];
}

- (id)initBuiltinBookmarkWithTitle:(id)a3 address:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v4 = [(WebBookmark *)self initWithTitle:a3 address:a4 collectionType:0];
  if (v4)
  {
    id v9 = @"com.apple.bookmarks.IsBuiltinBookmark";
    v10[0] = MEMORY[0x263EFFA88];
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    localAttributes = v4->_localAttributes;
    v4->_localAttributes = (NSDictionary *)v5;

    id v7 = v4;
  }

  return v4;
}

- (id)initBuiltinDeviceBookmarkWithTitle:(id)a3 address:(id)a4
{
  BOOL v4 = [(WebBookmark *)self initWithTitle:a3 address:a4 collectionType:0];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_editable = 0;
    v4->_syncable = 0;
    localAttributes = v4->_localAttributes;
    if (localAttributes) {
      id v7 = (id)[(NSDictionary *)localAttributes mutableCopy];
    }
    else {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v8 = v7;
    [v7 setValue:MEMORY[0x263EFFA88] forKey:@"com.apple.bookmarks.IsBuiltinDeviceBookmark"];
    [(WebBookmark *)v5 setLocalAttributes:v8];
    id v9 = v5;
  }
  return v5;
}

- (id)initCarrierBookmarkWithTitle:(id)a3 address:(id)a4
{
  BOOL v4 = [(WebBookmark *)self initBuiltinDeviceBookmarkWithTitle:a3 address:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    objc_super v6 = (void *)v4[14];
    if (v6) {
      id v7 = (id)[v6 mutableCopy];
    }
    else {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v8 = v7;
    [v7 setValue:MEMORY[0x263EFFA88] forKey:@"com.apple.bookmarks.IsCarrierBookmark"];
    [v5 setLocalAttributes:v8];
    id v9 = v5;
  }
  return v5;
}

- (id)initWhiteListBookmarkWithTitle:(id)a3 address:(id)a4
{
  BOOL v4 = [(WebBookmark *)self initWithTitle:a3 address:a4 collectionType:0];
  uint64_t v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_editable = 0;
    v4->_addedLocally = 1;
    v4->_needsSyncUpdate = 0;
    objc_super v6 = v4;
  }

  return v5;
}

- (WebBookmark)init
{
  return [(WebBookmark *)self initWithTitle:&stru_26CC2ED50 address:0 parentID:0 folder:1 deviceIdentifier:0 collectionType:0];
}

- (NSString)description
{
  return (NSString *)[(WebBookmark *)self descriptionPreservingPrivacy:0];
}

- (NSString)localizedTitle
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = objc_alloc_init(MEMORY[0x263F663B8]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__WebBookmark_localizedTitle__block_invoke;
  v8[3] = &unk_2643D9B48;
  v8[4] = self;
  [v3 setHandler:v8];
  if (self->_id)
  {
    int specialID = self->_specialID;
    if (specialID == 2)
    {
      uint64_t v4 = WebBookmarksBookmarksMenuFolderTitle();
    }
    else if (specialID == 1)
    {
      uint64_t v4 = WebBookmarksBookmarksBarFolderTitle();
    }
    else if (specialID == 3)
    {
      uint64_t v4 = WebBookmarksReadingListFolderTitle();
    }
    else
    {
      if (specialID == 4) {
        WebBookmarksWebFilterAllowedSitesFolderTitle();
      }
      else {
      uint64_t v4 = [(WebBookmark *)self title];
      }
    }
  }
  else
  {
    uint64_t v4 = WebBookmarksRootBookmarkTitle();
  }
  objc_super v6 = (void *)v4;

  return (NSString *)v6;
}

uint64_t __29__WebBookmark_localizedTitle__block_invoke()
{
  return os_unfair_recursive_lock_unlock();
}

- (BOOL)isBookmarksBarFolder
{
  LOBYTE(self) = self->_specialID == 1;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isBookmarksMenuFolder
{
  LOBYTE(self) = self->_specialID == 2;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isWebFilterAllowedSitesFolder
{
  LOBYTE(self) = self->_specialID == 4;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isFrequentlyVisitedSitesFolder
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_folder && self->_subtype == 5;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)isBuiltinBookmark
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = [(NSDictionary *)self->_localAttributes objectForKeyedSubscript:@"com.apple.bookmarks.IsBuiltinBookmark"];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(NSDictionary *)self->_localAttributes objectForKeyedSubscript:@"com.apple.bookmarks.IsBuiltinDeviceBookmark"];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      objc_super v6 = [(NSDictionary *)self->_localAttributes objectForKeyedSubscript:@"com.apple.bookmarks.IsCarrierBookmark"];
      BOOL v4 = v6 != 0;
    }
  }

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (void)setServerID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__WebBookmark_setServerID___block_invoke;
  v6[3] = &unk_2643D9CF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

uint64_t __27__WebBookmark_setServerID___block_invoke(uint64_t a1)
{
  uint64_t result = WBSIsEqual();
  if ((result & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) copy];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v6 = *MEMORY[0x263F66420];
    uint64_t result = [*(id *)(a1 + 40) isEqualToString:*MEMORY[0x263F66420]];
    if (result)
    {
      id v7 = *(void **)(a1 + 32);
      return [v7 _setUUID:v6];
    }
  }
  return result;
}

- (void)markSpecial:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __27__WebBookmark_markSpecial___block_invoke;
  v3[3] = &unk_2643DA5E0;
  v3[4] = self;
  int v4 = a3;
  [(WebBookmark *)self performWithFieldsWriteLock:v3];
}

uint64_t __27__WebBookmark_markSpecial___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 64) = 0;
  *(unsigned char *)(*(void *)(result + 32) + 65) = 0;
  *(_DWORD *)(*(void *)(result + 32) + 124) = *(_DWORD *)(result + 40);
  return result;
}

- (int64_t)itemType
{
  os_unfair_recursive_lock_lock_with_options();
  int64_t folder = self->_folder;
  os_unfair_recursive_lock_unlock();
  return folder;
}

- (int64_t)bookmarkType
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = objc_alloc_init(MEMORY[0x263F663B8]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__WebBookmark_bookmarkType__block_invoke;
  v6[3] = &unk_2643D9B48;
  void v6[4] = self;
  [v3 setHandler:v6];
  if ([(WebBookmark *)self isReadingListItem]) {
    int64_t v4 = 1;
  }
  else {
    int64_t v4 = 2 * (self->_subtype == 1);
  }

  return v4;
}

uint64_t __27__WebBookmark_bookmarkType__block_invoke()
{
  return os_unfair_recursive_lock_unlock();
}

- (int64_t)folderType
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = objc_alloc_init(MEMORY[0x263F663B8]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __25__WebBookmark_folderType__block_invoke;
  v8[3] = &unk_2643D9B48;
  v8[4] = self;
  [v3 setHandler:v8];
  int specialID = self->_specialID;
  if (specialID != 4)
  {
    switch(specialID)
    {
      case 1:
        int64_t v5 = 1;
        goto LABEL_11;
      case 2:
        int64_t v5 = 2;
        goto LABEL_11;
      case 3:
        int64_t v5 = 3;
        goto LABEL_11;
    }
    unint64_t v6 = self->_subtype - 1;
    if (v6 <= 3)
    {
      int64_t v5 = qword_21C0E8F48[v6];
      goto LABEL_11;
    }
  }
  int64_t v5 = 0;
LABEL_11:

  return v5;
}

uint64_t __25__WebBookmark_folderType__block_invoke()
{
  return os_unfair_recursive_lock_unlock();
}

- (NSNumber)isSelectedFavoritesFolder
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(WBSCRDTField *)self->_isSelectedFavoritesFolderField value];
  os_unfair_recursive_lock_unlock();
  return (NSNumber *)v3;
}

- (void)setSelectedFavoritesFolder:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__WebBookmark_setSelectedFavoritesFolder___block_invoke;
  v6[3] = &unk_2643D9CF8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __42__WebBookmark_setSelectedFavoritesFolder___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) isSelectedFavoritesFolder];
  char v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 40) + 208) setValue:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 40) + 208) incrementGenerationIfNeeded];
    *(unsigned char *)(*(void *)(a1 + 40) + 154) = 1;
    id v4 = *(void **)(a1 + 40);
    [v4 markAttributesAsModified:32];
  }
}

- (NSNumber)minimumSyncAPIVersion
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(WBSCRDTField *)self->_minimumSyncAPIVersionField value];
  os_unfair_recursive_lock_unlock();
  return (NSNumber *)v3;
}

- (void)setMinimumSyncAPIVersion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__WebBookmark_setMinimumSyncAPIVersion___block_invoke;
  v6[3] = &unk_2643D9CF8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __40__WebBookmark_setMinimumSyncAPIVersion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) integerValue];
  char v3 = [*(id *)(a1 + 40) minimumSyncAPIVersion];
  uint64_t v4 = [v3 integerValue];

  if (v2 != v4)
  {
    [*(id *)(*(void *)(a1 + 40) + 240) setValue:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 40) + 240) incrementGenerationIfNeeded];
    *(unsigned char *)(*(void *)(a1 + 40) + 154) = 1;
    id v5 = *(void **)(a1 + 40);
    [v5 markAttributesAsModified:0x8000];
  }
}

- (NSNumber)syncState
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(WBSCRDTField *)self->_syncStateField value];
  os_unfair_recursive_lock_unlock();
  return (NSNumber *)v3;
}

- (void)setSyncState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__WebBookmark_setSyncState___block_invoke;
  v6[3] = &unk_2643D9CF8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __28__WebBookmark_setSyncState___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) integerValue];
  char v3 = [*(id *)(a1 + 40) syncState];
  uint64_t v4 = [v3 integerValue];

  if (v2 != v4)
  {
    [*(id *)(*(void *)(a1 + 40) + 256) setValue:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 40) + 256) incrementGenerationIfNeeded];
    *(unsigned char *)(*(void *)(a1 + 40) + 154) = 1;
    id v5 = *(void **)(a1 + 40);
    [v5 markAttributesAsModified:0x4000];
  }
}

- (NSNumber)backgroundImageModifiedState
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(WBSCRDTField *)self->_backgroundImageModifiedField value];
  os_unfair_recursive_lock_unlock();
  return (NSNumber *)v3;
}

- (void)setBackgroundImageModifiedState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__WebBookmark_setBackgroundImageModifiedState___block_invoke;
  v6[3] = &unk_2643D9CF8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __47__WebBookmark_setBackgroundImageModifiedState___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) integerValue];
  char v3 = [*(id *)(a1 + 40) backgroundImageModifiedState];
  uint64_t v4 = [v3 integerValue];

  if (v2 != v4)
  {
    [*(id *)(*(void *)(a1 + 40) + 176) setValue:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 40) + 176) incrementGenerationIfNeeded];
    *(unsigned char *)(*(void *)(a1 + 40) + 154) = 1;
    id v5 = *(void **)(a1 + 40);
    [v5 markAttributesAsModified:0x2000];
  }
}

- (WBSCRDTGeneration)backgroundImageGeneration
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(WBSCRDTField *)self->_backgroundImageModifiedField generation];
  os_unfair_recursive_lock_unlock();
  return (WBSCRDTGeneration *)v3;
}

- (BOOL)isDeleted
{
  return [(WebBookmark *)self parentID] == -1;
}

- (NSString)creationDeviceIdentifier
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(NSDictionary *)self->_extraAttributes objectForKeyedSubscript:@"CreationDeviceIdentifier"];
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

- (void)setCreationDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__WebBookmark_setCreationDeviceIdentifier___block_invoke;
  v6[3] = &unk_2643D9CF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

uint64_t __43__WebBookmark_setCreationDeviceIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExtraAttributesValue:*(void *)(a1 + 40) forKey:@"CreationDeviceIdentifier"];
}

- (NSDate)dateLastViewed
{
  if ([(WebBookmark *)self isReadingListItem]) {
    [(WebBookmark *)self readingListDateLastViewed];
  }
  else {
  char v3 = [(WebBookmark *)self tabDateLastViewed];
  }
  return (NSDate *)v3;
}

- (NSNumber)frequentlyVisitedSiteScore
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(NSDictionary *)self->_localAttributes objectForKeyedSubscript:@"com.apple.bookmarks.FrequentlyVisitedSiteScore"];
  os_unfair_recursive_lock_unlock();
  return (NSNumber *)v3;
}

- (NSString)deviceTypeIdentifier
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(NSDictionary *)self->_extraAttributes objectForKeyedSubscript:@"DeviceTypeIdentifier"];
  os_unfair_recursive_lock_unlock();
  return (NSString *)v3;
}

- (void)setDeviceTypeIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__WebBookmark_setDeviceTypeIdentifier___block_invoke;
  v6[3] = &unk_2643D9CF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

uint64_t __39__WebBookmark_setDeviceTypeIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExtraAttributesValue:*(void *)(a1 + 40) forKey:@"DeviceTypeIdentifier"];
}

- (NSDate)tabDateLastViewed
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(WBSCRDTField *)self->_tabDateLastViewedField value];
  os_unfair_recursive_lock_unlock();
  return (NSDate *)v3;
}

- (void)setTabDateLastViewed:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__WebBookmark_setTabDateLastViewed___block_invoke;
  v6[3] = &unk_2643D9CF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __36__WebBookmark_setTabDateLastViewed___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 296) value];
  char v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 296) setValue:*(void *)(a1 + 40) incrementGenerationIfNeeded:1];
    [*(id *)(a1 + 32) markAttributesAsModified:8];
    *(unsigned char *)(*(void *)(a1 + 32) + 154) = 1;
  }
}

- (void)setLocalAttributesValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __46__WebBookmark_setLocalAttributesValue_forKey___block_invoke;
  v10[3] = &unk_2643DA608;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(WebBookmark *)self performWithFieldsWriteLock:v10];
}

void __46__WebBookmark_setLocalAttributesValue_forKey___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 112);
  if (v2)
  {
    char v3 = (void *)[v2 mutableCopy];
  }
  else
  {
    char v3 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v7 = v3;
  [v3 setObject:a1[6] forKeyedSubscript:a1[5]];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = a1[4];
  id v6 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v4;
}

- (void)setSymbolImageName:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__WebBookmark_setSymbolImageName___block_invoke;
  v6[3] = &unk_2643D9CF8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __34__WebBookmark_setSymbolImageName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) symbolImageName];
  char v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    id v4 = (void *)[*(id *)(a1 + 32) copy];
    [*(id *)(*(void *)(a1 + 40) + 264) setValue:v4];

    [*(id *)(*(void *)(a1 + 40) + 264) incrementGenerationIfNeeded];
    *(unsigned char *)(*(void *)(a1 + 40) + 154) = 1;
    id v5 = *(void **)(a1 + 40);
    [v5 markAttributesAsModified:4096];
  }
}

- (void)setCustomFavoritesFolderServerID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WebBookmark_setCustomFavoritesFolderServerID___block_invoke;
  v6[3] = &unk_2643D9CF8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __48__WebBookmark_setCustomFavoritesFolderServerID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) customFavoritesFolderServerID];
  char v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    id v4 = (void *)[*(id *)(a1 + 32) copy];
    [*(id *)(*(void *)(a1 + 40) + 272) setValue:v4];

    [*(id *)(*(void *)(a1 + 40) + 272) incrementGenerationIfNeeded];
    *(unsigned char *)(*(void *)(a1 + 40) + 154) = 1;
    id v5 = *(void **)(a1 + 40);
    [v5 markAttributesAsModified:0x40000];
  }
}

- (NSData)startPageSectionsDataRepresentation
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(WBSCRDTField *)self->_startPageSectionsDataField value];
  os_unfair_recursive_lock_unlock();
  return (NSData *)v3;
}

- (void)setStartPageSectionsDataRepresentation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__WebBookmark_setStartPageSectionsDataRepresentation___block_invoke;
  v6[3] = &unk_2643D9CF8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __54__WebBookmark_setStartPageSectionsDataRepresentation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) startPageSectionsDataRepresentation];
  char v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    id v4 = (void *)[*(id *)(a1 + 32) copy];
    [*(id *)(*(void *)(a1 + 40) + 280) setValue:v4];

    [*(id *)(*(void *)(a1 + 40) + 280) incrementGenerationIfNeeded];
    *(unsigned char *)(*(void *)(a1 + 40) + 154) = 1;
    id v5 = *(void **)(a1 + 40);
    [v5 markAttributesAsModified:0x80000];
  }
}

- (BOOL)showIconOnly
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(WBSCRDTField *)self->_showIconOnlyField value];
  char v4 = [v3 BOOLValue];

  os_unfair_recursive_lock_unlock();
  return v4;
}

- (void)setShowIconOnly:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __31__WebBookmark_setShowIconOnly___block_invoke;
  v3[3] = &unk_2643DA368;
  BOOL v4 = a3;
  v3[4] = self;
  [(WebBookmark *)self performWithFieldsWriteLock:v3];
}

uint64_t __31__WebBookmark_setShowIconOnly___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) showIconOnly];
  if (v2 != result)
  {
    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 288);
    id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    [v4 setValue:v5 incrementGenerationIfNeeded:1];

    *(unsigned char *)(*(void *)(a1 + 32) + 154) = 1;
    id v6 = *(void **)(a1 + 32);
    return [v6 markAttributesAsModified:0x200000];
  }
  return result;
}

- (WBSCRDTPosition)syncPosition
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = [(WBSCRDTField *)self->_locationField value];
  BOOL v4 = [v3 position];

  os_unfair_recursive_lock_unlock();
  return (WBSCRDTPosition *)v4;
}

- (void)setSyncPosition:(id)a3
{
}

- (void)setSyncPosition:(id)a3 incrementGeneration:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__WebBookmark_setSyncPosition_incrementGeneration___block_invoke;
  v8[3] = &unk_2643DA5B8;
  id v9 = v6;
  long long v10 = self;
  BOOL v11 = a4;
  id v7 = v6;
  [(WebBookmark *)self performWithFieldsWriteLock:v8];
}

void __51__WebBookmark_setSyncPosition_incrementGeneration___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 40) syncPosition];
  char v3 = WBSIsEqual();

  if ((v3 & 1) == 0)
  {
    BOOL v4 = [*(id *)(*(void *)(a1 + 40) + 232) value];
    id v5 = [v4 locationWithPosition:*(void *)(a1 + 32)];

    [*(id *)(*(void *)(a1 + 40) + 232) setValue:v5 incrementGenerationIfNeeded:*(unsigned __int8 *)(a1 + 48)];
    *(unsigned char *)(*(void *)(a1 + 40) + 154) = 1;
    [*(id *)(a1 + 40) markAttributesAsModified:4];
  }
}

- (void)setPinned:(BOOL)a3 title:(id)a4 address:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__WebBookmark_setPinned_title_address___block_invoke;
  v12[3] = &unk_2643DA630;
  BOOL v15 = a3;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(WebBookmark *)self performWithFieldsWriteLock:v12];
}

void __39__WebBookmark_setPinned_title_address___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  if (v2 != [*(id *)(a1 + 32) isPinned])
  {
    char v3 = [*(id *)(*(void *)(a1 + 32) + 216) value];
    id v8 = [v3 labelWithPinned:*(unsigned __int8 *)(a1 + 56)];

    [*(id *)(*(void *)(a1 + 32) + 216) setValue:v8 incrementGenerationIfNeeded:1];
    BOOL v4 = *(void **)(a1 + 32);
    id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    [v4 setExtraAttributesValue:v5 forKey:@"IsPinned"];

    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v6 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v6 = 0;
    }
    [*(id *)(a1 + 32) setExtraAttributesValue:v6 forKey:@"PinnedTitle"];
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v7 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v7 = 0;
    }
    [*(id *)(a1 + 32) setExtraAttributesValue:v7 forKey:@"PinnedAddress"];
    *(unsigned char *)(*(void *)(a1 + 32) + 154) = 1;
    [*(id *)(a1 + 32) markAttributesAsModified:0x10000];
  }
}

- (BOOL)isMarkedAsRead
{
  char v3 = [(WebBookmark *)self lastReadGeneration];
  if (v3)
  {
    BOOL v4 = [(WebBookmark *)self labelField];
    id v5 = [v4 generation];

    BOOL v6 = [v3 compare:v5] != -1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (WBSCRDTGeneration)lastReadGeneration
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = objc_alloc_init(MEMORY[0x263F663B8]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__WebBookmark_lastReadGeneration__block_invoke;
  v9[3] = &unk_2643D9B48;
  v9[4] = self;
  [v3 setHandler:v9];
  BOOL v4 = [(NSDictionary *)self->_extraAttributes objectForKeyedSubscript:@"ReadStatusGeneration"];
  uint64_t v5 = [(NSDictionary *)self->_extraAttributes objectForKeyedSubscript:@"DeviceIdentifier"];
  BOOL v6 = (void *)v5;
  uint64_t v7 = 0;
  if (v4 && v5) {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263F66610]), "initWithDeviceIdentifier:generation:", v5, objc_msgSend(v4, "unsignedIntegerValue"));
  }

  return (WBSCRDTGeneration *)v7;
}

uint64_t __33__WebBookmark_lastReadGeneration__block_invoke()
{
  return os_unfair_recursive_lock_unlock();
}

- (void)setLastReadGeneration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WebBookmark *)self lastReadGeneration];
  char v6 = WBSIsEqual();

  if ((v6 & 1) == 0)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__WebBookmark_setLastReadGeneration___block_invoke;
    v7[3] = &unk_2643DA658;
    id v8 = v4;
    [(WebBookmark *)self _updateExtraAttributeValuesUsingBlock:v7];
  }
}

uint64_t __37__WebBookmark_setLastReadGeneration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  char v6 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "generation"));
  [v5 setObject:v6 forKeyedSubscript:@"ReadStatusGeneration"];

  uint64_t v7 = [*(id *)(a1 + 32) deviceIdentifier];
  [v5 setObject:v7 forKeyedSubscript:@"DeviceIdentifier"];

  return 1;
}

- (void)markAsRead
{
  id v5 = [(WBSCRDTField *)self->_labelField generation];
  id v3 = [(WebBookmark *)self lastReadGeneration];
  char v4 = WBSIsEqual();

  if ((v4 & 1) == 0)
  {
    [(WebBookmark *)self setLastReadGeneration:v5];
    [(WebBookmark *)self markAttributesAsModified:0x20000];
  }
}

- (WebBookmark)initWithBookmark:(id)a3
{
  char v4 = (WebBookmark *)a3;

  return v4;
}

- (BOOL)needsSecureDelete
{
  return 0;
}

- (NSArray)modifiedFields
{
  return (NSArray *)[(WebBookmark *)self _fieldsForAttributes:self->_modifiedAttributes];
}

- (id)fieldForAttribute:(unint64_t)a3
{
  if (a3)
  {
    id v3 = -[WebBookmark _fieldsForAttributes:](self, "_fieldsForAttributes:");
    char v4 = [v3 firstObject];
  }
  else
  {
    char v4 = 0;
  }
  return v4;
}

- (void)getReadOnlyCachedBookmarkSyncDataUsingBlock:(id)a3
{
  id v5 = a3;
  id v6 = [(WebBookmark *)self wbSyncData];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)updateGenerationsInSyncData:(id)a3 forAttributes:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__WebBookmark_updateGenerationsInSyncData_forAttributes___block_invoke;
  v8[3] = &unk_2643DA680;
  id v9 = v6;
  unint64_t v10 = a4;
  void v8[4] = self;
  id v7 = v6;
  [(WebBookmark *)self performWithFieldsWriteLock:v8];
}

void __57__WebBookmark_updateGenerationsInSyncData_forAttributes___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v2 = objc_msgSend(*(id *)(a1 + 32), "_fieldsForAttributes:", *(void *)(a1 + 48), 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        id v9 = [v7 generation];
        unint64_t v10 = [*(id *)(a1 + 32) generationKeyForField:v7];
        [v8 setGeneration:v9 forKey:v10];

        [v7 setShouldIncrementGeneration:1];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (int64_t)_mergeFields:(id)a3 withFields:(id)a4 forBookmark:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v28 = 0;
  objc_super v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __51__WebBookmark__mergeFields_withFields_forBookmark___block_invoke;
  v17[3] = &unk_2643DA6D0;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  uint64_t v22 = &v24;
  uint64_t v23 = &v28;
  id v13 = v10;
  id v20 = v13;
  uint64_t v21 = self;
  [(WebBookmark *)self performWithFieldsWriteLock:v17];
  uint64_t v14 = v25[3];
  if (!v29[3])
  {
    if (v14)
    {
      int64_t v15 = 1;
      goto LABEL_7;
    }
LABEL_6:
    int64_t v15 = 2;
    goto LABEL_7;
  }
  if (v14) {
    goto LABEL_6;
  }
  int64_t v15 = 0;
LABEL_7:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

void __51__WebBookmark__mergeFields_withFields_forBookmark___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __51__WebBookmark__mergeFields_withFields_forBookmark___block_invoke_2;
  id v9 = &unk_2643DA6A8;
  long long v12 = *(_OWORD *)(a1 + 64);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v10 = v4;
  uint64_t v11 = v5;
  objc_msgSend(v2, "safari_enumerateZippedValuesWithArray:withBlock:", v3, &v6);
  *(unsigned char *)(*(void *)(a1 + 56) + 154) = *(void *)(*(void *)(a1 + 56) + 160) != 0;
  objc_msgSend(*(id *)(a1 + 48), "setNeedsSyncUpdate:", objc_msgSend(*(id *)(a1 + 48), "modifiedAttributes", v6, v7, v8, v9) != 0);
}

uint64_t __51__WebBookmark__mergeFields_withFields_forBookmark___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 mergeWithField:a3];
  if (v6 == -1)
  {
    uint64_t v7 = *(void *)(a1 + 48);
  }
  else
  {
    if (v6 != 1) {
      goto LABEL_6;
    }
    uint64_t v7 = *(void *)(a1 + 56);
  }
  ++*(void *)(*(void *)(v7 + 8) + 24);
LABEL_6:
  uint64_t v8 = 40;
  if (v6 == -1) {
    uint64_t v8 = 32;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + v8) + 160);
  uint64_t v10 = [*(id *)(a1 + 40) _attributesForField:v5];

  *(void *)(*(void *)(a1 + 40) + 160) = *(void *)(*(void *)(a1 + 40) + 160) & ~v10 | v10 & v9;
  uint64_t v11 = [*(id *)(a1 + 32) modifiedAttributes] & ~v10 | v10 & v9;
  long long v12 = *(void **)(a1 + 32);
  return [v12 setModifiedAttributes:v11];
}

- (void)mergeWithBookmark:(id)a3
{
  id v4 = a3;
  id v6 = [(WebBookmark *)self fields];
  id v5 = [v4 fields];
  [(WebBookmark *)self _mergeFields:v6 withFields:v5 forBookmark:v4];
}

- (int64_t)mergeAttributes:(unint64_t)a3 withBookmark:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(WebBookmark *)self _fieldsForAttributes:a3];
  uint64_t v8 = [v6 _fieldsForAttributes:a3];
  int64_t v9 = [(WebBookmark *)self _mergeFields:v7 withFields:v8 forBookmark:v6];

  return v9;
}

- (id)generationKeyForField:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"GenerationKey"];
}

- (void)clearModifiedAttributes
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38__WebBookmark_clearModifiedAttributes__block_invoke;
  v2[3] = &unk_2643D9B48;
  v2[4] = self;
  [(WebBookmark *)self performWithFieldsWriteLock:v2];
}

uint64_t __38__WebBookmark_clearModifiedAttributes__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 160) = 0;
  *(unsigned char *)(*(void *)(result + 32) + 154) = 0;
  return result;
}

- (BOOL)attributesMarkedAsModified:(unint64_t)a3
{
  LOBYTE(a3) = (a3 & ~self->_modifiedAttributes) == 0;
  os_unfair_recursive_lock_unlock();
  return a3;
}

- (void)lockFields
{
}

- (void)unlockFields
{
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (BOOL)wasLoadedFromDatabase
{
  return self->_loadedFromDatabase;
}

- (void)setNeedsSyncUpdate:(BOOL)a3
{
  self->_needsSyncUpdate = a3;
}

- (void)setFetchedIconData:(BOOL)a3
{
  self->_fetchedIconData = a3;
}

- (void)setIconData:(id)a3
{
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (BOOL)hasShareRecord
{
  return self->_hasShareRecord;
}

+ (NSDictionary)modifiedAttributesToFieldNames
{
  if (modifiedAttributesToFieldNames_onceToken != -1) {
    dispatch_once(&modifiedAttributesToFieldNames_onceToken, &__block_literal_global_215);
  }
  int v2 = (void *)modifiedAttributesToFieldNames_modifiedAttributesToFieldNames;
  return (NSDictionary *)v2;
}

void __55__WebBookmark_Internal__modifiedAttributesToFieldNames__block_invoke()
{
  v3[15] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CC3FF90;
  v2[1] = &unk_26CC3FFA8;
  v3[0] = @"Title";
  v3[1] = @"URL";
  v2[2] = &unk_26CC3FFC0;
  v2[3] = &unk_26CC3FFD8;
  v3[2] = @"Position";
  v3[3] = @"DateLastViewed";
  v2[4] = &unk_26CC3FFF0;
  void v2[5] = &unk_26CC40008;
  v3[4] = @"DateAdded";
  void v3[5] = @"IsSelectedFavoritesFolder";
  v2[6] = &unk_26CC40020;
  v2[7] = &unk_26CC40038;
  void v3[6] = @"ParentFolder";
  v3[7] = @"ImageURL";
  v2[8] = &unk_26CC40050;
  v2[9] = &unk_26CC40068;
  v3[8] = @"PreviewText";
  v3[9] = @"LastSelectedTab";
  v2[10] = &unk_26CC40080;
  v2[11] = &unk_26CC40098;
  v3[10] = @"SymbolImageName";
  v3[11] = @"CustomFavoritesFolderServerID";
  v2[12] = &unk_26CC400B0;
  v2[13] = &unk_26CC400C8;
  v3[12] = @"BackgroundImage";
  v3[13] = @"CustomStartPageSectionsData";
  v2[14] = &unk_26CC400E0;
  v3[14] = @"ShowIconOnly";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:15];
  int v1 = (void *)modifiedAttributesToFieldNames_modifiedAttributesToFieldNames;
  modifiedAttributesToFieldNames_modifiedAttributesToFieldNames = v0;
}

+ (id)_allowedSiteBookmarkWithTitle:(id)a3 address:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (unsigned char *)[objc_alloc((Class)a1) initWithTitle:v7 address:v6 collectionType:0];

  v8[65] = 0;
  v8[64] = 0;
  v8[80] = 1;
  v8[154] = 0;
  return v8;
}

- (WebBookmark)initWithDictionaryRepresentationForInMemoryChangeTracking:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)WebBookmark;
  id v5 = [(WebBookmark *)&v41 init];
  if (v5
    && (char v40 = 0,
        objc_msgSend(v4, "wb_numberForKey:isValid:", @"IsFolder", &v40),
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5->_int64_t folder = [v6 BOOLValue],
        v6,
        v40))
  {
    id v7 = objc_msgSend(v4, "wb_stringForKey:isValid:", @"Title", &v40);
    uint64_t v8 = (void *)[v7 copy];

    if (v40)
    {
      int64_t v9 = objc_msgSend(v4, "wb_stringForKey:isValid:", @"URL", &v40);
      uint64_t v10 = (void *)[v9 copy];

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v11 = objc_msgSend(v4, "wb_stringForKey:isValid:", @"UUID", &v40);
      uint64_t v12 = [v11 copy];
      UUID = v5->_UUID;
      v5->_UUID = (NSString *)v12;

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v14 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"IsEditable", &v40);
      v5->_editable = [v14 BOOLValue];

      if (!v40) {
        goto LABEL_26;
      }
      int64_t v15 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"IsDeletable", &v40);
      v5->_deletable = [v15 BOOLValue];

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v16 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"IsHidden", &v40);
      v5->_hidden = [v16 BOOLValue];

      if (!v40) {
        goto LABEL_26;
      }
      id v17 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"IsSyncable", &v40);
      v5->_syncable = [v17 BOOLValue];

      if (!v40) {
        goto LABEL_26;
      }
      id v18 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"IsLocallyAdded", &v40);
      v5->_addedLocally = [v18 BOOLValue];

      if (!v40) {
        goto LABEL_26;
      }
      id v19 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"BookmarkID", &v40);
      v5->_id = [v19 intValue];

      if (!v40) {
        goto LABEL_26;
      }
      id v20 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"ParentID", &v40);
      uint64_t v21 = [v20 intValue];

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v22 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"SpecialID", &v40);
      v5->_int specialID = [v22 intValue];

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v23 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"OrderIndex", &v40);
      v5->_orderIndex = [v23 unsignedIntValue];

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v24 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"IsInserted", &v40);
      v5->_inserted = [v24 BOOLValue];

      if (!v40) {
        goto LABEL_26;
      }
      v25 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"WasLoadedFromDatabase", &v40);
      v5->_loadedFromDatabase = [v25 BOOLValue];

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v26 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"NeedsSyncUpdate", &v40);
      v5->_needsSyncUpdate = [v26 BOOLValue];

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v27 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"UsedForInMemoryChangeTracking", &v40);
      v5->_usedForInMemoryChangeTracking = [v27 BOOLValue];

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v28 = objc_msgSend(v4, "wb_dictionaryForKey:isValid:", @"LocalAttributes", &v40);
      localAttributes = v5->_localAttributes;
      v5->_localAttributes = (NSDictionary *)v28;

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v30 = objc_msgSend(v4, "wb_dictionaryForKey:isValid:", @"ExtraAttributes", &v40);
      extraAttributes = v5->_extraAttributes;
      v5->_extraAttributes = (NSDictionary *)v30;

      if (!v40) {
        goto LABEL_26;
      }
      uint64_t v32 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"LastSelectedChildID", &v40);
      uint64_t v33 = [v32 intValue];

      if (v40)
      {
        uint64_t v34 = [[WBBookmarkLabel alloc] initWithTitle:v8 address:v10 pinned:[(WebBookmark *)v5 isPinned]];
        uint64_t v35 = [[WBBookmarkLocation alloc] initWithParentID:v21 position:0];
        [(WebBookmark *)v5 _setUpFieldsWithLabel:v34 lastSelectedChild:v33 location:v35 syncData:0];
        int v36 = objc_msgSend(v4, "wb_numberForKey:isValid:", @"Subtype", &v40);
        v5->_subtype = (int)[v36 intValue];

        if (v40
          && (objc_msgSend(v4, "wb_numberForKey:isValid:", @"CollectionType", &v40),
              int v37 = objc_claimAutoreleasedReturnValue(),
              v5->_collectionType = [v37 integerValue],
              v37,
              v40))
        {
          unsigned int v38 = v5;
        }
        else
        {
          unsigned int v38 = 0;
        }
      }
      else
      {
LABEL_26:
        unsigned int v38 = 0;
      }
    }
    else
    {
      unsigned int v38 = 0;
    }
  }
  else
  {
    unsigned int v38 = 0;
  }

  return v38;
}

- (WebBookmark)initWithCoder:(id)a3
{
  v56[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)WebBookmark;
  id v5 = [(WebBookmark *)&v53 init];
  if (v5)
  {
    v5->_int64_t folder = [v4 decodeBoolForKey:@"IsFolder"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerID"];
    serverID = v5->_serverID;
    v5->_serverID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Sync"];
    syncKey = v5->_syncKey;
    v5->_syncKey = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SyncData"];
    syncData = v5->_syncData;
    v5->_syncData = (NSData *)v12;

    v5->_editable = [v4 decodeBoolForKey:@"IsEditable"];
    v5->_deletable = [v4 decodeBoolForKey:@"IsDeletable"];
    v5->_hidden = [v4 decodeBoolForKey:@"IsHidden"];
    v5->_syncable = [v4 decodeBoolForKey:@"IsSyncable"];
    v5->_fetchedIconData = [v4 decodeBoolForKey:@"FetchedIconData"];
    v5->_addedLocally = [v4 decodeBoolForKey:@"IsLocallyAdded"];
    v5->_archiveStatus = [v4 decodeIntegerForKey:@"ArchiveStatus"];
    v5->_webFilterStatus = [v4 decodeIntegerForKey:@"WebFilterStatus"];
    id v14 = objc_alloc(MEMORY[0x263EFFA08]);
    v56[0] = objc_opt_class();
    v56[1] = objc_opt_class();
    v56[2] = objc_opt_class();
    int64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:3];
    uint64_t v16 = (void *)[v14 initWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"ExtraAttributes"];
    extraAttributes = v5->_extraAttributes;
    v5->_extraAttributes = (NSDictionary *)v17;

    id v19 = objc_alloc(MEMORY[0x263EFFA08]);
    v55[0] = objc_opt_class();
    v55[1] = objc_opt_class();
    v55[2] = objc_opt_class();
    v55[3] = objc_opt_class();
    v55[4] = objc_opt_class();
    v55[5] = objc_opt_class();
    v55[6] = objc_opt_class();
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:7];
    uint64_t v21 = (void *)[v19 initWithArray:v20];
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"LocalAttributes"];
    localAttributes = v5->_localAttributes;
    v5->_localAttributes = (NSDictionary *)v22;

    v5->_id = [v4 decodeInt32ForKey:@"BookmarkID"];
    v5->_int specialID = [v4 decodeInt32ForKey:@"SpecialID"];
    v5->_orderIndex = [v4 decodeInt32ForKey:@"OrderIndex"];
    v5->_inserted = [v4 decodeBoolForKey:@"IsInserted"];
    v5->_loadedFromDatabase = [v4 decodeBoolForKey:@"WasLoadedFromDatabase"];
    v5->_needsSyncUpdate = [v4 decodeBoolForKey:@"NeedsSyncUpdate"];
    v5->_modifiedAttributes = [v4 decodeInt64ForKey:@"ModifiedAttributes"];
    v5->_usedForInMemoryChangeTracking = [v4 decodeBoolForKey:@"UsedForInMemoryChangeTracking"];
    v5->_collectionType = [v4 decodeIntegerForKey:@"CollectionType"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceIdentifier"];
    [(WebBookmark *)v5 setDeviceIdentifier:v24];

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Title"];
    v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    uint64_t v48 = (void *)v25;
    uint64_t v26 = [[WBBookmarkLabel alloc] initWithTitle:v25 address:v47 pinned:[(WebBookmark *)v5 isPinned]];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastSelectedChildID"];
    uint64_t v28 = [v4 decodeInt32ForKey:@"ParentID"];
    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SyncPosition"];
    objc_super v29 = [[WBBookmarkLocation alloc] initWithParentID:v28 position:v44];
    [(WebBookmark *)v5 wbSyncData];
    v45 = v27;
    uint64_t v42 = v46 = v26;
    uint64_t v43 = v29;
    -[WebBookmark _setUpFieldsWithLabel:lastSelectedChild:location:syncData:](v5, "_setUpFieldsWithLabel:lastSelectedChild:location:syncData:", v26, [v27 intValue], v29, v42);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v30 = [(WebBookmark *)v5 fields];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v50;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v50 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void **)(*((void *)&v49 + 1) + 8 * v34);
          uint64_t v36 = objc_opt_class();
          int v37 = [(WebBookmark *)v5 generationKeyForField:v35];
          unsigned int v38 = [v4 decodeObjectOfClass:v36 forKey:v37];
          [v35 setGeneration:v38];

          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v32);
    }

    uint64_t v39 = [v42 shareRecord];
    v5->_hasShareRecord = v39 != 0;

    v5->_subtype = [v4 decodeIntegerForKey:@"Subtype"];
    char v40 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 encodeBool:self->_folder forKey:@"IsFolder"];
  [v4 encodeObject:self->_UUID forKey:@"UUID"];
  [v4 encodeObject:self->_serverID forKey:@"ServerID"];
  [v4 encodeObject:self->_syncKey forKey:@"Sync"];
  [v4 encodeObject:self->_syncData forKey:@"SyncData"];
  [v4 encodeBool:self->_editable forKey:@"IsEditable"];
  [v4 encodeBool:self->_deletable forKey:@"IsDeletable"];
  [v4 encodeBool:self->_hidden forKey:@"IsHidden"];
  [v4 encodeBool:self->_syncable forKey:@"IsSyncable"];
  [v4 encodeBool:self->_fetchedIconData forKey:@"FetchedIconData"];
  [v4 encodeBool:self->_addedLocally forKey:@"IsLocallyAdded"];
  [v4 encodeInteger:self->_archiveStatus forKey:@"ArchiveStatus"];
  [v4 encodeInteger:self->_webFilterStatus forKey:@"WebFilterStatus"];
  [v4 encodeObject:self->_extraAttributes forKey:@"ExtraAttributes"];
  [v4 encodeObject:self->_localAttributes forKey:@"LocalAttributes"];
  [v4 encodeInt32:self->_id forKey:@"BookmarkID"];
  [v4 encodeInt32:self->_specialID forKey:@"SpecialID"];
  [v4 encodeBool:self->_inserted forKey:@"IsInserted"];
  objc_msgSend(v4, "encodeBool:forKey:", -[WebBookmark wasLoadedFromDatabase](self, "wasLoadedFromDatabase"), @"WasLoadedFromDatabase");
  [v4 encodeBool:self->_needsSyncUpdate forKey:@"NeedsSyncUpdate"];
  [v4 encodeInt64:self->_modifiedAttributes forKey:@"ModifiedAttributes"];
  [v4 encodeBool:self->_usedForInMemoryChangeTracking forKey:@"UsedForInMemoryChangeTracking"];
  [v4 encodeInteger:self->_subtype forKey:@"Subtype"];
  [v4 encodeInteger:self->_collectionType forKey:@"CollectionType"];
  id v5 = [(WebBookmark *)self deviceIdentifier];
  [v4 encodeObject:v5 forKey:@"DeviceIdentifier"];

  uint64_t v6 = [(WebBookmark *)self title];
  [v4 encodeObject:v6 forKey:@"Title"];

  id v7 = [(WebBookmark *)self address];
  [v4 encodeObject:v7 forKey:@"URL"];

  uint64_t v8 = [(WBSCRDTField *)self->_lastSelectedChildField value];
  [v4 encodeObject:v8 forKey:@"LastSelectedChildID"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[WebBookmark parentID](self, "parentID"), @"ParentID");
  [v4 encodeInt32:self->_orderIndex forKey:@"OrderIndex"];
  int64_t v9 = [(WebBookmark *)self syncPosition];
  [v4 encodeObject:v9 forKey:@"SyncPosition"];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [(WebBookmark *)self fields];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        int64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = [v15 generation];
        uint64_t v17 = [(WebBookmark *)self generationKeyForField:v15];
        [v4 encodeObject:v16 forKey:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (NSDictionary)dictionaryRepresentationForInMemoryChangeTracking
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithBool:self->_folder];
  [v3 setObject:v4 forKeyedSubscript:@"IsFolder"];

  id v5 = [(WebBookmark *)self title];
  uint64_t v6 = (void *)[v5 copy];
  [v3 setObject:v6 forKeyedSubscript:@"Title"];

  id v7 = [(WebBookmark *)self address];
  uint64_t v8 = (void *)[v7 copy];
  [v3 setObject:v8 forKeyedSubscript:@"URL"];

  int64_t v9 = (void *)[(NSString *)self->_UUID copy];
  [v3 setObject:v9 forKeyedSubscript:@"UUID"];

  uint64_t v10 = [NSNumber numberWithBool:self->_editable];
  [v3 setObject:v10 forKeyedSubscript:@"IsEditable"];

  uint64_t v11 = [NSNumber numberWithBool:self->_deletable];
  [v3 setObject:v11 forKeyedSubscript:@"IsDeletable"];

  uint64_t v12 = [NSNumber numberWithBool:self->_hidden];
  [v3 setObject:v12 forKeyedSubscript:@"IsHidden"];

  uint64_t v13 = [NSNumber numberWithBool:self->_syncable];
  [v3 setObject:v13 forKeyedSubscript:@"IsSyncable"];

  id v14 = [NSNumber numberWithBool:self->_addedLocally];
  [v3 setObject:v14 forKeyedSubscript:@"IsLocallyAdded"];

  int64_t v15 = [NSNumber numberWithInt:self->_id];
  [v3 setObject:v15 forKeyedSubscript:@"BookmarkID"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", -[WebBookmark parentID](self, "parentID"));
  [v3 setObject:v16 forKeyedSubscript:@"ParentID"];

  uint64_t v17 = [NSNumber numberWithInt:self->_specialID];
  [v3 setObject:v17 forKeyedSubscript:@"SpecialID"];

  long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[WebBookmark orderIndex](self, "orderIndex"));
  [v3 setObject:v18 forKeyedSubscript:@"OrderIndex"];

  long long v19 = [NSNumber numberWithBool:self->_inserted];
  [v3 setObject:v19 forKeyedSubscript:@"IsInserted"];

  long long v20 = objc_msgSend(NSNumber, "numberWithBool:", -[WebBookmark wasLoadedFromDatabase](self, "wasLoadedFromDatabase"));
  [v3 setObject:v20 forKeyedSubscript:@"WasLoadedFromDatabase"];

  long long v21 = [NSNumber numberWithBool:self->_needsSyncUpdate];
  [v3 setObject:v21 forKeyedSubscript:@"NeedsSyncUpdate"];

  uint64_t v22 = [NSNumber numberWithBool:self->_usedForInMemoryChangeTracking];
  [v3 setObject:v22 forKeyedSubscript:@"UsedForInMemoryChangeTracking"];

  [v3 setObject:self->_localAttributes forKeyedSubscript:@"LocalAttributes"];
  [v3 setObject:self->_extraAttributes forKeyedSubscript:@"ExtraAttributes"];
  uint64_t v23 = [(WBSCRDTField *)self->_lastSelectedChildField value];
  [v3 setObject:v23 forKeyedSubscript:@"LastSelectedChildID"];

  uint64_t v24 = [NSNumber numberWithInteger:self->_collectionType];
  [v3 setObject:v24 forKeyedSubscript:@"CollectionType"];

  uint64_t v25 = [NSNumber numberWithInteger:self->_subtype];
  [v3 setObject:v25 forKeyedSubscript:@"Subtype"];

  return (NSDictionary *)v3;
}

- (void)_setServerID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__WebBookmark_Internal___setServerID___block_invoke;
  v6[3] = &unk_2643D9CF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __38__WebBookmark_Internal___setServerID___block_invoke(uint64_t a1)
{
}

- (void)_setHidden:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__WebBookmark_Internal___setHidden___block_invoke;
  v3[3] = &unk_2643DA368;
  v3[4] = self;
  BOOL v4 = a3;
  [(WebBookmark *)self performWithFieldsWriteLock:v3];
}

uint64_t __36__WebBookmark_Internal___setHidden___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 66) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)_usedForInMemoryChangeTracking
{
  LOBYTE(self) = self->_usedForInMemoryChangeTracking;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)_setUsedForInMemoryChangeTracking:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_usedForInMemoryChangeTracking = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setSyncKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__WebBookmark_Internal__setSyncKey___block_invoke;
  v6[3] = &unk_2643D9CF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

uint64_t __36__WebBookmark_Internal__setSyncKey___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) copy];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 40);
    *(void *)(v4 + 40) = v3;
    return MEMORY[0x270F9A758](v3, v5);
  }
  return result;
}

- (NSString)syncKey
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_syncKey;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setSyncData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__WebBookmark_Internal__setSyncData___block_invoke;
  v6[3] = &unk_2643D9CF8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __37__WebBookmark_Internal__setSyncData___block_invoke(uint64_t a1)
{
  if ((WBSIsEqual() & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = 0;
  }
}

- (NSData)syncData
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_syncData;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)_setSyncData:(id)a3 cachedWBSyncData:(id)a4
{
  id v6 = a4;
  [(WebBookmark *)self setSyncData:a3];
  os_unfair_recursive_lock_lock_with_options();
  id v7 = [v6 readOnlyProxy];

  cachedWBSyncData = self->_cachedWBSyncData;
  self->_cachedWBSyncData = v7;

  os_unfair_recursive_lock_unlock();
}

- (void)setSubtype:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_subtype = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)_updateExtraAttributeValuesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__WebBookmark_Internal___updateExtraAttributeValuesUsingBlock___block_invoke;
  v6[3] = &unk_2643D9E38;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

void __63__WebBookmark_Internal___updateExtraAttributeValuesUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 104) mutableCopy];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v8 = v4;

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    uint64_t v5 = [v8 copy];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 104);
    *(void *)(v6 + 104) = v5;
  }
}

id __58__WebBookmark_Internal__isSelectedFavoritesFolderProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = [v2[13] objectForKeyedSubscript:@"com.apple.bookmarks.SelectedFavoritesFolder"];
  os_unfair_recursive_lock_unlock();

  return v3;
}

uint64_t __55__WebBookmark_Internal__selectedFavoritesFolderUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setExtraAttributesValue:a3 forKey:@"com.apple.bookmarks.SelectedFavoritesFolder"];
}

id __45__WebBookmark_Internal__showIconOnlyProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = [v2[13] objectForKeyedSubscript:@"ShowIconOnly"];
  os_unfair_recursive_lock_unlock();

  return v3;
}

uint64_t __44__WebBookmark_Internal__showIconOnlyUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setExtraAttributesValue:a3 forKey:@"ShowIconOnly"];
}

id __50__WebBookmark_Internal__tabDateLastViewedProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = [v2[13] objectForKeyedSubscript:@"DateLastViewed"];
  os_unfair_recursive_lock_unlock();

  return v3;
}

uint64_t __49__WebBookmark_Internal__tabDateLastViewedUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setExtraAttributesValue:a3 forKey:@"DateLastViewed"];
}

id __61__WebBookmark_Internal__backgroundImageModifiedStateProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = [v2[13] objectForKeyedSubscript:@"BackgroundImageModifiedState"];
  os_unfair_recursive_lock_unlock();

  return v3;
}

uint64_t __60__WebBookmark_Internal__backgroundImageModifiedStateUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setExtraAttributesValue:a3 forKey:@"BackgroundImageModifiedState"];
}

uint64_t __47__WebBookmark_Internal__symbolImageNameUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setExtraAttributesValue:a3 forKey:@"SymbolImageName"];
}

uint64_t __61__WebBookmark_Internal__customFavoritesFolderServerIDUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setExtraAttributesValue:a3 forKey:@"CustomFavoritesFolderServerID"];
}

id __60__WebBookmark_Internal__customStartPageSectionsDataProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = [v2[13] objectForKeyedSubscript:@"StartPageSectionsData"];
  os_unfair_recursive_lock_unlock();

  return v3;
}

uint64_t __59__WebBookmark_Internal__customStartPageSectionsDataUpdater__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setExtraAttributesValue:a3 forKey:@"StartPageSectionsData"];
}

- (unint64_t)_attributesForField:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"Attributes"];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (WBSCRDTField)labelField
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_labelField;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (WBSCRDTField)locationField
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_locationField;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)_fieldsForAttributes:(unint64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v5 = [(WebBookmark *)self fields];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__WebBookmark_Internal___fieldsForAttributes___block_invoke;
  v8[3] = &unk_2643DB928;
  void v8[4] = self;
  void v8[5] = a3;
  uint64_t v6 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v8);

  os_unfair_recursive_lock_unlock();
  return v6;
}

BOOL __46__WebBookmark_Internal___fieldsForAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  return ([*(id *)(a1 + 32) _attributesForField:a2] & v2) != 0;
}

- (id)initReadingListBookmarkWithTitle:(id)a3 address:(id)a4 previewText:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(WebBookmark *)self initWithTitle:a3 address:v8 collectionType:0];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    [v11 setValue:v9 forKey:@"PreviewText"];
    uint64_t v12 = [MEMORY[0x263EFF910] date];
    [v11 setValue:v12 forKey:@"DateAdded"];

    uint64_t v13 = +[WBWebFilterSettings sharedWebFilterSettings];
    id v14 = [v13 userSettings];
    int64_t v15 = [NSURL URLWithString:v8];
    int v16 = [v14 contentFilterListsAllowURL:v15];

    if (v16) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    [(WebBookmark *)v10 setWebFilterStatus:v17];
    long long v18 = [NSDictionary dictionaryWithObject:v11 forKey:@"com.apple.ReadingList"];
    [(WebBookmark *)v10 setExtraAttributes:v18];

    long long v19 = v10;
  }

  return v10;
}

- (NSString)previewText
{
  return (NSString *)[(WBSCRDTField *)self->_previewTextField value];
}

- (void)setPreviewText:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__WebBookmark_ReadingList__setPreviewText___block_invoke;
  v6[3] = &unk_2643DB988;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

uint64_t __43__WebBookmark_ReadingList__setPreviewText___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 248) setValue:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 248);
  return [v2 incrementGenerationIfNeeded];
}

- (void)setAddedLocally:(BOOL)a3
{
  self->_addedLocally = a3;
}

- (id)_stringForReadingListArchiveStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"ReadingListArchiveStatusPending";
  }
  else {
    return off_2643DBA38[a3 - 1];
  }
}

- (void)setArchiveStatus:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = (id)WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(WebBookmark *)self _stringForReadingListArchiveStatus:a3];
    id v7 = [(WebBookmark *)self UUID];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "Setting ReadingList item bookmark archive status to %{public}@ for bookmark with UUID %{public}@", (uint8_t *)&v8, 0x16u);
  }
  self->_archiveStatus = a3;
}

- (void)setWebFilterStatus:(int64_t)a3
{
  if (self->_webFilterStatus != a3) {
    self->_webFilterStatus = a3;
  }
}

- (NSDate)dateLastArchived
{
  return (NSDate *)[(WebBookmark *)self _readingListPropertyNamed:@"DateLastArchived"];
}

- (void)setDateLastArchived:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WebBookmark_ReadingList__setDateLastArchived___block_invoke;
  v6[3] = &unk_2643DB9B0;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self _modifyLocalReadingListAttributes:v6];
}

uint64_t __48__WebBookmark_ReadingList__setDateLastArchived___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(void *)(a1 + 32) forKey:@"DateLastArchived"];
}

- (NSString)readingListIconURL
{
  return (NSString *)[(WBSCRDTField *)self->_iconURLField value];
}

- (void)setReadingListIconURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__WebBookmark_ReadingList__setReadingListIconURL___block_invoke;
  v6[3] = &unk_2643DB988;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

uint64_t __50__WebBookmark_ReadingList__setReadingListIconURL___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 200) setValue:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 200);
  return [v2 incrementGenerationIfNeeded];
}

- (NSString)readingListIconUUID
{
  return (NSString *)[(WebBookmark *)self _readingListPropertyNamed:@"ReadingListIconUUID"];
}

- (void)setReadingListIconUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(WebBookmark *)self readingListIconUUID];
  if (v5 != v4 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__WebBookmark_ReadingList__setReadingListIconUUID___block_invoke;
    v6[3] = &unk_2643DB9B0;
    id v7 = v4;
    [(WebBookmark *)self _modifyLocalReadingListAttributes:v6];
  }
}

uint64_t __51__WebBookmark_ReadingList__setReadingListIconUUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(void *)(a1 + 32) forKey:@"ReadingListIconUUID"];
}

- (NSDate)dateAdded
{
  return (NSDate *)[(WBSCRDTField *)self->_dateAddedField value];
}

- (void)setDateAdded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__WebBookmark_ReadingList__setDateAdded___block_invoke;
  v6[3] = &unk_2643DB988;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

uint64_t __41__WebBookmark_ReadingList__setDateAdded___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 184) setValue:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 184);
  return [v2 incrementGenerationIfNeeded];
}

- (NSDate)readingListDateLastViewed
{
  return (NSDate *)[(WBSCRDTField *)self->_dateLastViewedField value];
}

- (void)setReadingListDateLastViewed:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__WebBookmark_ReadingList__setReadingListDateLastViewed___block_invoke;
  v6[3] = &unk_2643DB988;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self performWithFieldsWriteLock:v6];
}

uint64_t __57__WebBookmark_ReadingList__setReadingListDateLastViewed___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 192) setValue:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 192);
  return [v2 incrementGenerationIfNeeded];
}

- (NSDate)dateLastFetched
{
  return (NSDate *)[(WebBookmark *)self _readingListPropertyNamed:@"DateLastFetched"];
}

- (void)setDateLastFetched:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__WebBookmark_ReadingList__setDateLastFetched___block_invoke;
  v6[3] = &unk_2643DB9B0;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self _modifyExtraReadingListAttributes:v6];
}

uint64_t __47__WebBookmark_ReadingList__setDateLastFetched___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(void *)(a1 + 32) forKey:@"DateLastFetched"];
}

- (void)setTitle:(id)a3 previewText:(id)a4 dateLastFetched:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(WebBookmark *)self setTitle:a3];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__WebBookmark_ReadingList__setTitle_previewText_dateLastFetched___block_invoke;
  v12[3] = &unk_2643DB9D8;
  id v10 = v8;
  id v13 = v10;
  id v11 = v9;
  id v14 = v11;
  [(WebBookmark *)self _modifyExtraReadingListAttributes:v12];
}

void __65__WebBookmark_ReadingList__setTitle_previewText_dateLastFetched___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setValue:*(void *)(a1 + 32) forKey:@"PreviewText"];
  [v3 setValue:*(void *)(a1 + 40) forKey:@"DateLastFetched"];
}

- (void)setNextPageURLs:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__WebBookmark_ReadingList__setNextPageURLs___block_invoke;
  v6[3] = &unk_2643DB9B0;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self _modifyLocalReadingListAttributes:v6];
}

uint64_t __44__WebBookmark_ReadingList__setNextPageURLs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(void *)(a1 + 32) forKey:@"NextPageURLs"];
}

- (NSDictionary)nextPageURLs
{
  return (NSDictionary *)[(WebBookmark *)self _readingListPropertyNamed:@"NextPageURLs"];
}

- (NSString)localPreviewText
{
  return (NSString *)[(WebBookmark *)self _readingListPropertyNamed:@"LocalPreviewText"];
}

- (void)setLocalPreviewText:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WebBookmark_ReadingList__setLocalPreviewText___block_invoke;
  v6[3] = &unk_2643DB9B0;
  id v7 = v4;
  id v5 = v4;
  [(WebBookmark *)self _modifyLocalReadingListAttributes:v6];
}

uint64_t __48__WebBookmark_ReadingList__setLocalPreviewText___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(void *)(a1 + 32) forKey:@"LocalPreviewText"];
}

- (BOOL)hasFetchedMetadata
{
  uint64_t v2 = [(WebBookmark *)self _readingListPropertyNamed:@"HasFetchedMetadata"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setHasFetchedMetadata:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__WebBookmark_ReadingList__setHasFetchedMetadata___block_invoke;
  v3[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  BOOL v4 = a3;
  [(WebBookmark *)self _modifyLocalReadingListAttributes:v3];
}

void __50__WebBookmark_ReadingList__setHasFetchedMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  char v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  [v4 setValue:v3 forKey:@"HasFetchedMetadata"];
}

- (void)cleanUpRedundantPreviewText
{
  uint64_t v3 = [(WebBookmark *)self previewText];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(WebBookmark *)self localPreviewText];

    if (v5)
    {
      [(WebBookmark *)self _modifyLocalReadingListAttributes:&__block_literal_global_18];
    }
  }
}

uint64_t __55__WebBookmark_ReadingList__cleanUpRedundantPreviewText__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:@"LocalPreviewText"];
}

+ (id)_trimmedTitle:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 0xDD)
  {
    uint64_t v4 = [v3 substringToIndex:220];

    id v3 = (id)v4;
  }
  return v3;
}

+ (id)_trimmedPreviewText:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if ((unint64_t)[v5 length] >= 0xDD)
  {
    uint64_t v6 = [v5 substringToIndex:220];

    id v5 = (void *)v6;
  }
  id v7 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\s+", @" ", 1024, 0, objc_msgSend(v5, "length"));

  return v7;
}

- (id)webarchivePathInReaderForm:(BOOL)a3 fileExists:(BOOL *)a4
{
  BOOL v5 = a3;
  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v8 = +[WebBookmarkCollection readingListArchivesDirectoryPath];
  id v9 = [(WebBookmark *)self UUID];
  id v10 = [v8 stringByAppendingPathComponent:v9];

  id v11 = [v10 stringByAppendingPathComponent:@"/file"];
  if ([v7 fileExistsAtPath:v11 isDirectory:0])
  {
    uint64_t v12 = [v11 stringByResolvingSymlinksInPath];
  }
  else
  {
    if (v5) {
      id v13 = @"Reader.webarchive";
    }
    else {
      id v13 = @"Page.webarchive";
    }
    uint64_t v12 = [v10 stringByAppendingPathComponent:v13];
  }
  id v14 = (void *)v12;

  if (a4) {
    *a4 = [v7 fileExistsAtPath:v14 isDirectory:0];
  }

  return v14;
}

- (id)webarchivePathForNextPageURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WebBookmark *)self nextPageURLs];
  uint64_t v6 = objc_msgSend(v4, "_wb_userVisibleString");
  uint64_t v7 = [v5 objectForKey:v6];

  id v8 = [MEMORY[0x263F08850] defaultManager];
  int v9 = [v8 fileExistsAtPath:v7 isDirectory:0];

  if (v9) {
    id v10 = (void *)v7;
  }
  else {
    id v10 = 0;
  }
  if (v9) {
    id v11 = 0;
  }
  else {
    id v11 = (void *)v7;
  }

  return v10;
}

- (NSString)offlineArchiveDirectoryPath
{
  id v3 = +[WebBookmarkCollection readingListArchivesDirectoryPath];
  id v4 = [(WebBookmark *)self UUID];
  BOOL v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (unint64_t)_sizeForFileOrDirectory:(id)a3 withAttributes:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v21 = a4;
  unint64_t v6 = [v21 fileSize];
  uint64_t v7 = [v21 fileType];
  char v8 = [v7 isEqualToString:*MEMORY[0x263F080E0]];

  if (v8)
  {
    int v9 = [MEMORY[0x263F08850] defaultManager];
    id v26 = 0;
    long long v20 = [v9 subpathsOfDirectoryAtPath:v5 error:&v26];
    id v19 = v26;
    if (v19)
    {
      id v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WebBookmark(ReadingListArchives) _sizeForFileOrDirectory:withAttributes:]((uint64_t)v5, v10);
      }
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v20;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v11);
            }
            int64_t v15 = [v5 stringByAppendingPathComponent:*(void *)(*((void *)&v22 + 1) + 8 * i)];
            int v16 = [v9 attributesOfItemAtPath:v15 error:0];
            uint64_t v17 = [v16 fileSize];

            v6 += v17;
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v12);
      }
    }
  }

  return v6;
}

- (unint64_t)archiveSize
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = +[WebBookmarkCollection readingListArchivesDirectoryPath];
  id v5 = [(WebBookmark *)self UUID];
  unint64_t v6 = [v4 stringByAppendingPathComponent:v5];

  if ([v3 fileExistsAtPath:v6])
  {
    id v11 = 0;
    uint64_t v7 = [v3 attributesOfItemAtPath:v6 error:&v11];
    id v8 = v11;
    if (v8) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = [(WebBookmark *)self _sizeForFileOrDirectory:v6 withAttributes:v7];
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)_removeDirectoryAtPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  char v13 = 0;
  char v5 = [v4 fileExistsAtPath:v3 isDirectory:&v13];
  if (v13) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  if (v6)
  {
    id v12 = 0;
    char v7 = [v4 removeItemAtPath:v3 error:&v12];
    id v8 = v12;
    if (v7)
    {
      unint64_t v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v3;
        _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Deleted %{public}@ as a result of deleting the bookmark", buf, 0xCu);
      }
    }
    else
    {
      id v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = objc_msgSend(v8, "wb_privacyPreservingDescription");
        -[WebBookmark(ReadingListArchives) _removeDirectoryAtPath:]((uint64_t)v3, v11, buf, v10);
      }
    }
  }
}

- (void)clearArchive
{
  id v3 = [(WebBookmark *)self UUID];
  if ([v3 length])
  {
    id v4 = +[WebBookmarkCollection readingListArchivesDirectoryPath];
    char v5 = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__WebBookmark_ReadingListArchives__clearArchive__block_invoke;
    block[3] = &unk_2643D9C00;
    block[4] = self;
    id v8 = v4;
    id v9 = v3;
    id v6 = v4;
    dispatch_async(v5, block);
  }
}

void __48__WebBookmark_ReadingListArchives__clearArchive__block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) stringByAppendingPathComponent:*(void *)(a1 + 48)];
  objc_msgSend(v1, "_removeDirectoryAtPath:");
}

- (void)clearArchiveSynchronously
{
  id v3 = [(WebBookmark *)self UUID];
  id v4 = v3;
  if (v3)
  {
    char v7 = v3;
    id v3 = (void *)[v3 length];
    id v4 = v7;
    if (v3)
    {
      char v5 = +[WebBookmarkCollection readingListArchivesDirectoryPath];
      id v6 = [v5 stringByAppendingPathComponent:v7];
      [(WebBookmark *)self _removeDirectoryAtPath:v6];

      id v4 = v7;
    }
  }
  MEMORY[0x270F9A758](v3, v4);
}

- (BOOL)shouldReattemptArchiveWithAutomaticArchivingEnabled:(BOOL)a3
{
  unint64_t v3 = self->_archiveStatus - 1;
  if (v3 >= 6) {
    char v4 = a3;
  }
  else {
    char v4 = 0x24u >> v3;
  }
  return v4 & 1;
}

- (BOOL)isFullArchiveAvailable
{
  return (unint64_t)(self->_archiveStatus - 1) < 2;
}

- (BOOL)shouldArchive
{
  return self->_archiveStatus != 0;
}

- (void)setShouldArchive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v5 = (id)WBS_LOG_CHANNEL_PREFIXReadingList();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      char v7 = [(WebBookmark *)self UUID];
      int v10 = 138543362;
      id v11 = v7;
      _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "setShouldArchive: setting ReadingList item bookmark archive status to ReadingListArchiveStatusShouldArchive for bookmark with UUID %{public}@", (uint8_t *)&v10, 0xCu);
    }
    int64_t v8 = 6;
  }
  else
  {
    if (v6)
    {
      id v9 = [(WebBookmark *)self UUID];
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "setShouldArchive: setting ReadingList item bookmark archive status to ReadingListArchiveStatusPending for bookmark with UUID %{public}@", (uint8_t *)&v10, 0xCu);
    }
    int64_t v8 = 0;
  }

  self->_archiveStatus = v8;
}

- (id)_readingListPropertyNamed:(id)a3
{
  id v4 = a3;
  char v5 = [(WebBookmark *)self extraAttributes];
  BOOL v6 = [v5 objectForKeyedSubscript:@"com.apple.ReadingList"];
  char v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    int64_t v8 = [(WebBookmark *)self localAttributes];
    id v9 = [v8 objectForKeyedSubscript:@"com.apple.ReadingList"];
    char v7 = [v9 objectForKey:v4];
  }
  return v7;
}

- (void)_modifyExtraReadingListAttributes:(id)a3
{
  int64_t v8 = (void (**)(id, id))a3;
  id v4 = [(WebBookmark *)self extraAttributes];
  id v5 = (id)[v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  BOOL v6 = [v5 objectForKey:@"com.apple.ReadingList"];
  id v7 = (id)[v6 mutableCopy];

  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v8[2](v8, v7);
  [v5 setValue:v7 forKey:@"com.apple.ReadingList"];
  [(WebBookmark *)self setExtraAttributes:v5];
  self->_needsSyncUpdate = 1;
}

- (void)_modifyLocalReadingListAttributes:(id)a3
{
  int64_t v8 = (void (**)(id, id))a3;
  id v4 = [(WebBookmark *)self localAttributes];
  id v5 = (id)[v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  BOOL v6 = [v5 objectForKey:@"com.apple.ReadingList"];
  id v7 = (id)[v6 mutableCopy];

  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v8[2](v8, v7);
  [v5 setValue:v7 forKey:@"com.apple.ReadingList"];
  [(WebBookmark *)self setLocalAttributes:v5];
}

uint64_t __53__WebBookmark_ReadingListInternal__dateAddedProvider__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _readingListPropertyNamed:@"DateAdded"];
}

void __52__WebBookmark_ReadingListInternal__dateAddedUpdater__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__WebBookmark_ReadingListInternal__dateAddedUpdater__block_invoke_2;
  v7[3] = &unk_2643DBAD0;
  id v8 = v4;
  id v5 = v4;
  id v6 = a2;
  [v6 _modifyExtraReadingListAttributes:v7];
  [v6 markAttributesAsModified:16];
}

uint64_t __52__WebBookmark_ReadingListInternal__dateAddedUpdater__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:*(void *)(a1 + 32) forKey:@"DateAdded"];
}

uint64_t __58__WebBookmark_ReadingListInternal__dateLastViewedProvider__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _readingListPropertyNamed:@"DateLastViewed"];
}

void __57__WebBookmark_ReadingListInternal__dateLastViewedUpdater__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__WebBookmark_ReadingListInternal__dateLastViewedUpdater__block_invoke_2;
  v7[3] = &unk_2643DBAD0;
  id v8 = v4;
  id v5 = v4;
  id v6 = a2;
  [v6 _modifyExtraReadingListAttributes:v7];
  [v6 markAttributesAsModified:8];
}

uint64_t __57__WebBookmark_ReadingListInternal__dateLastViewedUpdater__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:*(void *)(a1 + 32) forKey:@"DateLastViewed"];
}

uint64_t __51__WebBookmark_ReadingListInternal__iconURLProvider__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _readingListPropertyNamed:@"ReadingListIconURL"];
}

void __50__WebBookmark_ReadingListInternal__iconURLUpdater__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__WebBookmark_ReadingListInternal__iconURLUpdater__block_invoke_2;
  v7[3] = &unk_2643DBAD0;
  id v8 = v4;
  id v5 = v4;
  id v6 = a2;
  [v6 _modifyExtraReadingListAttributes:v7];
  [v6 markAttributesAsModified:128];
}

uint64_t __50__WebBookmark_ReadingListInternal__iconURLUpdater__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:*(void *)(a1 + 32) forKey:@"ReadingListIconURL"];
}

uint64_t __55__WebBookmark_ReadingListInternal__previewTextProvider__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _readingListPropertyNamed:@"PreviewText"];
}

void __54__WebBookmark_ReadingListInternal__previewTextUpdater__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__WebBookmark_ReadingListInternal__previewTextUpdater__block_invoke_2;
  v7[3] = &unk_2643DBAD0;
  id v8 = v4;
  id v5 = v4;
  id v6 = a2;
  [v6 _modifyExtraReadingListAttributes:v7];
  [v6 markAttributesAsModified:256];
  [v6 cleanUpRedundantPreviewText];
}

uint64_t __54__WebBookmark_ReadingListInternal__previewTextUpdater__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:*(void *)(a1 + 32) forKey:@"PreviewText"];
}

void __58__WebBookmark_Internal___setParentID_incrementGeneration___block_invoke_cold_1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_21C043000, a2, OS_LOG_TYPE_ERROR, "Setting bookmark with identifier %d as its own parent", (uint8_t *)v3, 8u);
}

@end