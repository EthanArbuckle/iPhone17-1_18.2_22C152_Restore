@interface OAXDrawingState
- (BOOL)isInsideGroup;
- (CXNamespace)OAXChart2012Namespace;
- (CXNamespace)OAXChartDrawingNamespace;
- (CXNamespace)OAXChartNamespace;
- (CXNamespace)OAXCompatNamespace;
- (CXNamespace)OAXDrawing2010Namespace;
- (CXNamespace)OAXLockedCanvasNamespace;
- (CXNamespace)OAXMainNamespace;
- (CXNamespace)OAXMathNamespace;
- (CXNamespace)OAXPictureNamespace;
- (CXNamespace)OAXTableNamespace;
- (CXNamespace)OAXWordProcessingMLNamespace;
- (NSMutableDictionary)sourceURLToTargetBlipIndexMap;
- (NSMutableDictionary)sourceURLToTargetBulletBlipIndexMap;
- (OAXDrawingState)init;
- (OAXDrawingState)initWithClient:(id)a3;
- (id)appVersion;
- (id)blipRefForURL:(id)a3;
- (id)blipRefWithURL:(id)a3 blipArray:(id)a4 blipURLtoIndexMap:(id)a5;
- (id)bulletBlipRefForURL:(id)a3;
- (id)client;
- (id)clientChartGraphicPropertyDefaultsBlock;
- (id)colorMap;
- (id)colorScheme;
- (id)documentState;
- (id)drawableForShapeId:(unsigned int)a3;
- (id)fontScheme;
- (id)oavState;
- (id)packagePart;
- (id)peekGroup;
- (id)popGroup;
- (id)styleMatrix;
- (id)tableStyleCache;
- (id)targetBlipCollection;
- (id)vmlShapeIdForDrawableId:(unsigned int)a3;
- (void)clearTargetBlipCollection;
- (void)pushGroup:(id)a3;
- (void)replaceGroupStack:(id)a3;
- (void)resetForNewDrawing;
- (void)setClientChartGraphicPropertyDefaultsBlock:(id)a3;
- (void)setColorMap:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setDocumentState:(id)a3;
- (void)setDrawable:(id)a3 forShapeId:(unsigned int)a4;
- (void)setFontScheme:(id)a3;
- (void)setOAXChart2012Namespace:(id)a3;
- (void)setOAXChartDrawingNamespace:(id)a3;
- (void)setOAXChartNamespace:(id)a3;
- (void)setOAXCompatNamespace:(id)a3;
- (void)setOAXDrawing2010Namespace:(id)a3;
- (void)setOAXLockedCanvasNamespace:(id)a3;
- (void)setOAXMainNamespace:(id)a3;
- (void)setOAXMathNamespace:(id)a3;
- (void)setOAXPictureNamespace:(id)a3;
- (void)setOAXTableNamespace:(id)a3;
- (void)setOAXWordProcessingMLNamespace:(id)a3;
- (void)setOavState:(id)a3;
- (void)setPackagePart:(id)a3;
- (void)setSourceURLToTargetBlipIndexMap:(id)a3;
- (void)setSourceURLToTargetBulletBlipIndexMap:(id)a3;
- (void)setStyleMatrix:(id)a3;
- (void)setTableStyleCache:(id)a3;
- (void)setTargetBlipCollection:(id)a3;
- (void)setTargetBulletBlipArray:(id)a3;
- (void)setVmlShapeId:(id)a3 forDrawableId:(unsigned int)a4;
- (void)setupNSForXMLFormat:(int)a3;
@end

@implementation OAXDrawingState

- (OAXDrawingState)initWithClient:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OAXDrawingState;
  v6 = [(OCXState *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mClient, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mShapeIdMap = v7->mShapeIdMap;
    v7->mShapeIdMap = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mDrawableIdToVmlShapeIdMap = v7->mDrawableIdToVmlShapeIdMap;
    v7->mDrawableIdToVmlShapeIdMap = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mGroupStack = v7->mGroupStack;
    v7->mGroupStack = v12;
  }
  return v7;
}

- (void)setOavState:(id)a3
{
}

- (void)setTargetBlipCollection:(id)a3
{
  v8 = (OADBlipCollection *)a3;
  if (self->mTgtBlipCollection != v8) {
    objc_storeStrong((id *)&self->mTgtBlipCollection, a3);
  }
  mSrcURLToTgtBlipIndexMap = self->mSrcURLToTgtBlipIndexMap;
  if (mSrcURLToTgtBlipIndexMap)
  {
    self->mSrcURLToTgtBlipIndexMap = 0;
  }
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v7 = self->mSrcURLToTgtBlipIndexMap;
  self->mSrcURLToTgtBlipIndexMap = v6;
}

