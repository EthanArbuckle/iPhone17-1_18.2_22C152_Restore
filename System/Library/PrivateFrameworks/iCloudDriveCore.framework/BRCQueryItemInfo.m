@interface BRCQueryItemInfo
+ (id)queryItemInfoForAppLibrary:(id)a3;
+ (id)queryItemInfoForDocumentsFolderWithAppLibrary:(id)a3;
+ (id)queryItemInfoForItem:(id)a3;
- (BOOL)isAppInstalled;
- (BOOL)isDefaultZone;
- (BOOL)isDocumentsFolder;
- (BOOL)isGreedyDocument;
- (BOOL)isWallet;
- (BOOL)isZoneRoot;
@end

@implementation BRCQueryItemInfo

+ (id)queryItemInfoForItem:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BRCQueryItemInfo);
  v4->_isZoneRoot = [v3 isZoneRoot];
  v5 = [v3 appLibrary];
  v4->_isAppInstalled = [v5 isAppInstalled];

  if ([v3 isDocument])
  {
    v6 = [v3 asDocument];
    v4->_isGreedyDocument = [v6 shouldBeGreedy];
  }
  else
  {
    v4->_isGreedyDocument = 0;
  }
  v7 = [v3 clientZone];
  v4->_isDefaultZone = [v7 isCloudDocsZone];

  v8 = [v3 itemID];
  v4->_isDocumentsFolder = [v8 isDocumentsFolder];

  v9 = [v3 appLibrary];
  v10 = [v9 appLibraryID];
  v4->_isWallet = [v10 isEqualToString:*MEMORY[0x263F32460]];

  return v4;
}

+ (id)queryItemInfoForAppLibrary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BRCQueryItemInfo);
  v4->_isZoneRoot = 1;
  v4->_isAppInstalled = [v3 isAppInstalled];
  v5 = [v3 appLibraryID];
  v4->_isWallet = [v5 isEqualToString:*MEMORY[0x263F32460]];

  LOBYTE(v5) = [v3 isCloudDocsAppLibrary];
  v4->_isDefaultZone = (char)v5;
  return v4;
}

+ (id)queryItemInfoForDocumentsFolderWithAppLibrary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BRCQueryItemInfo);
  char v5 = [v3 isAppInstalled];

  v4->_isAppInstalled = v5;
  v4->_isDocumentsFolder = 1;
  v4->_isZoneRoot = 0;
  return v4;
}

- (BOOL)isZoneRoot
{
  return self->_isZoneRoot;
}

- (BOOL)isDefaultZone
{
  return self->_isDefaultZone;
}

- (BOOL)isAppInstalled
{
  return self->_isAppInstalled;
}

- (BOOL)isWallet
{
  return self->_isWallet;
}

- (BOOL)isGreedyDocument
{
  return self->_isGreedyDocument;
}

- (BOOL)isDocumentsFolder
{
  return self->_isDocumentsFolder;
}

@end