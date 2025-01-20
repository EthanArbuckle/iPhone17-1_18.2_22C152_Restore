@interface PXProgrammaticNavigationDestination
- (BOOL)displayAlbumOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNavigationDestination:(id)a3;
- (BOOL)isEquivalentToNavigationDestination:(id)a3;
- (BOOL)isLemonadeHome;
- (BOOL)isTargetingAlbum;
- (BOOL)isTargetingAsset;
- (BOOL)renderAlbumAssetsWithDeferredProcessing;
- (BOOL)shouldExcludeSidebar;
- (BOOL)wantsEditMode;
- (NSArray)collectionHierarchy;
- (NSObject)additionalAttributes;
- (NSString)assetCollectionLocalIdentifier;
- (NSString)assetCollectionTransientIdentifier;
- (NSString)assetCollectionUUID;
- (NSString)assetLocalIdentifier;
- (NSString)assetUUID;
- (NSString)collectionListName;
- (NSString)collectionListUUID;
- (NSString)completionKey;
- (NSString)importSourceUUID;
- (NSString)libraryViewMode;
- (NSString)memoryCreationText;
- (NSString)personLocalIdentifier;
- (NSString)personUUID;
- (NSString)publicDescription;
- (NSString)shelfSlug;
- (NSString)socialGroupLocalIdentifier;
- (NSString)socialGroupUUID;
- (NSString)source;
- (PHCloudIdentifier)assetCloudIdentifier;
- (PHCloudIdentifier)assetCollectionCloudIdentifier;
- (PHImportSource)importSource;
- (PXDisplayAsset)asset;
- (PXDisplayAssetCollection)assetCollection;
- (PXDisplayCollection)collection;
- (PXDisplayCollectionList)collectionList;
- (PXDisplayPerson)person;
- (PXDisplaySocialGroup)socialGroup;
- (PXLemonadeNavigationDestinationProtocol)lemonadeNavigationDestination;
- (PXProgrammaticNavigationDestination)initWithImportSource:(id)a3 revealMode:(int64_t)a4;
- (PXProgrammaticNavigationDestination)initWithLemonadeNavigationDestination:(id)a3;
- (PXProgrammaticNavigationDestination)initWithObject:(id)a3 revealMode:(int64_t)a4;
- (PXProgrammaticNavigationDestination)initWithObject:(id)a3 revealMode:(int64_t)a4 sidebarNavigationBackButtonRootDestination:(id)a5;
- (PXProgrammaticNavigationDestination)initWithSearchTerm:(id)a3;
- (PXProgrammaticNavigationDestination)initWithSearchText:(id)a3;
- (PXProgrammaticNavigationDestination)initWithType:(int64_t)a3 revealMode:(int64_t)a4;
- (PXProgrammaticNavigationDestination)initWithType:(int64_t)a3 revealMode:(int64_t)a4 asset:(id)a5 assetCollection:(id)a6;
- (PXProgrammaticNavigationDestination)initWithType:(int64_t)a3 revealMode:(int64_t)a4 assetUUID:(id)a5 assetCollectionUUID:(id)a6;
- (PXProgrammaticNavigationDestination)initWithURL:(id)a3;
- (PXProgrammaticNavigationDestination)sidebarBackNavigationRootDestination;
- (id)description;
- (int64_t)assetCollectionSubtype;
- (int64_t)assetCollectionType;
- (int64_t)collectionListSubtype;
- (int64_t)collectionListType;
- (int64_t)openMode;
- (int64_t)revealMode;
- (int64_t)type;
- (unint64_t)hash;
- (unsigned)utilityCollectionType;
@end

@implementation PXProgrammaticNavigationDestination

- (PXProgrammaticNavigationDestination)initWithType:(int64_t)a3 revealMode:(int64_t)a4 assetUUID:(id)a5 assetCollectionUUID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = [(PXProgrammaticNavigationDestination *)self init];
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    v12->_revealMode = a4;
    uint64_t v14 = [v10 copy];
    assetUUID = v13->_assetUUID;
    v13->_assetUUID = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    assetCollectionUUID = v13->_assetCollectionUUID;
    v13->_assetCollectionUUID = (NSString *)v16;
  }
  return v13;
}

- (PXProgrammaticNavigationDestination)initWithType:(int64_t)a3 revealMode:(int64_t)a4
{
  return [(PXProgrammaticNavigationDestination *)self initWithType:a3 revealMode:a4 assetUUID:0 assetCollectionUUID:0];
}

- (BOOL)isTargetingAsset
{
  if ([(PXProgrammaticNavigationDestination *)self revealMode] != 1
    && [(PXProgrammaticNavigationDestination *)self revealMode] != 2)
  {
    return 0;
  }
  if ([(PXProgrammaticNavigationDestination *)self type] == 6
    || [(PXProgrammaticNavigationDestination *)self type] == 18)
  {
    return 1;
  }
  v4 = [(PXProgrammaticNavigationDestination *)self assetUUID];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    v5 = [(PXProgrammaticNavigationDestination *)self assetLocalIdentifier];
    if (v5)
    {
      BOOL v3 = 1;
    }
    else
    {
      v6 = [(PXProgrammaticNavigationDestination *)self assetCloudIdentifier];
      BOOL v3 = v6 != 0;
    }
  }

  return v3;
}

- (int64_t)revealMode
{
  return self->_revealMode;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryViewMode, 0);
  objc_storeStrong((id *)&self->_completionKey, 0);
  objc_storeStrong((id *)&self->_additionalAttributes, 0);
  objc_storeStrong((id *)&self->_sidebarBackNavigationRootDestination, 0);
  objc_storeStrong((id *)&self->_memoryCreationText, 0);
  objc_storeStrong((id *)&self->_lemonadeNavigationDestination, 0);
  objc_storeStrong((id *)&self->_shelfSlug, 0);
  objc_storeStrong((id *)&self->_importSource, 0);
  objc_storeStrong((id *)&self->_socialGroupLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_socialGroupUUID, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_collectionListName, 0);
  objc_storeStrong((id *)&self->_collectionListUUID, 0);
  objc_storeStrong((id *)&self->_assetCollectionTransientIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCollectionCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCollectionLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCollectionUUID, 0);
  objc_storeStrong((id *)&self->_assetCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_collectionHierarchy, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_userAlbumName, 0);
}

- (BOOL)shouldExcludeSidebar
{
  return self->_shouldExcludeSidebar;
}

- (NSString)libraryViewMode
{
  return self->_libraryViewMode;
}

- (NSString)completionKey
{
  return self->_completionKey;
}

- (BOOL)wantsEditMode
{
  return self->_wantsEditMode;
}

- (BOOL)displayAlbumOptions
{
  return self->_displayAlbumOptions;
}

- (BOOL)renderAlbumAssetsWithDeferredProcessing
{
  return self->_renderAlbumAssetsWithDeferredProcessing;
}

- (NSObject)additionalAttributes
{
  return self->_additionalAttributes;
}

- (PXProgrammaticNavigationDestination)sidebarBackNavigationRootDestination
{
  return self->_sidebarBackNavigationRootDestination;
}

- (NSString)memoryCreationText
{
  return self->_memoryCreationText;
}

- (PXLemonadeNavigationDestinationProtocol)lemonadeNavigationDestination
{
  return self->_lemonadeNavigationDestination;
}

