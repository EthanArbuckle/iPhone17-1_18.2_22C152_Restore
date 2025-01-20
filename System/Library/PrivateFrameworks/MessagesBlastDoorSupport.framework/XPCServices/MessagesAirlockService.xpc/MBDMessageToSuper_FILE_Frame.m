@interface MBDMessageToSuper_FILE_Frame
+ (BOOL)containsEmojiImageInfoExtractedFrom:(id)a3;
+ (BOOL)isLivePhotoAttribute:(id)a3;
+ (id)fileAttachmentsExtractedFrom:(id)a3;
+ (id)imageInfoExtractedFrom:(id)a3;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDMessageToSuper_FILE_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v14 = a4;
  id v9 = MBDIMCopyNormalizedAttributes(a8, 1, 0);
  v10 = [v9 _stringForKey:@"name"];
  if (v10 && ([(id)objc_opt_class() isLivePhotoAttribute:v9] & 1) == 0)
  {
    id v11 = [v9 mutableCopy];
    v12 = [(id)objc_opt_class() imageInfoExtractedFrom:v11];
    v13 = [(id)objc_opt_class() fileAttachmentsExtractedFrom:v11];
    if ([(id)objc_opt_class() containsEmojiImageInfoExtractedFrom:v11]) {
      [v14 appendFailedGenmojiAttributes];
    }
    else {
      [v14 appendFileTransferAttribute:v10 attachments:v13 imageInfo:v12];
    }
  }
}

+ (BOOL)isLivePhotoAttribute:(id)a3
{
  v3 = [a3 _stringForKey:MBDIMFileTransferIrisKey];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

+ (id)imageInfoExtractedFrom:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 _stringForKey:@"width"];
  uint64_t v5 = (uint64_t)[v4 integerValue];

  v6 = [v3 _stringForKey:@"height"];
  uint64_t v7 = (uint64_t)[v6 integerValue];

  [v3 removeObjectsForKeys:&off_10003EE28];
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  if (v5 >= 1 && v7 >= 1)
  {
    id v9 = +[NSNumber numberWithInteger:v5];
    [v8 setObject:v9 forKey:MBDIMInlineMediaWidthAttributeName];

    v10 = +[NSNumber numberWithInteger:v7];
    [v8 setObject:v10 forKey:MBDIMInlineMediaHeightAttributeName];
  }
  if ([v8 count]) {
    id v11 = [v8 copy];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (id)fileAttachmentsExtractedFrom:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray arrayWithCapacity:4];
  uint64_t v5 = MBDIMFileTransferUTITypeKey;
  v63[0] = MBDIMFileTransferMimeTypeKey;
  v63[1] = MBDIMFileTransferUTITypeKey;
  uint64_t v6 = MBDIMFileTransferDatasizeKey;
  v63[2] = MBDIMFileTransferDatasizeKey;
  v63[3] = MBDIMAnimatedEmojiAttributeName;
  v45 = +[NSArray arrayWithObjects:v63 count:4];
  v62[0] = MBDIMFileTransferDecryptionKeyKey;
  v62[1] = MBDIMFileTransferMMCSOwnerKey;
  v62[2] = MBDIMFileTransferSignatureHexKey;
  v62[3] = MBDIMFileTransferSizeKey;
  uint64_t v7 = MBDIMFileTransferURLKey;
  v62[4] = MBDIMFileTransferURLKey;
  v44 = +[NSArray arrayWithObjects:v62 count:5];
  uint64_t v8 = MBDIMFileTransferInlineAttachmentKey;
  id v9 = [v3 objectForKey:MBDIMFileTransferInlineAttachmentKey];

  if (v9)
  {
    v61[0] = v8;
    v61[1] = v5;
    v61[2] = v6;
    v61[3] = @"name";
    v10 = +[NSArray arrayWithObjects:v61 count:4];
    id v11 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v57 objects:v56 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v58;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v58 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v57 + 1) + 8 * i);
          v18 = [v3 objectForKey:v17];
          if (v18) {
            [v11 setObject:v18 forKey:v17];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v57 objects:v56 count:16];
      }
      while (v14);
    }

    id v19 = [v11 copy];
    [v4 addObject:v19];

    id v20 = v4;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v42 = v7;
    v43 = v4;
    do
    {
      v22 = MBDIMFileTransferKeyForSizeIndex();
      v23 = [v3 objectForKey:v22];

      if (!v23) {
        break;
      }
      id v24 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:8];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v25 = v45;
      id v26 = [v25 countByEnumeratingWithState:&v52 objects:v51 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v53;
        do
        {
          for (j = 0; j != v27; j = (char *)j + 1)
          {
            if (*(void *)v53 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v52 + 1) + 8 * (void)j);
            v31 = objc_msgSend(v3, "objectForKey:", v30, v42);
            if (v31) {
              [v24 setObject:v31 forKey:v30];
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v52 objects:v51 count:16];
        }
        while (v27);
      }

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v32 = v44;
      id v33 = [v32 countByEnumeratingWithState:&v47 objects:v46 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v48;
        do
        {
          for (k = 0; k != v34; k = (char *)k + 1)
          {
            if (*(void *)v48 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v47 + 1) + 8 * (void)k);
            v38 = MBDIMFileTransferKeyForSizeIndex();
            v39 = [v3 objectForKey:v38];
            if (v39)
            {
              [v24 setObject:v39 forKey:v37];
              [v3 removeObjectForKey:v38];
            }
          }
          id v34 = [v32 countByEnumeratingWithState:&v47 objects:v46 count:16];
        }
        while (v34);
      }

      id v40 = [v24 copy];
      BOOL v4 = v43;
      [v43 addObject:v40];

      ++v21;
    }
    while (v21 != 11);
    objc_msgSend(v3, "removeObjectsForKeys:", v45, v42);
    if ([v4 count]) {
      id v20 = [v4 copy];
    }
    else {
      id v20 = 0;
    }
  }

  return v20;
}

+ (BOOL)containsEmojiImageInfoExtractedFrom:(id)a3
{
  uint64_t v3 = MBDIMFileTransferEmojiImageContentIdentifierKey;
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:v3];
  uint64_t v6 = [v4 objectForKey:MBDIMFileTransferEmojiImageShortDescriptionKey];

  return (v5 | v6) != 0;
}

@end