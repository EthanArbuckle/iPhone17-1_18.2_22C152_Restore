@interface THAEHelper
- (BOOL)acknowledgeAnnotationProvider:(id)a3 willMergeAnnotationsWithAssertVersionMismatch:(id)a4 assetID:(id)a5 assetURL:(id)a6;
- (BOOL)acknowledgeAnnotationProvider:(id)a3 willMergeAnnotationsWithAssetVersionMismatch:(id)a4 assetID:(id)a5 assetURL:(id)a6;
- (BOOL)helperValidateBookAuthorizationWithError:(id *)a3 needsCoordination:(BOOL)a4;
- (THAEHelper)initWithURL:(id)a3 withOptions:(id)a4;
- (id)bookCoverDescription;
- (id)bookDescription;
- (id)helperCoverImage;
- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4;
- (id)helperMinifiedController;
- (id)url;
- (void)dealloc;
- (void)helperDeletePersistentCache;
- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4;
@end

@implementation THAEHelper

- (THAEHelper)initWithURL:(id)a3 withOptions:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THAEHelper;
  v6 = [(THAEHelper *)&v8 init];
  if (v6)
  {
    v6->mURL = (NSURL *)a3;
    v6->mOptions = (NSDictionary *)a4;
  }
  return v6;
}

- (void)dealloc
{
  self->mURL = 0;
  self->mBookDescription = 0;

  self->mBookCoverDescription = 0;
  self->mOptions = 0;
  v3.receiver = self;
  v3.super_class = (Class)THAEHelper;
  [(THAEHelper *)&v3 dealloc];
}

- (id)url
{
  return self->mURL;
}

- (id)bookDescription
{
  id result = self->mBookDescription;
  if (!result)
  {
    id result = [[THApplePubAssetPlugin sharedPlugin] descriptionForURL:[self url]];
    self->mBookDescription = (THBookDescription *)result;
  }
  return result;
}

- (id)bookCoverDescription
{
  id result = self->mBookCoverDescription;
  if (!result)
  {
    id result = [[THApplePubAssetPlugin sharedPlugin] coverDescriptionForURL:[self url]];
    self->mBookCoverDescription = (THBookCoverDescription *)result;
  }
  return result;
}