- (NSString)shelfSlug
{
  return self->_shelfSlug;
}

- (PHImportSource)importSource
{
  return self->_importSource;
}

- (NSString)socialGroupLocalIdentifier
{
  return self->_socialGroupLocalIdentifier;
}

- (NSString)socialGroupUUID
{
  return self->_socialGroupUUID;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (NSString)personUUID
{
  return self->_personUUID;
}

- (int64_t)collectionListSubtype
{
  return self->_collectionListSubtype;
}

- (int64_t)collectionListType
{
  return self->_collectionListType;
}

- (NSString)collectionListName
{
  return self->_collectionListName;
}

- (NSString)collectionListUUID
{
  return self->_collectionListUUID;
}

- (unsigned)utilityCollectionType
{
  return self->_utilityCollectionType;
}

- (int64_t)assetCollectionSubtype
{
  return self->_assetCollectionSubtype;
}

- (int64_t)assetCollectionType
{
  return self->_assetCollectionType;
}

- (NSString)assetCollectionTransientIdentifier
{
  return self->_assetCollectionTransientIdentifier;
}

- (PHCloudIdentifier)assetCollectionCloudIdentifier
{
  return self->_assetCollectionCloudIdentifier;
}

- (NSString)assetCollectionLocalIdentifier
{
  return self->_assetCollectionLocalIdentifier;
}

- (NSString)assetCollectionUUID
{
  return self->_assetCollectionUUID;
}

- (PHCloudIdentifier)assetCloudIdentifier
{
  return self->_assetCloudIdentifier;
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (NSString)source
{
  return self->_source;
}

- (int64_t)openMode
{
  return self->_openMode;
}

- (NSString)publicDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = PXProgrammaticNavigationDestinationTypeDescription([(PXProgrammaticNavigationDestination *)self type]);
  unint64_t v7 = [(PXProgrammaticNavigationDestination *)self revealMode];
  if (v7 > 3) {
    v8 = @"?";
  }
  else {
    v8 = off_1E5DBCAC8[v7];
  }
  v9 = (void *)[v3 initWithFormat:@"<%@: %p, type=%@ revealMode=%@", v5, self, v6, v8];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXProgrammaticNavigationDestination_publicDescription__block_invoke;
  aBlock[3] = &unk_1E5DBC9A0;
  id v20 = v9;
  id v10 = v9;
  id v11 = (void (**)(void *, __CFString *, void *))_Block_copy(aBlock);
  v12 = [(PXProgrammaticNavigationDestination *)self assetLocalIdentifier];
  if ((((uint64_t (*)(void *, __CFString *, void *))v11[2])(v11, @"assetLocalIdentifier", v12) & 1) == 0)
  {
    v13 = [(PXProgrammaticNavigationDestination *)self assetUUID];
    v11[2](v11, @"assetUUID", v13);
  }
  uint64_t v14 = [(PXProgrammaticNavigationDestination *)self assetCollectionLocalIdentifier];
  if ((((uint64_t (*)(void *, __CFString *, void *))v11[2])(v11, @"assetCollectionLocalIdentifier", v14) & 1) == 0)
  {
    v15 = [(PXProgrammaticNavigationDestination *)self assetCollectionUUID];
    v11[2](v11, @"assetCollectionUUID", v15);
  }
  uint64_t v16 = [(PXProgrammaticNavigationDestination *)self collectionListUUID];
  v11[2](v11, @"collectionListUUID", v16);

  v17 = (void *)[v10 copy];
  return (NSString *)v17;
}

BOOL __56__PXProgrammaticNavigationDestination_publicDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    [*(id *)(a1 + 32) appendFormat:@" %@=%@", a2, a3];
  }
  return a3 != 0;
}

- (id)description
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = NSString;
  v5 = PXProgrammaticNavigationDestinationTypeDescription([(PXProgrammaticNavigationDestination *)self type]);
  v6 = [v4 stringWithFormat:@"type=%@", v5];
  v22[0] = v6;
  unint64_t v7 = NSString;
  unint64_t v8 = [(PXProgrammaticNavigationDestination *)self revealMode];
  if (v8 > 3) {
    v9 = @"?";
  }
  else {
    v9 = off_1E5DBCAC8[v8];
  }
  id v10 = [v7 stringWithFormat:@"revealMode=%@", v9];
  v22[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v12 = [v3 arrayWithArray:v11];

  if (([(PXProgrammaticNavigationDestination *)self type] & 0xFFFFFFFFFFFFFFFELL) == 0x1C)
  {
    uint64_t v13 = [(PXProgrammaticNavigationDestination *)self shelfSlug];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      v15 = [NSString stringWithFormat:@"shelfSlug=%@", v13];
      [v12 addObject:v15];
    }
  }
  uint64_t v16 = NSString;
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  v19 = [v12 componentsJoinedByString:@", "];
  id v20 = [v16 stringWithFormat:@"<%@: %p, %@>", v18, self, v19];

  return v20;
}

- (unint64_t)hash
{
  int64_t v3 = [(PXProgrammaticNavigationDestination *)self type];
  int64_t v4 = v3 ^ (4 * [(PXProgrammaticNavigationDestination *)self revealMode]);
  v5 = [(PXProgrammaticNavigationDestination *)self assetUUID];
  uint64_t v6 = [v5 hash];

  unint64_t v7 = [(PXProgrammaticNavigationDestination *)self assetLocalIdentifier];
  uint64_t v8 = v4 ^ v6 ^ [v7 hash];

  v9 = [(PXProgrammaticNavigationDestination *)self assetCollectionUUID];
  uint64_t v10 = [v9 hash];

  id v11 = [(PXProgrammaticNavigationDestination *)self assetCollectionLocalIdentifier];
  uint64_t v12 = v10 ^ [v11 hash];

  uint64_t v13 = [(PXProgrammaticNavigationDestination *)self collectionListUUID];
  unint64_t v14 = v8 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (PXProgrammaticNavigationDestination *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PXProgrammaticNavigationDestination *)self isEqualToNavigationDestination:v4];
  }

  return v5;
}

