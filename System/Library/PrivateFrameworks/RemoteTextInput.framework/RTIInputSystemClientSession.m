@interface RTIInputSystemClientSession
- (RTIDocumentState)documentState;
- (RTIDocumentTraits)documentTraits;
- (RTISessionOptions)beginOptions;
- (void)setBeginOptions:(id)a3;
- (void)setDocumentState:(id)a3;
- (void)setDocumentTraits:(id)a3;
@end

@implementation RTIInputSystemClientSession

- (RTISessionOptions)beginOptions
{
  return self->_beginOptions;
}

- (void)setBeginOptions:(id)a3
{
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (void)setDocumentTraits:(id)a3
{
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
  objc_storeStrong((id *)&self->_beginOptions, 0);
}

@end