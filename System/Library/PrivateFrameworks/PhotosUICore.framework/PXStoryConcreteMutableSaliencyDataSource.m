@interface PXStoryConcreteMutableSaliencyDataSource
- (PXStoryConcreteMutableSaliencyDataSource)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rawSaliencyAreasForDisplayAsset:(id)a3;
- (id)saliencyAreasForDisplayAsset:(id)a3;
- (void)setSaliencyAreas:(id)a3 rawSaliencyAreas:(id)a4 forDisplayAsset:(id)a5;
@end

@implementation PXStoryConcreteMutableSaliencyDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSaliencyAreasByUUID, 0);
  objc_storeStrong((id *)&self->_saliencyAreasByUUID, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_PXStoryConcreteSaliencyDataSource alloc];
  saliencyAreasByUUID = self->_saliencyAreasByUUID;
  rawSaliencyAreasByUUID = self->_rawSaliencyAreasByUUID;
  return [(_PXStoryConcreteSaliencyDataSource *)v4 initWithSaliencyAreasByUUID:saliencyAreasByUUID rawSaliencyAreasByUUID:rawSaliencyAreasByUUID];
}

- (id)rawSaliencyAreasForDisplayAsset:(id)a3
{
  rawSaliencyAreasByUUID = self->_rawSaliencyAreasByUUID;
  v4 = [a3 uuid];
  v5 = [(NSMutableDictionary *)rawSaliencyAreasByUUID objectForKeyedSubscript:v4];

  return v5;
}

- (id)saliencyAreasForDisplayAsset:(id)a3
{
  saliencyAreasByUUID = self->_saliencyAreasByUUID;
  v4 = [a3 uuid];
  v5 = [(NSMutableDictionary *)saliencyAreasByUUID objectForKeyedSubscript:v4];

  return v5;
}

- (void)setSaliencyAreas:(id)a3 rawSaliencyAreas:(id)a4 forDisplayAsset:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v12 = [a5 uuid];
  v10 = (void *)[v9 copy];

  [(NSMutableDictionary *)self->_saliencyAreasByUUID setObject:v10 forKeyedSubscript:v12];
  v11 = (void *)[v8 copy];

  [(NSMutableDictionary *)self->_rawSaliencyAreasByUUID setObject:v11 forKeyedSubscript:v12];
}

- (PXStoryConcreteMutableSaliencyDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryConcreteMutableSaliencyDataSource;
  v2 = [(PXStoryConcreteMutableSaliencyDataSource *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    saliencyAreasByUUID = v2->_saliencyAreasByUUID;
    v2->_saliencyAreasByUUID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    rawSaliencyAreasByUUID = v2->_rawSaliencyAreasByUUID;
    v2->_rawSaliencyAreasByUUID = v5;
  }
  return v2;
}

@end