- (BOOL)isEqualToNavigationDestination:(id)a3
{
  id v4 = a3;
  if ([(PXProgrammaticNavigationDestination *)self isEquivalentToNavigationDestination:v4])
  {
    int64_t v5 = [(PXProgrammaticNavigationDestination *)self revealMode];
    BOOL v6 = v5 == [v4 revealMode];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEquivalentToNavigationDestination:(id)a3
{
  id v4 = (PXProgrammaticNavigationDestination *)a3;
  int64_t v5 = v4;
  if (!v4)
  {
LABEL_19:
    char v8 = 0;
    goto LABEL_20;
  }
  if (v4 != self)
  {
    int64_t v6 = [(PXProgrammaticNavigationDestination *)self type];
    if (v6 == [(PXProgrammaticNavigationDestination *)v5 type])
    {
      int64_t v7 = [(PXProgrammaticNavigationDestination *)self type];
      char v8 = 1;
      switch(v7)
      {
        case 7:
          id v9 = [(PXProgrammaticNavigationDestination *)self assetUUID];
          id v10 = [(PXProgrammaticNavigationDestination *)v5 assetUUID];
          if (v9 == v10)
          {
          }
          else
          {
            id v11 = v10;
            char v12 = [v9 isEqual:v10];

            if ((v12 & 1) == 0) {
              goto LABEL_19;
            }
          }
          v21 = [(PXProgrammaticNavigationDestination *)self assetLocalIdentifier];
          uint64_t v22 = [(PXProgrammaticNavigationDestination *)v5 assetLocalIdentifier];
          goto LABEL_29;
        case 8:
        case 9:
        case 18:
          goto LABEL_11;
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 19:
          goto LABEL_20;
        case 17:
          int64_t v19 = [(PXProgrammaticNavigationDestination *)self collectionListType];
          if (v19 != [(PXProgrammaticNavigationDestination *)v5 collectionListType]) {
            goto LABEL_19;
          }
          int64_t v20 = [(PXProgrammaticNavigationDestination *)self collectionListSubtype];
          if (v20 != [(PXProgrammaticNavigationDestination *)v5 collectionListSubtype]) {
            goto LABEL_19;
          }
          v21 = [(PXProgrammaticNavigationDestination *)self collectionListUUID];
          uint64_t v22 = [(PXProgrammaticNavigationDestination *)v5 collectionListUUID];
          goto LABEL_29;
        case 20:
          v21 = [(PXProgrammaticNavigationDestination *)self importSource];
          uint64_t v22 = [(PXProgrammaticNavigationDestination *)v5 importSource];
          goto LABEL_23;
        default:
          if (v7 == 31)
          {
            v21 = [(PXProgrammaticNavigationDestination *)self lemonadeNavigationDestination];
            uint64_t v22 = [(PXProgrammaticNavigationDestination *)v5 lemonadeNavigationDestination];
LABEL_23:
            if (v21 != (void *)v22)
            {
LABEL_30:
              v24 = (void *)v22;
              char v8 = [v21 isEqual:v22];
LABEL_33:

              goto LABEL_20;
            }
LABEL_32:
            v24 = v21;
            goto LABEL_33;
          }
          if (v7 != 32) {
            goto LABEL_20;
          }
LABEL_11:
          int64_t v13 = [(PXProgrammaticNavigationDestination *)self assetCollectionType];
          if (v13 == [(PXProgrammaticNavigationDestination *)v5 assetCollectionType])
          {
            int64_t v14 = [(PXProgrammaticNavigationDestination *)self assetCollectionSubtype];
            if (v14 == [(PXProgrammaticNavigationDestination *)v5 assetCollectionSubtype])
            {
              id v15 = [(PXProgrammaticNavigationDestination *)self assetCollectionUUID];
              id v16 = [(PXProgrammaticNavigationDestination *)v5 assetCollectionUUID];
              if (v15 == v16)
              {
              }
              else
              {
                v17 = v16;
                char v18 = [v15 isEqual:v16];

                if ((v18 & 1) == 0) {
                  goto LABEL_19;
                }
              }
              v21 = [(PXProgrammaticNavigationDestination *)self assetCollectionLocalIdentifier];
              uint64_t v22 = [(PXProgrammaticNavigationDestination *)v5 assetCollectionLocalIdentifier];
LABEL_29:
              if (v21 != (void *)v22) {
                goto LABEL_30;
              }
              char v8 = 1;
              goto LABEL_32;
            }
          }
          break;
      }
    }
    goto LABEL_19;
  }
  char v8 = 1;
LABEL_20:

  return v8;
}

- (NSString)importSourceUUID
{
  v2 = [(PXProgrammaticNavigationDestination *)self importSource];
  int64_t v3 = [v2 uuid];

  return (NSString *)v3;
}

- (PXDisplaySocialGroup)socialGroup
{
  v13[1] = *MEMORY[0x1E4F143B8];
  socialGroup = self->_socialGroup;
  if (!socialGroup)
  {
    id v4 = [(PXProgrammaticNavigationDestination *)self socialGroupUUID];
    int64_t v5 = [(PXProgrammaticNavigationDestination *)self socialGroupLocalIdentifier];
    if (!v5 && v4)
    {
      int64_t v5 = [MEMORY[0x1E4F39300] localIdentifierWithUUID:v4];
    }
    if (v5)
    {
      int64_t v6 = objc_msgSend(MEMORY[0x1E4F390A0], "px_standardFetchOptions");
      int64_t v7 = (void *)MEMORY[0x1E4F39300];
      v13[0] = v5;
      char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      id v9 = [v7 fetchSocialGroupsWithLocalIdentifiers:v8 options:v6];
      id v10 = [v9 firstObject];
      id v11 = self->_socialGroup;
      self->_socialGroup = v10;
    }
    socialGroup = self->_socialGroup;
  }
  return socialGroup;
}

- (PXDisplayPerson)person
{
  v14[1] = *MEMORY[0x1E4F143B8];
  person = self->_person;
  if (!person)
  {
    id v4 = [(PXProgrammaticNavigationDestination *)self personUUID];
    int64_t v5 = [(PXProgrammaticNavigationDestination *)self personLocalIdentifier];
    if (!v5 && v4)
    {
      int64_t v5 = [MEMORY[0x1E4F391F0] localIdentifierWithUUID:v4];
    }
    if (v5)
    {
      int64_t v6 = objc_msgSend(MEMORY[0x1E4F390A0], "px_standardFetchOptions");
      int64_t v7 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
      [v6 setIncludedDetectionTypes:v7];

      char v8 = (void *)MEMORY[0x1E4F391F0];
      v14[0] = v5;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      id v10 = [v8 fetchPersonsWithLocalIdentifiers:v9 options:v6];
      id v11 = [v10 firstObject];
      char v12 = self->_person;
      self->_person = v11;
    }
    person = self->_person;
  }
  return person;
}

- (NSArray)collectionHierarchy
{
  p_collectionHierarchy = &self->_collectionHierarchy;
  id v4 = (void *)[(NSArray *)self->_collectionHierarchy copy];
  if (!v4)
  {
    id v5 = [(PXProgrammaticNavigationDestination *)self collection];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v6 = v5;

      if (!v6)
      {
        id v4 = 0;
        goto LABEL_8;
      }
      int64_t v7 = objc_msgSend(v6, "px_fetchAncestryIncludingRoot:", 1);
      id v4 = (void *)[v7 copy];
    }
    else
    {
      id v6 = 0;
      id v4 = 0;
      int64_t v7 = v5;
    }

LABEL_8:
    objc_storeStrong((id *)p_collectionHierarchy, v4);
  }
  return (NSArray *)v4;
}

- (PXDisplayCollection)collection
{
  collection = self->_collection;
  if (!collection)
  {
    id v4 = [(PXProgrammaticNavigationDestination *)self assetCollection];
    if (!v4)
    {
      id v4 = [(PXProgrammaticNavigationDestination *)self collectionList];
    }
    id v5 = self->_collection;
    self->_collection = v4;

    collection = self->_collection;
  }
  return collection;
}

- (PXDisplayCollectionList)collectionList
{
  v24[1] = *MEMORY[0x1E4F143B8];
  collectionList = self->_collectionList;
  if (!collectionList)
  {
    id v4 = [(PXProgrammaticNavigationDestination *)self collectionListUUID];
    id v5 = [(PXProgrammaticNavigationDestination *)self collectionListName];
    id v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    if (v4)
    {
      int64_t v7 = [MEMORY[0x1E4F39008] localIdentifierWithUUID:v4];
      char v8 = (void *)MEMORY[0x1E4F39008];
      v24[0] = v7;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      id v10 = [v6 librarySpecificFetchOptions];
      id v11 = [v8 fetchCollectionListsWithLocalIdentifiers:v9 options:v10];
      char v12 = [v11 firstObject];
      int64_t v13 = self->_collectionList;
      self->_collectionList = v12;
    }
    else
    {
      if (!v5)
      {
        if ([(PXProgrammaticNavigationDestination *)self collectionListType])
        {
          v17 = (void *)MEMORY[0x1E4F39008];
          int64_t v18 = [(PXProgrammaticNavigationDestination *)self collectionListType];
          int64_t v19 = [(PXProgrammaticNavigationDestination *)self collectionListSubtype];
          int64_t v20 = [v6 librarySpecificFetchOptions];
          v21 = [v17 fetchCollectionListsWithType:v18 subtype:v19 options:v20];
          uint64_t v22 = [v21 firstObject];
          v23 = self->_collectionList;
          self->_collectionList = v22;
        }
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E4F39008], "px_transientIdentifierForWellKnownFolderName:", v5);
      int64_t v14 = (PXDisplayCollectionList *)objc_claimAutoreleasedReturnValue();
      int64_t v7 = v14;
      if (v14)
      {
        objc_msgSend(v6, "px_collectionListWithTransientIdentifier:", v14);
        int64_t v14 = (PXDisplayCollectionList *)objc_claimAutoreleasedReturnValue();
      }
      id v15 = self->_collectionList;
      self->_collectionList = v14;
    }
LABEL_9:

    collectionList = self->_collectionList;
  }
  return collectionList;
}

