@interface CRLPasteboardUIPasteboard
- (BOOL)canLoadItemsOfClass:(Class)a3;
- (CRLPasteboardUIPasteboard)initWithGeneralPasteboard;
- (CRLPasteboardUIPasteboard)initWithNativePasteboard:(id)a3;
- (CRLPasteboardUIPasteboard)initWithPasteboardName:(id)a3 create:(BOOL)a4;
- (CRLPasteboardUIPasteboard)initWithUniquePasteboardName;
- (id)URLs;
- (id)dataForPasteboardType:(id)a3;
- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4;
- (id)pasteboardTypes;
- (id)pasteboardTypesForItemSet:(id)a3;
- (id)propertyListForValue:(id)a3;
- (id)richTextStrings;
- (id)string;
- (id)stringForPasteboardType:(id)a3;
- (id)strings;
- (id)stringsForPasteboardType:(id)a3 inItemSet:(id)a4;
- (id)valueForPasteboardType:(id)a3;
- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4;
- (int64_t)clearContents;
- (int64_t)numberOfItems;
- (unint64_t)pasteboardItemMaxSize;
- (void)addItems:(id)a3 isSmartCopy:(BOOL)a4;
- (void)addPasteboardItem:(id)a3;
- (void)addPasteboardItem:(id)a3 atIndex:(unint64_t)a4;
- (void)addPasteboardItemForObject:(id)a3 type:(id)a4;
- (void)addPasteboardItemIndex:(unint64_t)a3 forType:(id)a4;
- (void)invalidate;
- (void)invalidatePasteboardCache;
- (void)invalidatePasteboardCacheIfNeeded;
- (void)reloadPasteboardItemIndexCacheIfNeeded;
- (void)setString:(id)a3;
- (void)updateCachedChangeCount;
@end

@implementation CRLPasteboardUIPasteboard

- (CRLPasteboardUIPasteboard)initWithGeneralPasteboard
{
  return [(CRLPasteboardUIPasteboard *)self initWithPasteboardName:UIPasteboardNameGeneral create:1];
}

- (CRLPasteboardUIPasteboard)initWithPasteboardName:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLPasteboardUIPasteboard;
  v7 = [(CRLPasteboard *)&v12 initWithPasteboardName:v6 create:v4];
  if (v7)
  {
    uint64_t v8 = +[UIPasteboard pasteboardWithName:v6 create:v4];
    pasteboard = v7->super._pasteboard;
    v7->super._pasteboard = (UIPasteboard *)v8;

    if (!v7->super._pasteboard)
    {
      if (v4)
      {
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014CC7B0);
        }
        v10 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
          sub_101067FE4((uint64_t)v6, v10);
        }
      }

      v7 = 0;
    }
  }

  return v7;
}

- (CRLPasteboardUIPasteboard)initWithUniquePasteboardName
{
  v6.receiver = self;
  v6.super_class = (Class)CRLPasteboardUIPasteboard;
  v2 = [(CRLPasteboard *)&v6 initWithUniquePasteboardName];
  if (v2)
  {
    uint64_t v3 = +[UIPasteboard pasteboardWithUniqueName];
    pasteboard = v2->super._pasteboard;
    v2->super._pasteboard = (UIPasteboard *)v3;
  }
  return v2;
}

- (CRLPasteboardUIPasteboard)initWithNativePasteboard:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = sub_1002469D0(v5, v4);
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLPasteboardUIPasteboard;
    v7 = [(CRLPasteboard *)&v10 initWithNativePasteboard:v4];
    uint64_t v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->super._pasteboard, v6);
    }
  }
  else
  {

    uint64_t v8 = 0;
  }

  return v8;
}

- (void)addPasteboardItemForObject:(id)a3 type:(id)a4
{
  id v9 = a4;
  id v10 = a3;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  [(CRLPasteboardUIPasteboard *)self addPasteboardItem:v8];
}

- (void)addPasteboardItem:(id)a3
{
}

