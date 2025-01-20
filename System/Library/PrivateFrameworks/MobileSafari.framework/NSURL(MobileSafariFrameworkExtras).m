@interface NSURL(MobileSafariFrameworkExtras)
+ (BOOL)_sf_canCreateURLsFromDropSession:()MobileSafariFrameworkExtras;
+ (uint64_t)_sf_urlsFromDragItems:()MobileSafariFrameworkExtras completionHandler:;
- (uint64_t)sf_isFacetimeURL;
- (uint64_t)sf_isOfflineReadingListURL;
- (uint64_t)sf_isTestWebArchiveURL;
@end

@implementation NSURL(MobileSafariFrameworkExtras)

- (uint64_t)sf_isOfflineReadingListURL
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (![a1 isFileURL]) {
    return 0;
  }
  v2 = [a1 path];
  uint64_t v3 = [v2 length];

  if (!v3 || ![a1 getFileSystemRepresentation:__s maxLength:1024]) {
    return 0;
  }
  v4 = (void *)[[NSString alloc] initWithBytesNoCopy:__s length:strlen(__s) encoding:4 freeWhenDone:0];
  v5 = [MEMORY[0x1E4FB60E8] readingListArchivesDirectoryPath];
  uint64_t v6 = objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", v5);

  return v6;
}

- (uint64_t)sf_isTestWebArchiveURL
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (![a1 isFileURL]) {
    return 0;
  }
  v2 = [a1 path];
  uint64_t v3 = [v2 length];

  if (!v3 || ![a1 getFileSystemRepresentation:__s maxLength:1024]) {
    return 0;
  }
  v4 = (void *)[[NSString alloc] initWithBytesNoCopy:__s length:strlen(__s) encoding:4 freeWhenDone:0];
  v5 = _SFSafariTestContentDirectoryPath();
  uint64_t v6 = objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", v5);

  return v6;
}

- (uint64_t)sf_isFacetimeURL
{
  if (([a1 isFaceTimeURL] & 1) != 0
    || ([a1 isFaceTimePromptURL] & 1) != 0
    || ([a1 isFaceTimeAudioURL] & 1) != 0)
  {
    return 1;
  }

  return [a1 isFaceTimeAudioPromptURL];
}

+ (BOOL)_sf_canCreateURLsFromDropSession:()MobileSafariFrameworkExtras
{
  id v3 = a3;
  v4 = allowedClasses();
  BOOL v5 = +[_SFDropSession dropSession:v3 containsItemsMatching:localObjectLoader allowedTypeIdentifiers:0 allowedClasses:v4];

  return v5;
}

+ (uint64_t)_sf_urlsFromDragItems:()MobileSafariFrameworkExtras completionHandler:
{
  return objc_msgSend(MEMORY[0x1E4FB1710], "_sf_loadObjectsFromDragItems:usingLocalObjectLoader:objectLoader:completionHandler:", a3, localObjectLoader, objectLoader, a4);
}

@end