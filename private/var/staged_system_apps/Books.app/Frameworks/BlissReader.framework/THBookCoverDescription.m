@interface THBookCoverDescription
+ (BOOL)readEmbeddedArtURLWithArchive:(id)a3 toProperties:(id)a4;
+ (THBookCoverDescription)descriptionWithURL:(id)a3;
+ (THBookCoverDescription)descriptionWithURL:(id)a3 assetID:(id)a4;
+ (id)displayNameFromFilePath:(id)a3;
+ (id)readEmbeddedArtPropertiesFromURL:(id)a3 error:(id *)a4;
+ (id)summaryWithURL:(id)a3;
- (BOOL)wasThinned;
- (CGImageSource)embeddedArtImageSource;
- (NSString)embeddedArtHref;
- (PFDContext)drmContext;
- (THAsset)asset;
- (THBookCoverDescription)initWithURL:(id)a3 assetID:(id)a4 summary:(id)a5;
- (id)bookBundleUrl;
- (id)dcTermsContributor;
- (id)embeddedArtURL;
- (void)dealloc;
@end

@implementation THBookCoverDescription

- (THBookCoverDescription)initWithURL:(id)a3 assetID:(id)a4 summary:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)THBookCoverDescription;
  v8 = [(THBookCoverDescription *)&v10 init];
  if (v8)
  {
    v8->mAsset = [[THAsset alloc] initWithURL:a3 assetID:a4];
    v8->mBookSummary = (NSDictionary *)a5;
  }
  return v8;
}

+ (id)summaryWithURL:(id)a3
{
  id v11 = 0;
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [a3 path]))
  {
    id result = [a1 readEmbeddedArtPropertiesFromURL:a3 error:&v11];
    if (result) {
      return result;
    }
    id v6 = v11;
    id v7 = +[TSUAssertionHandler currentHandler];
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookCoverDescription summaryWithURL:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookCoverDescription.m"];
    if (v6) {
      [v7 handleFailureInFunction:v8, v9, 63, @"Error reading properties from iBook: %@", [v11 description]];
    }
    else {
      [v7 handleFailureInFunction:v8 file:v9 lineNumber:67 description:@"Error reading properties from iBook."];
    }
  }
  return 0;
}

- (PFDContext)drmContext
{
  v3 = +[PFDContextManager sharedInstance];
  v4 = [(NSURL *)[(THAsset *)self->mAsset url] path];

  return (PFDContext *)[(PFDContextManager *)v3 contextForArchive:v4];
}