- (void)addPasteboardItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        v14 = [v6 objectForKeyedSubscript:v12];
        v15 = sub_1002469D0(v13, v14);

        if (v15 && ![v15 length])
        {
          char v16 = 0;
        }
        else
        {
          [(CRLPasteboardUIPasteboard *)self addPasteboardItemIndex:a4 forType:v12];
          char v16 = 1;
        }
        v9 |= v16;
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
    if (v9)
    {
      pasteboard = self->super._pasteboard;
      id v23 = v6;
      v18 = +[NSArray arrayWithObjects:&v23 count:1];
      [(UIPasteboard *)pasteboard addItems:v18];

      ++self->_pasteboardItemCount;
    }
  }
}

- (void)addPasteboardItemIndex:(unint64_t)a3 forType:(id)a4
{
  id v6 = a4;
  pasteboardItemIndexCache = self->_pasteboardItemIndexCache;
  id v14 = v6;
  if (pasteboardItemIndexCache)
  {
    id v8 = [(NSMutableDictionary *)pasteboardItemIndexCache objectForKeyedSubscript:v6];
    char v9 = v8;
    if (v8)
    {
      [v8 addIndex:a3];
    }
    else
    {
      uint64_t v13 = +[NSMutableIndexSet indexSetWithIndex:a3];
      [(NSMutableDictionary *)self->_pasteboardItemIndexCache setObject:v13 forKeyedSubscript:v14];
    }
  }
  else
  {
    id v10 = objc_alloc((Class)NSMutableDictionary);
    char v9 = +[NSMutableIndexSet indexSetWithIndex:a3];
    v11 = [v10 initWithObjectsAndKeys:v9, v14, 0];
    uint64_t v12 = self->_pasteboardItemIndexCache;
    self->_pasteboardItemIndexCache = v11;
  }
}

- (void)invalidatePasteboardCacheIfNeeded
{
  int64_t v3 = [(CRLPasteboard *)self changeCount];
  if (self->_cachedChangeCount != v3)
  {
    int64_t v4 = v3;
    [(CRLPasteboardUIPasteboard *)self invalidatePasteboardCache];
    self->_cachedChangeCount = v4;
  }
}

- (void)invalidatePasteboardCache
{
  self->_pasteboardItemCount = 0;
  pasteboardItemIndexCache = self->_pasteboardItemIndexCache;
  self->_pasteboardItemIndexCache = 0;

  cachedPasteboardTypes = self->_cachedPasteboardTypes;
  self->_cachedPasteboardTypes = 0;
}

- (void)reloadPasteboardItemIndexCacheIfNeeded
{
  [(CRLPasteboardUIPasteboard *)self invalidatePasteboardCacheIfNeeded];
  if (!self->_pasteboardItemIndexCache)
  {
    p_pasteboardItemCount = &self->_pasteboardItemCount;
    if (self->_pasteboardItemCount)
    {
      uint64_t v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CC7D0);
      }
      uint64_t v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106805C(&self->_pasteboardItemCount, v4, v5);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CC7F0);
      }
      id v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v6);
      }
      id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardUIPasteboard reloadPasteboardItemIndexCacheIfNeeded]");
      id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 849, 0, "Expected pasteboard item count should be zero, was %tu.", *p_pasteboardItemCount);
    }
    char v9 = [(UIPasteboard *)self->super._pasteboard pasteboardTypesForItemSet:0];
    id v10 = (char *)[v9 count];
    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v12 = [v9 objectAtIndexedSubscript:i];
        id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v18;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v18 != v15) {
                objc_enumerationMutation(v12);
              }
              [(CRLPasteboardUIPasteboard *)self addPasteboardItemIndex:i forType:*(void *)(*((void *)&v17 + 1) + 8 * (void)j)];
            }
            id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v14);
        }
      }
    }
    unint64_t *p_pasteboardItemCount = (unint64_t)v10;
    [(CRLPasteboardUIPasteboard *)self updateCachedChangeCount];
  }
}

- (void)updateCachedChangeCount
{
  self->_cachedChangeCount = [(CRLPasteboard *)self changeCount];
}

- (id)propertyListForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = v3;
LABEL_4:
    uint64_t v5 = v4;
    goto LABEL_5;
  }
  uint64_t v5 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:0];
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v3 bytes]);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    uint64_t v5 = 0;
  }
