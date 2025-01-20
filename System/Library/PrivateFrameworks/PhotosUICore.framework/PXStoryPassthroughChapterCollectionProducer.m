@interface PXStoryPassthroughChapterCollectionProducer
- (PXStoryChapterCollectionManager)chapterCollectionManager;
- (PXStoryPassthroughChapterCollectionProducer)init;
- (PXStoryPassthroughChapterCollectionProducer)initWithChapterCollectionManager:(id)a3;
- (id)requestChapterCollectionForKeyAsset:(id)a3 curatedAssets:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6;
@end

@implementation PXStoryPassthroughChapterCollectionProducer

- (void).cxx_destruct
{
}

- (PXStoryChapterCollectionManager)chapterCollectionManager
{
  return self->_chapterCollectionManager;
}

- (id)requestChapterCollectionForKeyAsset:(id)a3 curatedAssets:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6
{
  id v8 = a6;
  v9 = [PXStoryProducerResult alloc];
  v10 = [(PXStoryPassthroughChapterCollectionProducer *)self chapterCollectionManager];
  v11 = [(PXStoryProducerResult *)v9 initWithObject:v10];
  (*((void (**)(id, PXStoryProducerResult *))a6 + 2))(v8, v11);

  return 0;
}

- (PXStoryPassthroughChapterCollectionProducer)initWithChapterCollectionManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughChapterCollectionProducer;
  v6 = [(PXStoryPassthroughChapterCollectionProducer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_chapterCollectionManager, a3);
  }

  return v7;
}

- (PXStoryPassthroughChapterCollectionProducer)init
{
  return [(PXStoryPassthroughChapterCollectionProducer *)self initWithChapterCollectionManager:0];
}

@end