@interface _FTParagraphBatchInfo
- (FTMutableBatchTranslationRequest_Paragraph)requestParagraph;
- (_LTTranslationParagraph)paragraph;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setParagraph:(id)a3;
- (void)setRequestParagraph:(id)a3;
@end

@implementation _FTParagraphBatchInfo

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (_LTTranslationParagraph)paragraph
{
  return self->_paragraph;
}

- (void)setParagraph:(id)a3
{
}

- (FTMutableBatchTranslationRequest_Paragraph)requestParagraph
{
  return self->_requestParagraph;
}

- (void)setRequestParagraph:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParagraph, 0);
  objc_storeStrong((id *)&self->_paragraph, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end