- (void)setPackagePart:(id)a3
{
}

- (void)setStyleMatrix:(id)a3
{
}

- (id)styleMatrix
{
  return self->mStyleMatrix;
}

- (id)packagePart
{
  return self->mPackagePart;
}

- (void)setColorScheme:(id)a3
{
}

- (void)resetForNewDrawing
{
  [(NSMutableDictionary *)self->mShapeIdMap removeAllObjects];
  mDrawableIdToVmlShapeIdMap = self->mDrawableIdToVmlShapeIdMap;
  [(NSMutableDictionary *)mDrawableIdToVmlShapeIdMap removeAllObjects];
}

- (id)blipRefForURL:(id)a3
{
  id v4 = a3;
  id v5 = [(OADBlipCollection *)self->mTgtBlipCollection blips];
  v6 = [(OAXDrawingState *)self blipRefWithURL:v4 blipArray:v5 blipURLtoIndexMap:self->mSrcURLToTgtBlipIndexMap];

  if (v6)
  {
    int v7 = [v6 index];
    v8 = [v6 name];
    v9 = +[OADBlipRef blipRefWithIndex:(v7 + 1) name:v8 blip:0];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)blipRefWithURL:(id)a3 blipArray:(id)a4 blipURLtoIndexMap:(id)a5
{
  id v8 = a3;
  id v43 = a4;
  id v9 = a5;
  if (v8)
  {
    v10 = [(OCPPackagePart *)self->mPackagePart package];
    v11 = [v10 partForLocation:v8];

    if (v11)
    {
      v12 = [v11 location];
      v13 = [v12 path];

      v14 = [v13 lastPathComponent];
      v42 = [v14 stringByDeletingPathExtension];
      objc_super v15 = [v9 objectForKey:v13];
      v41 = v15;
      if (v15)
      {
        uint64_t v16 = [v15 intValue];
        v17 = [v43 objectAtIndex:(int)v16];
        v18 = (_DWORD *)[v17 referenceCount];
        ++*v18;
        v19 = +[OADBlipRef blipRefWithIndex:v16 name:v42 blip:0];
      }
      else
      {
        v39 = v14;
        v20 = [(OCPPackagePart *)self->mPackagePart package];
        uint64_t v21 = [v20 contentTypeForPartLocation:v8];

        v40 = (void *)v21;
        uint64_t v22 = +[OADBlipRef blipTypeForContentType:v21];
        if (v22) {
          goto LABEL_10;
        }
        v23 = [v8 pathExtension];
        uint64_t v22 = +[OADBlipRef blipTypeForExtension:v23];

        if (v22) {
          goto LABEL_10;
        }
        context = (void *)MEMORY[0x23EC9A170]();
        v37 = [(OCPPackagePart *)self->mPackagePart package];
        v24 = [v37 partForLocation:v8];
        v25 = [v24 data];
        uint64_t v22 = +[OADBlipRef blipTypeForImageData:v25];

        if (v22)
        {
LABEL_10:
          v26 = [[OADSubBlip alloc] initWithData:0 type:v22];
          v27 = [OAXBlipContext alloc];
          v28 = [(OCPPackagePart *)self->mPackagePart package];
          uint64_t v29 = [(OCXDelayedMediaContext *)v27 initWithTargetLocation:v8 package:v28];

          v38 = (void *)v29;
          [(OCDDelayedNode *)v26 setDelayedContext:v29];
          v30 = [v11 data];
          -[OADSubBlip setSizeInBytes:](v26, "setSizeInBytes:", [v30 length]);

          v31 = objc_alloc_init(OADBlip);
          [(OADBlip *)v31 setMainSubBlip:v26];
          [v43 addObject:v31];
          *[(OADBlip *)v31 referenceCount] = 1;
          uint64_t v32 = [v43 count] - 1;
          v33 = [NSNumber numberWithInt:v32];
          [v9 setObject:v33 forKey:v13];

          v19 = +[OADBlipRef blipRefWithIndex:v32 name:v42 blip:0];
          v34 = [(OCPPackagePart *)self->mPackagePart package];
          [v34 resetPartForLocation:v8];

          v14 = v39;
        }
        else
        {
          v19 = +[OADBlipRef blipRefWithIndex:0xFFFFFFFFLL name:0 blip:0];
        }
        v17 = v40;
      }
    }
    else
    {
      v19 = +[OADBlipRef blipRefWithIndex:0xFFFFFFFFLL name:0 blip:0];
    }
  }
  else
  {
    v19 = +[OADBlipRef blipRefWithIndex:0xFFFFFFFFLL name:0 blip:0];
  }

  return v19;
}

- (BOOL)isInsideGroup
{
  return [(NSMutableArray *)self->mGroupStack count] != 0;
}

- (id)client
{
  return self->mClient;
}

- (id)oavState
{
  return self->mOavState;
}

- (void)setDrawable:(id)a3 forShapeId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  mShapeIdMap = self->mShapeIdMap;
  int v7 = [NSNumber numberWithUnsignedLong:v4];
  id v8 = [(NSMutableDictionary *)mShapeIdMap objectForKey:v7];

  [v11 setId:v4];
  id v9 = self->mShapeIdMap;
  v10 = [NSNumber numberWithUnsignedLong:v4];
  [(NSMutableDictionary *)v9 setObject:v11 forKey:v10];
}

