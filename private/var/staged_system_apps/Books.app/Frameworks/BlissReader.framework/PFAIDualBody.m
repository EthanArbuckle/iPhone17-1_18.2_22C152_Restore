@interface PFAIDualBody
+ (Class)subreaderClass;
- (void)addDrawablesToPageZOrderWithContentState:(id)a3;
- (void)createBodiesWithContentState:(id)a3;
- (void)finalizePageHintsForOrientation:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAIDualBody

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

- (void)createBodiesWithContentState:(id)a3
{
  id v26 = [a3 paginatedState];
  id v25 = [v26 pageCache];
  v24 = (char *)[v25 pageCount];
  char v4 = 0;
  if (v24)
  {
    for (i = 0; i != v24; ++i)
    {
      [v26 setCurrentPageIndex:i];
      id v6 = [v25 pageWithIndex:i];
      id v28 = [v26 pageAtRelativeIndex:i];
      id v7 = [v6 flows];
      if ((unint64_t)[v7 count] <= 1)
      {
        if ([v7 count])
        {
          id v8 = [v7 objectAtIndex:0];
          if ([v8 count])
          {
            v29 = (char *)[v8 count] - 1;
            if ((uint64_t)v29 >= 1)
            {
              v9 = 0;
              id v27 = v8;
              do
              {
                id v10 = [v8 objectAtIndex:v9];
                id v11 = [v6 slotWithId:v10];
                if (v11)
                {
                  v12 = v11;
                  +[PFXDrawablePlacement boundsWithProperties:v11 readerState:a3];
                  id v17 = v6;
                  id v18 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:v13 size:v14];
                  v19 = -[THModelBodyTextInfo initWithContext:geometry:]([THModelBodyTextInfo alloc], "initWithContext:geometry:", [a3 tspContext], v18);

                  id v20 = [objc_alloc((Class)TSSPropertyMap) initWithCapacity:3];
                  +[PFXBlock mapLayoutStyleFromPropertySet:v12 toPropertyMap:v20 readerState:a3];
                  [v20 setObject:[v20 boxedObjectForProperty:146] forProperty:145];
                  [v20 removeValueForProperty:146];
                  id v21 = [objc_alloc((Class)TSWPColumnStyle) initWithContext:objc_msgSend(a3, "tspContext"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Body %@ Column Style", v10), v20, 0 name overridePropertyMap isVariation];
                  [(THModelBodyTextInfo *)v19 setColumnStyle:v21];

                  -[THModelBodyTextInfo setLineHints:](v19, "setLineHints:", +[PFAIDrawablePlacement lineHintsForPropertySet:textStorage:contentState:](PFAIDrawablePlacement, "lineHintsForPropertySet:textStorage:contentState:", v12, objc_msgSend(objc_msgSend(a3, "paginatedState"), "bodyStorage"), a3));
                  -[THModelBodyTextInfo setExteriorTextWrap:](v19, "setExteriorTextWrap:", +[PFXDrawablePlacement exteriorTextWrapWithCssValue:readerState:](PFXDrawablePlacement, "exteriorTextWrapWithCssValue:readerState:", [v12 valueForProperty:PFXPropNmApplePubBoxWrapExteriorPath[0]], a3));
                  [v28 addBodyBoxInfo:v19 insertContext:0];
                  +[PFAIDrawablePlacement cacheDrawable:v19 forSlot:v12 withContentState:a3];

                  id v6 = v17;
                  id v8 = v27;
                  char v4 = 1;
                }
                ++v9;
              }
              while (v29 != v9);
            }
          }
        }
      }
    }
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "bookDescription"), "orientationLock") == 3)
  {
    id v22 = [[[a3 flowState] contentNodeBody] pages];
    if ([v22 count] == (char *)&dword_0 + 1)
    {
      objc_opt_class();
      [v22 objectAtIndex:0];
      v23 = (void *)TSUDynamicCast();
      if (!v23) {
        [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[PFAIDualBody createBodiesWithContentState:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFAIBody.mm"] lineNumber:158 description:@"invalid nil value for '%s'", "flowPageInfo"];
      }
      [v23 setHasBodyFlow:v4 & 1];
    }
  }
}

- (void)addDrawablesToPageZOrderWithContentState:(id)a3
{
  id v18 = [a3 paginatedState];
  id v17 = [v18 pageDrawableMaps];
  id v16 = [v17 count];
  if ((uint64_t)v16 >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      id v4 = objc_msgSend(objc_msgSend(v18, "pageAtRelativeIndex:", v3), "drawablesZOrder");
      uint64_t v19 = v3;
      id v5 = [v17 objectAtIndex:v3];
      id v6 = objc_msgSend(objc_msgSend(v5, "allKeys"), "sortedArrayUsingSelector:", "compare:");
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v25;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = [v5 objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            long long v20 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v12)
            {
              id v13 = v12;
              uint64_t v14 = *(void *)v21;
              do
              {
                for (j = 0; j != v13; j = (char *)j + 1)
                {
                  if (*(void *)v21 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  [v4 addDrawable:*(void *)(*((void *)&v20 + 1) + 8 * (void)j)];
                }
                id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
              }
              while (v13);
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v8);
      }
      uint64_t v3 = v19 + 1;
    }
    while ((id)(v19 + 1) != v16);
  }
}

