@interface PXPresentationState
+ (void)setPptChartGraphicPropertyDefaultBlock:(id)a3;
- (BOOL)isCancelled;
- (CXNamespace)PXPresentationMLNamespace;
- (NSMutableDictionary)commentAuthorIdToIndexMap;
- (PXPresentationState)init;
- (TCCancelDelegate)cancelDelegate;
- (id)modelObjectForLocation:(id)a3;
- (id)oavState;
- (id)officeArtState;
- (id)tableStyleCache;
- (id)tgtPresentation;
- (int64_t)slideIndexForSlideURL:(id)a3;
- (void)resetOfficeArtState;
- (void)setCancelDelegate:(id)a3;
- (void)setModelObject:(id)a3 forLocation:(id)a4;
- (void)setPXPresentationMLNamespace:(id)a3;
- (void)setSlideIndex:(int64_t)a3 forSlideURL:(id)a4;
- (void)setTgtPresentation:(id)a3;
- (void)setupNSForXMLFormat:(int)a3;
@end

@implementation PXPresentationState

- (PXPresentationState)init
{
  v17.receiver = self;
  v17.super_class = (Class)PXPresentationState;
  v2 = [(OCXState *)&v17 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mModelObjects = v2->mModelObjects;
    v2->mModelObjects = v3;

    v5 = [[PXOfficeArtClient alloc] initWithState:v2];
    v6 = [[OAXDrawingState alloc] initWithClient:v5];
    mOfficeArtState = v2->mOfficeArtState;
    v2->mOfficeArtState = v6;

    v8 = [(OAVReadState *)[PXVmlState alloc] initWithClient:objc_opt_class() packagePart:0];
    mOAVState = v2->mOAVState;
    v2->mOAVState = &v8->super;

    [(OAXDrawingState *)v2->mOfficeArtState setDocumentState:v2];
    [(OAXDrawingState *)v2->mOfficeArtState setOavState:v2->mOAVState];
    [(OAVReadState *)v2->mOAVState setOaxState:v2->mOfficeArtState];
    v10 = objc_alloc_init(OAXTableStyleCache);
    mTableStyleCache = v2->mTableStyleCache;
    v2->mTableStyleCache = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mSlideURLToIndexMap = v2->mSlideURLToIndexMap;
    v2->mSlideURLToIndexMap = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mCommentAuthorIdToIndexMap = v2->mCommentAuthorIdToIndexMap;
    v2->mCommentAuthorIdToIndexMap = v14;

    +[PXPresentationState setPptChartGraphicPropertyDefaultBlock:v2->mOfficeArtState];
  }
  return v2;
}

- (void)setCancelDelegate:(id)a3
{
}

- (void)setTgtPresentation:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->mTgtPresentation, a3);
  mOfficeArtState = self->mOfficeArtState;
  v6 = [v9 blips];
  [(OAXDrawingState *)mOfficeArtState setTargetBlipCollection:v6];

  v7 = self->mOfficeArtState;
  v8 = [v9 bulletBlips];
  [(OAXDrawingState *)v7 setTargetBulletBlipArray:v8];
}

- (void)setSlideIndex:(int64_t)a3 forSlideURL:(id)a4
{
  id v9 = a4;
  mSlideURLToIndexMap = self->mSlideURLToIndexMap;
  v7 = [NSNumber numberWithInteger:a3];
  v8 = [v9 absoluteURL];
  [(NSMutableDictionary *)mSlideURLToIndexMap setObject:v7 forKey:v8];
}

- (id)tableStyleCache
{
  return self->mTableStyleCache;
}

- (id)officeArtState
{
  return self->mOfficeArtState;
}

- (BOOL)isCancelled
{
  return [(TCCancelDelegate *)self->mCancel isCancelled];
}

- (id)tgtPresentation
{
  return self->mTgtPresentation;
}