- (PXDisplayAssetCollection)assetCollection
{
  v29[1] = *MEMORY[0x1E4F143B8];
  assetCollection = self->_assetCollection;
  if (!assetCollection)
  {
    id v4 = [(PXProgrammaticNavigationDestination *)self assetCollectionUUID];
    id v5 = [(PXProgrammaticNavigationDestination *)self assetCollectionLocalIdentifier];
    if (!v5 && v4)
    {
      id v5 = [MEMORY[0x1E4F38EE8] localIdentifierWithUUID:v4];
    }
    id v6 = [(PXProgrammaticNavigationDestination *)self assetCollectionTransientIdentifier];
    int64_t v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    if (!v5)
    {
      char v8 = [(PXProgrammaticNavigationDestination *)self assetCollectionCloudIdentifier];
      id v9 = v8;
      if (v8)
      {
        id v5 = PXProgrammaticNavigationLocalIdentifierForCloudIdentifier(v8, v7);
      }
      else
      {
        id v5 = 0;
      }
    }
    id v10 = [v7 librarySpecificFetchOptions];
    id v11 = v10;
    if (v5)
    {
      [v10 setIncludeScreenRecordingsSmartAlbum:1];
      [v11 setIncludeLocalMemories:1];
      [v11 setIncludeStoryMemories:1];
      [v11 setIncludePendingMemories:1];
      [v11 setIncludeProResSmartAlbum:1];
      [v11 setIncludeSharedLibrarySharingSuggestionsSmartAlbum:1];
      char v12 = (void *)MEMORY[0x1E4F38EE8];
      v29[0] = v5;
      int64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      int64_t v14 = [v12 fetchAssetCollectionsWithLocalIdentifiers:v13 options:v11];
      id v15 = [v14 firstObject];
      id v16 = self->_assetCollection;
      self->_assetCollection = v15;

LABEL_23:
      assetCollection = self->_assetCollection;
      goto LABEL_24;
    }
    if (v6)
    {
      objc_msgSend(v7, "px_assetCollectionWithTransientIdentifier:", v6);
      v17 = (PXDisplayAssetCollection *)objc_claimAutoreleasedReturnValue();
      int64_t v18 = self->_assetCollection;
      self->_assetCollection = v17;

      goto LABEL_23;
    }
    if ([(PXProgrammaticNavigationDestination *)self utilityCollectionType])
    {
      int64_t v19 = objc_msgSend(MEMORY[0x1E4F38EE8], "fetchUtilityCollectionsWithType:options:", -[PXProgrammaticNavigationDestination utilityCollectionType](self, "utilityCollectionType"), v11);
    }
    else
    {
      if (![(PXProgrammaticNavigationDestination *)self assetCollectionType])
      {
        v25 = [(PXProgrammaticNavigationDestination *)self asset];
        if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
          id v21 = v25;
        }
        else {
          id v21 = 0;
        }

        if ([v21 sourceType] == 2)
        {
          v26 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v21 withType:1 options:0];
          v27 = [v26 firstObject];
          v28 = self->_assetCollection;
          self->_assetCollection = v27;
        }
        goto LABEL_22;
      }
      if ([(PXProgrammaticNavigationDestination *)self assetCollectionType] == 1
        && self->_userAlbumName)
      {
        [v11 setIncludeAllPhotosSmartAlbum:0];
        int64_t v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"title == %@", self->_userAlbumName];
        [v11 setPredicate:v20];
      }
      int64_t v19 = objc_msgSend(MEMORY[0x1E4F38EE8], "fetchAssetCollectionsWithType:subtype:options:", -[PXProgrammaticNavigationDestination assetCollectionType](self, "assetCollectionType"), -[PXProgrammaticNavigationDestination assetCollectionSubtype](self, "assetCollectionSubtype"), v11);
    }
    id v21 = v19;
    uint64_t v22 = [v19 firstObject];
    v23 = self->_assetCollection;
    self->_assetCollection = v22;

LABEL_22:
    goto LABEL_23;
  }
LABEL_24:
  return assetCollection;
}

- (BOOL)isTargetingAlbum
{
  v2 = [(PXProgrammaticNavigationDestination *)self assetCollection];
  if (objc_msgSend(v2, "px_isUserCreated") & 1) != 0 || (objc_msgSend(v2, "px_isSmartAlbum")) {
    char v3 = 1;
  }
  else {
    char v3 = objc_msgSend(v2, "px_isLemonadeUtilitiesAlbum");
  }

  return v3;
}

- (PXDisplayAsset)asset
{
  v18[1] = *MEMORY[0x1E4F143B8];
  asset = self->_asset;
  if (!asset)
  {
    id v4 = [(PXProgrammaticNavigationDestination *)self assetUUID];
    id v5 = [(PXProgrammaticNavigationDestination *)self assetLocalIdentifier];
    if (!v5 && v4)
    {
      id v5 = [MEMORY[0x1E4F38EB8] localIdentifierWithUUID:v4];
    }
    if (v5) {
      goto LABEL_6;
    }
    uint64_t v13 = [(PXProgrammaticNavigationDestination *)self assetCloudIdentifier];
    if (!v13) {
      goto LABEL_14;
    }
    int64_t v14 = (void *)v13;
    id v15 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v5 = PXProgrammaticNavigationLocalIdentifierForCloudIdentifier(v14, v15);

    if (v5)
    {
LABEL_6:
      id v6 = objc_msgSend(MEMORY[0x1E4F390A0], "px_standardFetchOptions");
      [v6 setIncludeHiddenAssets:1];
      [v6 setIncludeGuestAssets:1];
      int64_t v7 = (void *)MEMORY[0x1E4F38EB8];
      v18[0] = v5;
      char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      id v9 = [v7 fetchAssetsWithLocalIdentifiers:v8 options:v6];
      id v10 = [v9 firstObject];
      id v11 = self->_asset;
      self->_asset = v10;
    }
    else
    {
LABEL_14:
      if ([(PXProgrammaticNavigationDestination *)self type] != 18) {
        goto LABEL_8;
      }
      id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      id v16 = [(PXProgrammaticNavigationDestination *)self assetCollectionLocalIdentifier];
      id v6 = v16;
      if (v16)
      {
        objc_msgSend(v5, "px_fetchAssetForSuggestionWithLocalIdentifier:", v16);
        id v16 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
      }
      v17 = self->_asset;
      self->_asset = v16;
    }
LABEL_8:

    asset = self->_asset;
  }
  return asset;
}

