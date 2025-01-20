@interface THBookDescription
+ (BOOL)containsUnknownContentVersions:(id)a3;
+ (BOOL)isSampleAtURL:(id)a3;
+ (BOOL)readOpfMetadataWithArchive:(id)a3 toProperties:(id)a4;
+ (THBookDescription)descriptionWithAsset:(id)a3;
+ (THBookDescription)descriptionWithURL:(id)a3;
+ (THBookDescription)descriptionWithURL:(id)a3 assetID:(id)a4;
+ (id)displayNameFromFilePath:(id)a3;
+ (id)readBookPropertiesFromURL:(id)a3 error:(id *)a4;
+ (id)summaryWithURL:(id)a3;
- (BOOL)allowCopy;
- (BOOL)autoHyphenate;
- (BOOL)bookIsPaginatedForLandscape;
- (BOOL)bookIsPaginatedForPortrait;
- (BOOL)citationsAllowed;
- (BOOL)containsUnknownContentVersions;
- (BOOL)isDevelopment;
- (BOOL)isEpub;
- (BOOL)isPreorderBook;
- (BOOL)isSample;
- (NSDictionary)bookSummary;
- (NSString)annotationID;
- (NSString)assetLogID;
- (NSString)authoredVersion;
- (NSString)bookAuthor;
- (NSString)bookSubtitle;
- (NSString)bookTitle;
- (NSString)bookVersionString;
- (NSString)contextDirectoryPath;
- (NSString)databaseKey;
- (NSString)genre;
- (NSString)isbn;
- (NSString)language;
- (NSString)publisherName;
- (NSString)rawLanguage;
- (NSString)requiredVersion;
- (NSString)storeID;
- (NSString)timestamp;
- (NSString)tspObjectContextPath;
- (NSString)uniquifier;
- (NSURL)bookBundleUrl;
- (NSURL)storeURL;
- (PFDContext)drmContext;
- (THAsset)asset;
- (THBookDescription)initWithAsset:(id)a3 summary:(id)a4;
- (id)dataForAbsoluteURL:(id)a3 context:(id)a4;
- (id)dataForDocRelativePath:(id)a3 context:(id)a4;
- (id)libraryManagerInfo;
- (id)urlForDocRelativePath:(id)a3;
- (id)userDataPath;
- (int)orientationLock;
- (void)dealloc;
- (void)loadMetadata;
- (void)setAssetLogID:(id)a3;
- (void)setCitationsAllowed:(BOOL)a3;
- (void)setIsPreorderBook:(BOOL)a3;
@end

@implementation THBookDescription

- (THBookDescription)initWithAsset:(id)a3 summary:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THBookDescription;
  v6 = [(THBookDescription *)&v9 init];
  if (v6)
  {
    v6->mAsset = (THAsset *)a3;
    v6->mBookSummary = (NSDictionary *)a4;
    v6->mOrientationLock = 0;
    v6->mCitationsAllowed = 0;
    v6->_absolutePathToDataMap = +[NSMapTable strongToWeakObjectsMapTable];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6->_absolutePathToDataSync = (OS_dispatch_queue *)dispatch_queue_create("com.apple.THBookDescription.data", v7);
  }
  return v6;
}

- (PFDContext)drmContext
{
  result = self->mDrmContext;
  if (!result)
  {
    if (self->mLoadedDrmContext)
    {
      return 0;
    }
    else
    {
      result = (PFDContext *)[+[PFDContextManager sharedInstance] contextForArchive:[(NSURL *)[(THAsset *)self->mAsset url] path]];
      self->mDrmContext = result;
      self->mLoadedDrmContext = 1;
    }
  }
  return result;
}

