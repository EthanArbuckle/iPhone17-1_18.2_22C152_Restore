@interface PXStoryConcreteAutoEditClipCatalog
- (PXStoryConcreteAutoEditClipCatalog)init;
- (PXStoryConcreteAutoEditClipCatalog)initWithCapacity:(int64_t)a3;
- (id)clipAtIndex:(int64_t)a3;
- (id)clipForDisplayAsset:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)indexOfClipForDisplayAsset:(id)a3;
- (int64_t)numberOfClips;
- (void)enumerateClipsUsingBlock:(id)a3;
@end

@implementation PXStoryConcreteAutoEditClipCatalog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedClips, 0);
  objc_storeStrong((id *)&self->_clipIndicesByAssetUUID, 0);
}

- (int64_t)indexOfClipForDisplayAsset:(id)a3
{
  clipIndicesByAssetUUID = self->_clipIndicesByAssetUUID;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 alternateUUID];
  }
  else {
  v5 = [v4 uuid];
  }

  v6 = [(NSMutableDictionary *)clipIndicesByAssetUUID objectForKeyedSubscript:v5];

  if (v6) {
    int64_t v7 = [v6 integerValue];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)clipAtIndex:(int64_t)a3
{
  return (id)[(NSMutableArray *)self->_orderedClips objectAtIndexedSubscript:a3];
}

- (void)enumerateClipsUsingBlock:(id)a3
{
  id v4 = a3;
  orderedClips = self->_orderedClips;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PXStoryConcreteAutoEditClipCatalog_enumerateClipsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DC5F30;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)orderedClips enumerateObjectsUsingBlock:v7];
}

uint64_t __63__PXStoryConcreteAutoEditClipCatalog_enumerateClipsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)clipForDisplayAsset:(id)a3
{
  clipIndicesByAssetUUID = self->_clipIndicesByAssetUUID;
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    [v5 alternateUUID];
  }
  else {
  id v6 = [v5 uuid];
  }

  int64_t v7 = [(NSMutableDictionary *)clipIndicesByAssetUUID objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_orderedClips, "objectAtIndexedSubscript:", [v7 unsignedIntegerValue]);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfClips
{
  return [(NSMutableArray *)self->_orderedClips count];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = +[PXStoryConcreteMutableAutoEditClipCatalog allocWithZone:](PXStoryConcreteMutableAutoEditClipCatalog, "allocWithZone:");
  uint64_t v6 = [(NSMutableArray *)self->_orderedClips mutableCopyWithZone:a3];
  orderedClips = v5->super._orderedClips;
  v5->super._orderedClips = (NSMutableArray *)v6;

  uint64_t v8 = [(NSMutableDictionary *)self->_clipIndicesByAssetUUID mutableCopyWithZone:a3];
  clipIndicesByAssetUUID = v5->super._clipIndicesByAssetUUID;
  v5->super._clipIndicesByAssetUUID = (NSMutableDictionary *)v8;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[PXStoryConcreteAutoEditClipCatalog allocWithZone:](PXStoryConcreteAutoEditClipCatalog, "allocWithZone:");
  uint64_t v6 = [(NSMutableArray *)self->_orderedClips copyWithZone:a3];
  orderedClips = v5->_orderedClips;
  v5->_orderedClips = (NSMutableArray *)v6;

  uint64_t v8 = [(NSMutableDictionary *)self->_clipIndicesByAssetUUID copyWithZone:a3];
  clipIndicesByAssetUUID = v5->_clipIndicesByAssetUUID;
  v5->_clipIndicesByAssetUUID = (NSMutableDictionary *)v8;

  return v5;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@:%p %lu clips: %@>", objc_opt_class(), self, -[PXStoryConcreteAutoEditClipCatalog numberOfClips](self, "numberOfClips"), self->_orderedClips];
}

- (PXStoryConcreteAutoEditClipCatalog)initWithCapacity:(int64_t)a3
{
  if (a3 < 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXStoryConcreteAutoEditClipCatalog.m", 27, @"Invalid parameter not satisfying: %@", @"capacity >= 0" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PXStoryConcreteAutoEditClipCatalog;
  id v5 = [(PXStoryConcreteAutoEditClipCatalog *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    orderedClips = v5->_orderedClips;
    v5->_orderedClips = (NSMutableArray *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
    clipIndicesByAssetUUID = v5->_clipIndicesByAssetUUID;
    v5->_clipIndicesByAssetUUID = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (PXStoryConcreteAutoEditClipCatalog)init
{
  return [(PXStoryConcreteAutoEditClipCatalog *)self initWithCapacity:0];
}

@end