- (id)helperCoverImage
{
  id result = [[[self url] pathExtension] caseInsensitiveCompare:@"epub"];
  if (result)
  {
    id v4 = [(THAEHelper *)self url];
    id result = +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", objc_msgSend(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", kIMLibraryPlistArtworkName, 0), "path"));
    if (!result)
    {
      id result = [(THAEHelper *)self bookCoverDescription];
      if (result)
      {
        id v5 = [self bookCoverDescription].embeddedArtURL;
        id result = +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", [v5 path]);
        if (!result)
        {
          id result = [[self bookCoverDescription] drmContext];
          if (result)
          {
            id result = [result dataWithContentsOfFile:[v5 path] error:0];
            if (result)
            {
              return +[UIImage imageWithData:result];
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 isEqualToString:AEHelperStringMetadataAssetIDKey])
  {
    id v7 = [(THAEHelper *)self bookDescription];
    return [v7 annotationID];
  }
  else
  {
    id v9 = [[AEAssetEngine libraryMgr] metadataForAssetAtURL:self->mURL needsCoordination:v4];
    if (v9)
    {
      id v10 = v9;
      if ([a3 isEqualToString:AEHelperStringMetadataAuthorKey])
      {
        id result = +[IMLibraryPlist authorFromPlistEntry:v10];
        if (result) {
          return result;
        }
      }
      else if ([a3 isEqualToString:AEHelperStringMetadataTitleKey])
      {
        id result = +[IMLibraryPlist titleFromPlistEntry:v10];
        if (result) {
          return result;
        }
      }
      else if ([a3 isEqualToString:AEHelperStringMetadataGenreKey])
      {
        id result = +[IMLibraryPlist genreFromPlistEntry:v10];
        if (result) {
          return result;
        }
      }
    }
    id result = [(THAEHelper *)self bookDescription];
    if (result)
    {
      id v11 = result;
      if ([a3 isEqualToString:AEHelperStringMetadataAuthorKey])
      {
        return [v11 bookAuthor];
      }
      else if ([a3 isEqualToString:AEHelperStringMetadataTitleKey])
      {
        return [v11 bookTitle];
      }
      else if ([a3 isEqualToString:AEHelperStringMetadataGenreKey])
      {
        return [v11 genre];
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (void)helperDeletePersistentCache
{
  id v2 = [self bookDescription].contextDirectoryPath;
  if (v2)
  {
    id v3 = v2;
    char v7 = 0;
    BOOL v4 = +[NSFileManager defaultManager];
    unsigned int v5 = [(NSFileManager *)v4 fileExistsAtPath:v3 isDirectory:&v7];
    if (v7) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = 0;
    }
    if (v6 == 1) {
      [(NSFileManager *)v4 removeItemAtPath:v3 error:0];
    }
  }
}

- (id)helperMinifiedController
{
  id v2 = [[THiBooksMinifiedController alloc] initWithHelper:self];

  return v2;
}

- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4
{
  id v7 = +[THApplePubAssetPlugin sharedPlugin];

  [v7 helper:self viewControllerWithOptions:a3 completion:a4];
}

- (BOOL)helperValidateBookAuthorizationWithError:(id *)a3 needsCoordination:(BOOL)a4
{
  if (a3)
  {
    *a3 = 0;
    id v7 = objc_msgSend(objc_msgSend(-[THAEHelper bookDescription](self, "bookDescription"), "bookBundleUrl"), "path");
    if (!v7 || (id v8 = v7, ![v7 length]))
    {
      id v22 = objc_alloc((Class)NSError);
      BOOL v23 = 0;
      *a3 = [v22 initWithDomain:AssetEngineErrorDomain code:1001 userInfo:0];
LABEL_23:
      id v27 = *a3;
      return v23;
    }
    id v9 = [PFAXPackage rightsInfoForArchiveAtPath:[+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary") _perUserBookURLForBookURL:[+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8)]].path];
    id v10 = +[PFAXPackage newAllEncryptionInfoFromAssetForArchiveAtPath:v8];
    id v11 = v10;
    if (!v9 && !objc_msgSend(objc_msgSend(v10, "allKeys"), "count"))
    {
      BOOL v24 = v11 == 0;
      goto LABEL_19;
    }
    v12 = [[PFDContext alloc] initWithRoot:v8 pVwXvin61ocxeAjqxjwz:v11 andRights:v9];
    v13 = v12;
    id v29 = 0;
    if (v12)
    {
      [(PFDContext *)v12 dataRepresentationForEntryName:@"OPS/assets/ncxExtensions.xml" error:&v29];
      id v14 = [v29 domain];
      id v15 = [v29 code];
      if ([v14 isEqualToString:@"ibookserrors"])
      {
        if ((unint64_t)v15 + 42597 > 2)
        {
          if (!+[PFDContext isBagRefetchRequiredForStatus:v15])goto LABEL_16; {
          id v25 = objc_alloc((Class)NSError);
          }
          uint64_t v26 = AssetEngineErrorDomain;
          id v18 = [v29 userInfo];
          v19 = v25;
          uint64_t v20 = v26;
          uint64_t v21 = 2002;
        }
        else
        {
          id v16 = objc_alloc((Class)NSError);
          uint64_t v17 = AssetEngineErrorDomain;
          id v18 = [v29 userInfo];
          v19 = v16;
          uint64_t v20 = v17;
          uint64_t v21 = 2003;
        }
        *a3 = [v19 initWithDomain:v20 code:v21 userInfo:v18];
      }
    }
LABEL_16:

    if (v13) {
      BOOL v24 = v29 == 0;
    }
    else {
      BOOL v24 = 0;
    }
LABEL_19:
    BOOL v23 = v24;

    goto LABEL_23;
  }
  return 0;
}

- (BOOL)acknowledgeAnnotationProvider:(id)a3 willMergeAnnotationsWithAssetVersionMismatch:(id)a4 assetID:(id)a5 assetURL:(id)a6
{
  if (a5)
  {
    id v11 = [[self bookDescription] bookVersionString];
    -[THAnnotationSerializationManager handleAnnotationProvider:willMergeVersionMismatchedAnnotationsWithIncomingAnnotationAssetVersion:assetAssetVersion:assetID:assetURL:](+[THAnnotationSerializationManager annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:](THAnnotationSerializationManager, "annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:", a5, a6, v11, [THAEHelper bookDescription](self, "bookDescription").contextDirectoryPath, [THAEHelper bookDescription](self, "bookDescription").asset.isManagedBook), "handleAnnotationProvider:willMergeVersionMismatchedAnnotationsWithIncomingAnnotationAssetVersion:assetAssetVersion:assetID:assetURL:", a3, [THBookVersion bookVersionWithVersionString:](THBookVersion, "bookVersionWithVersionString:", a4), [THBookVersion bookVersionWithVersionString:](THBookVersion, "bookVersionWithVersionString:", v11), a5, a6);
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, 0, a6) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAEHelper acknowledgeAnnotationProvider:willMergeAnnotationsWithAssetVersionMismatch:assetID:assetURL:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAssetHelper.m") lineNumber:471 description:@"invalid nil value for '%s'", "assetID"];
  }
  return 0;
}

- (BOOL)acknowledgeAnnotationProvider:(id)a3 willMergeAnnotationsWithAssertVersionMismatch:(id)a4 assetID:(id)a5 assetURL:(id)a6
{
  return [(THAEHelper *)self acknowledgeAnnotationProvider:a3 willMergeAnnotationsWithAssetVersionMismatch:a4 assetID:a5 assetURL:a6];
}

@end