+ (id)summaryWithURL:(id)a3
{
  id v11 = 0;
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [a3 path]))
  {
    id result = [a1 readBookPropertiesFromURL:a3 error:&v11];
    if (result) {
      return result;
    }
    id v6 = v11;
    id v7 = +[TSUAssertionHandler currentHandler];
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookDescription summaryWithURL:]");
    objc_super v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookDescription.m"];
    if (v6) {
      [v7 handleFailureInFunction:v8, v9, 92, @"Error reading properties from iBook: %@", [v11 description]];
    }
    else {
      [v7 handleFailureInFunction:v8 file:v9 lineNumber:96 description:@"Error reading properties from iBook."];
    }
  }
  return 0;
}

+ (THBookDescription)descriptionWithURL:(id)a3
{
  id result = [a1 summaryWithURL:];
  if (result)
  {
    v5 = result;
    id v6 = [(__CFString *)[AEAssetEngine libraryMgr] assetIDForAssetAtURLOnMainThread:a3];
    if (!v6)
    {
      id v7 = [[AEAssetEngine libraryMgr] metadataForAssetAtURL:a3 needsCoordination:1];
      if (v7) {
        id v6 = (__CFString *)+[IMLibraryPlist storeIdFromPlistEntry:v7];
      }
      else {
        id v6 = 0;
      }
    }
    if (![(__CFString *)v6 length])
    {
      id v6 = (__CFString *)[(THBookDescription *)v5 objectForKey:kTHBookInfoUUID];
      if (![(__CFString *)v6 length])
      {
        id v8 = [(THBookDescription *)v5 objectForKey:kTHBookInfoOPF];
        char v11 = 0;
        if (v8
          && (id v9 = v8,
              -[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", [a3 path], &v11))&& v11)
        {
          CFStringRef v10 = (const __CFString *)+[NSString md5StringWithContentsOfFile:](NSString, "md5StringWithContentsOfFile:", objc_msgSend(objc_msgSend(a3, "URLByAppendingPathComponent:", v9), "path"));
        }
        else
        {
          CFStringRef v10 = THUniqueIdForPath([a3 path]);
        }
        id v6 = (__CFString *)v10;
      }
    }
    return [[THBookDescription alloc] initWithAsset:+[THAsset assetWithURL:a3 assetID:v6] summary:v5];
  }
  return result;
}

+ (THBookDescription)descriptionWithURL:(id)a3 assetID:(id)a4
{
  id result = [a1 summaryWithURL:];
  if (result)
  {
    id v7 = [[THBookDescription alloc] initWithAsset:+[THAsset assetWithURL:a3 assetID:a4] summary:result];
    return v7;
  }
  return result;
}

+ (THBookDescription)descriptionWithAsset:(id)a3
{
  id result = [a1 summaryWithURL:[a3 url]];
  if (result)
  {
    v5 = [[THBookDescription alloc] initWithAsset:a3 summary:result];
    return v5;
  }
  return result;
}

+ (id)displayNameFromFilePath:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a3, "lastPathComponent"), "stringByDeletingPathExtension");
  v4 = +[NSCharacterSet characterSetWithCharactersInString:@":/"];

  return [v3 tsu_stringByRemovingCharactersInSet:v4];
}

- (void)dealloc
{
  [+[PFDContextManager sharedInstance] removeContextForArchive:[(NSURL *)[(THAsset *)self->mAsset url] path]];

  self->mAsset = 0;
  self->mBookSummary = 0;

  dispatch_release((dispatch_object_t)self->_absolutePathToDataSync);
  v3.receiver = self;
  v3.super_class = (Class)THBookDescription;
  [(THBookDescription *)&v3 dealloc];
}

- (BOOL)isDevelopment
{
  return 0;
}

- (id)libraryManagerInfo
{
  id v3 = +[AEAssetEngine libraryMgr];
  v4 = [(THAsset *)[(THBookDescription *)self asset] url];

  return [v3 metadataForAssetAtURL:v4 needsCoordination:1];
}

- (NSString)storeID
{
  v2 = [(THBookDescription *)self asset];

  return [(THAsset *)v2 storeID];
}

- (NSURL)storeURL
{
  v2 = [(THBookDescription *)self asset];

  return [(THAsset *)v2 storeUrl];
}

