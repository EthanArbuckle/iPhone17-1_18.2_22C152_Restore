@interface SPSentencePieceModel
- (BOOL)isByte:(int64_t)a3;
- (SPSentencePieceModel)initWithModelPath:(id)a3;
- (SPSentencePieceModel)initWithModelPath:(id)a3 error:(id *)a4;
- (SPSentencePieceModel)initWithModelURL:(id)a3 error:(id *)a4;
- (id)decodeAsTextFromIDs:(id)a3 error:(id *)a4;
- (id)decodeAsTextFromTokens:(id)a3 error:(id *)a4;
- (id)decodeFromIDs:(id)a3;
- (id)decodeFromIDs:(id)a3 error:(id *)a4;
- (id)decodeFromTokens:(id)a3;
- (id)decodeFromTokens:(id)a3 error:(id *)a4;
- (id)encodeAsIDsFrom:(id)a3;
- (id)encodeAsIDsFrom:(id)a3 error:(id *)a4;
- (id)encodeAsIDsFromText:(id)a3 error:(id *)a4;
- (id)encodeAsTokensFrom:(id)a3;
- (id)encodeAsTokensFrom:(id)a3 error:(id *)a4;
- (id)encodeAsTokensFromText:(id)a3 error:(id *)a4;
- (id)pieceFrom:(int64_t)a3;
- (id)pieces;
- (int64_t)idFrom:(id)a3;
- (int64_t)longestPieceLength;
- (int64_t)pieceSize;
- (void)dealloc;
- (void)enumerateEntriesForPredictiveSearch:(id)a3 shouldMatchAfterDecoding:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateEntriesForPredictiveSearch:(id)a3 usingBlock:(id)a4;
- (void)enumerateEntriesWithCommonPrefix:(id)a3 shouldMatchAfterDecoding:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateEntriesWithCommonPrefix:(id)a3 usingBlock:(id)a4;
@end

@implementation SPSentencePieceModel

