@interface PFAITocConfigLocalToc
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAITocConfigLocalToc

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  if ([v4 childResultCount] == (char *)&dword_0 + 1)
  {
    objc_opt_class();
    [v4 childResultAtIndex:0];
    v5 = (void *)TSUDynamicCast();
    if (v5)
    {
      v51 = v5;
      id v52 = a3;
      id v6 = [v5 containedStorage];
      if (([v6 hasSmartFields] & 1) == 0)
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id obj = objc_msgSend(objc_msgSend(a3, "tocTile"), "landscapeEntries");
        id v55 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (v55)
        {
          v7 = 0;
          uint64_t v54 = *(void *)v57;
          do
          {
            for (i = 0; i != v55; i = (char *)i + 1)
            {
              if (*(void *)v57 != v54) {
                objc_enumerationMutation(obj);
              }
              v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              if ([v9 sectionIdentifier])
              {
                v10 = (char *)[v6 rangeOfParagraphBreakingCharacter:10 backwards:0 range:v7, (unsigned char *)[v6 length] - v7];
                v12 = v10 == (char *)0x7FFFFFFFFFFFFFFFLL ? (char *)[v6 length] : &v10[v11];
                v13 = (char *)[v6 rangeOfString:[v9 sectionIdentifier] searchOptions:1 range:v7 v12 - v7];
                if (v13 != (char *)0x7FFFFFFFFFFFFFFFLL)
                {
                  v15 = v13;
                  uint64_t v16 = v14;
                  v7 = &v13[v14];
                  id v17 = objc_msgSend(objc_alloc((Class)TSWPHyperlinkField), "initWithContext:url:", objc_msgSend(v6, "context"), objc_msgSend(objc_msgSend(v9, "modelLink"), "url"));
                  [v6 addSmartField:v17 toRange:v15 dolcContext:v16 undoTransaction:0];
                }
              }
              if ([v9 title])
              {
                id v18 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "title"), "stringByReplacingOccurrencesOfString:withString:", @"\u2028", @"​\u2028"), "stringByReplacingOccurrencesOfString:withString:", @"\r", &stru_46D7E8);
                v19 = [v6 rangeOfParagraphBreakingCharacter:10 backwards:0 range:v7, [v6 length] - v7];
                v21 = v19 == (char *)0x7FFFFFFFFFFFFFFFLL ? (char *)[v6 length] : &v19[v20];
                v22 = [v6 rangeOfString:v18 searchOptions:1 range:v7, v21 - v7];
                if (v22 != (char *)0x7FFFFFFFFFFFFFFFLL)
                {
                  v24 = v22;
                  uint64_t v25 = v23;
                  v7 = &v22[v23];
                  id v26 = objc_msgSend(objc_alloc((Class)TSWPHyperlinkField), "initWithContext:url:", objc_msgSend(v6, "context"), objc_msgSend(objc_msgSend(v9, "modelLink"), "url"));
                  [v6 addSmartField:v26 toRange:v24 dolcContext:v25 undoTransaction:0];
                }
              }
              if ([v9 displayPageNumber])
              {
                v27 = [v6 rangeOfParagraphBreakingCharacter:10 backwards:0 range:v7, [v6 length] - v7];
                v29 = v27 == (char *)0x7FFFFFFFFFFFFFFFLL ? (char *)[v6 length] : &v27[v28];
                v30 = [v6 rangeOfString:[v9 displayPageNumber] searchOptions:1 range:v7, v29 - v7];
                if (v30 != (char *)0x7FFFFFFFFFFFFFFFLL)
                {
                  v32 = v30;
                  uint64_t v33 = v31;
                  v7 = &v30[v31];
                  id v34 = objc_msgSend(objc_alloc((Class)TSWPHyperlinkField), "initWithContext:url:", objc_msgSend(v6, "context"), objc_msgSend(objc_msgSend(v9, "modelLink"), "url"));
                  [v6 addSmartField:v34 toRange:v32 dolcContext:v33 undoTransaction:0];
                }
              }
              v35 = [v6 rangeOfParagraphBreakingCharacter:10 backwards:0 range:v7, [v6 length] - v7];
              if (v35 >= v7) {
                v7 = &v35[v36];
              }
            }
            id v55 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
          }
          while (v55);
        }
      }
      id v37 = [v51 geometry];
      objc_msgSend(objc_msgSend(v51, "geometry"), "size");
      double v39 = v38 + 2.0;
      objc_msgSend(objc_msgSend(v51, "geometry"), "size");
      [v37 setSize:v39];
      v40 = -[THWViewportInfo initWithContext:geometry:]([THWViewportInfo alloc], "initWithContext:geometry:", [v52 tspContext], objc_msgSend(v51, "geometry"));
      id v41 = objc_msgSend(objc_alloc((Class)TSDShapeInfo), "initWithContext:geometry:style:", objc_msgSend(v52, "tspContext"), objc_msgSend(v51, "geometry"), objc_msgSend(v51, "shapeStyle"));
      [(THWViewportInfo *)v40 setBackgroundShape:v41];

      [(THWViewportInfo *)v40 setStroke:+[TSDStroke emptyStroke]];
      id v42 = [objc_alloc((Class)TSWPStorageMeasurer) initWithStorage:v6];
      [v42 measuredSizeWithFlags:3];
      double v44 = v43;

      objc_msgSend(objc_msgSend(v51, "geometry"), "size");
      -[THWViewportInfo setCanvasSize:](v40, "setCanvasSize:", v45 + -2.0, v44 + 10.0);
      [(THWViewportInfo *)v40 setContentPadding:0.0];
      id v46 = objc_alloc((Class)TSDInfoGeometry);
      objc_msgSend(objc_msgSend(v51, "geometry"), "size");
      id v48 = [v46 initWithPosition:0.0 size:v47 + -1.0 v44];
      id v49 = [objc_alloc((Class)TSWPShapeStyle) initWithContext:[v52 tspContext]];
      objc_msgSend(objc_msgSend(v52, "stylesheet"), "addStyle:", v49);
      id v50 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", objc_msgSend(v52, "tspContext"), v48, v49, v6);
      [v50 setStroke:[TSDStroke emptyStroke]];

      [(THWViewportInfo *)v40 setCanvasInfos:+[NSArray arrayWithObject:v50]];
      objc_msgSend(objc_msgSend(v52, "pageInfo"), "addFloatingDrawable:insertContext:", v40, 0);
      +[PFAITocConfigDrawablePlacement cacheDrawable:v40 readerState:v52];
    }
  }
}

@end