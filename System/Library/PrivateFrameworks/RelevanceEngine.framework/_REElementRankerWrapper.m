@interface _REElementRankerWrapper
- (BOOL)shouldHideElement:(id)a3;
- (OS_dispatch_queue)queue;
- (REMLElementComparator)comparator;
- (id)featureMapGenerator;
- (void)setComparator:(id)a3;
- (void)setFeatureMapGenerator:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _REElementRankerWrapper

- (BOOL)shouldHideElement:(id)a3
{
  id v4 = a3;
  v5 = v4;
  BOOL v6 = 0;
  if (v4 && self->_featureMapGenerator)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45___REElementRankerWrapper_shouldHideElement___block_invoke;
    block[3] = &unk_2644BCAD8;
    block[4] = self;
    id v10 = v4;
    v11 = &v12;
    dispatch_sync(queue, block);
    BOOL v6 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (id)featureMapGenerator
{
  return self->_featureMapGenerator;
}

- (void)setFeatureMapGenerator:(id)a3
{
}

- (REMLElementComparator)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_comparator, 0);
  objc_storeStrong(&self->_featureMapGenerator, 0);
}

@end