@interface TITokenizationRevision
- (NSMutableArray)branchTokens;
- (TITokenizationRevision)init;
- (TITokenizationRevision)initWithTokenIterator:(_TIRevisionHistoryTokenIterator)a3;
- (_NSRange)originalSelectedTokenRange;
- (_TIRevisionHistoryTokenIterator)originalIterator;
- (unint64_t)branchedTokenIndex;
- (unint64_t)mergedTokenIndex;
- (unint64_t)revisedDocumentLocation;
- (void)setBranchedTokenIndex:(unint64_t)a3;
- (void)setMergedTokenIndex:(unint64_t)a3;
- (void)setOriginalIterator:(_TIRevisionHistoryTokenIterator)a3;
- (void)setOriginalSelectedTokenRange:(_NSRange)a3;
- (void)setRevisedDocumentLocation:(unint64_t)a3;
@end

@implementation TITokenizationRevision

- (void).cxx_destruct
{
}

- (NSMutableArray)branchTokens
{
  return self->_branchTokens;
}

- (void)setMergedTokenIndex:(unint64_t)a3
{
  self->_mergedTokenIndex = a3;
}

- (unint64_t)mergedTokenIndex
{
  return self->_mergedTokenIndex;
}

- (void)setBranchedTokenIndex:(unint64_t)a3
{
  self->_branchedTokenIndex = a3;
}

- (unint64_t)branchedTokenIndex
{
  return self->_branchedTokenIndex;
}

- (void)setRevisedDocumentLocation:(unint64_t)a3
{
  self->_revisedDocumentLocation = a3;
}

- (unint64_t)revisedDocumentLocation
{
  return self->_revisedDocumentLocation;
}

- (void)setOriginalIterator:(_TIRevisionHistoryTokenIterator)a3
{
  self->_originalIterator = a3;
}

- (_TIRevisionHistoryTokenIterator)originalIterator
{
  unint64_t documentLocation = self->_originalIterator.documentLocation;
  unint64_t tokenIndex = self->_originalIterator.tokenIndex;
  result.unint64_t documentLocation = documentLocation;
  result.unint64_t tokenIndex = tokenIndex;
  return result;
}

- (void)setOriginalSelectedTokenRange:(_NSRange)a3
{
  self->_originalSelectedTokenRange = a3;
}

- (_NSRange)originalSelectedTokenRange
{
  NSUInteger length = self->_originalSelectedTokenRange.length;
  NSUInteger location = self->_originalSelectedTokenRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (TITokenizationRevision)initWithTokenIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t documentLocation = a3.documentLocation;
  unint64_t tokenIndex = a3.tokenIndex;
  v10.receiver = self;
  v10.super_class = (Class)TITokenizationRevision;
  v5 = [(TITokenizationRevision *)&v10 init];
  v6 = (TITokenizationRevision *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 40) = xmmword_1E4154B50;
    *((void *)v5 + 7) = tokenIndex;
    *((void *)v5 + 8) = documentLocation;
    *((void *)v5 + 1) = documentLocation;
    *((int64x2_t *)v5 + 1) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    branchTokens = v6->_branchTokens;
    v6->_branchTokens = v7;
  }
  return v6;
}

- (TITokenizationRevision)init
{
  return -[TITokenizationRevision initWithTokenIterator:](self, "initWithTokenIterator:", 0, 0);
}

@end