- (BOOL)isLemonadeHome
{
  if ([(PXProgrammaticNavigationDestination *)self type] == 14) {
    return 1;
  }
  id v4 = [(PXProgrammaticNavigationDestination *)self assetCollection];
  char v5 = objc_msgSend(v4, "px_isMomentsVirtualCollection");

  return v5;
}

- (PXProgrammaticNavigationDestination)initWithLemonadeNavigationDestination:(id)a3
{
  id v5 = a3;
  id v6 = [(PXProgrammaticNavigationDestination *)self initWithType:31 revealMode:1];
  int64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lemonadeNavigationDestination, a3);
  }

  return v7;
}

- (PXProgrammaticNavigationDestination)initWithSearchText:(id)a3
{
  id v4 = a3;
  id v5 = [(PXProgrammaticNavigationDestination *)self initWithType:14 revealMode:1];
  if (v5)
  {
    uint64_t v6 = +[PXSearchNavigationAttributes attributesWithGenericSearchText:v4];
    additionalAttributes = v5->_additionalAttributes;
    v5->_additionalAttributes = v6;
  }
  return v5;
}

- (PXProgrammaticNavigationDestination)initWithSearchTerm:(id)a3
{
  id v4 = a3;
  id v5 = [(PXProgrammaticNavigationDestination *)self initWithType:14 revealMode:1];
  if (v5)
  {
    uint64_t v6 = +[PXSearchNavigationAttributes attributesWithGenericSearchTerm:v4];
    additionalAttributes = v5->_additionalAttributes;
    v5->_additionalAttributes = v6;
  }
  return v5;
}

- (PXProgrammaticNavigationDestination)initWithImportSource:(id)a3 revealMode:(int64_t)a4
{
  id v7 = a3;
  char v8 = [(PXProgrammaticNavigationDestination *)self initWithType:20 revealMode:a4];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_importSource, a3);
  }

  return v9;
}

- (PXProgrammaticNavigationDestination)initWithType:(int64_t)a3 revealMode:(int64_t)a4 asset:(id)a5 assetCollection:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(PXProgrammaticNavigationDestination *)self init];
  int64_t v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v13->_revealMode = a4;
    objc_storeStrong((id *)&v13->_asset, a5);
    uint64_t v15 = [v11 uuid];
    assetUUID = v14->_assetUUID;
    v14->_assetUUID = (NSString *)v15;

    objc_storeStrong((id *)&v14->_assetCollection, a6);
    uint64_t v17 = [v12 uuid];
    assetCollectionUUID = v14->_assetCollectionUUID;
    v14->_assetCollectionUUID = (NSString *)v17;
  }
  return v14;
}

- (PXProgrammaticNavigationDestination)initWithObject:(id)a3 revealMode:(int64_t)a4 sidebarNavigationBackButtonRootDestination:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(PXProgrammaticNavigationDestination *)self init];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_revealMode = a4;
    objc_storeStrong((id *)&v12->_sidebarBackNavigationRootDestination, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v10;
      if (objc_msgSend(v14, "px_isPhotosVirtualCollection"))
      {
        uint64_t v15 = 1;
LABEL_20:
        uint64_t v28 = 80;
LABEL_21:
        *(Class *)((char *)&v13->super.isa + v28) = (Class)v15;

        goto LABEL_22;
      }
      if (objc_msgSend(v14, "px_isSharedActivityVirtualCollection"))
      {
        uint64_t v15 = 19;
        goto LABEL_20;
      }
      if ([v14 isTransient])
      {
        v24 = [v14 transientIdentifier];
        char v25 = [v24 isEqualToString:@"PXPhotosSearchVirtualCollection"];

        if (v25)
        {
          uint64_t v15 = 14;
          goto LABEL_20;
        }
      }
      if ([v14 isTransient])
      {
        v26 = [v14 transientIdentifier];
        char v27 = [v26 isEqualToString:@"PXPrototypeVirtualCollection"];

        if (v27)
        {
          uint64_t v15 = 16;
          goto LABEL_20;
        }
      }
      if (objc_msgSend(v14, "px_isContentSyndicationAlbum"))
      {
        uint64_t v30 = 8;
      }
      else
      {
        unint64_t v31 = [v14 assetCollectionType];
        if (v31 > 0xB)
        {
LABEL_28:
          objc_storeStrong((id *)&v13->_assetCollection, a3);
          uint64_t v32 = [v14 uuid];
          assetCollectionUUID = v13->_assetCollectionUUID;
          v13->_assetCollectionUUID = (NSString *)v32;

          v13->_assetCollectionType = [v14 assetCollectionType];
          uint64_t v15 = [v14 assetCollectionSubtype];
          uint64_t v28 = 176;
          goto LABEL_21;
        }
        uint64_t v30 = qword_1AB35AE20[v31];
      }
      v13->_type = v30;
      goto LABEL_28;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      v35 = NSStringFromSelector(a2);
      [v34 handleFailureInMethod:a2, v13, @"PXProgrammaticNavigationDestination.m", 376, @"%@ currently only supports PHAssetCollection and PHCollectionList objects.", v35 object file lineNumber description];

      abort();
    }
    id v16 = v10;
    if (objc_msgSend(v16, "px_isTripsVirtualCollection"))
    {
      uint64_t v17 = 27;
    }
    else
    {
      uint64_t v18 = [v16 collectionListType];
      if ((unint64_t)(v18 - 1) > 2)
      {
LABEL_13:
        collectionList = v13->_collectionList;
        v13->_collectionList = (PXDisplayCollectionList *)v16;
        id v20 = v16;

        uint64_t v21 = [v20 uuid];
        collectionListUUID = v13->_collectionListUUID;
        v13->_collectionListUUID = (NSString *)v21;

        v13->_collectionListType = [v20 collectionListType];
        uint64_t v23 = [v20 collectionListSubtype];

        v13->_collectionListSubtype = v23;
        goto LABEL_22;
      }
      uint64_t v17 = qword_1AB35AE80[v18 - 1];
    }
    v13->_type = v17;
    goto LABEL_13;
  }
LABEL_22:

  return v13;
}

- (PXProgrammaticNavigationDestination)initWithObject:(id)a3 revealMode:(int64_t)a4
{
  return [(PXProgrammaticNavigationDestination *)self initWithObject:a3 revealMode:a4 sidebarNavigationBackButtonRootDestination:0];
}

