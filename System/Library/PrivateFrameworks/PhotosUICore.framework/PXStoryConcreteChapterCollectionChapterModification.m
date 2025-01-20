@interface PXStoryConcreteChapterCollectionChapterModification
- (NSCopying)editedChapterIdentifier;
- (PXStoryConcreteChapterCollectionChapterModification)init;
- (PXStoryConcreteChapterCollectionChapterModification)initWithEditedChapterIdentifier:(id)a3 chapterChangeRequest:(id)a4;
- (id)chapterChangeRequest;
- (int64_t)kind;
@end

@implementation PXStoryConcreteChapterCollectionChapterModification

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chapterChangeRequest, 0);
  objc_storeStrong((id *)&self->_editedChapterIdentifier, 0);
}

- (id)chapterChangeRequest
{
  return self->_chapterChangeRequest;
}

- (NSCopying)editedChapterIdentifier
{
  return self->_editedChapterIdentifier;
}

- (int64_t)kind
{
  return 1;
}

- (PXStoryConcreteChapterCollectionChapterModification)initWithEditedChapterIdentifier:(id)a3 chapterChangeRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryConcreteChapterCollectionChapterModification;
  v9 = [(PXStoryConcreteChapterCollectionChapterModification *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_editedChapterIdentifier, a3);
    uint64_t v11 = [v8 copy];
    id chapterChangeRequest = v10->_chapterChangeRequest;
    v10->_id chapterChangeRequest = (id)v11;
  }
  return v10;
}

- (PXStoryConcreteChapterCollectionChapterModification)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryChapterCollectionEdit.m", 17, @"%s is not available as initializer", "-[PXStoryConcreteChapterCollectionChapterModification init]");

  abort();
}

@end