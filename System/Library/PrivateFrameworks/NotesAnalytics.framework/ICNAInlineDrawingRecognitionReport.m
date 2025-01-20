@interface ICNAInlineDrawingRecognitionReport
- (ICASAccountData)accountData;
- (ICASDrawingRecognitionData)drawingRecognitionData;
- (ICASNoteAccessData)noteAccessData;
- (ICASNoteData)noteData;
- (void)setAccountData:(id)a3;
- (void)setDrawingRecognitionData:(id)a3;
- (void)setNoteAccessData:(id)a3;
- (void)setNoteData:(id)a3;
@end

@implementation ICNAInlineDrawingRecognitionReport

- (ICASNoteData)noteData
{
  return self->_noteData;
}

- (void)setNoteData:(id)a3
{
}

- (ICASNoteAccessData)noteAccessData
{
  return self->_noteAccessData;
}

- (void)setNoteAccessData:(id)a3
{
}

- (ICASAccountData)accountData
{
  return self->_accountData;
}

- (void)setAccountData:(id)a3
{
}

- (ICASDrawingRecognitionData)drawingRecognitionData
{
  return self->_drawingRecognitionData;
}

- (void)setDrawingRecognitionData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingRecognitionData, 0);
  objc_storeStrong((id *)&self->_accountData, 0);
  objc_storeStrong((id *)&self->_noteAccessData, 0);
  objc_storeStrong((id *)&self->_noteData, 0);
}

@end