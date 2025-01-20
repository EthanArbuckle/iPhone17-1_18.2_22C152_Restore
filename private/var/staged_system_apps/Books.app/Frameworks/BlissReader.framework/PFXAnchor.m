@interface PFXAnchor
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXAnchor

- (BOOL)mapStartElementWithState:(id)a3
{
  id v3 = a3;
  id v35 = [a3 currentHtmlStackEntry];
  id v5 = [v35 currentEntryMediaState];
  id v6 = [v3 currentHtmlDocMediaState];
  id v7 = [v5 propertySet];
  id v37 = [v5 storage];
  [v5 setOriginalStorage:];
  v38 = v3;
  if ([v6 hasHints])
  {
    if (([v3 inTable] & 1) == 0)
    {
      id v8 = [v3 totalTextRead];
      BOOL v9 = v8 == [v6 nextHintLocation];
      id v3 = v38;
      if (v9 && ![v6 nextHintShapeRef])
      {
        objc_msgSend(objc_msgSend(v38, "hintCollectorForStorage:", v37), "addLineBreakHintWithPresentationId:", @"p");
        [v6 popHint];
      }
    }
  }
  id v10 = [v7 valueForProperty:PFXPropNmApplePubLayoutHint[0]];
  v11 = &OBJC_IVAR___THiOSThemeProvider__uiTextColor;
  if (v10)
  {
    v12 = v10;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v13 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v13)
    {
      id v14 = v13;
      id v34 = v5;
      int v15 = 0;
      uint64_t v16 = *(void *)v42;
      v36 = self;
      while (1)
      {
        v17 = 0;
        do
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v12);
          }
          id v18 = +[PFSUtilities identValueOrNilFromPair:](PFSUtilities, "identValueOrNilFromPair:", *(void *)(*((void *)&v41 + 1) + 8 * (void)v17), v34);
          if ([PFXPropNmApplePubShapeHint isEqualToString:v18])
          {
            if ([v6 hasHints] && (objc_msgSend(v3, "inTable") & 1) == 0)
            {
              int v39 = v15;
              v19 = v12;
              v20 = v11;
              id v21 = [v3 hintCollectorForStorage:v37];
              id v22 = [v3 totalTextRead];
              id v23 = [v6 nextHintLocation];
              if (v22 == v23 && ![v6 nextHintShapeRef])
              {
                [v21 addLineBreakHintWithPresentationId:@"p"];
                [v6 popHint];
              }
              id v24 = [v6 nextHintShapeRef];
              if ([v6 hasHints])
              {
                do
                {
                  if (v23 != v22) {
                    break;
                  }
                  if (!v24) {
                    break;
                  }
                  [v21 addStartHintWithIdref:v24 presentationId:@"p"];
                  [v6 popHint];
                  id v23 = [v6 nextHintLocation];
                  id v24 = [v6 nextHintShapeRef];
                }
                while (([v6 hasHints] & 1) != 0);
              }
              id v3 = v38;
              v11 = v20;
              v12 = v19;
              self = v36;
              int v15 = v39;
            }
            goto LABEL_29;
          }
          if ([v18 isEqualToString:PFXPropNmApplePubInlineHint])
          {
            int v15 = 1;
LABEL_29:
            *((unsigned char *)&self->super.super.isa + v11[811]) = 1;
            goto LABEL_30;
          }
          if (([PFXPropNmApplePubPageHint isEqualToString:v18] & 1) != 0
            || [PFXPropNmApplePubPageShapeHint isEqualToString:v18])
          {
            [v6 addPageStartIndex];
            goto LABEL_29;
          }
          if ([PFXPropNmApplePubAnchorHint isEqualToString:v18])
          {
            objc_msgSend(v6, "cacheCharacterPosition:forDrawableAnchorId:", objc_msgSend(objc_msgSend(v6, "bodyStorage"), "length"), +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v35, "xmlElementId")));
            goto LABEL_29;
          }
LABEL_30:
          v17 = (char *)v17 + 1;
        }
        while (v17 != v14);
        id v25 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
        id v14 = v25;
        if (!v25)
        {
          char v26 = v15;
          id v5 = v34;
          if (v26)
          {
            id v27 = objc_msgSend(objc_alloc((Class)TSWPDrawableAttachment), "initWithContext:drawable:", objc_msgSend(v3, "tspContext"), 0);
            [v27 setHOffsetType:0];
            [v27 setHOffset:0.0];
            [v27 setVOffsetType:0];
            [v27 setVOffset:0.0];
            id v28 = [v37 length];
            [v37 insertAttachmentOrFootnote:v27 range:v28];
            v29 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [v35 xmlElementId]);
            id v30 = objc_msgSend(objc_msgSend(v38, "currentHtmlDocMediaState"), "drawableAttachmentCache");
            v31 = v29;
            id v3 = v38;
            [v30 setObject:v27 forKey:v31];

            objc_msgSend(v37, "setCharacterStyle:range:undoTransaction:", objc_msgSend(objc_msgSend(objc_msgSend(v35, "parentHtmlStackEntry"), "currentEntryMediaState"), "characterStyle"), v28, 1, 0);
          }
          break;
        }
      }
    }
  }
  if (*((unsigned char *)&self->super.super.isa + v11[811]))
  {
    v32 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", +[THTemporaryObjectContext context](THTemporaryObjectContext, "context"), &stru_46D7E8, [v6 stylesheet], 3);
    [v5 setOverriddenStorage:v32];

    return 1;
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)PFXAnchor;
    return [(PFXCharacterRun *)&v40 mapStartElementWithState:v3];
  }
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  id v7 = [a3 currentHtmlDocMediaState];
  id v8 = [v6 originalStorage];
  if (!self->mIsLayoutHint)
  {
    v19.receiver = self;
    v19.super_class = (Class)PFXAnchor;
    [(PFXCharacterRun *)&v19 mapEndElementWithState:a3];
    id v11 = [v5 href];
    if (v11)
    {
      v12 = v11;
      if (objc_msgSend(@"noteref", "isEqualToString:", objc_msgSend(v5, "valueForAttribute:", "type"))&& objc_msgSend(v6, "childResultCount") == (char *)&dword_0 + 1&& (objc_msgSend(v6, "childResultAtIndex:", 0), (uint64_t v13 = TSUProtocolCast()) != 0))
      {
        uint64_t v14 = v13;
        [v6 setResult:v13];
        [v7 setSourceDrawableInfo:v14 forIdentifier:[v12 fragment]];
      }
      else
      {
        int v15 = [v6 startCharIndex];
        uint64_t v16 = [v8 length];
        int64_t v17 = v16 - v15;
        if (v16 != v15)
        {
          id v18 = objc_msgSend(objc_alloc((Class)TSWPHyperlinkField), "initWithContext:url:", objc_msgSend(a3, "tspContext"), v12);
          [v8 addSmartField:v18 toRange:v15 dolcContext:v17 undoTransaction:0];
        }
      }
    }
  }
  if ([v7 hasHints])
  {
    if (([a3 inTable] & 1) == 0)
    {
      id v9 = [a3 hintCollectorForStorage:v8];
      id v10 = [a3 totalTextRead];
      if (v10 == [v7 nextHintLocation] && !objc_msgSend(v7, "nextHintShapeRef"))
      {
        [v9 addLineBreakHintWithPresentationId:@"p"];
        [v7 popHint];
      }
    }
  }
}

@end