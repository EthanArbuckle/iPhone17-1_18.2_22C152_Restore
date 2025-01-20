@interface PXStoryConcreteChapterCollectionChapterDeletion
- (NSCopying)deletedChapterIdentifier;
- (PXStoryConcreteChapterCollectionChapterDeletion)init;
- (PXStoryConcreteChapterCollectionChapterDeletion)initWithDeletedChapterIdentifier:(id)a3;
- (int64_t)kind;
@end

@implementation PXStoryConcreteChapterCollectionChapterDeletion

- (void).cxx_destruct
{
}

- (NSCopying)deletedChapterIdentifier
{
  return self->_deletedChapterIdentifier;
}

- (int64_t)kind
{
  return 3;
}

- (PXStoryConcreteChapterCollectionChapterDeletion)initWithDeletedChapterIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryConcreteChapterCollectionChapterDeletion;
  v6 = [(PXStoryConcreteChapterCollectionChapterDeletion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deletedChapterIdentifier, a3);
  }

  return v7;
}

- (PXStoryConcreteChapterCollectionChapterDeletion)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryChapterCollectionEdit.m", 77, @"%s is not available as initializer", "-[PXStoryConcreteChapterCollectionChapterDeletion init]");

  abort();
}

@end