- (void)finalizePageHintsForOrientation:(id)a3
{
  id v4 = [a3 contentNodeBody];
  id v5 = [a3 bodyStorage];
  if (a3)
  {
    [a3 pageStartIndices];
    id v7 = v56;
    id v6 = v57;
  }
  else
  {
    id v7 = 0;
    id v6 = 0;
    v56 = 0;
    v57 = 0;
    uint64_t v58 = 0;
  }
  __p = 0;
  v54 = 0;
  v55 = 0;
  uint64_t v8 = v6 - v7;
  unint64_t v9 = v8 >> 3;
  if ((unint64_t)v8 >= 9)
  {
    id v10 = 0;
    if (v9 <= 2) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = v8 >> 3;
    }
    uint64_t v12 = 1;
    do
    {
      uint64_t v13 = *((void *)v56 + v12);
      if (v10 >= v55)
      {
        double v15 = (char *)__p;
        uint64_t v16 = (v10 - (unsigned char *)__p) >> 3;
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 61) {
          sub_3D1D0();
        }
        uint64_t v18 = v55 - (unsigned char *)__p;
        if ((v55 - (unsigned char *)__p) >> 2 > v17) {
          unint64_t v17 = v18 >> 2;
        }
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v17;
        }
        if (v19)
        {
          long long v20 = (char *)sub_4374C((uint64_t)&v55, v19);
          double v15 = (char *)__p;
          id v10 = v54;
        }
        else
        {
          long long v20 = 0;
        }
        long long v21 = &v20[8 * v16];
        *(void *)long long v21 = v13;
        uint64_t v14 = v21 + 8;
        while (v10 != v15)
        {
          uint64_t v22 = *((void *)v10 - 1);
          v10 -= 8;
          *((void *)v21 - 1) = v22;
          v21 -= 8;
        }
        __p = v21;
        v54 = v14;
        v55 = &v20[8 * v19];
        if (v15) {
          operator delete(v15);
        }
      }
      else
      {
        *(void *)id v10 = v13;
        uint64_t v14 = v10 + 8;
      }
      v54 = v14;
      ++v12;
      id v10 = v14;
    }
    while (v12 != v11);
  }
  id v23 = [v5 length];
  id v24 = v23;
  long long v25 = v54;
  if (v54 >= v55)
  {
    long long v27 = (char *)__p;
    uint64_t v28 = (v54 - (unsigned char *)__p) >> 3;
    unint64_t v29 = v28 + 1;
    if ((unint64_t)(v28 + 1) >> 61) {
      sub_3D1D0();
    }
    uint64_t v30 = v55 - (unsigned char *)__p;
    if ((v55 - (unsigned char *)__p) >> 2 > v29) {
      unint64_t v29 = v30 >> 2;
    }
    if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v31 = v29;
    }
    if (v31)
    {
      v32 = (char *)sub_4374C((uint64_t)&v55, v31);
      long long v27 = (char *)__p;
      long long v25 = v54;
    }
    else
    {
      v32 = 0;
    }
    v33 = &v32[8 * v28];
    v34 = &v32[8 * v31];
    *(void *)v33 = v24;
    long long v26 = v33 + 8;
    while (v25 != v27)
    {
      uint64_t v35 = *((void *)v25 - 1);
      v25 -= 8;
      *((void *)v33 - 1) = v35;
      v33 -= 8;
    }
    __p = v33;
    v54 = v26;
    v55 = v34;
    if (v27) {
      operator delete(v27);
    }
  }
  else
  {
    *(void *)v54 = v23;
    long long v26 = v25 + 8;
  }
  v54 = v26;
  v36 = (char *)[v5 attachmentCount];
  if (v36)
  {
    v37 = 0;
    uint64_t v38 = 0;
    do
    {
      unint64_t v52 = 0;
      objc_opt_class();
      [v5 attachmentAtAttachmentIndex:v37 outCharIndex:&v52];
      v39 = (void *)TSUDynamicCast();
      if (v39)
      {
        do
          unint64_t v40 = *((void *)__p + v38++);
        while (v52 >= v40);
        [v4 setRelativePageIndex:--v38 forInfo:[v39 drawable]];
      }
      ++v37;
    }
    while (v37 != v36);
  }
  id v41 = [v4 pages];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v42 = [v41 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v42)
  {
    unint64_t v43 = 0;
    uint64_t v44 = *(void *)v49;
LABEL_50:
    uint64_t v45 = 0;
    if (v9 >= v43) {
      uint64_t v46 = v9 - v43;
    }
    else {
      uint64_t v46 = 0;
    }
    while (1)
    {
      if (*(void *)v49 != v44) {
        objc_enumerationMutation(v41);
      }
      if (v46 == v45) {
        break;
      }
      v47 = *(void **)(*((void *)&v48 + 1) + 8 * v45);
      [v47 setPageStartCharIndex:*((void *)v56 + v43)];
      [v47 setPageEndCharIndex:*((void *)__p + v43++)];
      if (v42 == (id)++v45)
      {
        id v42 = [v41 countByEnumeratingWithState:&v48 objects:v59 count:16];
        if (v42) {
          goto LABEL_50;
        }
        break;
      }
    }
  }
  if (__p)
  {
    v54 = (char *)__p;
    operator delete(__p);
  }
  if (v56)
  {
    v57 = v56;
    operator delete(v56);
  }
}

- (void)mapEndElementWithState:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PFAIDualBody;
  -[PFAIDualReader mapEndElementWithState:](&v5, "mapEndElementWithState:");
  if (xmlStrEqual((const xmlChar *)"body", (const xmlChar *)objc_msgSend(objc_msgSend(a3, "currentXmlStackEntry"), "xmlElementName")))
  {
    [a3 setPaginatedAsCurrent];
    [(PFAIDualBody *)self createBodiesWithContentState:a3];
    [(PFAIDualBody *)self addDrawablesToPageZOrderWithContentState:a3];
    -[PFAIDualBody finalizePageHintsForOrientation:](self, "finalizePageHintsForOrientation:", [a3 paginatedState]);
  }
}

@end