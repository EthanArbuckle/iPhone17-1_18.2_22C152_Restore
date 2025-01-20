@interface PFXShapeWithText
- (BOOL)mapStartElementWithState:(id)a3;
- (PFXBody)bodyMapper;
- (PFXShapeWithText)init;
- (TSSPropertyMap)textBlockPropertyMap;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
- (void)setBodyMapper:(id)a3;
@end

@implementation PFXShapeWithText

- (PFXShapeWithText)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFXShapeWithText;
  v2 = [(PFXShapeWithText *)&v4 init];
  if (v2) {
    v2->mTextBlockPropertyMap = (TSSPropertyMap *)[objc_alloc((Class)TSSPropertyMap) initWithCapacity:3];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXShapeWithText;
  [(PFXDrawable *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlDocMediaState];
  id v6 = [a3 currentHtmlStackEntry];
  id v7 = [v6 currentEntryMediaState];
  v12.receiver = self;
  v12.super_class = (Class)PFXShapeWithText;
  [(PFXDrawable *)&v12 mapStartElementWithState:a3];
  [a3 isTOC];
  id v8 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:string:stylesheet:kind:", objc_msgSend(a3, "tspContext"), &stru_46D7E8, objc_msgSend(v5, "stylesheet"), 3);
  [v7 setOverriddenStorage:v8];
  [a3 setCfiPathForInfo:v8 fromStackEntry:v6];

  if (+[PFAIDualDrawable shouldImportInCurrentLayoutWithStackEntry:v6 state:a3])
  {
    [a3 setUniqueIdForInfo:v8 fromStackEntry:v6];
  }
  id v9 = objc_alloc_init((Class)[a3 textBodyClass]);
  [(PFXShapeWithText *)self setBodyMapper:v9];

  [(PFXBody *)[(PFXShapeWithText *)self bodyMapper] mapStartElementWithState:a3];
  [(PFXDrawablePlacement *)self->super.mPlacement bounds];
  [v7 setBlockWidth:v10];
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlDocMediaState];
  id v6 = [a3 currentHtmlStackEntry];
  id v7 = [v6 currentEntryMediaState];
  [(PFXShapeWithText *)self setBodyMapper:0];
  id v8 = [v7 storage];
  id v9 = (char *)[v7 childResultCount];
  id v10 = 0;
  if (v9 == (unsigned char *)&dword_0 + 1)
  {
    id v10 = [v7 childResultAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 setValuesForProperties:self->mTextBlockPropertyMap];
      [v10 setContainedStorage:v8];
      [(PFXShapeWithText *)self updateLineHintsWithShape:v10 readerState:a3];
      id v11 = objc_alloc_init((Class)NSMutableArray);
      [v7 setOverriddenStorage:0];
LABEL_7:
      for (i = 0; i != v9; ++i)
        [v11 addObject:[v7 childResultAtIndex:i]];
      goto LABEL_9;
    }
  }
  id v11 = objc_alloc_init((Class)NSMutableArray);
  if ([v8 characterCount])
  {
    id v23 = objc_msgSend(objc_alloc((Class)TSWPShapeStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), 0, self->mTextBlockPropertyMap, 0);
    objc_msgSend(objc_msgSend(v5, "stylesheet"), "addStyle:", v23);
    double y = CGPointZero.y;
    [(PFXDrawablePlacement *)self->super.mPlacement bounds];
    id v13 = [objc_alloc((Class)TSDBezierPathSource) initWithBezierPath:[TSDBezierPath bezierPathWithRect:CGPointZero.x, y]];
    id v24 = v6;
    id v14 = objc_alloc((Class)TSWPShapeInfo);
    id v15 = v10;
    id v16 = [a3 tspContext];
    v17 = [(PFXDrawablePlacement *)self->super.mPlacement infoGeometry];
    id v18 = v16;
    id v10 = v15;
    id v19 = [v14 initWithContext:v18 geometry:v17 style:v23 pathSource:v13 wpStorage:v8];
    [v19 setTextUserEditable:0];
    [v11 addObject:v19];

    id v6 = v24;
  }
  [v7 setOverriddenStorage:0];
  if (v9) {
    goto LABEL_7;
  }
LABEL_9:
  if ([v11 count] == (char *)&dword_0 + 1)
  {
    id v21 = [v11 lastObject];
  }
  else
  {
    id v22 = [v11 count];
    id v21 = v11;
    if ((unint64_t)v22 < 2) {
      goto LABEL_13;
    }
  }
  [v7 setResult:v21];
LABEL_13:

  v25.receiver = self;
  v25.super_class = (Class)PFXShapeWithText;
  [(PFXDrawable *)&v25 mapEndElementWithState:a3];
  if ([a3 isInsideWidget]) {
    [v6 addChildAttributesToParentForResult:v10];
  }
}

- (TSSPropertyMap)textBlockPropertyMap
{
  return self->mTextBlockPropertyMap;
}

- (PFXBody)bodyMapper
{
  return self->mBodyMapper;
}

- (void)setBodyMapper:(id)a3
{
}

@end