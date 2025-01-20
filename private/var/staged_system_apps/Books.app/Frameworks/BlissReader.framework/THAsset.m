@interface THAsset
+ (BOOL)asset:(id)a3 isSameAsAsset:(id)a4;
+ (THAsset)assetWithAsset:(id)a3;
+ (THAsset)assetWithURL:(id)a3 assetID:(id)a4;
+ (THAsset)assetWithURL:(id)a3 assetID:(id)a4 type:(id)a5;
- (BOOL)isEpub;
- (BOOL)isManagedBook;
- (BOOL)isSample;
- (NSDictionary)metadata;
- (NSString)assetID;
- (NSString)assetType;
- (NSString)author;
- (NSString)genre;
- (NSString)storeID;
- (NSString)title;
- (NSURL)storeUrl;
- (NSURL)url;
- (THAsset)initWithURL:(id)a3 assetID:(id)a4;
- (THAsset)initWithURL:(id)a3 assetID:(id)a4 type:(id)a5;
- (id)p_libraryManagerInfo;
- (id)p_libraryManagerInfoWithCoordination:(BOOL)a3;
- (os_unfair_lock_s)unfairLock;
- (void)dealloc;
- (void)loadMetadata;
- (void)setMetadata:(id)a3;
- (void)setUnfairLock:(os_unfair_lock_s)a3;
@end

@implementation THAsset

- (THAsset)initWithURL:(id)a3 assetID:(id)a4 type:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)THAsset;
  v8 = [(THAsset *)&v10 init];
  if (v8)
  {
    v8->mURL = (NSURL *)a3;
    v8->mAssetID = (NSString *)[a4 copy];
    v8->mType = (NSString *)[a5 copy];
    v8->_unfairLock._os_unfair_lock_opaque = 0;
  }
  return v8;
}

- (THAsset)initWithURL:(id)a3 assetID:(id)a4
{
  return [(THAsset *)self initWithURL:a3 assetID:a4 type:@"application/ibooks"];
}

+ (THAsset)assetWithURL:(id)a3 assetID:(id)a4 type:(id)a5
{
  id v5 = [objc_alloc((Class)a1) initWithURL:a3 assetID:a4 type:a5];

  return (THAsset *)v5;
}

+ (THAsset)assetWithURL:(id)a3 assetID:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithURL:a3 assetID:a4];

  return (THAsset *)v4;
}

- (void)loadMetadata
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THAsset;
  [(THAsset *)&v3 dealloc];
}

+ (BOOL)asset:(id)a3 isSameAsAsset:(id)a4
{
  BOOL result = 0;
  if (a3 && a4) {
    return !objc_msgSend(objc_msgSend(a3, "assetType"), "compare:", objc_msgSend(a4, "assetType"))
  }
        && objc_msgSend(objc_msgSend(a3, "assetID"), "compare:", objc_msgSend(a4, "assetID")) == 0;
  return result;
}

- (NSString)assetType
{
  return self->mType;
}

- (NSString)assetID
{
  return self->mAssetID;
}

- (NSURL)url
{
  return self->mURL;
}

- (BOOL)isEpub
{
  v2 = [(NSString *)[(NSURL *)[(THAsset *)self url] pathExtension] lowercaseString];

  return [@"epub" isEqualToString:v2];
}

+ (THAsset)assetWithAsset:(id)a3
{
  id v4 = [a3 url];
  id v5 = [a3 assetID];

  return +[THAsset assetWithURL:v4 assetID:v5];
}

- (id)p_libraryManagerInfo
{
  return [(THAsset *)self p_libraryManagerInfoWithCoordination:1];
}

- (id)p_libraryManagerInfoWithCoordination:(BOOL)a3
{
  BOOL v3 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  if (!self->_metadata) {
    self->_metadata = [+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr") metadataForAssetAtURL: -[THAsset url](self, "url") needsCoordination:v3];
  }
  os_unfair_lock_unlock(p_unfairLock);
  return self->_metadata;
}

- (NSURL)storeUrl
{
  id v3 = [[AEAssetEngine storeMgr] clientApplicationController];
  id v4 = [(THAsset *)self storeID];

  return (NSURL *)[v3 bookUrlForStoreId:v4];
}

- (NSString)author
{
  BOOL result = [(THAsset *)self p_libraryManagerInfo];
  if (result)
  {
    return (NSString *)+[IMLibraryPlist authorFromPlistEntry:result];
  }
  return result;
}

- (NSString)title
{
  BOOL result = [(THAsset *)self p_libraryManagerInfo];
  if (result)
  {
    return (NSString *)+[IMLibraryPlist titleFromPlistEntry:result];
  }
  return result;
}

- (NSString)storeID
{
  BOOL result = [(THAsset *)self p_libraryManagerInfo];
  if (result)
  {
    return (NSString *)+[IMLibraryPlist storeIdFromPlistEntry:result];
  }
  return result;
}

- (NSString)genre
{
  BOOL result = [(THAsset *)self p_libraryManagerInfo];
  if (result)
  {
    return (NSString *)+[IMLibraryPlist genreFromPlistEntry:result];
  }
  return result;
}

- (BOOL)isSample
{
  id v2 = [(THAsset *)self p_libraryManagerInfo];
  if (v2)
  {
    id v3 = +[IMLibraryPlist isSampleFromPlistEntry:v2];
    LOBYTE(v2) = [v3 BOOLValue];
  }
  return (char)v2;
}

- (BOOL)isManagedBook
{
  id v2 = +[IMLibraryPlist isManagedBookFromURL:[(THAsset *)self url]];

  return [v2 BOOLValue];
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

@end