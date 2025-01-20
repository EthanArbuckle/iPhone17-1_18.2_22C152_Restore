@interface TIKeyboardInputManagerStickerTask
- (TIWordSearchCandidateResultSet)candidateResultSet;
- (id)stickerCompletionHandler;
- (void)setCandidateResultSet:(id)a3;
- (void)setStickerCompletionHandler:(id)a3;
@end

@implementation TIKeyboardInputManagerStickerTask

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stickerCompletionHandler, 0);

  objc_storeStrong((id *)&self->_candidateResultSet, 0);
}

- (void)setStickerCompletionHandler:(id)a3
{
}

- (id)stickerCompletionHandler
{
  return self->_stickerCompletionHandler;
}

- (void)setCandidateResultSet:(id)a3
{
}

- (TIWordSearchCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

@end