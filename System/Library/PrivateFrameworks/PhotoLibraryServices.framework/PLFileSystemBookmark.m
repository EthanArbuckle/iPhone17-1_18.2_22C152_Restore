@interface PLFileSystemBookmark
+ (id)entityName;
+ (id)fileSystemBookmarkFromURL:(id)a3 context:(id)a4;
- (BOOL)supportsCloudUpload;
- (id)fileSystemURL;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
@end

@implementation PLFileSystemBookmark

- (id)fileSystemURL
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((PLIsAssetsd() & 1) == 0 && !MEMORY[0x19F38C0C0]())
  {
    v7 = [(PLManagedObject *)self photoLibrary];
    v8 = [v7 assetsdClient];
    id v5 = [v8 resourceClient];

    v9 = [(PLFileSystemBookmark *)self objectID];
    id v15 = 0;
    id v16 = 0;
    id v14 = 0;
    int v10 = [v5 sandboxExtensionForFileSystemBookmark:v9 bookmarkURL:&v16 sandboxExtensionToken:&v15 error:&v14];
    id v6 = v16;
    id v11 = v15;
    id v12 = v14;

    v4 = 0;
    if (v10) {
      v4 = (void *)[objc_alloc(MEMORY[0x1E4F8B9D0]) initWithURL:v6 sandboxExtensionToken:v11 consume:1];
    }

    goto LABEL_10;
  }
  char v18 = 0;
  v3 = [(PLFileSystemBookmark *)self bookmarkData];
  id v17 = 0;
  v4 = +[PLURL URLByResolvingBookmarkData:v3 options:256 relativeToURL:0 bookmarkDataIsStale:&v18 error:&v17];
  id v5 = v17;

  if (v4)
  {
    [v4 startAccessingSecurityScopedResource];
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = [(PLManagedObject *)self shortObjectIDURI];
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error resolving bookmark data for %@. Error: %@", buf, 0x16u);
LABEL_10:
  }
LABEL_11:

  return v4;
}

- (BOOL)supportsCloudUpload
{
  return 0;
}

+ (id)fileSystemBookmarkFromURL:(id)a3 context:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 startAccessingSecurityScopedResource];
  id v36 = 0;
  v9 = [v6 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v36];
  id v10 = v36;
  id v35 = 0;
  uint64_t v11 = *MEMORY[0x1E4F1C960];
  id v34 = 0;
  int v12 = [v6 getResourceValue:&v35 forKey:v11 error:&v34];
  id v13 = v35;
  id v14 = v34;
  id v15 = v14;
  id v16 = 0;
  if (!v12)
  {
    if (!v8) {
      goto LABEL_3;
    }
LABEL_11:
    [v6 stopAccessingSecurityScopedResource];
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  id v30 = a1;
  id v31 = v14;
  id v32 = v10;
  char v18 = [v13 path];
  v19 = (void *)MEMORY[0x1E4F8B908];
  id v20 = [v6 path];
  __int16 v21 = [v19 realPathForPath:v20 error:0];

  if ([v21 hasPrefix:v18])
  {
    id v29 = v7;
    id v22 = [v21 pathComponents];
    uint64_t v23 = [v18 pathComponents];
    uint64_t v24 = [v22 count];
    uint64_t v25 = v24 - [v23 count];
    if (v25 <= 0)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:v30 file:@"PLFileSystemBookmark.m" lineNumber:116 description:@"URL must be relative to the volume"];
    }
    v26 = objc_msgSend(v22, "subarrayWithRange:", objc_msgSend(v23, "count"), v25);
    id v16 = [v26 componentsJoinedByString:@"/"];

    id v7 = v29;
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, v30, @"PLFileSystemBookmark.m", 121, @"url path %@ does not have volume path prefix %@", v21, v18 object file lineNumber description];
    id v16 = 0;
  }

  id v15 = v31;
  id v10 = v32;
  if (v8) {
    goto LABEL_11;
  }
LABEL_3:
  if (v9)
  {
LABEL_4:
    id v17 = +[PLManagedObject insertInManagedObjectContext:v7];
    [v17 setBookmarkData:v9];
    [v17 setPathRelativeToVolume:v16];
    goto LABEL_15;
  }
LABEL_12:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v6;
    __int16 v39 = 2112;
    id v40 = v10;
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error creating bookmark data for %@: %@", buf, 0x16u);
  }
  id v17 = 0;
LABEL_15:

  return v17;
}

+ (id)entityName
{
  return @"FileSystemBookmark";
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFileSystemBookmark *)self resource];
  id v6 = [v5 asset];
  if ([v6 isValidForJournalPersistence])
  {
    id v7 = [PLAssetJournalEntryPayload alloc];
    int v8 = [(PLFileSystemBookmark *)self resource];
    v9 = [(PLAssetJournalEntryPayload *)v7 initWithInternalResource:v8 filesystemBookmark:self changedKeys:v4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)payloadID
{
  v2 = [(PLFileSystemBookmark *)self resource];
  v3 = [v2 asset];
  id v4 = [v3 uuid];
  id v5 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v4];

  return v5;
}

@end