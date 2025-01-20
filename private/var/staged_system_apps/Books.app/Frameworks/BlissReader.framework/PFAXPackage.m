@interface PFAXPackage
+ (BOOL)validateMimetypeInArchive:(id)a3 validMimetypes:(id)a4;
+ (__CFDictionary)rightsInfoForArchive:(id)a3;
+ (__CFDictionary)rightsInfoForArchiveAtPath:(id)a3;
+ (id)encryptionXmlPathForArchive:(id)a3;
+ (id)encryptionXmlPathForArchiveAtPath:(id)a3;
+ (id)newAllEncryptionInfoForArchive:(id)a3;
+ (id)newAllEncryptionInfoFromAssetForArchive:(id)a3;
+ (id)newAllEncryptionInfoFromAssetForArchiveAtPath:(id)a3;
+ (id)newAllEncryptionInfoFromCacheForArchive:(id)a3 originalEncryptionPath:(id)a4;
+ (id)opfXmlUriFromPackage:(id)a3;
+ (void)writeContainerXmlToStream:(id)a3;
+ (void)writeMimetypeEntry:(id)a3 toStream:(id)a4;
@end

@implementation PFAXPackage

+ (void)writeContainerXmlToStream:(id)a3
{
  v3 = +[PFXStreamWriter createXmlTextWriterAtEntry:@"META-INF/container.xml" inOutputStream:a3 isCompressed:1];
  xmlTextWriterStartDocument(v3, 0, "UTF-8", 0);
  if (+[PFXStreamWriter startElementInStream:v3 name:@"container" prefix:0 ns:PFXCommonEpubContainerNS[0]])
  {
    +[PFXStreamWriter writeAttributeToStream:v3 name:@"version" content:@"1.0"];
  }
  +[PFXStreamWriter startElementInStream:v3 name:@"rootfiles"];
  if (+[PFXStreamWriter startElementInStream:name:](PFXStreamWriter, "startElementInStream:name:", v3, @"rootfile")&& +[PFXStreamWriter writeAttributeToStream:v3 name:@"full-path" content:@"contents/publication.xml"])
  {
    +[PFXStreamWriter writeAttributeToStream:v3 name:@"media-type" content:PFXCommonOEBPSPackageMediaType];
  }
  xmlTextWriterEndDocument(v3);
  xmlTextWriterFlush(v3);

  xmlFreeTextWriter(v3);
}

