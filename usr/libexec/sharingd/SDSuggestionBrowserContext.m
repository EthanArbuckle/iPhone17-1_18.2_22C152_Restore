@interface SDSuggestionBrowserContext
- (BOOL)isSharePlayAvailable;
- (BOOL)shouldSuggestFamilyMembers;
- (BOOL)supportsCollaboration;
- (NSArray)peopleSuggestionBundleIds;
- (NSArray)photosAssetIDs;
- (NSArray)typeIdentifiersBeingShared;
- (NSArray)urlsBeingShared;
- (NSData)processedImageResultsData;
- (NSDictionary)sandboxExtensionsByfileURLPath;
- (NSString)bundleID;
- (void)setBundleID:(id)a3;
- (void)setIsSharePlayAvailable:(BOOL)a3;
- (void)setPeopleSuggestionBundleIds:(id)a3;
- (void)setPhotosAssetIDs:(id)a3;
- (void)setProcessedImageResultsData:(id)a3;
- (void)setSandboxExtensionsByfileURLPath:(id)a3;
- (void)setShouldSuggestFamilyMembers:(BOOL)a3;
- (void)setSupportsCollaboration:(BOOL)a3;
- (void)setTypeIdentifiersBeingShared:(id)a3;
- (void)setUrlsBeingShared:(id)a3;
@end

@implementation SDSuggestionBrowserContext

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSArray)typeIdentifiersBeingShared
{
  return self->_typeIdentifiersBeingShared;
}

- (void)setTypeIdentifiersBeingShared:(id)a3
{
}

- (NSArray)photosAssetIDs
{
  return self->_photosAssetIDs;
}

- (void)setPhotosAssetIDs:(id)a3
{
}

- (NSArray)urlsBeingShared
{
  return self->_urlsBeingShared;
}

- (void)setUrlsBeingShared:(id)a3
{
}

- (NSDictionary)sandboxExtensionsByfileURLPath
{
  return self->_sandboxExtensionsByfileURLPath;
}

- (void)setSandboxExtensionsByfileURLPath:(id)a3
{
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
}

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (BOOL)isSharePlayAvailable
{
  return self->_isSharePlayAvailable;
}

- (void)setIsSharePlayAvailable:(BOOL)a3
{
  self->_isSharePlayAvailable = a3;
}

- (BOOL)supportsCollaboration
{
  return self->_supportsCollaboration;
}

- (void)setSupportsCollaboration:(BOOL)a3
{
  self->_supportsCollaboration = a3;
}

- (NSData)processedImageResultsData
{
  return self->_processedImageResultsData;
}

- (void)setProcessedImageResultsData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedImageResultsData, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionsByfileURLPath, 0);
  objc_storeStrong((id *)&self->_urlsBeingShared, 0);
  objc_storeStrong((id *)&self->_photosAssetIDs, 0);
  objc_storeStrong((id *)&self->_typeIdentifiersBeingShared, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end