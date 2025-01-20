@interface CRLPasteboard
+ (CRLPasteboard)pasteboardWithName:(id)a3 create:(BOOL)a4;
+ (CRLPasteboard)pasteboardWithPasteboard:(id)a3;
+ (CRLPasteboard)pasteboardWithUniqueName;
+ (CRLPasteboard)stylePasteboard;
+ (Class)pasteboardClass;
+ (id)activePasteboardForName:(id)a3;
+ (id)activePasteboards;
+ (id)activePasteboardsQueue;
+ (id)generalPasteboard;
- (BOOL)canLoadItemsOfClass:(Class)a3;
- (BOOL)containsAnyPasteboardTypeInArray:(id)a3;
- (BOOL)containsImportableRichTextTypes;
- (BOOL)containsImportableTextTypes;
- (BOOL)containsNativePasteboardTypes;
- (BOOL)containsPasteboardTypes:(id)a3;
- (BOOL)isSmartCopy;
- (NSArray)URLs;
- (NSArray)richTextStrings;
- (NSArray)strings;
- (NSString)name;
- (NSString)string;
- (id)dataForPasteboardType:(id)a3;
- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4;
- (id)description;
- (id)importableImageTypes;
- (id)importableRichTextTypes;
- (id)pasteboardTypes;
- (id)pasteboardTypesForItemSet:(id)a3;
- (id)stringForPasteboardType:(id)a3;
- (id)stringsForPasteboardType:(id)a3 inItemSet:(id)a4;
- (id)valueForPasteboardType:(id)a3;
- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4;
- (int64_t)changeCount;
- (int64_t)clearContents;
- (int64_t)numberOfItems;
- (unint64_t)pasteboardItemMaxSize;
- (void)addItems:(id)a3;
@end

@implementation CRLPasteboard

+ (id)activePasteboardsQueue
{
  if (qword_1016A8E00 != -1) {
    dispatch_once(&qword_1016A8E00, &stru_1014CC670);
  }
  v2 = (void *)qword_1016A8DF8;

  return v2;
}

+ (id)activePasteboards
{
  if (qword_1016A8E10 != -1) {
    dispatch_once(&qword_1016A8E10, &stru_1014CC690);
  }
  v2 = (void *)qword_1016A8E08;

  return v2;
}

+ (id)activePasteboardForName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_10002B7E0;
  v17 = sub_10002B7F0;
  id v18 = 0;
  v5 = [a1 activePasteboardsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B7F8;
  block[3] = &unk_1014CC6B8;
  v11 = &v13;
  id v12 = a1;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (Class)pasteboardClass
{
  return (Class)objc_opt_class();
}

+ (id)generalPasteboard
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B910;
  block[3] = &unk_1014CC6D8;
  void block[4] = a1;
  if (qword_1016A8E20 != -1) {
    dispatch_once(&qword_1016A8E20, block);
  }
  v2 = (void *)qword_1016A8E18;

  return v2;
}

+ (CRLPasteboard)pasteboardWithName:(id)a3 create:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10002B7E0;
  v20 = sub_10002B7F0;
  id v21 = 0;
  id v7 = [a1 activePasteboardsQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002BB88;
  v11[3] = &unk_1014CC700;
  uint64_t v13 = &v16;
  id v14 = a1;
  id v12 = v6;
  BOOL v15 = a4;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return (CRLPasteboard *)v9;
}

+ (CRLPasteboard)pasteboardWithUniqueName
{
  id v3 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "pasteboardClass")), "initWithUniquePasteboardName");
  id v4 = [a1 activePasteboardsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BD1C;
  v7[3] = &unk_1014CC768;
  id v9 = a1;
  id v5 = v3;
  id v8 = v5;
  dispatch_async(v4, v7);

  return (CRLPasteboard *)v5;
}

+ (CRLPasteboard)pasteboardWithPasteboard:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10002B7E0;
  v17 = sub_10002B7F0;
  id v18 = 0;
  id v5 = [a1 activePasteboardsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C094;
  block[3] = &unk_1014CC790;
  v11 = &v13;
  id v12 = a1;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (CRLPasteboard *)v7;
}