+ (id)opfXmlUriFromPackage:(id)a3
{
  id v3 = [a3 entryWithName:@"META-INF/container.xml"];
  if (!v3) {
    return 0;
  }
  v4 = (xmlTextReader *)[v3 xmlReader];
  if (!v4) {
    return 0;
  }
  v5 = v4;
  int v6 = xmlTextReaderDepth(v4);
  while (xmlTextReaderRead(v5) == 1)
  {
    int v7 = xmlTextReaderNodeType(v5);
    int v8 = xmlTextReaderDepth(v5);
    if (v8 == v6 && v7 == 15) {
      break;
    }
    if (v8 == v6 && v7 == 1)
    {
      v9 = xmlTextReaderConstLocalName(v5);
      if (xmlStrEqual(v9, (const xmlChar *)"container"))
      {
        v10 = xmlTextReaderConstNamespaceUri(v5);
        if (xmlStrEqual(v10, (const xmlChar *)PFXCommonEpubContainerNS[0]))
        {
          Attribute = xmlTextReaderGetAttribute(v5, (const xmlChar *)"version");
          if (Attribute)
          {
            v12 = Attribute;
            int v13 = xmlStrEqual(Attribute, (const xmlChar *)"1.0");
            xmlFree(v12);
            if (v13)
            {
              int v16 = xmlTextReaderDepth(v5);
              if (xmlTextReaderRead(v5) == 1)
              {
                while (1)
                {
                  v17 = xmlTextReaderConstLocalName(v5);
                  int v18 = xmlTextReaderNodeType(v5);
                  int v19 = xmlTextReaderDepth(v5);
                  if (v19 == v16 && v18 == 15) {
                    break;
                  }
                  v14 = 0;
                  if (v16 + 1 == v19 && v18 == 1)
                  {
                    if (xmlStrEqual(v17, (const xmlChar *)"rootfiles"))
                    {
                      while (xmlTextReaderRead(v5) == 1)
                      {
                        v20 = xmlTextReaderConstLocalName(v5);
                        int v21 = xmlTextReaderNodeType(v5);
                        if (v16 + 2 == xmlTextReaderDepth(v5) && v21 == 1)
                        {
                          if (xmlStrEqual(v20, (const xmlChar *)"rootfile"))
                          {
                            v22 = xmlTextReaderGetAttribute(v5, (const xmlChar *)"media-type");
                            if (v22)
                            {
                              v23 = v22;
                              int v24 = xmlStrEqual(v22, (const xmlChar *)PFXCommonOEBPSPackageMediaTypeXmlChars);
                              xmlFree(v23);
                              if (v24)
                              {
                                v25 = xmlTextReaderGetAttribute(v5, (const xmlChar *)"full-path");
                                if (v25)
                                {
                                  v26 = v25;
                                  v14 = +[NSString stringWithUTF8String:v25];
                                  xmlFree(v26);
                                  goto LABEL_32;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                    v14 = 0;
                  }
LABEL_32:
                  if (xmlTextReaderRead(v5) != 1 || v14) {
                    goto LABEL_14;
                  }
                }
              }
              break;
            }
          }
        }
      }
    }
  }
  v14 = 0;
LABEL_14:
  xmlFreeTextReader(v5);
  return v14;
}

+ (void)writeMimetypeEntry:(id)a3 toStream:(id)a4
{
}

+ (BOOL)validateMimetypeInArchive:(id)a3 validMimetypes:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = [a3 entryWithName:@"mimetype"];
  if (!v5) {
    return 0;
  }
  int v6 = v5;
  id v7 = objc_alloc_init((Class)NSMutableData);
  if (![v6 readIntoData:v7]) {
    goto LABEL_17;
  }
  id v8 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
  v9 = +[NSString stringWithString:v8];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [a4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(a4);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = [(NSString *)v9 length];
        int v16 = [v14 length];
        if (v15 > v16)
        {
          v17 = v16;
          if (!-[NSString length](-[NSString stringByTrimmingCharactersInSet:](-[NSString substringWithRange:](v9, "substringWithRange:", v16, v15 - v16), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")), "length"))v9 = [(NSString *)v9 substringToIndex:v17]; {
        }
          }
        if ([[(NSString *)v9 lowercaseString] isEqualToString:v14])
        {
          BOOL v18 = 1;
          goto LABEL_19;
        }
      }
      id v11 = [a4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      BOOL v18 = 0;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_17:
    BOOL v18 = 0;
  }
LABEL_19:

  return v18;
}

+ (id)encryptionXmlPathForArchive:(id)a3
{
  id v4 = [a3 rootFolder];

  return [a1 encryptionXmlPathForArchiveAtPath:v4];
}

+ (id)encryptionXmlPathForArchiveAtPath:(id)a3
{
  return [a3 stringByAppendingString:@"/META-INF/encryption.xml"];
}

+ (id)newAllEncryptionInfoFromAssetForArchiveAtPath:(id)a3
{
  char v5 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(a1, "encryptionXmlPathForArchiveAtPath:"), &v5))
  {
    BOOL v3 = v5 == 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  if (v3) {
    operator new();
  }
  return 0;
}

+ (id)newAllEncryptionInfoFromAssetForArchive:(id)a3
{
  id v4 = [a3 rootFolder];

  return [a1 newAllEncryptionInfoFromAssetForArchiveAtPath:v4];
}

+ (id)newAllEncryptionInfoFromCacheForArchive:(id)a3 originalEncryptionPath:(id)a4
{
  if (!objc_msgSend(objc_msgSend(a3, "asset"), "assetID")) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFAXPackage newAllEncryptionInfoFromCacheForArchive:originalEncryptionPath:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/XML/PFAXPackage.mm") lineNumber:455 description:@"Attempting to cache an asset without an ID."];
  }
  id v7 = [[THApplicationDelegate cacheDirectoryForAsset:[a3 asset]] stringByAppendingPathComponent:@"encryption_xml_cache.plist"];
  id v8 = &isPad_ptr;
  id v42 = v7;
  if (v7
    && ((id v9 = v7,
         char v44 = 0,
         [+[NSFileManager defaultManager] fileExistsAtPath:v7 isDirectory:&v44])? (BOOL v10 = v44 == 0): (BOOL v10 = 0), v10))
  {
    id v11 = [objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:v9];
  }
  else
  {
    id v11 = 0;
  }
  id v43 = 0;
  [+[NSURL fileURLWithPath:a4] getResourceValue:&v43 forKey:NSURLFileSizeKey error:0];
  if (v11)
  {
    id v41 = a1;
    objc_opt_class();
    [v11 objectForKey:PFAXPackageEncryptionCacheVersion];
    [(id)TSUDynamicCast() doubleValue];
    double v13 = v12;
    objc_opt_class();
    [v11 objectForKey:PFAXPackageEncryptionCacheTimestamp];
    uint64_t v14 = TSUDynamicCast();
    objc_opt_class();
    [v11 objectForKey:PFAXPackageEncryptionCacheAssetID];
    uint64_t v40 = TSUDynamicCast();
    objc_opt_class();
    [v11 objectForKey:PFAXPackageEncryptionCacheAssetType];
    uint64_t v38 = TSUDynamicCast();
    objc_opt_class();
    [v11 objectForKey:PFAXPackageEncryptionCacheOriginalEncryptionFileSize];
    v39 = (void *)TSUDynamicCast();
    objc_opt_class();
    [v11 objectForKey:PFAXPackageEncryptionCacheAssetURL];
    uint64_t v15 = TSUDynamicCast();
    if (v15) {
      int v16 = +[NSURL URLWithString:v15];
    }
    else {
      int v16 = 0;
    }
    objc_opt_class();
    [v11 objectForKey:PFAXPackageEncryptionCacheBookVersion];
    uint64_t v17 = TSUDynamicCast();
    if (v17) {
      BOOL v18 = [[THBookVersion alloc] initWithString:v17];
    }
    else {
      BOOL v18 = +[THBookVersion unversionedBookVersion];
    }
    int v19 = v18;
    long long v20 = +[NSDate date];
    long long v21 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", [v41 encryptionXmlPathForArchive:a3], 0);
    if (v21) {
      id v22 = [(NSDictionary *)v21 objectForKey:NSFileCreationDate];
    }
    else {
      id v22 = 0;
    }
    BOOL v23 = 0;
    double v24 = fabs(v13 + -1.0);
    BOOL v25 = 1;
    if (v22 && v14)
    {
      BOOL v23 = [(NSDate *)v20 compare:v22] != NSOrderedAscending
         && [(NSDate *)v20 compare:v14] != NSOrderedAscending;
      BOOL v25 = [v22 compare:v14] == (char *)&dword_0 + 1;
    }
    unsigned int v26 = +[THAsset asset:isSameAsAsset:](THAsset, "asset:isSameAsAsset:", [a3 asset], +[THAsset assetWithURL:assetID:type:](THAsset, "assetWithURL:assetID:type:", v16, v40, v38));
    unsigned int v27 = objc_msgSend(objc_msgSend(a3, "bookVersion"), "isEqualToBookVersion:", v19);
    id v28 = [v43 integerValue];
    id v29 = [v39 integerValue];
    if (v24 < 0.00999999978 && !v25 && v26 && v27 && v23 && v28 == v29)
    {
      objc_opt_class();
      [v11 objectForKey:PFAXPackageEncryptionCachePayload];
      id v30 = (id)TSUDynamicCast();

      id v8 = &isPad_ptr;
      if (v30) {
        return v30;
      }
    }
    else
    {

      id v8 = &isPad_ptr;
    }
    a1 = v41;
    if ([+[NSFileManager defaultManager] isDeletableFileAtPath:v42])
    {
      [+[NSFileManager defaultManager] removeItemAtPath:v42 error:0];
    }
  }
  id v30 = [a1 newAllEncryptionInfoFromAssetForArchive:a3];
  id v31 = objc_alloc_init((Class)v8[413]);
  v32 = +[NSNumber numberWithDouble:1.0];
  [v31 setObject:v32 forKey:PFAXPackageEncryptionCacheVersion];
  [v31 setObject:[NSDate date] forKey:PFAXPackageEncryptionCacheTimestamp];
  if (objc_msgSend(objc_msgSend(a3, "asset"), "assetID"))
  {
    id v33 = objc_msgSend(objc_msgSend(a3, "asset"), "assetID");
    [v31 setObject:v33 forKey:PFAXPackageEncryptionCacheAssetID];
  }
  if (objc_msgSend(objc_msgSend(a3, "asset"), "assetType"))
  {
    id v34 = objc_msgSend(objc_msgSend(a3, "asset"), "assetType");
    [v31 setObject:v34 forKey:PFAXPackageEncryptionCacheAssetType];
  }
  if (objc_msgSend(objc_msgSend(a3, "asset"), "url"))
  {
    id v35 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "asset"), "url"), "absoluteString");
    [v31 setObject:v35 forKey:PFAXPackageEncryptionCacheAssetURL];
  }
  if (objc_msgSend(objc_msgSend(a3, "bookVersion"), "versionString"))
  {
    id v36 = objc_msgSend(objc_msgSend(a3, "bookVersion"), "versionString");
    [v31 setObject:v36 forKey:PFAXPackageEncryptionCacheBookVersion];
  }
  if (v30) {
    [v31 setObject:v30 forKey:PFAXPackageEncryptionCachePayload];
  }
  if (v43) {
    [v31 setObject:v43 forKey:PFAXPackageEncryptionCacheOriginalEncryptionFileSize];
  }
  +[THApplicationDelegate ensureCacheDirectory:](THApplicationDelegate, "ensureCacheDirectory:", [a3 asset]);
  [v31 writeToFile:v42 atomically:1];

  return v30;
}

+ (id)newAllEncryptionInfoForArchive:(id)a3
{
  id v5 = [a1 encryptionXmlPathForArchive:];
  char v9 = 0;
  if ([+[NSFileManager defaultManager] fileExistsAtPath:v5 isDirectory:&v9])
  {
    BOOL v6 = v9 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  if (!v6) {
    return 0;
  }
  unsigned int v8 = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"preventUseOfEncryptionCache"];
  if (objc_msgSend(objc_msgSend(a3, "asset"), "assetID")
    && objc_msgSend(objc_msgSend(a3, "bookVersion"), "isValid")
    && (([a3 preventUseOfEncryptionCache] | v8) & 1) == 0)
  {
    return [a1 newAllEncryptionInfoFromCacheForArchive:a3 originalEncryptionPath:v5];
  }
  else
  {
    return [a1 newAllEncryptionInfoFromAssetForArchive:a3];
  }
}

+ (__CFDictionary)rightsInfoForArchive:(id)a3
{
  id v4 = [a3 perUserRootFolder];

  return (__CFDictionary *)[a1 rightsInfoForArchiveAtPath:v4];
}

+ (__CFDictionary)rightsInfoForArchiveAtPath:(id)a3
{
  if (a3)
  {
    char v5 = 0;
    if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", [a3 stringByAppendingString:@"/META-INF/sinf.xml"], &v5))
    {
      BOOL v3 = v5 == 0;
    }
    else
    {
      BOOL v3 = 0;
    }
    if (v3) {
      operator new();
    }
  }
  return 0;
}

@end