LABEL_5:

  return v5;
}

- (id)URLs
{
  return [(UIPasteboard *)self->super._pasteboard URLs];
}

- (id)string
{
  uint64_t v3 = objc_opt_class();
  id v4 = [UTTypeUTF8PlainText identifier];
  uint64_t v5 = [(CRLPasteboardUIPasteboard *)self valueForPasteboardType:v4];
  id v6 = sub_1002469D0(v3, v5);

  return v6;
}

- (void)setString:(id)a3
{
  id v4 = a3;
  [(CRLPasteboardUIPasteboard *)self clearContents];
  id v5 = [UTTypeUTF8PlainText identifier];
  [(CRLPasteboardUIPasteboard *)self addPasteboardItemForObject:v4 type:v5];
}

- (id)strings
{
  uint64_t v3 = [UTTypeText identifier];
  id v4 = [(CRLPasteboardUIPasteboard *)self valuesForPasteboardType:v3 inItemSet:0];
  id v5 = +[NSMutableArray arrayWithArray:v4];

  if (![v5 count])
  {
    id v6 = [UTTypeURL identifier];
    id v7 = [(CRLPasteboardUIPasteboard *)self valuesForPasteboardType:v6 inItemSet:0];
    [v5 addObjectsFromArray:v7];
  }
  id v8 = [v5 count];
  if (v8)
  {
    id v38 = +[NSMutableArray arrayWithCapacity:v8];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v35 = v5;
    id obj = v5;
    id v9 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
    if (!v9) {
      goto LABEL_27;
    }
    id v10 = v9;
    v11 = &off_1014C1000;
    uint64_t v12 = *(void *)v40;
    v36 = self;
    while (1)
    {
      id v13 = 0;
      do
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = [(CRLPasteboardUIPasteboard *)self propertyListForValue:*(void *)(*((void *)&v39 + 1) + 8 * (void)v13)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = [v14 absoluteString];
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = v17;
          if (isKindOfClass)
          {
            long long v19 = [v14 firstObject];
            long long v20 = sub_1002469D0(v18, v19);

            if (v20) {
              goto LABEL_24;
            }
            goto LABEL_13;
          }
          uint64_t v15 = sub_1002469D0(v17, v14);
        }
        long long v20 = (void *)v15;
        if (v15)
        {
LABEL_24:
          [v38 addObject:v20];
          goto LABEL_25;
        }
LABEL_13:
        unsigned int v21 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CC810);
        }
        long long v22 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v29 = v22;
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          *(_DWORD *)buf = 67110146;
          unsigned int v44 = v21;
          __int16 v45 = 2082;
          v46 = "-[CRLPasteboardUIPasteboard strings]";
          __int16 v47 = 2082;
          v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m";
          __int16 v49 = 1024;
          int v50 = 938;
          __int16 v51 = 2114;
          v52 = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to convert value from %{public}@ to NSString", buf, 0x2Cu);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CC830);
        }
        id v23 = v11;
        v24 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v32 = v24;
          v33 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          unsigned int v44 = v21;
          __int16 v45 = 2114;
          v46 = v33;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardUIPasteboard strings]");
        v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m"];
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 938, 0, "Failed to convert value from %{public}@ to NSString", v28);

        v11 = v23;
        self = v36;
LABEL_25:

        id v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
      if (!v10)
      {
LABEL_27:

        id v5 = v35;
        goto LABEL_29;
      }
    }
  }
  id v38 = 0;
LABEL_29:

  return v38;
}