- (NSString)annotationID
{
  id result = [(THBookDescription *)self storeID];
  if (!result)
  {
    v4 = [(THBookDescription *)self asset];
    return [(THAsset *)v4 assetID];
  }
  return result;
}

- (NSString)databaseKey
{
  return [(THAsset *)self->mAsset assetID];
}

- (NSString)contextDirectoryPath
{
  return (NSString *)+[THApplicationDelegate contextDirectoryForAsset:self->mAsset];
}

- (NSURL)bookBundleUrl
{
  v2 = [(THBookDescription *)self asset];

  return [(THAsset *)v2 url];
}

- (id)dataForAbsoluteURL:(id)a3 context:(id)a4
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  v19 = sub_6432C;
  v20 = sub_6433C;
  uint64_t v21 = 0;
  if (!a3) {
    goto LABEL_9;
  }
  id v6 = [a3 path];
  absolutePathToDataSync = self->_absolutePathToDataSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_64348;
  block[3] = &unk_457DA0;
  block[5] = v6;
  block[6] = &v16;
  block[4] = self;
  dispatch_sync(absolutePathToDataSync, block);
  id v8 = (void *)v17[5];
  if (!v8)
  {
    id v9 = [(THBookDescription *)self drmContext];
    if (v9)
    {
      id v10 = +[TSPData readOnlyDataFromDataRep:filename:context:](TSPData, "readOnlyDataFromDataRep:filename:context:", -[PFDContext dataRepresentationForFile:error:](v9, "dataRepresentationForFile:error:", v6, 0), [v6 lastPathComponent], a4);
      v17[5] = (uint64_t)v10;
      if (!v10)
      {
LABEL_7:
        id v11 = +[TSPData readOnlyDataWithoutDataDigestFromURL:context:](TSPData, "readOnlyDataWithoutDataDigestFromURL:context:", +[NSURL fileURLWithPath:v6 isDirectory:0], a4);
        v17[5] = (uint64_t)v11;
        if (v11) {
          goto LABEL_8;
        }
LABEL_9:
        id v8 = 0;
        goto LABEL_10;
      }
    }
    else if (!v17[5])
    {
      goto LABEL_7;
    }
LABEL_8:
    v12 = self->_absolutePathToDataSync;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_64380;
    v14[3] = &unk_457DC8;
    v14[4] = self;
    v14[5] = v6;
    v14[6] = &v16;
    dispatch_sync(v12, v14);
    id v8 = (void *)v17[5];
  }
LABEL_10:
  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)dataForDocRelativePath:(id)a3 context:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v6 = +[NSURL fileURLWithPath:[(NSString *)[(NSURL *)[(THBookDescription *)self bookBundleUrl] path] stringByAppendingPathComponent:a3] isDirectory:0];

  return [(THBookDescription *)self dataForAbsoluteURL:v6 context:a4];
}

- (id)urlForDocRelativePath:(id)a3
{
  id result = [a3 length];
  if (result)
  {
    id v6 = [(NSString *)[(NSURL *)[(THBookDescription *)self bookBundleUrl] path] stringByAppendingPathComponent:a3];
    return +[NSURL fileURLWithPath:v6 isDirectory:0];
  }
  return result;
}

- (NSString)tspObjectContextPath
{
  v2 = [(THBookDescription *)self contextDirectoryPath];

  return [(NSString *)v2 stringByAppendingPathComponent:@"database"];
}

- (NSString)bookVersionString
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoBookVersionStringKey];
}

- (NSString)bookTitle
{
  id v3 = [(THAsset *)[(THBookDescription *)self asset] title];
  if (![(NSString *)v3 length]) {
    id v3 = [(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoTitleKey];
  }
  if ([(NSString *)v3 length]) {
    return v3;
  }
  v5 = objc_opt_class();
  id v6 = [(NSURL *)[(THAsset *)self->mAsset url] path];

  return (NSString *)[v5 displayNameFromFilePath:v6];
}

- (void)loadMetadata
{
  v2 = [(THBookDescription *)self asset];

  [(THAsset *)v2 loadMetadata];
}

- (NSString)bookSubtitle
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoSubtitleKey];
}