- (NSString)string
{
  return 0;
}

- (NSArray)strings
{
  return 0;
}

- (NSArray)richTextStrings
{
  return 0;
}

- (NSArray)URLs
{
  return 0;
}

- (id)pasteboardTypes
{
  return 0;
}

- (BOOL)containsPasteboardTypes:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 count];
  [(CRLPasteboard *)self pasteboardTypes];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v4, "containsObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
        {
          if (!--v5)
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)containsAnyPasteboardTypeInArray:(id)a3
{
  id v4 = a3;
  [(CRLPasteboard *)self pasteboardTypes];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "crl_conformsToAnyUTI:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)canLoadItemsOfClass:(Class)a3
{
  return 0;
}

- (id)dataForPasteboardType:(id)a3
{
  return 0;
}

- (id)stringForPasteboardType:(id)a3
{
  return 0;
}

- (id)valueForPasteboardType:(id)a3
{
  return 0;
}

- (int64_t)numberOfItems
{
  return 0;
}

- (void)addItems:(id)a3
{
}

- (id)pasteboardTypesForItemSet:(id)a3
{
  return 0;
}

- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4
{
  return 0;
}

- (id)stringsForPasteboardType:(id)a3 inItemSet:(id)a4
{
  return 0;
}

- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4
{
  return 0;
}

- (NSString)name
{
  return [(UIPasteboard *)self->_pasteboard name];
}

- (int64_t)changeCount
{
  return [(UIPasteboard *)self->_pasteboard changeCount];
}

- (int64_t)clearContents
{
  return 0;
}

- (id)importableRichTextTypes
{
  return +[CRLIngestionTypes supportedRichTextTypes];
}

- (id)importableImageTypes
{
  return +[CRLIngestionTypes supportedImageTypes];
}

- (BOOL)containsNativePasteboardTypes
{
  v5[0] = @"com.apple.freeform.CRLNativeMetadata";
  v5[1] = @"com.apple.freeform.CRLNativeData";
  id v3 = +[NSArray arrayWithObjects:v5 count:2];
  LOBYTE(self) = [(CRLPasteboard *)self containsPasteboardTypes:v3];

  return (char)self;
}

- (BOOL)containsImportableRichTextTypes
{
  v2 = self;
  id v3 = [(CRLPasteboard *)self importableRichTextTypes];
  LOBYTE(v2) = [(CRLPasteboard *)v2 containsAnyPasteboardTypeInArray:v3];

  return (char)v2;
}

- (BOOL)containsImportableTextTypes
{
  [(CRLPasteboard *)self pasteboardTypes];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (+[CRLIngestionTypes isValidPlainTextUTI:](CRLIngestionTypes, "isValidPlainTextUTI:", *(void *)(*((void *)&v7 + 1) + 8 * i), (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)isSmartCopy
{
  CFStringRef v5 = @"NeXT smart paste pasteboard type";
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];
  LOBYTE(self) = [(CRLPasteboard *)self containsPasteboardTypes:v3];

  return (char)self;
}

- (unint64_t)pasteboardItemMaxSize
{
  return 18874368;
}

- (id)description
{
  id v3 = [(id)objc_opt_class() description];
  uint64_t v4 = [(CRLPasteboard *)self name];
  CFStringRef v5 = [(CRLPasteboard *)self pasteboardTypes];
  id v6 = +[NSString stringWithFormat:@"<%@ %p name=\"%@\" pasteboardTypes=%@>", v3, self, v4, v5];

  return v6;
}

+ (CRLPasteboard)stylePasteboard
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C860;
  block[3] = &unk_1014CC6D8;
  void block[4] = a1;
  if (qword_1016A8E30 != -1) {
    dispatch_once(&qword_1016A8E30, block);
  }
  id v2 = (void *)qword_1016A8E28;

  return (CRLPasteboard *)v2;
}

- (void).cxx_destruct
{
}

@end