- (SPSentencePieceModel)initWithModelURL:(id)a3 error:(id *)a4
{
  v6 = (utils *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SPSentencePieceModel;
  v7 = [(SPSentencePieceModel *)&v12 init];
  if (!v7) {
    goto LABEL_5;
  }
  id v11 = 0;
  uint64_t processor = SPSentencePieceProcessorCreate(v6, (const __CFURL *)&v11);
  v7->_uint64_t processor = (__SPSentencePieceProcessorWrapper *)processor;
  if (a4)
  {
    *a4 = v11;
    uint64_t processor = (uint64_t)v7->_processor;
  }
  if (!processor) {
    v9 = 0;
  }
  else {
LABEL_5:
  }
    v9 = v7;

  return v9;
}

- (SPSentencePieceModel)initWithModelPath:(id)a3 error:(id *)a4
{
  v6 = [NSURL URLWithString:a3];
  v7 = [(SPSentencePieceModel *)self initWithModelURL:v6 error:a4];

  return v7;
}

- (SPSentencePieceModel)initWithModelPath:(id)a3
{
  v4 = [NSURL URLWithString:a3];
  v5 = [(SPSentencePieceModel *)self initWithModelURL:v4 error:0];

  return v5;
}

- (void)dealloc
{
  uint64_t processor = self->_processor;
  if (processor) {
    CFRelease(processor);
  }
  v4.receiver = self;
  v4.super_class = (Class)SPSentencePieceModel;
  [(SPSentencePieceModel *)&v4 dealloc];
}

- (id)encodeAsIDsFromText:(id)a3 error:(id *)a4
{
  id v7 = 0;
  EncodedIDs = SPSentencePieceProcessorCreateEncodedIDs((uint64_t)self->_processor, (const __CFString *)a3, (CFErrorRef *)&v7);
  if (a4) {
    *a4 = v7;
  }
  return EncodedIDs;
}

- (id)encodeAsIDsFrom:(id)a3 error:(id *)a4
{
  objc_super v4 = [(SPSentencePieceModel *)self encodeAsIDsFromText:a3 error:a4];
  v5 = v4;
  if (!v4) {
    objc_super v4 = (void *)MEMORY[0x263EFFA68];
  }
  id v6 = v4;

  return v6;
}

- (id)encodeAsIDsFrom:(id)a3
{
  v3 = [(SPSentencePieceModel *)self encodeAsIDsFromText:a3 error:0];
  objc_super v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v3;

  return v5;
}

- (id)encodeAsTokensFromText:(id)a3 error:(id *)a4
{
  id v7 = 0;
  EncodedPieces = SPSentencePieceProcessorCreateEncodedPieces((uint64_t)self->_processor, (const __CFString *)a3, (CFErrorRef *)&v7);
  if (a4) {
    *a4 = v7;
  }
  return EncodedPieces;
}

- (id)encodeAsTokensFrom:(id)a3 error:(id *)a4
{
  objc_super v4 = [(SPSentencePieceModel *)self encodeAsTokensFromText:a3 error:a4];
  id v5 = v4;
  if (!v4) {
    objc_super v4 = (void *)MEMORY[0x263EFFA68];
  }
  id v6 = v4;

  return v6;
}

- (id)encodeAsTokensFrom:(id)a3
{
  v3 = [(SPSentencePieceModel *)self encodeAsTokensFromText:a3 error:0];
  objc_super v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v3;

  return v5;
}

- (id)decodeAsTextFromTokens:(id)a3 error:(id *)a4
{
  id v7 = 0;
  DecodedStringFromPieces = (__CFString *)SPSentencePieceProcessorCreateDecodedStringFromPieces((uint64_t)self->_processor, (utils *)a3, (CFErrorRef *)&v7);
  if (a4) {
    *a4 = v7;
  }
  return DecodedStringFromPieces;
}

- (id)decodeFromTokens:(id)a3 error:(id *)a4
{
  objc_super v4 = [(SPSentencePieceModel *)self decodeAsTextFromTokens:a3 error:a4];
  id v5 = v4;
  if (!v4) {
    objc_super v4 = &stru_27098C7D0;
  }
  id v6 = v4;

  return v6;
}

- (id)decodeFromTokens:(id)a3
{
  v3 = [(SPSentencePieceModel *)self decodeAsTextFromTokens:a3 error:0];
  objc_super v4 = v3;
  if (!v3) {
    v3 = &stru_27098C7D0;
  }
  id v5 = v3;

  return v5;
}

- (id)decodeAsTextFromIDs:(id)a3 error:(id *)a4
{
  id v7 = 0;
  DecodedStringFromIDs = (__CFString *)SPSentencePieceProcessorCreateDecodedStringFromIDs((uint64_t)self->_processor, (utils *)a3, (CFErrorRef *)&v7);
  if (a4) {
    *a4 = v7;
  }
  return DecodedStringFromIDs;
}

- (id)decodeFromIDs:(id)a3 error:(id *)a4
{
  objc_super v4 = [(SPSentencePieceModel *)self decodeAsTextFromIDs:a3 error:a4];
  id v5 = v4;
  if (!v4) {
    objc_super v4 = &stru_27098C7D0;
  }
  id v6 = v4;

  return v6;
}

- (id)decodeFromIDs:(id)a3
{
  v3 = [(SPSentencePieceModel *)self decodeAsTextFromIDs:a3 error:0];
  objc_super v4 = v3;
  if (!v3) {
    v3 = &stru_27098C7D0;
  }
  id v5 = v3;

  return v5;
}

- (id)pieces
{
  Pieces = SPSentencePieceProcessorCreatePieces((uint64_t)self->_processor);
  return Pieces;
}

- (int64_t)pieceSize
{
  return SPSentencePieceProcessorGetPieceSize((uint64_t)self->_processor);
}

- (int64_t)idFrom:(id)a3
{
  return SPSentencePieceProcessorGetIdFromPiece((uint64_t)self->_processor, (const __CFString *)a3);
}

- (id)pieceFrom:(int64_t)a3
{
  PieceFromId = (__CFString *)SPSentencePieceProcessorCreatePieceFromId((CFStringRef)self->_processor);
  return PieceFromId;
}

- (BOOL)isByte:(int64_t)a3
{
  return SPSentencePieceProcessorIsByte((uint64_t)self->_processor);
}

- (int64_t)longestPieceLength
{
  return SPSentencePieceProcessorGetLongestPieceLength((uint64_t)self->_processor);
}

- (void)enumerateEntriesWithCommonPrefix:(id)a3 shouldMatchAfterDecoding:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t processor = self->_processor;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __93__SPSentencePieceModel_enumerateEntriesWithCommonPrefix_shouldMatchAfterDecoding_usingBlock___block_invoke;
  v11[3] = &unk_2654AE4B8;
  id v12 = v8;
  id v10 = v8;
  SPSentencePieceProcessorEnumerateEntriesWithCommonPrefix((uint64_t)processor, (const __CFString *)a3, v5, (uint64_t)v11);
}

uint64_t __93__SPSentencePieceModel_enumerateEntriesWithCommonPrefix_shouldMatchAfterDecoding_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateEntriesWithCommonPrefix:(id)a3 usingBlock:(id)a4
{
}

- (void)enumerateEntriesForPredictiveSearch:(id)a3 shouldMatchAfterDecoding:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t processor = self->_processor;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__SPSentencePieceModel_enumerateEntriesForPredictiveSearch_shouldMatchAfterDecoding_usingBlock___block_invoke;
  v11[3] = &unk_2654AE4B8;
  id v12 = v8;
  id v10 = v8;
  SPSentencePieceProcessorEnumerateEntriesForPredictiveSearch((uint64_t)processor, (const __CFString *)a3, v5, (uint64_t)v11);
}

uint64_t __96__SPSentencePieceModel_enumerateEntriesForPredictiveSearch_shouldMatchAfterDecoding_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateEntriesForPredictiveSearch:(id)a3 usingBlock:(id)a4
{
}

@end