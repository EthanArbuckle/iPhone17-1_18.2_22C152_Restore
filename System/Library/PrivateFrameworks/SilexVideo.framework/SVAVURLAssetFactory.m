@interface SVAVURLAssetFactory
- (NSDictionary)options;
- (SVAVURLAssetFactory)initWithOptions:(id)a3;
- (id)createURLAssetWithURL:(id)a3;
@end

@implementation SVAVURLAssetFactory

- (SVAVURLAssetFactory)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVAVURLAssetFactory;
  v5 = [(SVAVURLAssetFactory *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    options = v5->_options;
    v5->_options = (NSDictionary *)v6;
  }
  return v5;
}

- (id)createURLAssetWithURL:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFA8D0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [(SVAVURLAssetFactory *)self options];
  v8 = (void *)[v6 initWithURL:v5 options:v7];

  return v8;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end