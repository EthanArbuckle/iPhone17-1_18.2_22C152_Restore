@interface CRLPdfTaggerTextStorageChunkContext
- (CRLPdfTaggerTextStorageChunkContext)initWithStateOfTagger:(id)a3 textStorageChunk:(id)a4 limitSelection:(id)a5;
- (CRLWPRep)textStorageChunk;
@end

@implementation CRLPdfTaggerTextStorageChunkContext

- (CRLPdfTaggerTextStorageChunkContext)initWithStateOfTagger:(id)a3 textStorageChunk:(id)a4 limitSelection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 columns];
  v12 = [v9 storage];
  v15.receiver = self;
  v15.super_class = (Class)CRLPdfTaggerTextStorageChunkContext;
  v13 = [(CRLPdfTaggerTextColumnOwnerContext *)&v15 initWithStateOfTagger:v8 columns:v11 storage:v12 limitSelection:v10];

  if (v13) {
    objc_storeStrong((id *)&v13->_textStorageChunk, a4);
  }

  return v13;
}

- (CRLWPRep)textStorageChunk
{
  return self->_textStorageChunk;
}

- (void).cxx_destruct
{
}

@end