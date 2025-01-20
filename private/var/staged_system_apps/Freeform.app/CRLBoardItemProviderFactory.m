@interface CRLBoardItemProviderFactory
- (CRLBoardItemProviderFactory)initWithBoardItemFactory:(id)a3;
- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory;
- (id)extractAdaptiveGlyphsFrom:(id)a3 in:(_NSRange)a4;
- (id)extractPasteboardBoardItemsFrom:(id)a3;
- (id)geometryForTextBoxWithPosition:(CGPoint)a3;
- (id)providerForBoardItemFromDetectedImportableURL:(id)a3 fallbackBoardItemProvider:(id)a4;
- (id)providersForBoardItemsFromImportedRichText:(id)a3;
- (id)providersForBoardItemsFromImportedText:(id)a3;
- (id)providersForBoardItemsFromTextStorages:(id)a3 position:(CGPoint)a4 keepHighlights:(BOOL)a5;
- (id)providersForBoardItemsFromURLs:(id)a3;
- (id)styleMappingProvidersForPasteboardBoardItems:(id)a3;
- (void)setBoardItemFactory:(id)a3;
@end

@implementation CRLBoardItemProviderFactory

- (CRLBoardItemProviderFactory)initWithBoardItemFactory:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLBoardItemProviderFactory;
  v5 = [(CRLBoardItemProviderFactory *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_boardItemFactory, v4);
  }

  return v6;
}

- (id)styleMappingProvidersForPasteboardBoardItems:(id)a3
{
  id v3 = a3;
  id v4 = [v3 count];
  if (v4)
  {
    v5 = +[NSMutableArray arrayWithCapacity:v4];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v12 = [CRLStyleMappingBoardItemProvider alloc];
          v13 = -[CRLStyleMappingBoardItemProvider initWithIngestibleBoardItem:](v12, "initWithIngestibleBoardItem:", v11, (void)v15);
          if (v13) {
            [v5 addObject:v13];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)providersForBoardItemsFromTextStorages:(id)a3 position:(CGPoint)a4 keepHighlights:(BOOL)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  if ([v8 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v8;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      v12 = 0;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v9);
          }
          long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v15 hasVisibleContent])
          {
            long long v16 = -[CRLBoardItemProviderFactory geometryForTextBoxWithPosition:](self, "geometryForTextBoxWithPosition:", x, y);
            long long v17 = [[CRLTextBoxingBoardItemProvider alloc] initWithTextStorage:v15 geometry:v16];
            if (v17)
            {
              if (!v12)
              {
                v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
              }
              [v12 addObject:v17];
            }
            double x = x + 15.0;
            double y = y + 15.0;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    id v8 = v19;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)providersForBoardItemsFromImportedText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = -[CRLBoardItemProviderFactory geometryForTextBoxWithPosition:](self, "geometryForTextBoxWithPosition:", CGPointZero.x, CGPointZero.y);
    id v6 = [[CRLTextBoxingBoardItemProvider alloc] initWithTextString:v4 geometry:v5];
    id v7 = v6;
    if (v6)
    {
      id v10 = v6;
      id v8 = +[NSArray arrayWithObjects:&v10 count:1];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)providersForBoardItemsFromImportedRichText:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v6 = [(CRLBoardItemProviderFactory *)self extractPasteboardBoardItemsFrom:v4];
  [v5 addObjectsFromArray:v6];

  id v7 = +[CRLWPStorageSanitizer filterText:v4 removingAttachments:1];

  if ([v7 length])
  {
    id v8 = -[CRLBoardItemProviderFactory geometryForTextBoxWithPosition:](self, "geometryForTextBoxWithPosition:", CGPointZero.x, CGPointZero.y);
    id v9 = [[CRLTextBoxingBoardItemProvider alloc] initWithRichTextString:v7 geometry:v8];
    [v5 addObject:v9];
  }

  return v5;
}

- (id)extractPasteboardBoardItemsFrom:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v6 = [v4 length];
  if (objc_msgSend(v4, "containsAttachmentsInRange:", 0, v6))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10031D028;
    v10[3] = &unk_1014EDDA0;
    id v7 = v5;
    id v11 = v7;
    [v4 enumerateAttribute:NSAttachmentAttributeName inRange:0 options:0 usingBlock:v10];
    id v8 = -[CRLBoardItemProviderFactory extractAdaptiveGlyphsFrom:in:](self, "extractAdaptiveGlyphsFrom:in:", v4, 0, v6);
    [v7 addObjectsFromArray:v8];
  }

  return v5;
}

- (id)providersForBoardItemsFromURLs:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 crl_arrayByTransformingWithBlock:&stru_1014EDDE0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)providerForBoardItemFromDetectedImportableURL:(id)a3 fallbackBoardItemProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[CRLURLBoardItemProvider canInitWithURL:v5]) {
    id v7 = [[CRLURLBoardItemProvider alloc] initWithURL:v5 fallbackBoardItemProvider:v6 isDetectedURL:1 suggestedName:0];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)geometryForTextBoxWithPosition:(CGPoint)a3
{
  id v3 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasMutableInfoGeometry alloc], "initWithPosition:size:", a3.x, a3.y, CGSizeZero.width, CGSizeZero.height);
  [(CRLCanvasMutableInfoGeometry *)v3 setWidthValid:0];
  [(CRLCanvasMutableInfoGeometry *)v3 setHeightValid:0];

  return v3;
}

- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_boardItemFactory);

  return (_TtC8Freeform19CRLBoardItemFactory *)WeakRetained;
}

- (void)setBoardItemFactory:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)extractAdaptiveGlyphsFrom:(id)a3 in:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = self;
  sub_100BDC7FC(v7, location, length);

  sub_1005057FC(&qword_101676170);
  v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

@end