- (PXProgrammaticNavigationDestination)initWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(PXProgrammaticNavigationDestination *)self init];
  if (v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:0];
    id v7 = [v6 host];
    char v8 = PXProgrammaticNavigationPathComponentsForURLComponents(v6);
    id v9 = PXProgrammaticNavigationQueryValuesForComponents(v6);
    id v10 = [v6 scheme];
    int v11 = [v10 isEqualToString:@"photos"];

    if (v11)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __51__PXProgrammaticNavigationDestination_initWithURL___block_invoke;
      aBlock[3] = &unk_1E5DD36F8;
      v128 = (PHCloudIdentifier *)v4;
      id v12 = (void (**)(void))_Block_copy(aBlock);
      uint64_t v13 = [v9 objectForKeyedSubscript:@"identifier"];
      uint64_t v14 = [v9 objectForKeyedSubscript:@"uuid"];
      uint64_t v15 = [v9 objectForKeyedSubscript:@"name"];
      v5->_openMode = 0;
      uint64_t v16 = [v9 objectForKeyedSubscript:@"source"];
      source = v5->_source;
      v5->_source = (NSString *)v16;

      uint64_t obj = v14;
      if ([v7 isEqualToString:@"contentmode"])
      {
        v119 = v15;
        uint64_t v123 = v13;
        v116 = v12;
        uint64_t v18 = [v9 objectForKeyedSubscript:@"id"];
        int64_t v19 = [v9 objectForKeyedSubscript:@"assetuuid"];
        if (![v19 length])
        {
          [v9 objectForKeyedSubscript:@"assetUUID"];
          v21 = id v20 = v8;

          int64_t v19 = (void *)v21;
          char v8 = v20;
        }
        uint64_t v22 = v8;
        uint64_t v23 = v7;
        if (![v19 length])
        {
          v24 = (void *)MEMORY[0x1E4F391D0];
          char v25 = [v9 objectForKeyedSubscript:@"assetidentifier"];
          uint64_t v26 = [v24 uuidFromLocalIdentifier:v25];

          int64_t v19 = (void *)v26;
        }
        char v27 = [v9 objectForKeyedSubscript:@"oneUp"];
        int v28 = [v27 BOOLValue];

        if ([v18 isEqualToString:@"photos"])
        {
          v5->_type = 5;
          id v7 = v23;
          if (v19)
          {
            uint64_t v29 = 1;
            if (!v28) {
              uint64_t v29 = 2;
            }
            v5->_revealMode = v29;
            objc_storeStrong((id *)&v5->_assetUUID, v19);
          }
          else
          {
            v5->_revealMode = 3;
          }
          char v8 = v22;
          uint64_t v13 = v123;
          uint64_t v59 = [v9 objectForKeyedSubscript:@"libraryViewMode"];
          libraryViewMode = v5->_libraryViewMode;
          v5->_libraryViewMode = (NSString *)v59;

          v45 = (void *)obj;
        }
        else
        {
          id v7 = v23;
          if ([v18 isEqualToString:@"search"])
          {
            *(_OWORD *)&v5->_type = xmmword_1AB359E90;
            char v8 = v22;
            uint64_t v13 = v123;
            v45 = (void *)obj;
          }
          else
          {
            char v8 = v22;
            uint64_t v13 = v123;
            v45 = (void *)obj;
            if ([v18 isEqualToString:@"albums"]) {
              *(_OWORD *)&v5->_type = xmmword_1AB359DF0;
            }
          }
        }

        id v12 = v116;
        uint64_t v15 = v119;
        goto LABEL_57;
      }
      if ([v7 isEqualToString:@"asset"])
      {
        v117 = v12;
        v120 = v15;
        v111 = v7;
        v114 = v8;
        id v109 = v4;
        *(_OWORD *)&v5->_type = xmmword_1AB312C90;
        v34 = [v9 objectForKeyedSubscript:@"prefersSpatialPresentation"];
        uint64_t v35 = [v34 BOOLValue];

        v36 = [v9 objectForKeyedSubscript:@"prefersImmersiveMode"];
        uint64_t v37 = [v36 BOOLValue];

        v38 = [v9 objectForKeyedSubscript:@"wantsSharePlay"];
        uint64_t v39 = [v38 BOOLValue];

        int v108 = v35;
        v40 = [NSNumber numberWithBool:v35];
        LODWORD(v35) = [v40 BOOLValue];
        [NSNumber numberWithBool:v37];
        v41 = v124 = (void *)v13;
        int v42 = [v41 BOOLValue] + v35;
        v43 = [NSNumber numberWithBool:v39];
        unsigned int v44 = v42 + [v43 BOOLValue];

        uint64_t v13 = (uint64_t)v124;
        v45 = (void *)obj;
        if (v44 >= 2) {
          PXAssertGetLog();
        }
        uint64_t v46 = 3;
        if (!v39) {
          uint64_t v46 = 0;
        }
        if (v37) {
          uint64_t v46 = 1;
        }
        if (v108) {
          uint64_t v46 = 2;
        }
        v5->_openMode = v46;
        objc_storeStrong((id *)&v5->_assetLocalIdentifier, v124);
        p_assetUUID = (void **)&v5->_assetUUID;
        objc_storeStrong((id *)&v5->_assetUUID, (id)obj);
        assetUUID = v5->_assetUUID;
        if (assetUUID)
        {
          v49 = assetUUID;
          v50 = *p_assetUUID;
          *p_assetUUID = v49;
          id v4 = v109;
          id v7 = v111;
          char v8 = v114;
        }
        else
        {
          v61 = [v9 objectForKeyedSubscript:@"assetuuid"];
          v50 = v61;
          if (v61)
          {
            id v62 = v61;
          }
          else
          {
            id v62 = [v9 objectForKeyedSubscript:@"assetUUID"];
          }
          id v4 = v109;
          id v7 = v111;
          char v8 = v114;
          v64 = *p_assetUUID;
          *p_assetUUID = v62;
        }
        uint64_t v65 = PXProgrammaticNavigationCloudIdentifierForURLQueryValues(v9);
        assetCloudIdentifier = v5->_assetCloudIdentifier;
        v5->_assetCloudIdentifier = (PHCloudIdentifier *)v65;

        uint64_t v67 = [v9 objectForKeyedSubscript:@"albumuuid"];
        assetCollectionUUID = v5->_assetCollectionUUID;
        v5->_assetCollectionUUID = (NSString *)v67;

        uint64_t v15 = v120;
        if (![(NSString *)v5->_assetCollectionUUID length])
        {
          v69 = (void *)MEMORY[0x1E4F38EE8];
          v70 = [v9 objectForKeyedSubscript:@"albumname"];
          v71 = v69;
          uint64_t v13 = (uint64_t)v124;
          v45 = (void *)obj;
          uint64_t v15 = v120;
          objc_msgSend(v71, "px_getType:subtype:forBuiltInAlbumName:", &v5->_assetCollectionType, &v5->_assetCollectionSubtype, v70);
        }
        id v12 = v117;
        goto LABEL_57;
      }
      if ([v7 isEqualToString:@"edit"])
      {
        [v8 firstObject];
        v121 = v6;
        v52 = uint64_t v51 = v13;
        int v53 = [v52 isEqualToString:@"enter"];

        uint64_t v13 = v51;
        uint64_t v6 = v121;
        if (v53)
        {
          *(_OWORD *)&v5->_type = xmmword_1AB312C90;
          uint64_t v54 = [v9 objectForKeyedSubscript:@"assetUUID"];
          v55 = v5->_assetUUID;
          v5->_assetUUID = (NSString *)v54;

          v5->_wantsEditMode = 1;
          uint64_t v56 = [v9 objectForKeyedSubscript:@"completionKey"];
          completionKey = v5->_completionKey;
          v5->_completionKey = (NSString *)v56;

LABEL_36:
          v45 = (void *)obj;
LABEL_57:

          v33 = v128;
          goto LABEL_58;
        }
      }
      if ([v7 isEqualToString:@"lastasset"])
      {
        *(_OWORD *)&v5->_type = xmmword_1AB3063D0;
        goto LABEL_36;
      }
      v45 = (void *)obj;
      if ([v7 isEqualToString:@"allphotos"])
      {
        v5->_type = 5;
        goto LABEL_57;
      }
      if ([v7 isEqualToString:@"folder"])
      {
        v5->_type = 17;
        objc_storeStrong((id *)&v5->_collectionListUUID, (id)obj);
        objc_storeStrong((id *)&v5->_collectionListName, v15);
        *(_OWORD *)&v5->_collectionListType = xmmword_1AB359E80;
        v5->_revealMode = 3;
        goto LABEL_57;
      }
      if ([v7 isEqualToString:@"album"])
      {
        v74 = [v9 objectForKeyedSubscript:@"revealassetuuid"];
        uint64_t v125 = v13;
        v112 = v74;
        if (v74)
        {
          *(_OWORD *)&v5->_type = xmmword_1AB359E70;
          objc_storeStrong((id *)&v5->_assetUUID, v74);
        }
        else
        {
          *(_OWORD *)&v5->_type = xmmword_1AB359DF0;
        }
        v115 = v8;
        v118 = v12;
        v110 = [v9 objectForKeyedSubscript:@"show-options"];
        v75 = [v110 lowercaseString];
        int v76 = [v75 isEqualToString:@"true"];

        if (v76) {
          v5->_displayAlbumOptions = 1;
        }
        unint64_t v77 = (unint64_t)(id)obj;
        v122 = v15;
        id v78 = v15;
        uint64_t v79 = objc_msgSend(MEMORY[0x1E4F39228], "px_transientIdentifierForWellKnownAssetCollectionName:", v78);
        v80 = (void *)v79;
        if (v77 | v125)
        {
          objc_storeStrong((id *)&v5->_assetCollectionUUID, (id)obj);
          p_assetCollectionLocalIdentifier = (id *)&v5->_assetCollectionLocalIdentifier;
          v82 = (void *)v125;
        }
        else
        {
          if (!v79)
          {
            v5->_utilityCollectionType = objc_msgSend(MEMORY[0x1E4F39340], "px_utilityCollectionTypeforBuiltInAlbumName:", v78);
            objc_msgSend(MEMORY[0x1E4F38EE8], "px_getType:subtype:forBuiltInAlbumName:", &v5->_assetCollectionType, &v5->_assetCollectionSubtype, v78);
            goto LABEL_82;
          }
          p_assetCollectionLocalIdentifier = (id *)&v5->_assetCollectionTransientIdentifier;
          v82 = v80;
        }
        objc_storeStrong(p_assetCollectionLocalIdentifier, v82);
LABEL_82:
        uint64_t v83 = PXProgrammaticNavigationCloudIdentifierForURLQueryValues(v9);
        assetCollectionCloudIdentifier = v5->_assetCollectionCloudIdentifier;
        v5->_assetCollectionCloudIdentifier = (PHCloudIdentifier *)v83;

        v85 = [v9 objectForKeyedSubscript:@"render"];
        int v86 = [v85 BOOLValue];

        if (v86) {
          v5->_renderAlbumAssetsWithDeferredProcessing = 1;
        }

        v45 = (void *)v77;
        char v8 = v115;
        id v12 = v118;
        uint64_t v15 = v122;
        uint64_t v13 = v125;
        goto LABEL_57;
      }
      if ([v7 isEqualToString:@"userAlbum"])
      {
        *(_OWORD *)&v5->_type = xmmword_1AB359DF0;
        objc_storeStrong((id *)&v5->_userAlbumName, v15);
        *(_OWORD *)&v5->_assetCollectionType = xmmword_1AB2ED380;
        goto LABEL_57;
      }
      if ([v7 isEqual:@"memory"])
      {
        if (!(v13 | obj) || v13 && obj) {
          v12[2](v12);
        }
        if (v13)
        {
          if (!obj)
          {
            v45 = [MEMORY[0x1E4F391D0] uuidFromLocalIdentifier:v13];
          }
        }
        else
        {
          uint64_t v13 = [MEMORY[0x1E4F39160] localIdentifierWithUUID:obj];
        }
        objc_storeStrong((id *)&v5->_assetCollectionLocalIdentifier, (id)v13);
        objc_storeStrong((id *)&v5->_assetCollectionUUID, v45);
        v5->_assetCollectionType = 4;
        long long v92 = xmmword_1AB359E00;
        goto LABEL_97;
      }
      if ([v7 isEqual:@"shelf"])
      {
        uint64_t v87 = v13;
        v88 = v15;
        uint64_t v89 = [v9 objectForKeyedSubscript:@"id"];
        if (!v89) {
          v12[2](v12);
        }
        long long v90 = xmmword_1AB31D830;
LABEL_94:
        *(_OWORD *)&v5->_type = v90;
        shelfSlug = v5->_shelfSlug;
        v5->_shelfSlug = (NSString *)v89;

        uint64_t v15 = v88;
        uint64_t v13 = v87;
        goto LABEL_36;
      }
      if ([v7 isEqual:@"shelf-details"])
      {
        uint64_t v87 = v13;
        v88 = v15;
        uint64_t v89 = [v9 objectForKeyedSubscript:@"id"];
        if (!v89) {
          v12[2](v12);
        }
        long long v90 = xmmword_1AB31D840;
        goto LABEL_94;
      }
      if ([v7 isEqual:@"memoryfeed"])
      {
        long long v92 = xmmword_1AB342250;
LABEL_97:
        *(_OWORD *)&v5->_type = v92;
        goto LABEL_57;
      }
      if ([v7 isEqual:@"events"])
      {
        *(_OWORD *)&v5->_type = xmmword_1AB31D810;
        v5->_assetCollectionType = 6;
        if (!obj && v13)
        {
          uint64_t v93 = [MEMORY[0x1E4F391D0] uuidFromLocalIdentifier:v13];
          v94 = v5->_assetCollectionUUID;
          v5->_assetCollectionUUID = (NSString *)v93;

LABEL_111:
          objc_storeStrong((id *)&v5->_assetCollectionLocalIdentifier, (id)v13);
          goto LABEL_36;
        }
        objc_storeStrong((id *)&v5->_assetCollectionUUID, (id)obj);
        if (v13 || !obj) {
          goto LABEL_111;
        }
LABEL_110:
        v45 = (void *)obj;
        uint64_t v97 = [MEMORY[0x1E4F39238] localIdentifierWithUUID:obj];
        assetCollectionLocalIdentifier = v5->_assetCollectionLocalIdentifier;
        v5->_assetCollectionLocalIdentifier = (NSString *)v97;

        uint64_t v13 = 0;
        goto LABEL_57;
      }
      v113 = v7;
      if ([v7 isEqual:@"trips"])
      {
        *(_OWORD *)&v5->_type = xmmword_1AB31D820;
        v5->_assetCollectionType = 6;
        if (obj || !v13)
        {
          objc_storeStrong((id *)&v5->_assetCollectionUUID, (id)obj);
          if (!v13 && obj) {
            goto LABEL_110;
          }
        }
        else
        {
          uint64_t v95 = [MEMORY[0x1E4F391D0] uuidFromLocalIdentifier:v13];
          v96 = v5->_assetCollectionUUID;
          v5->_assetCollectionUUID = (NSString *)v95;
        }
        objc_storeStrong((id *)&v5->_assetCollectionLocalIdentifier, (id)v13);
LABEL_131:
        id v7 = v113;
        goto LABEL_36;
      }
      if ([v7 isEqual:@"people"])
      {
        *(_OWORD *)&v5->_type = xmmword_1AB359E60;
        objc_storeStrong((id *)&v5->_personLocalIdentifier, (id)v13);
        p_personUUID = (id *)&v5->_personUUID;
LABEL_119:
        v45 = (void *)obj;
        objc_storeStrong(p_personUUID, (id)obj);
        goto LABEL_57;
      }
      if ([v7 isEqual:@"social-groups"])
      {
        *(_OWORD *)&v5->_type = xmmword_1AB359E50;
        objc_storeStrong((id *)&v5->_socialGroupLocalIdentifier, (id)v13);
        p_personUUID = (id *)&v5->_socialGroupUUID;
        goto LABEL_119;
      }
      if ([v7 isEqual:@"places"])
      {
        long long v100 = xmmword_1AB321B70;
LABEL_130:
        *(_OWORD *)&v5->_type = v100;
        goto LABEL_131;
      }
      if ([v7 isEqual:@"icloud-links"])
      {
        long long v100 = xmmword_1AB307930;
        goto LABEL_130;
      }
      if ([v7 isEqualToString:@"profile"])
      {
        long long v100 = xmmword_1AB359E40;
        goto LABEL_130;
      }
      if ([v7 isEqual:@"photoschallengesubmission"])
      {
        long long v100 = xmmword_1AB2F0A60;
        goto LABEL_130;
      }
      if ([v7 isEqual:@"spatial"])
      {
        long long v100 = xmmword_1AB3324B0;
        goto LABEL_130;
      }
      if ([v7 isEqualToString:@"featuredPhoto"])
      {
        *(_OWORD *)&v5->_type = xmmword_1AB359E30;
        objc_storeStrong((id *)&v5->_assetCollectionLocalIdentifier, (id)v13);
        v5->_assetCollectionType = 8;
        goto LABEL_131;
      }
      if ([v7 isEqualToString:@"forYou"])
      {
        v101 = [v9 objectForKeyedSubscript:@"type"];
        if ([v101 isEqualToString:@"sharedLibrarySuggestions"]) {
          *(_OWORD *)&v5->_type = xmmword_1AB315060;
        }
        goto LABEL_155;
      }
      if ([v7 isEqualToString:@"library"])
      {
        v101 = [v9 objectForKeyedSubscript:@"zoomLevel"];
        if ([v101 isEqualToString:@"all-photos"])
        {
          uint64_t v102 = 5;
        }
        else if ([v101 isEqualToString:@"days"])
        {
          uint64_t v102 = 4;
        }
        else if ([v101 isEqualToString:@"months"])
        {
          uint64_t v102 = 3;
        }
        else if ([v101 isEqualToString:@"years"])
        {
          uint64_t v102 = 2;
        }
        else
        {
          uint64_t v102 = 1;
        }
        v5->_type = v102;
        v5->_revealMode = 1;
        goto LABEL_155;
      }
      if ([v7 isEqualToString:@"memory-generation"])
      {
        *(_OWORD *)&v5->_type = xmmword_1AB359E20;
        uint64_t v103 = [v9 objectForKeyedSubscript:@"query"];
        memoryCreationText = v5->_memoryCreationText;
        v5->_memoryCreationText = (NSString *)v103;
      }
      else
      {
        if ([v7 isEqualToString:@"oneyearago"])
        {
          *(_OWORD *)&v5->_type = xmmword_1AB359E10;
          v101 = PXLocalizedStringFromTable(@"SEARCH_SUGGESTION_LAST_YEAR", @"PhotosUICore");
          uint64_t v105 = +[PXSearchNavigationAttributes attributesWithGenericSearchText:v101];
          additionalAttributes = v5->_additionalAttributes;
          v5->_additionalAttributes = v105;

LABEL_155:
          goto LABEL_131;
        }
        if (![v7 isEqualToString:@"cloudfeed"]) {
          goto LABEL_131;
        }
        v5->_type = 19;
        uint64_t v107 = +[PXSharedAlbumNavigationAttributes attributesForURLComponents:v6];
        memoryCreationText = v5->_additionalAttributes;
        v5->_additionalAttributes = v107;
      }

      goto LABEL_131;
    }
    uint64_t v30 = [v6 scheme];
    int v31 = [v30 isEqualToString:@"photos-navigation"];

    if (v31)
    {
      if ([v7 isEqualToString:@"search"])
      {
        *(_OWORD *)&v5->_type = xmmword_1AB359E10;
        uint64_t v32 = +[PXSearchNavigationAttributes attributesForURLComponents:v6];
        v33 = (PHCloudIdentifier *)v5->_additionalAttributes;
        v5->_additionalAttributes = v32;
LABEL_58:

        goto LABEL_59;
      }
      if ([v7 isEqualToString:@"memories"])
      {
        *(_OWORD *)&v5->_type = xmmword_1AB359E00;
      }
      else
      {
        if ([v7 isEqualToString:@"asset"])
        {
          *(_OWORD *)&v5->_type = xmmword_1AB312C90;
          uint64_t v58 = PXProgrammaticNavigationCloudIdentifierForURLQueryValues(v9);
          v33 = v5->_assetCloudIdentifier;
          v5->_assetCloudIdentifier = (PHCloudIdentifier *)v58;
          goto LABEL_58;
        }
        if ([v7 isEqualToString:@"album"])
        {
          *(_OWORD *)&v5->_type = xmmword_1AB359DF0;
          uint64_t v63 = PXProgrammaticNavigationCloudIdentifierForURLQueryValues(v9);
          v33 = v5->_assetCollectionCloudIdentifier;
          v5->_assetCollectionCloudIdentifier = (PHCloudIdentifier *)v63;
          goto LABEL_58;
        }
      }
    }
LABEL_59:
    v72 = [v9 objectForKeyedSubscript:@"shouldExcludeSidebar"];
    v5->_shouldExcludeSidebar = [v72 BOOLValue];
  }
  return v5;
}

void __51__PXProgrammaticNavigationDestination_initWithURL___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "destination URL is malformed: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __51__PXProgrammaticNavigationDestination_initWithURL___block_invoke_262(unsigned char *a1)
{
  if (a1[32]) {
    return 2;
  }
  if (a1[33]) {
    return 1;
  }
  if (a1[34]) {
    return 3;
  }
  return 0;
}

@end