- (void)resetOfficeArtState
{
  id v13 = [(OAXDrawingState *)self->mOfficeArtState styleMatrix];
  v3 = [(OAXDrawingState *)self->mOfficeArtState sourceURLToTargetBlipIndexMap];
  v4 = [(OAXDrawingState *)self->mOfficeArtState sourceURLToTargetBulletBlipIndexMap];
  mOfficeArtState = self->mOfficeArtState;
  self->mOfficeArtState = 0;

  v6 = [[PXOfficeArtClient alloc] initWithState:self];
  v7 = [[OAXDrawingState alloc] initWithClient:v6];
  v8 = self->mOfficeArtState;
  self->mOfficeArtState = v7;

  [(OAXDrawingState *)self->mOfficeArtState setDocumentState:self];
  [(OAXDrawingState *)self->mOfficeArtState setOavState:self->mOAVState];
  [(OAVReadState *)self->mOAVState setOaxState:self->mOfficeArtState];
  id v9 = self->mOfficeArtState;
  v10 = [(OCDDocument *)self->mTgtPresentation blips];
  [(OAXDrawingState *)v9 setTargetBlipCollection:v10];

  v11 = self->mOfficeArtState;
  v12 = [(PDPresentation *)self->mTgtPresentation bulletBlips];
  [(OAXDrawingState *)v11 setTargetBulletBlipArray:v12];

  [(OAXDrawingState *)self->mOfficeArtState setStyleMatrix:v13];
  [(OAXDrawingState *)self->mOfficeArtState setSourceURLToTargetBlipIndexMap:v3];
  [(OAXDrawingState *)self->mOfficeArtState setSourceURLToTargetBulletBlipIndexMap:v4];
  +[PXPresentationState setPptChartGraphicPropertyDefaultBlock:self->mOfficeArtState];
}

- (void)setModelObject:(id)a3 forLocation:(id)a4
{
  id v8 = a3;
  mModelObjects = self->mModelObjects;
  v7 = [a4 absoluteURL];
  [(NSMutableDictionary *)mModelObjects setObject:v8 forKey:v7];
}

- (id)modelObjectForLocation:(id)a3
{
  mModelObjects = self->mModelObjects;
  v4 = [a3 absoluteURL];
  v5 = [(NSMutableDictionary *)mModelObjects objectForKey:v4];

  return v5;
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancel;
}

- (int64_t)slideIndexForSlideURL:(id)a3
{
  mSlideURLToIndexMap = self->mSlideURLToIndexMap;
  v4 = [a3 absoluteURL];
  v5 = [(NSMutableDictionary *)mSlideURLToIndexMap objectForKey:v4];

  if (v5) {
    int64_t v6 = [v5 integerValue];
  }
  else {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (id)oavState
{
  return self->mOAVState;
}

+ (void)setPptChartGraphicPropertyDefaultBlock:(id)a3
{
}

id __62__PXPresentationState_setPptChartGraphicPropertyDefaultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = a3;
  int64_t v6 = (void *)[v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        v11 = TSUDynamicCast(v10, v9);
        if (objc_msgSend(v11, "isEqualToString:", @"AutomaticChartMarkerSize", (void)v16)
          && [v4 hasStroke])
        {
          v12 = NSNumber;
          id v13 = [v4 stroke];
          [v13 width];
          int64_t v6 = [v12 numberWithDouble:floor(v14 * 2.0 + 3.0)];

          goto LABEL_12;
        }
      }
      int64_t v6 = (void *)[v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)setupNSForXMLFormat:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPresentationState;
  -[OCXState setupNSForXMLFormat:](&v9, sel_setupNSForXMLFormat_);
  id v5 = [CXNamespace alloc];
  int64_t v6 = v5;
  if (v3)
  {
    uint64_t v7 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/presentationml/2006/main"];
    id v8 = [(CXNamespace *)v6 initWithUri:"http://purl.oclc.org/ooxml/presentationml/main" fallbackNamespace:v7];
    [(PXPresentationState *)self setPXPresentationMLNamespace:v8];
  }
  else
  {
    uint64_t v7 = [(CXNamespace *)v5 initWithUri:"http://schemas.openxmlformats.org/presentationml/2006/main"];
    [(PXPresentationState *)self setPXPresentationMLNamespace:v7];
  }

  [(OAXDrawingState *)self->mOfficeArtState setupNSForXMLFormat:v3];
  [(OCXState *)self->mOAVState setupNSForXMLFormat:v3];
}

- (NSMutableDictionary)commentAuthorIdToIndexMap
{
  return self->mCommentAuthorIdToIndexMap;
}

- (CXNamespace)PXPresentationMLNamespace
{
  return self->mPXPresentationMLNamespace;
}

- (void)setPXPresentationMLNamespace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCommentAuthorIdToIndexMap, 0);
  objc_storeStrong((id *)&self->mPXPresentationMLNamespace, 0);
  objc_storeStrong((id *)&self->mCancel, 0);
  objc_storeStrong((id *)&self->mTgtPresentation, 0);
  objc_storeStrong((id *)&self->mSlideURLToIndexMap, 0);
  objc_storeStrong((id *)&self->mTableStyleCache, 0);
  objc_storeStrong((id *)&self->mOAVState, 0);
  objc_storeStrong((id *)&self->mOfficeArtState, 0);
  objc_storeStrong((id *)&self->mModelObjects, 0);
}

@end