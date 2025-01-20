@interface MBDMessageToSuper_FILE_Frame
+ (BOOL)isLivePhotoAttribute:(id)a3;
+ (id)emojiImageInfoExtractedFrom:(id)a3;
+ (id)fileAttachmentsExtractedFrom:(id)a3;
+ (id)imageInfoExtractedFrom:(id)a3;
+ (id)stickerInfoExtractedFrom:(id)a3;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDMessageToSuper_FILE_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v14 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MBDMessageToSuper_FILE_Frame;
  id v15 = a8;
  [(MBDToSuperParserFrame *)&v24 parser:a3 context:v14 didStartElement:a5 namespaceURI:a6 qualifiedName:a7 attributes:v15];
  id v16 = MBDIMCopyNormalizedAttributes(v15, 1, 0);

  v17 = [v16 _stringForKey:@"name"];
  if (v17)
  {
    unsigned __int8 v18 = [(id)objc_opt_class() isLivePhotoAttribute:v16];
    id v19 = [v16 mutableCopy];
    v20 = [(id)objc_opt_class() imageInfoExtractedFrom:v19];
    v21 = [(id)objc_opt_class() fileAttachmentsExtractedFrom:v19];
    v22 = [(id)objc_opt_class() stickerInfoExtractedFrom:v19];
    v23 = [(id)objc_opt_class() emojiImageInfoExtractedFrom:v19];
    if (v18) {
      [v14 appendLivePhotoAttribute:v17 attachments:v21 imageInfo:v20 stickerInfo:v22];
    }
    else {
      [v14 appendFileTransferAttribute:v17 attachments:v21 imageInfo:v20 stickerInfo:v22 emojiImageInfo:v23];
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

  [v3 removeObjectsForKeys:&off_1000E5BF0];
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  if (v5 >= 1 && v7 >= 1)
  {
    v9 = +[NSNumber numberWithInteger:v5];
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
  v64[0] = MBDIMFileTransferMimeTypeKey;
  v64[1] = MBDIMFileTransferUTITypeKey;
  uint64_t v6 = MBDIMFileTransferDatasizeKey;
  v64[2] = MBDIMFileTransferDatasizeKey;
  v64[3] = MBDIMFileTransferIrisKey;
  v64[4] = MBDIMAnimatedEmojiAttributeName;
  v46 = +[NSArray arrayWithObjects:v64 count:5];
  v63[0] = MBDIMFileTransferDecryptionKeyKey;
  v63[1] = MBDIMFileTransferMMCSOwnerKey;
  v63[2] = MBDIMFileTransferSignatureHexKey;
  v63[3] = MBDIMFileTransferSizeKey;
  uint64_t v7 = MBDIMFileTransferURLKey;
  uint64_t v8 = MBDIMFileTransferAudioTranscriptionKey;
  v63[4] = MBDIMFileTransferURLKey;
  v63[5] = MBDIMFileTransferAudioTranscriptionKey;
  v45 = +[NSArray arrayWithObjects:v63 count:6];
  uint64_t v9 = MBDIMFileTransferInlineAttachmentKey;
  v10 = [v3 objectForKey:MBDIMFileTransferInlineAttachmentKey];

  if (v10)
  {
    v62[0] = v9;
    v62[1] = v5;
    v62[2] = v6;
    v62[3] = v8;
    v62[4] = @"name";
    id v11 = +[NSArray arrayWithObjects:v62 count:5];
    id v12 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v58 objects:v57 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v59;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v59 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          id v19 = [v3 objectForKey:v18];
          if (v19) {
            [v12 setObject:v19 forKey:v18];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v58 objects:v57 count:16];
      }
      while (v15);
    }

    id v20 = [v12 copy];
    [v4 addObject:v20];

    id v21 = v4;
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v43 = v7;
    v44 = v4;
    do
    {
      v23 = MBDIMFileTransferKeyForSizeIndex();
      objc_super v24 = [v3 objectForKey:v23];

      if (!v24) {
        break;
      }
      id v25 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:8];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v26 = v46;
      id v27 = [v26 countByEnumeratingWithState:&v53 objects:v52 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v54;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v54 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
            v32 = objc_msgSend(v3, "objectForKey:", v31, v43);
            if (v32) {
              [v25 setObject:v32 forKey:v31];
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v53 objects:v52 count:16];
        }
        while (v28);
      }

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v33 = v45;
      id v34 = [v33 countByEnumeratingWithState:&v48 objects:v47 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v49;
        do
        {
          for (k = 0; k != v35; k = (char *)k + 1)
          {
            if (*(void *)v49 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v48 + 1) + 8 * (void)k);
            v39 = MBDIMFileTransferKeyForSizeIndex();
            v40 = [v3 objectForKey:v39];
            if (v40)
            {
              [v25 setObject:v40 forKey:v38];
              [v3 removeObjectForKey:v39];
            }
          }
          id v35 = [v33 countByEnumeratingWithState:&v48 objects:v47 count:16];
        }
        while (v35);
      }

      id v41 = [v25 copy];
      BOOL v4 = v44;
      [v44 addObject:v41];

      ++v22;
    }
    while (v22 != 11);
    objc_msgSend(v3, "removeObjectsForKeys:", v46, v43);
    if ([v4 count]) {
      id v21 = [v4 copy];
    }
    else {
      id v21 = 0;
    }
  }

  return v21;
}

+ (id)stickerInfoExtractedFrom:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:15];
  sub_10000C06C(@"sid", v3, v4);
  sub_10000C06C(@"pid", v3, v4);
  sub_10000C06C(@"shash", v3, v4);
  sub_10000C06C(@"sli", v3, v4);
  sub_10000C06C(@"sai", v3, v4);
  sub_10000C06C(@"spw", v3, v4);
  sub_10000C06C(@"sxs", v3, v4);
  sub_10000C06C(@"sys", v3, v4);
  sub_10000C06C(@"ssa", v3, v4);
  sub_10000C06C(@"sro", v3, v4);
  sub_10000C06C(@"srecipe", v3, v4);
  sub_10000C06C(@"sbid", v3, v4);
  sub_10000C06C(@"sir", v3, v4);
  sub_10000C06C(@"spv", v3, v4);
  sub_10000C06C(@"suri", v3, v4);

  if ([v4 count]) {
    id v5 = [v4 copy];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)emojiImageInfoExtractedFrom:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  sub_10000C06C(MBDIMFileTransferEmojiImageContentIdentifierKey, v3, v4);
  sub_10000C06C(MBDIMFileTransferEmojiImageShortDescriptionKey, v3, v4);

  if ([v4 count]) {
    id v5 = [v4 copy];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

@end