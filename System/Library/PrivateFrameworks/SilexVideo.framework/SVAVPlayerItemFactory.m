@interface SVAVPlayerItemFactory
- (NSArray)automaticallyLoadedAssetKeys;
- (SVAVPlayerItemFactory)initWithAutomaticallyLoadedAssetKeys:(id)a3 assetFactory:(id)a4 preferredForwardBufferDuration:(double)a5;
- (SVAVURLAssetFactory)assetFactory;
- (double)preferredForwardBufferDuration;
- (id)createPlayerItemWithURL:(id)a3;
@end

@implementation SVAVPlayerItemFactory

- (SVAVPlayerItemFactory)initWithAutomaticallyLoadedAssetKeys:(id)a3 assetFactory:(id)a4 preferredForwardBufferDuration:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVAVPlayerItemFactory;
  v10 = [(SVAVPlayerItemFactory *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    automaticallyLoadedAssetKeys = v10->_automaticallyLoadedAssetKeys;
    v10->_automaticallyLoadedAssetKeys = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_assetFactory, a4);
    v10->_preferredForwardBufferDuration = a5;
  }

  return v10;
}

- (id)createPlayerItemWithURL:(id)a3
{
  id v4 = a3;
  v5 = [(SVAVPlayerItemFactory *)self assetFactory];
  v6 = [v5 createURLAssetWithURL:v4];

  v7 = (void *)MEMORY[0x263EFA800];
  id v8 = [(SVAVPlayerItemFactory *)self automaticallyLoadedAssetKeys];
  id v9 = [v7 playerItemWithAsset:v6 automaticallyLoadedAssetKeys:v8];

  [(SVAVPlayerItemFactory *)self preferredForwardBufferDuration];
  objc_msgSend(v9, "setPreferredForwardBufferDuration:");

  return v9;
}

- (NSArray)automaticallyLoadedAssetKeys
{
  return self->_automaticallyLoadedAssetKeys;
}

- (SVAVURLAssetFactory)assetFactory
{
  return self->_assetFactory;
}

- (double)preferredForwardBufferDuration
{
  return self->_preferredForwardBufferDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFactory, 0);

  objc_storeStrong((id *)&self->_automaticallyLoadedAssetKeys, 0);
}

@end