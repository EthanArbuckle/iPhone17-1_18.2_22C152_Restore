@interface PFAISearchRefTextState
- (BOOL)isCancelled;
- (PFAIOperationLoadDelegate)loadDelegate;
- (PFAISearchRefTextState)initWithEntry:(id)a3 searchArray:(id)a4 inArchive:(id)a5 documentRoot:(id)a6;
- (THDocumentRoot)thDocumentRoot;
- (id)addRefText:(id)a3 forRID:(id)a4;
- (id)currentRID;
- (id)incrementFromRID:(id)a3;
- (id)refTextForRIDs;
- (void)dealloc;
- (void)setLoadDelegate:(id)a3;
- (void)switchReadToGetCfi;
@end

@implementation PFAISearchRefTextState

- (PFAISearchRefTextState)initWithEntry:(id)a3 searchArray:(id)a4 inArchive:(id)a5 documentRoot:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PFAISearchRefTextState;
  v8 = [(PFXXmlStreamReaderState *)&v11 initWithEntry:a3 inArchive:a5];
  v9 = v8;
  if (v8)
  {
    v8->mDocumentRoot = (THDocumentRoot *)a6;
    v8->mRIDs = (NSArray *)[a4 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    v9->mRefTextForRID = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](v9->mRIDs, "count")];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAISearchRefTextState;
  [(PFXXmlStreamReaderState *)&v3 dealloc];
}

- (id)currentRID
{
  unint64_t mCurrentRIDIndex = self->mCurrentRIDIndex;
  if (mCurrentRIDIndex >= [(NSArray *)self->mRIDs count]) {
    return 0;
  }
  mRIDs = self->mRIDs;
  unint64_t v5 = self->mCurrentRIDIndex;

  return [(NSArray *)mRIDs objectAtIndex:v5];
}

- (id)incrementFromRID:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", -[PFAISearchRefTextState currentRID](self, "currentRID"))) {
    ++self->mCurrentRIDIndex;
  }

  return [(PFAISearchRefTextState *)self currentRID];
}

- (id)addRefText:(id)a3 forRID:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mRefTextForRID, "setObject:forKey:", a3);

  return [(PFAISearchRefTextState *)self incrementFromRID:a4];
}

- (id)refTextForRIDs
{
  return self->mRefTextForRID;
}

- (void)switchReadToGetCfi
{
  self->unint64_t mCurrentRIDIndex = 0;
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