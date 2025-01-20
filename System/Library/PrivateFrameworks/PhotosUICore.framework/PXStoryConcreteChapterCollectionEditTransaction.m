@interface PXStoryConcreteChapterCollectionEditTransaction
- (NSArray)edits;
- (PXStoryChapterCollection)originalChapterCollection;
- (PXStoryConcreteChapterCollectionEditTransaction)init;
- (PXStoryConcreteChapterCollectionEditTransaction)initWithOriginalChapterCollection:(id)a3 edits:(id)a4;
@end

@implementation PXStoryConcreteChapterCollectionEditTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edits, 0);
  objc_storeStrong((id *)&self->_originalChapterCollection, 0);
}

- (NSArray)edits
{
  return self->_edits;
}

- (PXStoryChapterCollection)originalChapterCollection
{
  return self->_originalChapterCollection;
}

- (PXStoryConcreteChapterCollectionEditTransaction)initWithOriginalChapterCollection:(id)a3 edits:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryConcreteChapterCollectionEditTransaction;
  v9 = [(PXStoryConcreteChapterCollectionEditTransaction *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalChapterCollection, a3);
    uint64_t v11 = [v8 copy];
    edits = v10->_edits;
    v10->_edits = (NSArray *)v11;
  }
  return v10;
}

- (PXStoryConcreteChapterCollectionEditTransaction)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryChapterCollectionEdit.m", 105, @"%s is not available as initializer", "-[PXStoryConcreteChapterCollectionEditTransaction init]");

  abort();
}

@end