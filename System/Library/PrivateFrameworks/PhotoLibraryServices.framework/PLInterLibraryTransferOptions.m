@interface PLInterLibraryTransferOptions
+ (BOOL)supportsSecureCoding;
+ (id)newTransferOptionsForAssetsFromSyndicationToSystem;
+ (id)newTransferOptionsForFaceCropFromSyndicationToSystem;
+ (id)newTransferOptionsForPersonFromSystemToSyndication;
- (BOOL)allowSavedAssetTypeChanges;
- (BOOL)ignoreMissingSourceFileURLs;
- (BOOL)ignoreMissingSourceFiles;
- (BOOL)skipContextSave;
- (BOOL)updateExistingObjects;
- (NSArray)keysForDeDupe;
- (NSSet)excludedAttributeNames;
- (NSSet)excludedEntityNames;
- (PLInterLibraryTransferOptions)initWithCoder:(id)a3;
- (id)_sortedEntityNamesAsString;
- (id)debugDescription;
- (id)description;
- (unsigned)allowDeleteOfSavedAssetTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowDeleteOfSavedAssetTypes:(unsigned int)a3;
- (void)setAllowSavedAssetTypeChanges:(BOOL)a3;
- (void)setExcludedAttributeNames:(id)a3;
- (void)setExcludedEntityNames:(id)a3;
- (void)setIgnoreMissingSourceFileURLs:(BOOL)a3;
- (void)setIgnoreMissingSourceFiles:(BOOL)a3;
- (void)setKeysForDeDupe:(id)a3;
- (void)setSkipContextSave:(BOOL)a3;
- (void)setUpdateExistingObjects:(BOOL)a3;
@end

@implementation PLInterLibraryTransferOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysForDeDupe, 0);
  objc_storeStrong((id *)&self->_excludedAttributeNames, 0);
  objc_storeStrong((id *)&self->_excludedEntityNames, 0);
}

- (void)setSkipContextSave:(BOOL)a3
{
  self->_skipContextSave = a3;
}

- (BOOL)skipContextSave
{
  return self->_skipContextSave;
}

- (void)setAllowDeleteOfSavedAssetTypes:(unsigned int)a3
{
  self->_allowDeleteOfSavedAssetTypes = a3;
}

- (unsigned)allowDeleteOfSavedAssetTypes
{
  return self->_allowDeleteOfSavedAssetTypes;
}

- (void)setKeysForDeDupe:(id)a3
{
}

- (NSArray)keysForDeDupe
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIgnoreMissingSourceFileURLs:(BOOL)a3
{
  self->_ignoreMissingSourceFileURLs = a3;
}

- (BOOL)ignoreMissingSourceFileURLs
{
  return self->_ignoreMissingSourceFileURLs;
}

- (void)setIgnoreMissingSourceFiles:(BOOL)a3
{
  self->_ignoreMissingSourceFiles = a3;
}

- (BOOL)ignoreMissingSourceFiles
{
  return self->_ignoreMissingSourceFiles;
}

- (void)setAllowSavedAssetTypeChanges:(BOOL)a3
{
  self->_allowSavedAssetTypeChanges = a3;
}

- (BOOL)allowSavedAssetTypeChanges
{
  return self->_allowSavedAssetTypeChanges;
}

- (void)setUpdateExistingObjects:(BOOL)a3
{
  self->_updateExistingObjects = a3;
}

- (BOOL)updateExistingObjects
{
  return self->_updateExistingObjects;
}

- (void)setExcludedAttributeNames:(id)a3
{
}

- (NSSet)excludedAttributeNames
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExcludedEntityNames:(id)a3
{
}

