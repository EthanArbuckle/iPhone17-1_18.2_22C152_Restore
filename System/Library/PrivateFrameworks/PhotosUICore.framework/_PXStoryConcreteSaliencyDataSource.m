@interface _PXStoryConcreteSaliencyDataSource
- (_PXStoryConcreteSaliencyDataSource)init;
- (_PXStoryConcreteSaliencyDataSource)initWithSaliencyAreasByUUID:(id)a3 rawSaliencyAreasByUUID:(id)a4;
- (id)rawSaliencyAreasForDisplayAsset:(id)a3;
- (id)saliencyAreasForDisplayAsset:(id)a3;
@end

@implementation _PXStoryConcreteSaliencyDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSaliencyAreasByUUID, 0);
  objc_storeStrong((id *)&self->_saliencyAreasByUUID, 0);
}

- (id)rawSaliencyAreasForDisplayAsset:(id)a3
{
  rawSaliencyAreasByUUID = self->_rawSaliencyAreasByUUID;
  v4 = [a3 uuid];
  v5 = [(NSDictionary *)rawSaliencyAreasByUUID objectForKeyedSubscript:v4];

  return v5;
}

- (id)saliencyAreasForDisplayAsset:(id)a3
{
  saliencyAreasByUUID = self->_saliencyAreasByUUID;
  v4 = [a3 uuid];
  v5 = [(NSDictionary *)saliencyAreasByUUID objectForKeyedSubscript:v4];

  return v5;
}

- (_PXStoryConcreteSaliencyDataSource)initWithSaliencyAreasByUUID:(id)a3 rawSaliencyAreasByUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXStoryConcreteSaliencyDataSource;
  v8 = [(_PXStoryConcreteSaliencyDataSource *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    saliencyAreasByUUID = v8->_saliencyAreasByUUID;
    v8->_saliencyAreasByUUID = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    rawSaliencyAreasByUUID = v8->_rawSaliencyAreasByUUID;
    v8->_rawSaliencyAreasByUUID = (NSDictionary *)v11;
  }
  return v8;
}

- (_PXStoryConcreteSaliencyDataSource)init
{
  return [(_PXStoryConcreteSaliencyDataSource *)self initWithSaliencyAreasByUUID:MEMORY[0x1E4F1CC08] rawSaliencyAreasByUUID:MEMORY[0x1E4F1CC08]];
}

@end