- (id)richTextStrings
{
  pasteboard = self->super._pasteboard;
  id v4 = [UTTypeFlatRTFD identifier];
  v52 = v4;
  id v5 = +[NSArray arrayWithObjects:&v52 count:1];
  id v6 = [(UIPasteboard *)pasteboard itemSetWithPasteboardTypes:v5];

  id v7 = [v6 count];
  id v8 = self->super._pasteboard;
  if (v7)
  {
    id v9 = [UTTypeFlatRTFD identifier];
    id v10 = [(UIPasteboard *)v8 valuesForPasteboardType:v9 inItemSet:v6];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v12)
    {
      id v13 = v12;
      id v14 = 0;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          id v18 = objc_alloc((Class)NSAttributedString);
          NSAttributedStringDocumentAttributeKey v49 = NSDocumentTypeDocumentAttribute;
          NSAttributedStringDocumentType v50 = NSRTFDTextDocumentType;
          long long v19 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          id v20 = [v18 initWithData:v17 options:v19 documentAttributes:0 error:0];

          if ([v20 length])
          {
            if (v14)
            {
              [v14 addObject:v20];
            }
            else
            {
              id v14 = +[NSMutableArray arrayWithObject:v20];
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v13);
      unsigned int v21 = v11;
    }
    else
    {
      id v14 = 0;
      unsigned int v21 = v11;
    }
  }
  else
  {
    long long v22 = [UTTypeRTF identifier];
    v48 = v22;
    id v23 = +[NSArray arrayWithObjects:&v48 count:1];
    unsigned int v21 = [(UIPasteboard *)v8 itemSetWithPasteboardTypes:v23];

    if (![v21 count])
    {
      id v14 = 0;
      goto LABEL_32;
    }
    v24 = self->super._pasteboard;
    v25 = [UTTypeRTF identifier];
    v26 = [(UIPasteboard *)v24 valuesForPasteboardType:v25 inItemSet:v21];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v26;
    id v27 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v27)
    {
      id v28 = v27;
      id v14 = 0;
      uint64_t v29 = *(void *)v38;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
          id v32 = objc_alloc((Class)NSAttributedString);
          NSAttributedStringDocumentAttributeKey v45 = NSDocumentTypeDocumentAttribute;
          NSAttributedStringDocumentType v46 = NSRTFTextDocumentType;
          v33 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          id v34 = [v32 initWithData:v31 options:v33 documentAttributes:0 error:0];

          if ([v34 length])
          {
            if (v14)
            {
              [v14 addObject:v34];
            }
            else
            {
              id v14 = +[NSMutableArray arrayWithObject:v34];
            }
          }
        }
        id v28 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v28);
    }
    else
    {
      id v14 = 0;
    }
    id v11 = obj;
  }
LABEL_32:

  return v14;
}

- (id)pasteboardTypes
{
  [(CRLPasteboardUIPasteboard *)self invalidatePasteboardCacheIfNeeded];
  cachedPasteboardTypes = self->_cachedPasteboardTypes;
  if (!cachedPasteboardTypes)
  {
    id v4 = +[NSMutableOrderedSet orderedSet];
    id v5 = [(UIPasteboard *)self->super._pasteboard pasteboardTypesForItemSet:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v11 = v10;
          id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v20;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v4 addObject:*(void *)(*((void *)&v19 + 1) + 8 * (void)j)];
              }
              id v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v13);
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }
    char v16 = [v4 array];
    uint64_t v17 = self->_cachedPasteboardTypes;
    self->_cachedPasteboardTypes = v16;

    cachedPasteboardTypes = self->_cachedPasteboardTypes;
  }

  return cachedPasteboardTypes;
}

- (id)dataForPasteboardType:(id)a3
{
  id v4 = a3;
  [(CRLPasteboardUIPasteboard *)self reloadPasteboardItemIndexCacheIfNeeded];
  id v5 = [(NSMutableDictionary *)self->_pasteboardItemIndexCache objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      uint64_t v7 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v6 firstIndex]);

      id v6 = (void *)v7;
    }
    uint64_t v8 = [(CRLPasteboardUIPasteboard *)self dataForPasteboardType:v4 inItemSet:v6];
    id v9 = [v8 firstObject];

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v10 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:200 options:0 error:0];

        id v9 = (void *)v10;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)stringForPasteboardType:(id)a3
{
  id v4 = a3;
  [(CRLPasteboardUIPasteboard *)self reloadPasteboardItemIndexCacheIfNeeded];
  id v5 = [(NSMutableDictionary *)self->_pasteboardItemIndexCache objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      uint64_t v7 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v6 firstIndex]);

      id v6 = (void *)v7;
    }
    uint64_t v8 = [(CRLPasteboardUIPasteboard *)self stringsForPasteboardType:v4 inItemSet:v6];
    id v9 = [v8 firstObject];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)valueForPasteboardType:(id)a3
{
  id v4 = a3;
  [(CRLPasteboardUIPasteboard *)self reloadPasteboardItemIndexCacheIfNeeded];
  id v5 = [(NSMutableDictionary *)self->_pasteboardItemIndexCache objectForKeyedSubscript:v4];
  id v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    uint64_t v7 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v6 firstIndex]);

    id v6 = (void *)v7;
  }
  uint64_t v8 = [(CRLPasteboardUIPasteboard *)self valuesForPasteboardType:v4 inItemSet:v6];
  id v9 = [v8 firstObject];

  if (v9)
  {
    uint64_t v10 = [(CRLPasteboardUIPasteboard *)self propertyListForValue:v9];
  }
  else
  {
LABEL_6:
    uint64_t v10 = 0;
  }

  return v10;
}