- (NSString)bookAuthor
{
  id v3 = [(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoAuthorKey];
  if ([(NSString *)v3 length]) {
    return v3;
  }
  v5 = [(THBookDescription *)self asset];

  return [(THAsset *)v5 author];
}

- (NSString)publisherName
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoPublisherKey];
}

- (NSString)genre
{
  id v3 = [(THAsset *)[(THBookDescription *)self asset] genre];
  if ([(NSString *)v3 length]) {
    return v3;
  }
  mBookSummary = self->mBookSummary;
  id v6 = kTHBookInfoGenreKey;

  return (NSString *)[(NSDictionary *)mBookSummary objectForKey:v6];
}

- (NSString)isbn
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoISBN];
}

- (NSString)uniquifier
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoUUID];
}

- (NSString)authoredVersion
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoAuthoredVersion];
}

- (NSString)requiredVersion
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoRequiredVersion];
}

- (BOOL)containsUnknownContentVersions
{
  objc_opt_class();
  [(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoContentVersions];
  id v3 = (void *)TSUDynamicCast();

  return [v3 BOOLValue];
}

- (NSString)timestamp
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoTimestamp];
}

- (NSString)language
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoLanguageKey];
}

- (NSString)rawLanguage
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoRawLanguageKey];
}

- (BOOL)autoHyphenate
{
  id v2 = [(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoAutoHyphenate];

  return [v2 BOOLValue];
}

- (int)orientationLock
{
  if (!self->mOrientationLock)
  {
    self->mOrientationLock = 3;
    objc_opt_class();
    [(NSDictionary *)self->mBookSummary objectForKey:kTHBookInfoOrientationLockKey];
    id v3 = (void *)TSUDynamicCast();
    if (v3)
    {
      v4 = v3;
      if ([v3 isEqualToString:@"landscape-only"])
      {
        int v5 = 2;
LABEL_7:
        self->mOrientationLock = v5;
        return self->mOrientationLock;
      }
      if ([v4 isEqualToString:@"portrait-only"])
      {
        int v5 = 1;
        goto LABEL_7;
      }
    }
  }
  return self->mOrientationLock;
}

- (BOOL)isSample
{
  id v2 = [(THBookDescription *)self asset];

  return [(THAsset *)v2 isSample];
}

+ (BOOL)isSampleAtURL:(id)a3
{
  if (a3)
  {
    id v4 = [[AEAssetEngine libraryMgr] metadataForAssetAtURL:a3 needsCoordination:1];
    if (v4) {
      id v4 = +[IMLibraryPlist isSampleFromPlistEntry:v4];
    }
  }
  else
  {
    id v4 = 0;
  }
  return [v4 BOOLValue];
}

- (BOOL)allowCopy
{
  if ([(THBookDescription *)self isSample]) {
    return 0;
  }
  if (![(PFDContext *)[(THBookDescription *)self drmContext] kiUanAfQBD5qIUraolUj]) {
    return 1;
  }
  id v4 = [[AEAssetEngine storeMgr] clientApplicationController];

  return [v4 allowCitationForProtectedBooks];
}

- (BOOL)bookIsPaginatedForPortrait
{
  return [(THBookDescription *)self orientationLock] == 1;
}

- (BOOL)bookIsPaginatedForLandscape
{
  return ![(THBookDescription *)self bookIsPaginatedForPortrait];
}

- (BOOL)isEpub
{
  id v2 = [(THBookDescription *)self asset];

  return [(THAsset *)v2 isEpub];
}

- (THAsset)asset
{
  return self->mAsset;
}

- (NSDictionary)bookSummary
{
  return self->mBookSummary;
}

- (BOOL)citationsAllowed
{
  return self->mCitationsAllowed;
}

- (void)setCitationsAllowed:(BOOL)a3
{
  self->mCitationsAllowed = a3;
}

- (BOOL)isPreorderBook
{
  return self->mIsPreorderBook;
}

- (void)setIsPreorderBook:(BOOL)a3
{
  self->mIsPreorderBook = a3;
}

- (NSString)assetLogID
{
  return self->_assetLogID;
}

- (void)setAssetLogID:(id)a3
{
}

- (id)userDataPath
{
  id v2 = [(THBookDescription *)self contextDirectoryPath];
  uint64_t v3 = +[NSString stringWithFormat:@"userdata_v%ld.sqlite", 0];

  return [(NSString *)v2 stringByAppendingPathComponent:v3];
}

+ (BOOL)containsUnknownContentVersions:(id)a3
{
  if (qword_573378 != -1) {
    dispatch_once(&qword_573378, &stru_45B3F8);
  }
  if ([a3 hasPrefix:@"{"]
    && [a3 hasSuffix:@"}"])
  {
    id v4 = objc_msgSend(objc_msgSend(a3, "substringWithRange:", 1, (char *)objc_msgSend(a3, "length") - 2), "componentsSeparatedByString:", @";");
  }
  else
  {
    id v4 = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    id v8 = (id *)&unk_573000;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v19 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v10 count] == (char *)&dword_0 + 2)
        {
          objc_opt_class();
          [v10 objectAtIndexedSubscript:0];
          uint64_t v11 = TSUDynamicCast();
          if (v11)
          {
            uint64_t v12 = v11;
            if (![v8[110] objectForKey:v11]) {
              return 1;
            }
            id v13 = [v8[110] objectForKey:v12];
            objc_opt_class();
            BOOL v14 = 1;
            [v10 objectAtIndexedSubscript:1];
            v15 = (void *)TSUDynamicCast();
            id v16 = [v13 integerValue];
            BOOL v17 = (uint64_t)v16 < (uint64_t)[v15 integerValue];
            id v8 = (id *)&unk_573000;
            if (v17) {
              return v14;
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 0;
}

+ (BOOL)readOpfMetadataWithArchive:(id)a3 toProperties:(id)a4
{
  uint64_t v7 = +[PFAXPackage opfXmlUriFromPackage:](PFAXPackage, "opfXmlUriFromPackage:");
  id v8 = v7;
  if (v7)
  {
    if ([(NSString *)v7 hasPrefix:@"/"]) {
      id v9 = v8;
    }
    else {
      id v9 = +[NSString stringWithFormat:@"/%@", v8];
    }
    [a4 setValue:v9 forKey:kTHBookInfoOPF];
    id v55 = objc_alloc_init((Class)NSAutoreleasePool);
    unsigned __int8 v10 = [a3 isEPUB];
    uint64_t v11 = (xmlTextReader *)objc_msgSend(objc_msgSend(a3, "entryWithName:", v9), "xmlReader");
    uint64_t v12 = v11;
    if (v11)
    {
      unsigned __int8 v53 = v10;
      id v52 = a1;
      v57[0] = 0;
      v57[1] = 0;
      v56 = v57;
      int v13 = xmlTextReaderDepth(v11);
      while (xmlTextReaderRead(v12) == 1)
      {
        int v14 = xmlTextReaderDepth(v12);
        int v15 = xmlTextReaderNodeType(v12);
        if (v14 == v13 && v15 == 15) {
          break;
        }
        if (v13 + 1 == v14 && v15 == 1)
        {
          id v16 = xmlTextReaderConstLocalName(v12);
          if (xmlStrEqual(v16, (const xmlChar *)"metadata"))
          {
            uint64_t v54 = v13 + 2;
            while (1)
            {
              while (1)
              {
LABEL_14:
                if (xmlTextReaderRead(v12) != 1) {
                  goto LABEL_85;
                }
                int v17 = xmlTextReaderDepth(v12);
                int v18 = xmlTextReaderNodeType(v12);
                if (v17 == v14 && v18 == 15) {
                  goto LABEL_85;
                }
                if (v54 != v17 || v18 != 1) {
                  continue;
                }
                long long v19 = xmlTextReaderConstLocalName(v12);
                if (!xmlStrEqual(v19, (const xmlChar *)"meta")) {
                  break;
                }
                int Attribute = xmlTextReaderMoveToFirstAttribute(v12);
                long long v21 = 0;
                long long v22 = 0;
                v23 = 0;
                while (Attribute == 1)
                {
                  v24 = xmlTextReaderConstLocalName(v12);
                  v25 = xmlTextReaderConstValue(v12);
                  if (xmlStrEqual(v24, (const xmlChar *)"name"))
                  {
                    long long v21 = v25;
                    if (!v25) {
                      goto LABEL_32;
                    }
                  }
                  else if (xmlStrEqual(v24, (const xmlChar *)"content"))
                  {
                    long long v22 = v25;
                    if (!v21) {
                      goto LABEL_32;
                    }
                  }
                  else
                  {
                    if (xmlStrEqual(v24, (const xmlChar *)"property")) {
                      v23 = v25;
                    }
                    if (!v21) {
                      goto LABEL_32;
                    }
                  }
                  if (v22) {
                    break;
                  }
LABEL_32:
                  int Attribute = xmlTextReaderMoveToNextAttribute(v12);
                }
                if (xmlStrEqual((const xmlChar *)"ibooks:subtitle", v21))
                {
                  v26 = +[NSString stringWithXmlString:v22];
                  v27 = &kTHBookInfoSubtitleKey;
                  goto LABEL_57;
                }
                if (xmlStrEqual((const xmlChar *)"ibooks:currentVersion", v21))
                {
                  v26 = +[NSString stringWithXmlString:v22];
                  v27 = &kTHBookInfoAuthoredVersion;
                  goto LABEL_57;
                }
                if (xmlStrEqual((const xmlChar *)"ibooks:requiredVersion", v21))
                {
                  v26 = +[NSString stringWithXmlString:v22];
                  v27 = &kTHBookInfoRequiredVersion;
                  goto LABEL_57;
                }
                if (xmlStrEqual((const xmlChar *)"ibooks:contentVersions", v21))
                {
                  if (objc_msgSend(v52, "containsUnknownContentVersions:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v22)))
                  {
                    v26 = +[NSNumber numberWithBool:1];
                    v27 = &kTHBookInfoContentVersions;
LABEL_57:
                    [a4 setValue:v26 forKey:*v27];
                  }
                }
                else if (xmlStrEqual((const xmlChar *)"ibooks:autoHyphenate", v21))
                {
                  v43 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [+[NSString stringWithXmlString:v22] isEqualToString:@"yes"]);
                  [a4 setValue:v43 forKey:kTHBookInfoAutoHyphenate];
                }
                else if (xmlStrEqual((const xmlChar *)"ibooks:version", v23))
                {
                  InnerXml = xmlTextReaderReadInnerXml(v12);
                  v47 = +[NSString stringWithXmlString:InnerXml];
                  [a4 setValue:v47 forKey:kTHBookInfoBookVersionStringKey];
                  if (InnerXml) {
                    xmlFree(InnerXml);
                  }
                }
              }
              v28 = xmlTextReaderConstNamespaceUri(v12);
              if (!xmlStrEqual(v28, (const xmlChar *)PFXCommonDublinCoreMetadataNS[0])) {
                goto LABEL_14;
              }
              int v29 = xmlStrEqual((const xmlChar *)"title", v19);
              v30 = &kTHBookInfoTitleKey;
              if (v29) {
                goto LABEL_37;
              }
              if (xmlStrEqual((const xmlChar *)"creator", v19))
              {
                for (int i = xmlTextReaderMoveToFirstAttribute(v12); ; int i = xmlTextReaderMoveToNextAttribute(v12))
                {
                  if (i != 1) {
                    goto LABEL_14;
                  }
                  v37 = xmlTextReaderConstLocalName(v12);
                  v38 = xmlTextReaderConstValue(v12);
                  if (xmlStrEqual(v37, (const xmlChar *)"role"))
                  {
                    if (xmlStrEqual(v38, (const xmlChar *)"aut")) {
                      break;
                    }
                  }
                }
                v30 = &kTHBookInfoAuthorKey;
                goto LABEL_37;
              }
              int v39 = xmlStrEqual((const xmlChar *)"publisher", v19);
              v30 = &kTHBookInfoPublisherKey;
              if (v39) {
                goto LABEL_37;
              }
              if (!xmlStrEqual((const xmlChar *)"identifier", v19))
              {
                int v44 = xmlStrEqual((const xmlChar *)"date", v19);
                v30 = &kTHBookInfoTimestamp;
                if (!v44)
                {
                  int v45 = xmlStrEqual((const xmlChar *)"language", v19);
                  v30 = &kTHBookInfoLanguageKey;
                  if (!v45) {
                    goto LABEL_14;
                  }
                }
                goto LABEL_37;
              }
              for (int j = xmlTextReaderMoveToFirstAttribute(v12); ; int j = xmlTextReaderMoveToNextAttribute(v12))
              {
                if (j != 1) {
                  goto LABEL_14;
                }
                v41 = xmlTextReaderConstLocalName(v12);
                v42 = xmlTextReaderConstValue(v12);
                if (v53) {
                  break;
                }
                if (xmlStrEqual(v41, (const xmlChar *)"scheme"))
                {
                  int v48 = xmlStrEqual(v42, (const xmlChar *)"ISBN");
                  v30 = &kTHBookInfoISBN;
                  if (v48) {
                    goto LABEL_37;
                  }
                  int v49 = xmlStrEqual(v42, (const xmlChar *)"UUID");
                  goto LABEL_83;
                }
LABEL_66:
                ;
              }
              if (!xmlStrEqual(v41, (const xmlChar *)"id")) {
                goto LABEL_66;
              }
              int v50 = xmlStrEqual(v42, (const xmlChar *)"isbn");
              v30 = &kTHBookInfoISBN;
              if (v50) {
                goto LABEL_37;
              }
              int v49 = xmlStrEqual(v42, (const xmlChar *)"uid");
LABEL_83:
              v30 = &kTHBookInfoUUID;
              if (!v49) {
                goto LABEL_14;
              }
LABEL_37:
              v31 = *v30;
              if (*v30 && !xmlTextReaderIsEmptyElement(v12))
              {
                String = xmlTextReaderReadString(v12);
                id v33 = [objc_alloc((Class)NSString) initWithXmlString:String];
                if (!v33)
                {
                  v34 = xmlTextReaderReadInnerXml(v12);
                  id v33 = [objc_alloc((Class)NSString) initWithXmlString:v34];
                  if (v34) {
                    xmlFree(v34);
                  }
                }
                if ([(__CFString *)v31 isEqualToString:kTHBookInfoLanguageKey])
                {
                  [a4 setValue:v33 forKey:kTHBookInfoRawLanguageKey];
                  id v35 = +[PFSConstants languageForString:v33];

                  id v33 = v35;
                }
                [a4 setValue:v33 forKey:v31];
                if (String) {
                  xmlFree(String);
                }
              }
            }
          }
        }
      }
LABEL_85:
      sub_1E7BA0((uint64_t)&v56, v57[0]);
      if (v12) {
        xmlFreeTextReader(v12);
      }
    }
  }
  return v8 != 0;
}

+ (id)readBookPropertiesFromURL:(id)a3 error:(id *)a4
{
  objc_opt_class();
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", [a3 path]);
  if (![(PFXArchive *)v8 isValid]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THBookDescriptionAdditions.mm") lineNumber:392 description:@"Failed to load valid archive"];
  }
  if ([(PFXArchive *)v8 isValid])
  {
    [(PFXArchive *)v8 setPreventUseOfEncryptionCache:+[THBookDescription isSampleAtURL:a3]];
    [a1 readOpfMetadataWithArchive:v8 toProperties:v7];
    +[PFAIDisplayOptions readWithArchive:v8 toProperties:v7];
  }

  if (a4 && *a4) {
    return 0;
  }
  return v7;
}

@end