- (id)targetBlipCollection
{
  return self->mTgtBlipCollection;
}

- (void)setDocumentState:(id)a3
{
  id v4 = a3;
  objc_storeWeak(&self->mDocumentState, v4);
  -[OAXDrawingState setupNSForXMLFormat:](self, "setupNSForXMLFormat:", [v4 xmlFormat]);
}

- (void)setTargetBulletBlipArray:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->mTgtBulletBlips, a3);
  if (self->mTgtBulletBlips)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mSrcURLToTgtBulletBlipIndexMap = self->mSrcURLToTgtBulletBlipIndexMap;
    self->mSrcURLToTgtBulletBlipIndexMap = v5;
  }
}

- (void)setTableStyleCache:(id)a3
{
}

- (void)setFontScheme:(id)a3
{
}

- (void)setColorMap:(id)a3
{
}

- (id)tableStyleCache
{
  return self->mTableStyleCache;
}

- (NSMutableDictionary)sourceURLToTargetBlipIndexMap
{
  return self->mSrcURLToTgtBlipIndexMap;
}

- (NSMutableDictionary)sourceURLToTargetBulletBlipIndexMap
{
  return self->mSrcURLToTgtBulletBlipIndexMap;
}

- (void)setSourceURLToTargetBlipIndexMap:(id)a3
{
}

- (void)setSourceURLToTargetBulletBlipIndexMap:(id)a3
{
}

- (id)popGroup
{
  v3 = [(OAXDrawingState *)self peekGroup];
  [(NSMutableArray *)self->mGroupStack removeLastObject];
  return v3;
}

- (id)drawableForShapeId:(unsigned int)a3
{
  mShapeIdMap = self->mShapeIdMap;
  id v4 = [NSNumber numberWithUnsignedLong:a3];
  id v5 = [(NSMutableDictionary *)mShapeIdMap objectForKey:v4];

  return v5;
}

- (id)bulletBlipRefForURL:(id)a3
{
  v3 = [(OAXDrawingState *)self blipRefWithURL:a3 blipArray:self->mTgtBulletBlips blipURLtoIndexMap:self->mSrcURLToTgtBulletBlipIndexMap];
  return v3;
}

- (id)documentState
{
  id WeakRetained = objc_loadWeakRetained(&self->mDocumentState);
  return WeakRetained;
}

- (id)colorScheme
{
  return self->mColorScheme;
}

- (id)colorMap
{
  return self->mColorMap;
}

- (id)fontScheme
{
  return self->mFontScheme;
}

- (void)clearTargetBlipCollection
{
  mTgtBlipCollection = self->mTgtBlipCollection;
  self->mTgtBlipCollection = 0;

  mSrcURLToTgtBlipIndexMap = self->mSrcURLToTgtBlipIndexMap;
  self->mSrcURLToTgtBlipIndexMap = 0;
}

- (OAXDrawingState)init
{
  return 0;
}

- (id)appVersion
{
  v2 = [(OAXDrawingState *)self packagePart];
  v3 = [v2 package];
  id v4 = [v3 properties];
  id v5 = [v4 appVersion];

  return v5;
}

- (id)vmlShapeIdForDrawableId:(unsigned int)a3
{
  mDrawableIdToVmlShapeIdMap = self->mDrawableIdToVmlShapeIdMap;
  id v4 = [NSNumber numberWithUnsignedLong:a3];
  id v5 = [(NSMutableDictionary *)mDrawableIdToVmlShapeIdMap objectForKey:v4];

  return v5;
}