- (int64_t)numberOfItems
{
  return [(UIPasteboard *)self->super._pasteboard numberOfItems];
}

- (id)pasteboardTypesForItemSet:(id)a3
{
  return [(UIPasteboard *)self->super._pasteboard pasteboardTypesForItemSet:a3];
}

- (BOOL)canLoadItemsOfClass:(Class)a3
{
  if (![(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___NSItemProviderReading])return 0; {
  id v5 = self->super._pasteboard;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(UIPasteboard *)v5 itemProviders];
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
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) canLoadObjectOfClass:a3])
        {
          BOOL v11 = 1;
          goto LABEL_13;
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
LABEL_13:

  return v11;
}

- (void)addItems:(id)a3 isSmartCopy:(BOOL)a4
{
  BOOL v62 = a4;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = a3;
  id v68 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
  if (v68)
  {
    uint64_t v67 = *(void *)v92;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v92 != v67)
        {
          uint64_t v11 = v10;
          objc_enumerationMutation(obj);
          uint64_t v10 = v11;
        }
        uint64_t v69 = v10;
        id v12 = *(void **)(*((void *)&v91 + 1) + 8 * v10);
        long long v13 = sub_100246AC8(v12, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLPasteboardWriting);
        v70 = v13;
        if (v13)
        {
          id v74 = [v13 writableTypesForPasteboard:self->super._pasteboard];
          long long v14 = (char *)[v74 count];
          if (v14)
          {
            uint64_t v87 = 0;
            v88 = &v87;
            uint64_t v89 = 0x2020000000;
            unint64_t pasteboardItemCount = self->_pasteboardItemCount;
            long long v15 = +[NSMutableIndexSet indexSet];
            uint64_t v17 = 0;
            unint64_t v18 = 0;
            for (i = 0; i != v14; ++i)
            {
              long long v20 = [v74 objectAtIndexedSubscript:i];
              if (([v20 hasPrefix:@"com.apple.freeform.CRLNativeData"] & 1) != 0
                || ([v20 hasPrefix:@"com.apple.freeform.CRLNativeMetadata"] & 1) != 0
                || ([v20 hasPrefix:@"com.apple.freeform.CRLAsset."] & 1) != 0
                || [v20 isEqualToString:@"com.apple.freeform.CRLDescription"])
              {
                [v15 addIndex:i];
              }
              else
              {
                v71 = [v70 pasteboardPropertyListForType:v20];
                if (v71
                  || objc_msgSend(v20, "crl_isPasteboardStateType")
                  && (+[NSData data],
                      (v71 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
                  {
                    v18 += (unint64_t)[v71 length];
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v85 = 0u;
                      long long v86 = 0u;
                      long long v83 = 0u;
                      long long v84 = 0u;
                      id v22 = v71;
                      id v23 = [v22 countByEnumeratingWithState:&v83 objects:v96 count:16];
                      v63 = v17;
                      v64 = v16;
                      if (v23)
                      {
                        uint64_t v24 = *(void *)v84;
                        do
                        {
                          for (j = 0; j != v23; j = (char *)j + 1)
                          {
                            if (*(void *)v84 != v24) {
                              objc_enumerationMutation(v22);
                            }
                            long long v26 = *(void **)(*((void *)&v83 + 1) + 8 * (void)j);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0) {
                                continue;
                              }
                            }
                            v18 += (unint64_t)[v26 length];
                          }
                          id v23 = [v22 countByEnumeratingWithState:&v83 objects:v96 count:16];
                        }
                        while (v23);
                      }

                      uint64_t v17 = v63;
                      long long v16 = v64;
                    }
                  }
                  if (v18 <= [(CRLPasteboardUIPasteboard *)self pasteboardItemMaxSize])
                  {
                    if (v17)
                    {
                      [v17 setObject:v71 forKey:v20];
                    }
                    else
                    {
                      uint64_t v17 = +[NSMutableDictionary dictionaryWithObject:v71 forKey:v20];
                    }
                  }
                  else
                  {
                    if (qword_101719A68 != -1) {
                      dispatch_once(&qword_101719A68, &stru_1014CC850);
                    }
                    long long v21 = off_10166B498;
                    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
                    {
                      unint64_t v27 = [(CRLPasteboardUIPasteboard *)self pasteboardItemMaxSize];
                      *(_DWORD *)buf = 134218242;
                      *(void *)v99 = v27;
                      *(_WORD *)&v99[8] = 2114;
                      *(void *)&v99[10] = v20;
                      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_ERROR, "The total size for public data on the pasteboard has reached the allowed limit of %zu bytes per pasteboard item. %{public}@ will not be added to the pasteboard.", buf, 0x16u);
                    }
                  }
                }
                else
                {
                }
              }
            }
            if ([v17 count])
            {
              unint64_t v28 = self->_pasteboardItemCount;
              uint64_t v29 = v88;
              v88[3] = v28;
              if (v28)
              {
                unsigned int v30 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014CC870);
                }
                uint64_t v31 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)v99 = v30;
                  *(_WORD *)&v99[4] = 2082;
                  *(void *)&v99[6] = "-[CRLPasteboardUIPasteboard addItems:isSmartCopy:]";
                  *(_WORD *)&v99[14] = 2082;
                  *(void *)&v99[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m";
                  __int16 v100 = 1024;
                  int v101 = 1161;
                  _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Public data types need to belong to the first pasteboard item. Otherwise, it is not guaranteed to be retrievable by other pasteboard clients.", buf, 0x22u);
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014CC890);
                }
                id v32 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
                {
                  v58 = +[CRLAssertionHandler packedBacktraceString];
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v99 = v30;
                  *(_WORD *)&v99[4] = 2114;
                  *(void *)&v99[6] = v58;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                }
                v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardUIPasteboard addItems:isSmartCopy:]");
                id v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m"];
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 1161, 0, "Public data types need to belong to the first pasteboard item. Otherwise, it is not guaranteed to be retrievable by other pasteboard clients.");

                uint64_t v29 = v88;
                uint64_t v35 = v88[3];
              }
              else
              {
                uint64_t v35 = 0;
              }
              v29[3] = v35 + 1;
              -[CRLPasteboardUIPasteboard addPasteboardItem:atIndex:](self, "addPasteboardItem:atIndex:", v17);
            }

            if ([v15 count])
            {
              v79[0] = _NSConcreteStackBlock;
              v79[1] = 3221225472;
              v79[2] = sub_10002F314;
              v79[3] = &unk_1014CC8B8;
              id v57 = v70;
              v82 = &v87;
              id v80 = v57;
              v81 = self;
              [v74 enumerateObjectsAtIndexes:v15 options:0 usingBlock:v79];
            }
            _Block_object_dispose(&v87, 8);
          }
        }
        else
        {
          uint64_t v36 = objc_opt_class();
          sub_1002469D0(v36, v12);
          id v74 = (id)objc_claimAutoreleasedReturnValue();
          if (v74)
          {
            long long v77 = 0u;
            long long v78 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            id v74 = v74;
            id v37 = [v74 countByEnumeratingWithState:&v75 objects:v95 count:16];
            if (v37)
            {
              uint64_t v72 = *(void *)v76;
              do
              {
                for (k = 0; k != v37; k = (char *)k + 1)
                {
                  if (*(void *)v76 != v72) {
                    objc_enumerationMutation(v74);
                  }
                  long long v39 = *(void **)(*((void *)&v75 + 1) + 8 * (void)k);
                  long long v40 = [v74 objectForKeyedSubscript:v39];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v41 = self;
                    id v42 = v40;
                    id v43 = v39;
                    if (self) {
                      unint64_t v44 = [(CRLPasteboardUIPasteboard *)v41 pasteboardItemMaxSize];
                    }
                    else {
                      unint64_t v44 = 18874368;
                    }
                    if ((unint64_t)[v42 length] > v44)
                    {
                      unsigned int v45 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                      if (qword_101719A70 != -1) {
                        dispatch_once(&qword_101719A70, &stru_1014CC958);
                      }
                      NSAttributedStringDocumentType v46 = off_10166B4A0;
                      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67110146;
                        *(_DWORD *)v99 = v45;
                        *(_WORD *)&v99[4] = 2082;
                        *(void *)&v99[6] = "void CRLPasteboardAssertNSData(CRLPasteboard *__strong, NSData *__strong, N"
                                             "SString *__strong)";
                        *(_WORD *)&v99[14] = 2082;
                        *(void *)&v99[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard_Internal.h";
                        __int16 v100 = 1024;
                        int v101 = 13;
                        __int16 v102 = 2114;
                        id v103 = v43;
                        _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Data for %{public}@ is too large for the pasteboard. It may be silently dropped.", buf, 0x2Cu);
                      }
                      if (qword_101719A70 != -1) {
                        dispatch_once(&qword_101719A70, &stru_1014CC978);
                      }
                      __int16 v47 = off_10166B4A0;
                      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                      {
                        NSAttributedStringDocumentType v50 = v47;
                        __int16 v51 = +[CRLAssertionHandler packedBacktraceString];
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v99 = v45;
                        *(_WORD *)&v99[4] = 2114;
                        *(void *)&v99[6] = v51;
                        _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                      }
                      v48 = +[NSString stringWithUTF8String:"void CRLPasteboardAssertNSData(CRLPasteboard *__strong, NSData *__strong, NSString *__strong)"];
                      NSAttributedStringDocumentAttributeKey v49 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard_Internal.h"];
                      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v48, v49, 13, 0, "Data for %{public}@ is too large for the pasteboard. It may be silently dropped.", v43);
                    }
                  }
                  [(CRLPasteboardUIPasteboard *)self addPasteboardItemForObject:v40 type:v39];
                }
                id v37 = [v74 countByEnumeratingWithState:&v75 objects:v95 count:16];
              }
              while (v37);
            }
          }
          else
          {
            unsigned int v52 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014CC8D8);
            }
            v53 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v99 = v52;
              *(_WORD *)&v99[4] = 2082;
              *(void *)&v99[6] = "-[CRLPasteboardUIPasteboard addItems:isSmartCopy:]";
              *(_WORD *)&v99[14] = 2082;
              *(void *)&v99[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m";
              __int16 v100 = 1024;
              int v101 = 1198;
              _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Expected item to conform to CRLPasteboardWriting protocol, or be an instance of NSDictionary", buf, 0x22u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014CC8F8);
            }
            v54 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v59 = v54;
              v60 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v99 = v52;
              *(_WORD *)&v99[4] = 2114;
              *(void *)&v99[6] = v60;
              _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v55 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardUIPasteboard addItems:isSmartCopy:]");
            v56 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v55, v56, 1198, 0, "Expected item to conform to CRLPasteboardWriting protocol, or be an instance of NSDictionary");
          }
        }

        uint64_t v10 = v69 + 1;
      }
      while ((id)(v69 + 1) != v68);
      id v68 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
    }
    while (v68);
  }

  if (v62)
  {
    v61 = [@"NeXT smart paste pasteboard type" dataUsingEncoding:4];
    [(CRLPasteboardUIPasteboard *)self addPasteboardItemForObject:v61 type:@"NeXT smart paste pasteboard type"];
  }
}

- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4
{
  return [(UIPasteboard *)self->super._pasteboard dataForPasteboardType:a3 inItemSet:a4];
}

- (id)stringsForPasteboardType:(id)a3 inItemSet:(id)a4
{
  uint64_t v5 = [(CRLPasteboardUIPasteboard *)self valuesForPasteboardType:a3 inItemSet:a4];
  id v6 = [v5 count];
  if (v6)
  {
    id v33 = +[NSMutableArray arrayWithCapacity:v6];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v31 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v34 objects:v48 count:16];
    if (!v8) {
      goto LABEL_29;
    }
    id v9 = v8;
    uint64_t v10 = &off_1014C1000;
    uint64_t v11 = *(void *)v35;
    id v32 = v7;
    while (1)
    {
      id v12 = 0;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = [(CRLPasteboardUIPasteboard *)self propertyListForValue:*(void *)(*((void *)&v34 + 1) + 8 * (void)v12)];
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = [v13 path];
            if (!v14) {
              goto LABEL_17;
            }
LABEL_16:
            [v33 addObject:v14];
          }
          else
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            uint64_t v16 = objc_opt_class();
            if ((isKindOfClass & 1) == 0)
            {
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_17;
              }
              id v14 = v13;
              goto LABEL_16;
            }
            uint64_t v17 = [v13 firstObject];
            sub_1002469D0(v16, v17);
            id v14 = (id)objc_claimAutoreleasedReturnValue();

            if (v14) {
              goto LABEL_16;
            }
