@interface PXStoryConcreteChapterCollectionChapterInsertion
- (PXDisplayAsset)firstAsset;
- (PXStoryConcreteChapterCollectionChapterInsertion)init;
- (PXStoryConcreteChapterCollectionChapterInsertion)initWithFirstAsset:(id)a3 chapterConfiguration:(id)a4;
- (id)chapterConfiguration;
- (int64_t)kind;
@end

@implementation PXStoryConcreteChapterCollectionChapterInsertion

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chapterConfiguration, 0);
  objc_storeStrong((id *)&self->_firstAsset, 0);
}

- (id)chapterConfiguration
{
  return self->_chapterConfiguration;
}

- (PXDisplayAsset)firstAsset
{
  return self->_firstAsset;
}

- (int64_t)kind
{
  return 2;
}

- (PXStoryConcreteChapterCollectionChapterInsertion)initWithFirstAsset:(id)a3 chapterConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryConcreteChapterCollectionChapterInsertion;
  v9 = [(PXStoryConcreteChapterCollectionChapterInsertion *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstAsset, a3);
    uint64_t v11 = [v8 copy];
    id chapterConfiguration = v10->_chapterConfiguration;
    v10->_id chapterConfiguration = (id)v11;
  }
  return v10;
}

- (PXStoryConcreteChapterCollectionChapterInsertion)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryChapterCollectionEdit.m", 47, @"%s is not available as initializer", "-[PXStoryConcreteChapterCollectionChapterInsertion init]");

  abort();
}

@end