- (void)setVmlShapeId:(id)a3 forDrawableId:(unsigned int)a4
{
  id v8 = a3;
  mDrawableIdToVmlShapeIdMap = self->mDrawableIdToVmlShapeIdMap;
  id v7 = [NSNumber numberWithUnsignedLong:a4];
  [(NSMutableDictionary *)mDrawableIdToVmlShapeIdMap setObject:v8 forKey:v7];
}

- (void)pushGroup:(id)a3
{
}

- (id)peekGroup
{
  return (id)[(NSMutableArray *)self->mGroupStack lastObject];
}

- (void)replaceGroupStack:(id)a3
{
}

- (void)setupNSForXMLFormat:(int)a3
{
  v35.receiver = self;
  v35.super_class = (Class)OAXDrawingState;
  -[OCXState setupNSForXMLFormat:](&v35, sel_setupNSForXMLFormat_);
  id v5 = [CXNamespace alloc];
  v6 = v5;
  if (a3)
  {
    id v7 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/main"];
    id v8 = [(CXNamespace *)v6 initWithUri:"http://purl.oclc.org/ooxml/drawingml/main" fallbackNamespace:v7];
    [(OAXDrawingState *)self setOAXMainNamespace:v8];

    id v9 = [CXNamespace alloc];
    v10 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/chart"];
    id v11 = [(CXNamespace *)v9 initWithUri:"http://purl.oclc.org/ooxml/drawingml/chart" fallbackNamespace:v10];
    [(OAXDrawingState *)self setOAXChartNamespace:v11];

    v12 = [CXNamespace alloc];
    v13 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/chartDrawing"];
    v14 = [(CXNamespace *)v12 initWithUri:"http://purl.oclc.org/ooxml/drawingml/chartDrawing" fallbackNamespace:v13];
    [(OAXDrawingState *)self setOAXChartDrawingNamespace:v14];

    objc_super v15 = [CXNamespace alloc];
    uint64_t v16 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/lockedCanvas"];
    v17 = [(CXNamespace *)v15 initWithUri:"http://purl.oclc.org/ooxml/drawingml/lockedCanvas" fallbackNamespace:v16];
    [(OAXDrawingState *)self setOAXLockedCanvasNamespace:v17];

    v18 = [CXNamespace alloc];
    v19 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/picture"];
    v20 = [(CXNamespace *)v18 initWithUri:"http://purl.oclc.org/ooxml/drawingml/picture" fallbackNamespace:v19];
    [(OAXDrawingState *)self setOAXPictureNamespace:v20];

    uint64_t v21 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/table"];
    [(OAXDrawingState *)self setOAXTableNamespace:v21];

    uint64_t v22 = [CXNamespace alloc];
    v23 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/wordprocessingml/2006/main"];
    v24 = [(CXNamespace *)v22 initWithUri:"http://purl.oclc.org/ooxml/wordprocessingml/main" fallbackNamespace:v23];
    [(OAXDrawingState *)self setOAXWordProcessingMLNamespace:v24];

    v25 = [CXNamespace alloc];
    v26 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/math"];
    v27 = [(CXNamespace *)v25 initWithUri:"http://purl.oclc.org/ooxml/officeDocument/math" fallbackNamespace:v26];
    [(OAXDrawingState *)self setOAXMathNamespace:v27];
  }
  else
  {
    v28 = [(CXNamespace *)v5 initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/main"];
    [(OAXDrawingState *)self setOAXMainNamespace:v28];

    uint64_t v29 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/chart"];
    [(OAXDrawingState *)self setOAXChartNamespace:v29];

    v30 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/chartDrawing"];
    [(OAXDrawingState *)self setOAXChartDrawingNamespace:v30];

    v31 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/lockedCanvas"];
    [(OAXDrawingState *)self setOAXLockedCanvasNamespace:v31];

    uint64_t v32 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/picture"];
    [(OAXDrawingState *)self setOAXPictureNamespace:v32];

    v33 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/table"];
    [(OAXDrawingState *)self setOAXTableNamespace:v33];

    v34 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/wordprocessingml/2006/main"];
    [(OAXDrawingState *)self setOAXWordProcessingMLNamespace:v34];

    v26 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/math"];
    [(OAXDrawingState *)self setOAXMathNamespace:v26];
  }

  [(OAXDrawingState *)self setOAXCompatNamespace:OAXCompatNamespace];
  [(OAXDrawingState *)self setOAXChart2012Namespace:OAXChart2012Namespace];
  [(OAXDrawingState *)self setOAXDrawing2010Namespace:OAXDrawing2010Namespace];
}

- (CXNamespace)OAXMainNamespace
{
  return self->mOAXMainNamespace;
}

- (void)setOAXMainNamespace:(id)a3
{
}

- (CXNamespace)OAXChartNamespace
{
  return self->mOAXChartNamespace;
}

- (void)setOAXChartNamespace:(id)a3
{
}

- (CXNamespace)OAXChartDrawingNamespace
{
  return self->mOAXChartDrawingNamespace;
}

- (void)setOAXChartDrawingNamespace:(id)a3
{
}

- (CXNamespace)OAXCompatNamespace
{
  return self->mOAXCompatNamespace;
}

- (void)setOAXCompatNamespace:(id)a3
{
}

- (CXNamespace)OAXLockedCanvasNamespace
{
  return self->mOAXLockedCanvasNamespace;
}

- (void)setOAXLockedCanvasNamespace:(id)a3
{
}

- (CXNamespace)OAXPictureNamespace
{
  return self->mOAXPictureNamespace;
}

- (void)setOAXPictureNamespace:(id)a3
{
}

- (CXNamespace)OAXTableNamespace
{
  return self->mOAXTableNamespace;
}

- (void)setOAXTableNamespace:(id)a3
{
}

- (CXNamespace)OAXWordProcessingMLNamespace
{
  return self->mOAXWordProcessingMLNamespace;
}

- (void)setOAXWordProcessingMLNamespace:(id)a3
{
}

- (CXNamespace)OAXDrawing2010Namespace
{
  return self->mOAXDrawing2010Namespace;
}

- (void)setOAXDrawing2010Namespace:(id)a3
{
}

- (CXNamespace)OAXChart2012Namespace
{
  return self->mOAXChart2012Namespace;
}

- (void)setOAXChart2012Namespace:(id)a3
{
}

- (CXNamespace)OAXMathNamespace
{
  return self->mOAXMathNamespace;
}

- (void)setOAXMathNamespace:(id)a3
{
}

- (id)clientChartGraphicPropertyDefaultsBlock
{
  return self->_clientChartGraphicPropertyDefaultsBlock;
}

- (void)setClientChartGraphicPropertyDefaultsBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientChartGraphicPropertyDefaultsBlock, 0);
  objc_destroyWeak(&self->mDocumentState);
  objc_storeStrong((id *)&self->mOAXMathNamespace, 0);
  objc_storeStrong((id *)&self->mOAXChart2012Namespace, 0);
  objc_storeStrong((id *)&self->mOAXDrawing2010Namespace, 0);
  objc_storeStrong((id *)&self->mOAXWordProcessingMLNamespace, 0);
  objc_storeStrong((id *)&self->mOAXTableNamespace, 0);
  objc_storeStrong((id *)&self->mOAXPictureNamespace, 0);
  objc_storeStrong((id *)&self->mOAXLockedCanvasNamespace, 0);
  objc_storeStrong((id *)&self->mOAXCompatNamespace, 0);
  objc_storeStrong((id *)&self->mOAXChartDrawingNamespace, 0);
  objc_storeStrong((id *)&self->mOAXChartNamespace, 0);
  objc_storeStrong((id *)&self->mOAXMainNamespace, 0);
  objc_storeStrong((id *)&self->mGroupStack, 0);
  objc_storeStrong((id *)&self->mFontScheme, 0);
  objc_storeStrong((id *)&self->mColorMap, 0);
  objc_storeStrong((id *)&self->mColorScheme, 0);
  objc_storeStrong((id *)&self->mOavState, 0);
  objc_storeStrong((id *)&self->mSrcURLToTgtBulletBlipIndexMap, 0);
  objc_storeStrong((id *)&self->mTgtBulletBlips, 0);
  objc_storeStrong((id *)&self->mSrcURLToTgtBlipIndexMap, 0);
  objc_storeStrong((id *)&self->mTgtBlipCollection, 0);
  objc_storeStrong((id *)&self->mDrawableIdToVmlShapeIdMap, 0);
  objc_storeStrong((id *)&self->mShapeIdMap, 0);
  objc_storeStrong((id *)&self->mTableStyleCache, 0);
  objc_storeStrong((id *)&self->mStyleMatrix, 0);
  objc_storeStrong((id *)&self->mPackagePart, 0);
  objc_storeStrong((id *)&self->mClient, 0);
}

@end