- (NSSet)excludedEntityNames
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (PLInterLibraryTransferOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLInterLibraryTransferOptions;
  v5 = [(PLInterLibraryTransferOptions *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"excludedEntityNames"];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
      excludedEntityNames = v5->_excludedEntityNames;
      v5->_excludedEntityNames = (NSSet *)v7;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(PLInterLibraryTransferOptions *)self excludedEntityNames];
  v5 = [v6 allObjects];
  [v4 encodeObject:v5 forKey:@"excludedEntityNames"];
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PLInterLibraryTransferOptions *)self _sortedEntityNamesAsString];
  id v6 = [v3 stringWithFormat:@"<%@:%p> (excluding %@)", v4, self, v5];

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PLInterLibraryTransferOptions *)self _sortedEntityNamesAsString];
  id v6 = [v3 stringWithFormat:@"%@ (excluding %@)", v4, v5];

  return v6;
}

- (id)_sortedEntityNamesAsString
{
  v2 = [(PLInterLibraryTransferOptions *)self excludedEntityNames];
  v3 = [v2 allObjects];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];
  v5 = [v4 componentsJoinedByString:@", "];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newTransferOptionsForFaceCropFromSyndicationToSystem
{
  id v2 = objc_alloc_init((Class)a1);
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = +[PLDetectedFace entityName];
  v5 = +[PLManagedAsset entityName];
  id v6 = +[PLPerson entityName];
  uint64_t v7 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, 0);
  [v2 setExcludedEntityNames:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v2 setExcludedAttributeNames:v8];

  [v2 setUpdateExistingObjects:0];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  [v2 setKeysForDeDupe:v9];

  return v2;
}

+ (id)newTransferOptionsForPersonFromSystemToSyndication
{
  id v16 = objc_alloc_init((Class)a1);
  id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v18 = +[PLDetectedFace entityName];
  v14 = +[PLDetectedFaceGroup entityName];
  id v2 = +[PLFaceCrop entityName];
  v15 = +[PLGraphEdge entityName];
  v13 = +[PLManagedAsset entityName];
  id v3 = +[PLManagedKeyword entityName];
  uint64_t v4 = +[PLPerson entityName];
  v5 = +[PLPersonReference entityName];
  id v6 = +[PLPhotosHighlight entityName];
  uint64_t v7 = +[PLShareParticipant entityName];
  id v8 = +[PLUserFeedback entityName];
  id v9 = objc_msgSend(v17, "initWithObjects:", v18, v14, v2, v15, v13, v3, v4, v5, v6, v7, v8, 0);
  [v16 setExcludedEntityNames:v9];

  objc_super v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"faceCount", 0);
  [v16 setExcludedAttributeNames:v10];

  [v16 setUpdateExistingObjects:1];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  [v16 setKeysForDeDupe:v11];

  return v16;
}

+ (id)newTransferOptionsForAssetsFromSyndicationToSystem
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init((Class)a1);
  id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v23 = +[PLGenericAlbum entityName];
  v18 = +[PLCloudSharedComment entityName];
  v22 = +[PLDetectedFace entityName];
  id v17 = +[PLFaceCrop entityName];
  v21 = +[PLGraphEdge entityName];
  v20 = +[PLManagedAlbum entityName];
  id v16 = +[PLManagedAsset entityName];
  v15 = +[PLManagedKeyword entityName];
  v14 = +[PLMemory entityName];
  v13 = +[PLMoment entityName];
  v12 = +[PLMomentShare entityName];
  id v3 = +[PLPerson entityName];
  uint64_t v4 = +[PLPersonReference entityName];
  v5 = +[PLPhotosHighlight entityName];
  id v6 = +[PLShareParticipant entityName];
  uint64_t v7 = +[PLSuggestion entityName];
  id v8 = objc_msgSend(v19, "initWithObjects:", v23, v18, v22, v17, v21, v20, v16, v15, v14, v13, v12, v3, v4, v5, v6, v7, 0);
  [v2 setExcludedEntityNames:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v2 setExcludedAttributeNames:v9];

  [v2 setUpdateExistingObjects:1];
  [v2 setAllowSavedAssetTypeChanges:0];
  [v2 setIgnoreMissingSourceFiles:1];
  [v2 setIgnoreMissingSourceFileURLs:1];
  v24[0] = @"additionalAttributes.syndicationIdentifier";
  objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v2 setKeysForDeDupe:v10];

  objc_msgSend(v2, "setAllowDeleteOfSavedAssetTypes:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"));
  return v2;
}

@end