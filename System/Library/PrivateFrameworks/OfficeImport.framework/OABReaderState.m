@interface OABReaderState
- (BOOL)isInsideGroup;
- (BOOL)useXmlBlobs;
- (Class)client;
- (ESDContainer)bstoreContainerHolder;
- (OABReaderState)init;
- (OABReaderState)initWithClient:(Class)a3;
- (id)colorPalette;
- (id)contentObjectForId:(int)a3;
- (id)drawableForShapeId:(int)a3;
- (id)groupStackReference;
- (id)peekGroup;
- (id)popGroup;
- (id)xmlDrawingState;
- (int)groupDepth;
- (void)pushGroup:(id)a3;
- (void)setBstoreContainerHolder:(id)a3;
- (void)setColorPalette:(id)a3;
- (void)setContentObject:(id)a3 forId:(int)a4;
- (void)setDrawable:(id)a3 forShapeId:(unsigned int)a4;
@end

@implementation OABReaderState

- (OABReaderState)initWithClient:(Class)a3
{
  v13.receiver = self;
  v13.super_class = (Class)OABReaderState;
  v4 = [(OABReaderState *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->mClient = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mShapeIdMap = v5->mShapeIdMap;
    v5->mShapeIdMap = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mEshContentIdMap = v5->mEshContentIdMap;
    v5->mEshContentIdMap = v8;

    uint64_t v10 = objc_opt_new();
    mGroupStack = v5->mGroupStack;
    v5->mGroupStack = (NSMutableArray *)v10;
  }
  return v5;
}

- (id)colorPalette
{
  return self->mColorPalette;
}

- (Class)client
{
  return self->mClient;
}

- (void)setDrawable:(id)a3 forShapeId:(unsigned int)a4
{
  id v8 = a3;
  mShapeIdMap = self->mShapeIdMap;
  v7 = [NSNumber numberWithUnsignedLong:a4];
  [(NSMutableDictionary *)mShapeIdMap setObject:v8 forKey:v7];
}

- (id)drawableForShapeId:(int)a3
{
  mShapeIdMap = self->mShapeIdMap;
  v4 = [NSNumber numberWithInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)mShapeIdMap objectForKey:v4];

  return v5;
}

- (void)setColorPalette:(id)a3
{
}

- (OABReaderState)init
{
  return 0;
}

- (id)contentObjectForId:(int)a3
{
  mEshContentIdMap = self->mEshContentIdMap;
  v4 = [NSNumber numberWithInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)mEshContentIdMap objectForKey:v4];

  return v5;
}

- (void)setContentObject:(id)a3 forId:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  mEshContentIdMap = self->mEshContentIdMap;
  v7 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)mEshContentIdMap setObject:v8 forKey:v7];
}

- (int)groupDepth
{
  return [(NSMutableArray *)self->mGroupStack count];
}

- (id)groupStackReference
{
  return self->mGroupStack;
}

- (void)pushGroup:(id)a3
{
}

- (id)popGroup
{
  v3 = [(OABReaderState *)self peekGroup];
  [(NSMutableArray *)self->mGroupStack removeLastObject];
  return v3;
}

- (id)peekGroup
{
  return (id)[(NSMutableArray *)self->mGroupStack lastObject];
}

- (BOOL)isInsideGroup
{
  return [(NSMutableArray *)self->mGroupStack count] != 0;
}

- (id)xmlDrawingState
{
  return 0;
}

- (BOOL)useXmlBlobs
{
  return 0;
}

- (ESDContainer)bstoreContainerHolder
{
  return self->mBstoreContainerHolder;
}

- (void)setBstoreContainerHolder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBstoreContainerHolder, 0);
  objc_storeStrong((id *)&self->mGroupStack, 0);
  objc_storeStrong((id *)&self->mColorPalette, 0);
  objc_storeStrong((id *)&self->mEshContentIdMap, 0);
  objc_storeStrong((id *)&self->mShapeIdMap, 0);
}

@end