LABEL_17:
            unsigned int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014CC918);
            }
            long long v19 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              long long v25 = v19;
              long long v26 = (objc_class *)objc_opt_class();
              unint64_t v27 = NSStringFromClass(v26);
              *(_DWORD *)buf = 67110146;
              unsigned int v39 = v18;
              __int16 v40 = 2082;
              long long v41 = "-[CRLPasteboardUIPasteboard stringsForPasteboardType:inItemSet:]";
              __int16 v42 = 2082;
              id v43 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m";
              __int16 v44 = 1024;
              int v45 = 1248;
              __int16 v46 = 2114;
              __int16 v47 = v27;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to convert value from %{public}@ to NSString", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014CC938);
            }
            long long v20 = v10;
            long long v21 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              unint64_t v28 = v21;
              uint64_t v29 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v39 = v18;
              __int16 v40 = 2114;
              long long v41 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardUIPasteboard stringsForPasteboardType:inItemSet:]");
            id v14 = (id)objc_claimAutoreleasedReturnValue();
            id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m"];
            id v23 = (objc_class *)objc_opt_class();
            uint64_t v24 = NSStringFromClass(v23);
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v22, 1248, 0, "Failed to convert value from %{public}@ to NSString", v24);

            uint64_t v10 = v20;
            id v7 = v32;
          }
        }
        id v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v48 count:16];
      if (!v9)
      {
LABEL_29:

        uint64_t v5 = v31;
        goto LABEL_31;
      }
    }
  }
  id v33 = 0;
LABEL_31:

  return v33;
}

- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4
{
  return [(UIPasteboard *)self->super._pasteboard valuesForPasteboardType:a3 inItemSet:a4];
}

- (int64_t)clearContents
{
  [(CRLPasteboardUIPasteboard *)self invalidatePasteboardCache];
  int64_t v3 = [(CRLPasteboard *)self changeCount];
  [(UIPasteboard *)self->super._pasteboard setItems:&__NSArray0__struct];
  [(CRLPasteboardUIPasteboard *)self updateCachedChangeCount];
  return v3;
}

- (unint64_t)pasteboardItemMaxSize
{
  int64_t v3 = [(CRLPasteboard *)self name];
  unsigned int v4 = [v3 isEqualToString:UIPasteboardNameGeneral];

  if (!v4) {
    return 0x1000000;
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLPasteboardUIPasteboard;
  return [(CRLPasteboard *)&v6 pasteboardItemMaxSize];
}

- (void)invalidate
{
  id v2 = [(CRLPasteboard *)self name];
  +[UIPasteboard removePasteboardWithName:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboardItemIndexCache, 0);

  objc_storeStrong((id *)&self->_cachedPasteboardTypes, 0);
}

@end