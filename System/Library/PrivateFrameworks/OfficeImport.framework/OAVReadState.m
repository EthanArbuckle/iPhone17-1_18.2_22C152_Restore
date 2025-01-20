@interface OAVReadState
- (BOOL)isDualDrawable:(id)a3;
- (Class)client;
- (OAVReadState)initWithClient:(Class)a3 packagePart:(id)a4;
- (OAXDrawingState)oaxState;
- (id)blipRefForURL:(id)a3;
- (id)drawableForVmlShapeId:(id)a3;
- (id)packagePart;
- (unsigned)officeArtShapeIdWithVmlShapeId:(id)a3;
- (unsigned)shapeTypeForId:(id)a3;
- (void)addDualDrawable:(id)a3;
- (void)resetForNewDrawing;
- (void)setDrawable:(id)a3 forVmlShapeId:(id)a4;
- (void)setOaxState:(id)a3;
- (void)setPackagePart:(id)a3;
- (void)setShapeType:(unsigned __int16)a3 forId:(id)a4;
@end

@implementation OAVReadState

- (OAVReadState)initWithClient:(Class)a3 packagePart:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)OAVReadState;
  v8 = [(OCXState *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->mClient = a3;
    objc_storeStrong((id *)&v8->mPackagePart, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mShapeTypes = v9->mShapeTypes;
    v9->mShapeTypes = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mShapeIdMap = v9->mShapeIdMap;
    v9->mShapeIdMap = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mDualDrawables = v9->mDualDrawables;
    v9->mDualDrawables = v14;
  }
  return v9;
}

- (void)resetForNewDrawing
{
  [(NSMutableDictionary *)self->mShapeTypes removeAllObjects];
  [(NSMutableDictionary *)self->mShapeIdMap removeAllObjects];
  [(NSMutableSet *)self->mDualDrawables removeAllObjects];
  [(OAVReadState *)self setPackagePart:0];
}

- (Class)client
{
  return self->mClient;
}

- (id)packagePart
{
  return self->mPackagePart;
}

- (void)setPackagePart:(id)a3
{
}

- (unsigned)shapeTypeForId:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mShapeTypes objectForKey:a3];
  unsigned __int16 v4 = [v3 unsignedShortValue];

  return v4;
}

- (void)setShapeType:(unsigned __int16)a3 forId:(id)a4
{
  uint64_t v4 = a3;
  id v8 = a4;
  mShapeTypes = self->mShapeTypes;
  id v7 = [NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)mShapeTypes setObject:v7 forKey:v8];
}

- (id)drawableForVmlShapeId:(id)a3
{
  uint64_t v4 = [(NSMutableDictionary *)self->mShapeIdMap objectForKey:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mOAXState);
  v6 = objc_msgSend(WeakRetained, "drawableForShapeId:", objc_msgSend(v4, "unsignedLongValue"));

  return v6;
}

- (void)setDrawable:(id)a3 forVmlShapeId:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->mShapeIdMap count] ^ 0x80000000;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mOAXState);
  [WeakRetained setDrawable:v12 forShapeId:v7];

  if (v6)
  {
    v9 = [(NSMutableDictionary *)self->mShapeIdMap objectForKeyedSubscript:v6];

    if (!v9)
    {
      uint64_t v10 = [v12 id];
      v11 = [NSNumber numberWithUnsignedInt:v10];
      [(NSMutableDictionary *)self->mShapeIdMap setObject:v11 forKeyedSubscript:v6];
    }
  }
}

- (void)addDualDrawable:(id)a3
{
}

- (BOOL)isDualDrawable:(id)a3
{
  return [(NSMutableSet *)self->mDualDrawables containsObject:a3];
}

- (unsigned)officeArtShapeIdWithVmlShapeId:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mShapeIdMap objectForKey:a3];
  unsigned int v4 = [v3 unsignedLongValue];

  return v4;
}

- (id)blipRefForURL:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mOAXState);
  id v6 = [WeakRetained blipRefForURL:v4];

  return v6;
}

- (OAXDrawingState)oaxState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mOAXState);
  return (OAXDrawingState *)WeakRetained;
}

- (void)setOaxState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mOAXState);
  objc_storeStrong((id *)&self->mDualDrawables, 0);
  objc_storeStrong((id *)&self->mShapeIdMap, 0);
  objc_storeStrong((id *)&self->mShapeTypes, 0);
  objc_storeStrong((id *)&self->mPackagePart, 0);
}

@end