+ (THBookCoverDescription)descriptionWithURL:(id)a3
{
  id result = [a1 summaryWithURL:];
  if (result)
  {
    v5 = result;
    id v6 = (__CFString *)[(THBookCoverDescription *)result objectForKey:kTHBookCoverInfoUUID];
    if (![(__CFString *)v6 length])
    {
      id v7 = [(THBookCoverDescription *)v5 objectForKey:kTHBookCoverInfoOPF];
      char v10 = 0;
      if (v7
        && (id v8 = v7,
            -[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", [a3 path], &v10))&& v10)
      {
        CFStringRef v9 = (const __CFString *)+[NSString md5StringWithContentsOfFile:](NSString, "md5StringWithContentsOfFile:", objc_msgSend(objc_msgSend(a3, "URLByAppendingPathComponent:", v8), "path"));
      }
      else
      {
        CFStringRef v9 = THUniqueIdForPath([a3 path]);
      }
      id v6 = (__CFString *)v9;
    }
    return [[THBookCoverDescription alloc] initWithURL:a3 assetID:v6 summary:v5];
  }
  return result;
}

+ (THBookCoverDescription)descriptionWithURL:(id)a3 assetID:(id)a4
{
  id result = [a1 summaryWithURL:];
  if (result)
  {
    id v7 = [[THBookCoverDescription alloc] initWithURL:a3 assetID:a4 summary:result];
    return v7;
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
  v3.receiver = self;
  v3.super_class = (Class)THBookCoverDescription;
  [(THBookCoverDescription *)&v3 dealloc];
}

- (id)bookBundleUrl
{
  v2 = [(THBookCoverDescription *)self asset];

  return [(THAsset *)v2 url];
}

- (id)embeddedArtURL
{
  id result = [(THBookCoverDescription *)self embeddedArtHref];
  if (result)
  {
    id v4 = result;
    id v5 = [(THBookCoverDescription *)self bookBundleUrl];
    return [v5 URLByAppendingPathComponent:v4];
  }
  return result;
}

- (NSString)embeddedArtHref
{
  return (NSString *)[(NSDictionary *)self->mBookSummary objectForKey:kTHBookCoverInfoCoverImageKey];
}

- (id)dcTermsContributor
{
  return [(NSDictionary *)self->mBookSummary objectForKey:kTHBookCoverContributor];
}

- (CGImageSource)embeddedArtImageSource
{
  objc_super v3 = [(THBookCoverDescription *)self drmContext];
  CFURLRef v4 = [(THBookCoverDescription *)self embeddedArtURL];
  if (v3) {
    CGImageSourceRef v5 = [(PFDContext *)v3 newImageSourceWithContentsOfURL:v4 error:0];
  }
  else {
    CGImageSourceRef v5 = CGImageSourceCreateWithURL(v4, 0);
  }

  return v5;
}

- (BOOL)wasThinned
{
  return [(NSDictionary *)self->mBookSummary objectForKey:kTHBookCoverThinningVersion] != 0;
}

- (THAsset)asset
{
  return self->mAsset;
}

+ (BOOL)readEmbeddedArtURLWithArchive:(id)a3 toProperties:(id)a4
{
  v72 = +[PFAXPackage opfXmlUriFromPackage:](PFAXPackage, "opfXmlUriFromPackage:");
  if (!v72) {
    return v72 != 0;
  }
  CGImageSourceRef v5 = v72;
  if (![(NSString *)v72 hasPrefix:@"/"]) {
    CGImageSourceRef v5 = +[NSString stringWithFormat:@"/%@", v72];
  }
  [a4 setValue:v5 forKey:kTHBookCoverInfoOPF];
  unsigned __int8 v67 = [a3 isEPUB];
  id v66 = objc_alloc_init((Class)NSAutoreleasePool);
  v65 = +[NSURL URLWithString:v5];
  id v6 = [(xmlTextReader *)[a3 entryWithName:v5] xmlReader];
  id v7 = v6;
  if (!v6) {
    goto LABEL_115;
  }
  id v64 = a4;
  long long v79 = 0uLL;
  uint64_t v80 = 0;
  memset(v77, 0, sizeof(v77));
  int v78 = 1065353216;
  uint64_t v8 = xmlTextReaderDepth(v6);
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = (int)v8 + 1;
  uint64_t v71 = (int)v8 + 2;
  do
  {
    do
    {
LABEL_6:
      if (xmlTextReaderRead(v7) == 1)
      {
        int v12 = xmlTextReaderDepth(v7);
        int v13 = xmlTextReaderNodeType(v7);
        if (v12 != v8 || v13 != 15) {
          continue;
        }
      }
      goto LABEL_111;
    }
    while (v11 != v12 || v13 != 1);
    v14 = xmlTextReaderConstLocalName(v7);
    if (xmlStrEqual(v14, (const xmlChar *)"metadata"))
    {
      uint64_t v68 = v11;
      uint64_t v69 = v8;
      id v62 = 0;
      v63 = 0;
      v61 = 0;
LABEL_15:
      uint64_t v15 = v9;
      uint64_t v16 = v10;
      while (1)
      {
LABEL_16:
        uint64_t v10 = v16;
        uint64_t v9 = v15;
        uint64_t v11 = v68;
        uint64_t v8 = v69;
        if (xmlTextReaderRead(v7) != 1) {
          goto LABEL_6;
        }
        int v17 = xmlTextReaderDepth(v7);
        int v18 = xmlTextReaderNodeType(v7);
        if (v17 == v12 && v18 == 15)
        {
          if (v62)
          {
            v38 = v61;
            v39 = -[THAsset initWithURL:assetID:]([THAsset alloc], "initWithURL:assetID:", +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", [a3 rootPath], objc_msgSend(a3, "isDirectory")), v62);
          }
          else
          {
            v39 = 0;
            v38 = v61;
          }
          if (v63) {
            v40 = [[THBookVersion alloc] initWithString:v63];
          }
          else {
            v40 = +[THBookVersion newUnversionedBookVersion];
          }
          v41 = v40;
          [a3 setBookVersion:v40];
          [a3 setAsset:v39];
          if (v38) {
            [v64 setObject:v38 forKey:kTHBookCoverThinningVersion];
          }

          goto LABEL_6;
        }
        uint64_t v16 = v10;
        if (v71 != v17) {
          continue;
        }
        uint64_t v16 = v10;
        if (v18 != 1) {
          continue;
        }
        v19 = xmlTextReaderConstLocalName(v7);
        if (!xmlStrEqual(v19, (const xmlChar *)"meta"))
        {
          uint64_t v15 = 1;
          uint64_t v16 = 1;
          if ((v9 & v10 & 1) == 0)
          {
            v27 = xmlTextReaderConstNamespaceUri(v7);
            uint64_t v15 = v9;
            uint64_t v16 = v10;
            if (xmlStrEqual(v27, (const xmlChar *)PFXCommonDublinCoreMetadataNS[0]))
            {
              if (xmlStrEqual((const xmlChar *)"identifier", v19))
              {
                for (int i = xmlTextReaderMoveToFirstAttribute(v7); ; int i = xmlTextReaderMoveToNextAttribute(v7))
                {
                  if (i != 1) {
                    goto LABEL_15;
                  }
                  v29 = xmlTextReaderConstLocalName(v7);
                  v30 = xmlTextReaderConstValue(v7);
                  if (v67)
                  {
                    if (xmlStrEqual(v29, (const xmlChar *)"id"))
                    {
                      int v33 = xmlStrEqual(v30, (const xmlChar *)"uid");
LABEL_55:
                      uint64_t v15 = v9;
                      uint64_t v16 = v10;
                      if (!v33) {
                        goto LABEL_16;
                      }
                      uint64_t v15 = 1;
                      uint64_t v16 = v10;
                      v32 = &kTHBookCoverInfoUUID;
                      goto LABEL_57;
                    }
                  }
                  else if (xmlStrEqual(v29, (const xmlChar *)"scheme"))
                  {
                    int v33 = xmlStrEqual(v30, (const xmlChar *)"UUID");
                    goto LABEL_55;
                  }
                }
              }
              uint64_t v15 = v9;
              uint64_t v16 = v10;
              if (xmlStrEqual((const xmlChar *)"contributor", v19))
              {
                uint64_t v16 = 1;
                uint64_t v15 = v9;
                v32 = &kTHBookCoverContributor;
LABEL_57:
                v34 = *v32;
                if (*v32 && !xmlTextReaderIsEmptyElement(v7))
                {
                  String = xmlTextReaderReadString(v7);
                  id v36 = [objc_alloc((Class)NSString) initWithXmlString:String];
                  if (!v36)
                  {
                    InnerXml = xmlTextReaderReadInnerXml(v7);
                    id v36 = [objc_alloc((Class)NSString) initWithXmlString:InnerXml];
                    if (InnerXml) {
                      xmlFree(InnerXml);
                    }
                  }
                  [v64 setValue:v36 forKey:v34];
                  if ([kTHBookCoverInfoUUID isEqualToString:v34]) {
                    id v62 = [v36 copy];
                  }
                  if (String) {
                    xmlFree(String);
                  }
                }
              }
            }
          }
          continue;
        }
        int Attribute = xmlTextReaderMoveToFirstAttribute(v7);
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (Attribute == 1)
        {
          v24 = xmlTextReaderConstLocalName(v7);
          v25 = xmlTextReaderConstValue(v7);
          if (xmlStrEqual(v24, (const xmlChar *)"name"))
          {
            v21 = v25;
            if (!v25) {
              goto LABEL_34;
            }
          }
          else if (xmlStrEqual(v24, (const xmlChar *)"content"))
          {
            v22 = (char *)v25;
            if (!v21) {
              goto LABEL_34;
            }
          }
          else
          {
            if (xmlStrEqual(v24, (const xmlChar *)"property")) {
              v23 = v25;
            }
            if (!v21) {
              goto LABEL_34;
            }
          }
          if (v22) {
            break;
          }
LABEL_34:
          int Attribute = xmlTextReaderMoveToNextAttribute(v7);
        }
        if (xmlStrEqual((const xmlChar *)"cover", v21))
        {
          sub_1F43C0(v75, v22);
          if (SHIBYTE(v80) < 0) {
            operator delete((void *)v79);
          }
          long long v79 = *(_OWORD *)v75;
          uint64_t v80 = v76;
          goto LABEL_15;
        }
        if (xmlStrEqual((const xmlChar *)"ibooks:version", v23))
        {
          v26 = xmlTextReaderReadInnerXml(v7);
          v63 = +[NSString stringWithXmlString:v26];
          uint64_t v15 = v9;
          uint64_t v16 = v10;
          if (v26)
          {
            xmlFree(v26);
            uint64_t v15 = v9;
            uint64_t v16 = v10;
          }
        }
        else
        {
          int v31 = xmlStrEqual((const xmlChar *)"ibooks:thinningversion", v21);
          uint64_t v15 = v9;
          uint64_t v16 = v10;
          if (v31)
          {
            uint64_t v15 = v9;
            uint64_t v16 = v10;
            if (v22)
            {
              v61 = +[NSString stringWithXmlString:v22];
              uint64_t v15 = v9;
              uint64_t v16 = v10;
            }
          }
        }
      }
    }
  }
  while (!xmlStrEqual(v14, (const xmlChar *)"manifest"));
  uint64_t v42 = HIBYTE(v80);
  if (v80 < 0) {
    uint64_t v42 = *((void *)&v79 + 1);
  }
  if (v42)
  {
    while (xmlTextReaderRead(v7) == 1)
    {
      int v43 = xmlTextReaderDepth(v7);
      int v44 = xmlTextReaderNodeType(v7);
      if (v43 == v12 && v44 == 15)
      {
        if ([a3 isDirectory])
        {
          uint64_t v53 = HIBYTE(v80);
          if (v80 < 0) {
            uint64_t v53 = *((void *)&v79 + 1);
          }
          if (v53)
          {
            v54 = sub_1F9368(v77, (unsigned __int8 *)&v79);
            if (v54)
            {
              id v55 = objc_alloc((Class)NSString);
              v56 = v54 + 40;
              if ((char)v54[63] < 0) {
                v56 = (void *)*v56;
              }
              id v57 = [v55 initWithUTF8String:v56];
              id v58 = [objc_alloc((Class)NSURL) initWithString:v57 relativeToURL:v65];
              id v59 = [v58 path];
              [a3 checkEncryption];
              [v64 setValue:v59 forKey:kTHBookCoverInfoCoverImageKey];
            }
          }
        }
        break;
      }
      if (v71 == v43 && v44 == 1)
      {
        v45 = xmlTextReaderConstLocalName(v7);
        if (xmlStrEqual(v45, (const xmlChar *)"item"))
        {
          int v46 = xmlTextReaderMoveToFirstAttribute(v7);
          v47 = 0;
          v48 = 0;
          while (v46 == 1)
          {
            v49 = xmlTextReaderConstLocalName(v7);
            v50 = xmlTextReaderConstValue(v7);
            if (xmlStrEqual(v49, (const xmlChar *)"id"))
            {
              v47 = (char *)v50;
            }
            else if (xmlStrEqual(v49, (const xmlChar *)"href"))
            {
              v48 = (char *)v50;
            }
            int v46 = xmlTextReaderMoveToNextAttribute(v7);
          }
          if (xmlStrlen((const xmlChar *)v47) >= 1 && xmlStrlen((const xmlChar *)v48) >= 1)
          {
            sub_1F43C0(v75, v48);
            sub_1F43C0(__p, v47);
            v81 = __p;
            v51 = sub_22E598((uint64_t)v77, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v81);
            v52 = v51 + 40;
            if ((char)v51[63] < 0) {
              operator delete(*(void **)v52);
            }
            *(_OWORD *)v52 = *(_OWORD *)v75;
            *((void *)v52 + 2) = v76;
            HIBYTE(v76) = 0;
            LOBYTE(v75[0]) = 0;
            if (v74 < 0)
            {
              operator delete(__p[0]);
              if (SHIBYTE(v76) < 0) {
                operator delete(v75[0]);
              }
            }
          }
        }
      }
    }
  }
LABEL_111:
  sub_2108CC((uint64_t)v77);
  if (SHIBYTE(v80) < 0) {
    operator delete((void *)v79);
  }
  if (v7) {
    xmlFreeTextReader(v7);
  }
LABEL_115:

  return v72 != 0;
}

+ (id)readEmbeddedArtPropertiesFromURL:(id)a3 error:(id *)a4
{
  objc_opt_class();
  id v7 = +[NSMutableDictionary dictionary];
  uint64_t v8 = -[PFXArchive initWithPath:allowArchive:]([PFXArchive alloc], "initWithPath:allowArchive:", [a3 path], 1);
  if (![(PFXArchive *)v8 isValid]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THBookCoverDescriptionAdditions.mm") lineNumber:376 description:@"Failed to load valid archive"];
  }
  if ([(PFXArchive *)v8 isValid])
  {
    [(PFXArchive *)v8 setPreventUseOfEncryptionCache:+[THBookDescription isSampleAtURL:a3]];
    [a1 readEmbeddedArtURLWithArchive:v8 toProperties:v7];
  }

  if (a4 && *a4) {
    return 0;
  }
  return v7;
}

@end