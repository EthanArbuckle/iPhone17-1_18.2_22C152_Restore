@interface PFAISearchIndexState
- (BOOL)isCancelled;
- (PFAIOperationLoadDelegate)loadDelegate;
- (PFAISearchIndex)index;
- (PFAISearchIndexState)initWithEntry:(id)a3 inArchive:(id)a4 documentRoot:(id)a5;
- (THDocumentRoot)thDocumentRoot;
- (void)dealloc;
- (void)setIndex:(id)a3;
- (void)setLoadDelegate:(id)a3;
@end

@implementation PFAISearchIndexState

- (PFAISearchIndexState)initWithEntry:(id)a3 inArchive:(id)a4 documentRoot:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PFAISearchIndexState;
  result = [(PFXXmlStreamReaderState *)&v7 initWithEntry:a3 inArchive:a4];
  if (result) {
    result->mDocumentRoot = (THDocumentRoot *)a5;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAISearchIndexState;
  [(PFXXmlStreamReaderState *)&v3 dealloc];
}

- (THDocumentRoot)thDocumentRoot
{
  return self->mDocumentRoot;
}

- (PFAIOperationLoadDelegate)loadDelegate
{
  return self->mLoadDelegate;
}

- (void)setLoadDelegate:(id)a3
{
  self->mLoadDelegate = (PFAIOperationLoadDelegate *)a3;
}

- (PFAISearchIndex)index
{
  return self->mIndex;
}

- (void)setIndex:(id)a3
{
}

- (BOOL)isCancelled
{
  if (self->mWasCancelled) {
    BOOL result = 1;
  }
  else {
    BOOL result = [(PFAIOperationLoadDelegate *)self->mLoadDelegate operationShouldCancelLoad];
  }
  self->mWasCancelled = result;
  return result;
}

@end