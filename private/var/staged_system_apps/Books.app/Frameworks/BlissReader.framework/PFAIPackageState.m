@interface PFAIPackageState
- (NSArray)spineEntries;
- (NSDictionary)metadata;
- (NSDictionary)spineURLToCfi;
- (NSString)glossaryEntryUri;
- (NSString)ncxEntryUri;
- (NSString)opfEntryUri;
- (NSString)searchIndexUri;
- (NSURL)applePubZipURL;
- (PFAIPackageState)initWithDocumentRoot:(id)a3 applePubURL:(id)a4 archive:(id)a5;
- (PFXArchive)archive;
- (THDocumentRoot)thDocumentRoot;
- (id)entryMeidaTypeForEntry:(id)a3;
- (id)entryUriForId:(id)a3;
- (int64_t)requiredVersion;
- (void)addManifestItemAbsoluteEntryUri:(id)a3 withId:(id)a4 mediaType:(id)a5;
- (void)dealloc;
- (void)setGlossaryEntryUri:(id)a3;
- (void)setNcxEntryUri:(id)a3;
- (void)setOpfEntryUri:(id)a3;
- (void)setRequiredVersion:(int64_t)a3;
- (void)setSearchIndexUri:(id)a3;
- (void)setSpineEntries:(id)a3;
- (void)setSpineURLToCfi:(id)a3;
- (void)setValue:(id)a3 forMetadata:(id)a4;
@end

@implementation PFAIPackageState

- (PFAIPackageState)initWithDocumentRoot:(id)a3 applePubURL:(id)a4 archive:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PFAIPackageState;
  v8 = [(PFAIPackageState *)&v10 init];
  if (v8)
  {
    v8->mDocumentRoot = (THDocumentRoot *)a3;
    v8->mArchive = (PFXArchive *)a5;
    v8->mManifestEntryUriById = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->mManifestEntryMeidaTypeByUri = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->mMetadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->mApplePubURL = (NSURL *)a4;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIPackageState;
  [(PFAIPackageState *)&v3 dealloc];
}

- (id)entryUriForId:(id)a3
{
  return [(NSMutableDictionary *)self->mManifestEntryUriById objectForKey:a3];
}

- (id)entryMeidaTypeForEntry:(id)a3
{
  return [(NSMutableDictionary *)self->mManifestEntryMeidaTypeByUri objectForKey:a3];
}

- (void)addManifestItemAbsoluteEntryUri:(id)a3 withId:(id)a4 mediaType:(id)a5
{
  id v9 = [(NSMutableDictionary *)self->mManifestEntryUriById objectForKey:a4];
  if (v9)
  {
    id v10 = v9;
    [(NSMutableDictionary *)self->mManifestEntryUriById removeObjectForKey:a4];
    [(NSMutableDictionary *)self->mManifestEntryMeidaTypeByUri removeObjectForKey:v10];
  }
  [(NSMutableDictionary *)self->mManifestEntryUriById setObject:a3 forKey:a4];
  mManifestEntryMeidaTypeByUri = self->mManifestEntryMeidaTypeByUri;

  [(NSMutableDictionary *)mManifestEntryMeidaTypeByUri setObject:a5 forKey:a3];
}

- (void)setValue:(id)a3 forMetadata:(id)a4
{
}

- (PFXArchive)archive
{
  return self->mArchive;
}

- (THDocumentRoot)thDocumentRoot
{
  return self->mDocumentRoot;
}

- (NSURL)applePubZipURL
{
  return self->mApplePubURL;
}

- (NSString)opfEntryUri
{
  return self->mOpfUri;
}

- (void)setOpfEntryUri:(id)a3
{
}

- (NSString)ncxEntryUri
{
  return self->mNcxUri;
}

- (void)setNcxEntryUri:(id)a3
{
}

- (NSString)glossaryEntryUri
{
  return self->mGlossaryUri;
}

- (void)setGlossaryEntryUri:(id)a3
{
}

- (NSString)searchIndexUri
{
  return self->mSearchIndexUri;
}

- (void)setSearchIndexUri:(id)a3
{
}

- (NSDictionary)metadata
{
  return &self->mMetadata->super;
}

- (NSArray)spineEntries
{
  return self->mSpineEntries;
}

- (void)setSpineEntries:(id)a3
{
}

- (NSDictionary)spineURLToCfi
{
  return self->mSpineURLToCfi;
}

- (void)setSpineURLToCfi:(id)a3
{
}

- (int64_t)requiredVersion
{
  return self->mRequiredVersion;
}

- (void)setRequiredVersion:(int64_t)a3
{
  self->mRequiredVersion = a3;
}

@end