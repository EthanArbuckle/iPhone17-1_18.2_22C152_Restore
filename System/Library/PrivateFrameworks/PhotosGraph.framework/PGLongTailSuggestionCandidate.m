@interface PGLongTailSuggestionCandidate
- (BOOL)isValidBeforeKeyItemFilterWithMeNodeLocalIdentifier:(id)a3;
- (BOOL)isValidWithMeNodeLocalIdentifier:(id)a3;
- (PGLongTailSuggestionCandidate)initWithAsset:(id)a3 score:(unint64_t)a4;
- (PHAsset)asset;
- (unint64_t)score;
@end

@implementation PGLongTailSuggestionCandidate

- (void).cxx_destruct
{
}

- (unint64_t)score
{
  return self->_score;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (BOOL)isValidBeforeKeyItemFilterWithMeNodeLocalIdentifier:(id)a3
{
  id v4 = a3;
  if (([(PHAsset *)self->_asset clsIsNonMemorable] & 1) != 0
    || ![MEMORY[0x1E4F8E7A8] assetIsSafeForWidgetDisplay:self->_asset]
    || ([(PHAsset *)self->_asset clsIsTragicFailure] & 1) != 0
    || ([(PHAsset *)self->_asset clsIsUtility] & 1) != 0
    || ([(PHAsset *)self->_asset aspectRatio], v5 >= 3.0))
  {
    BOOL v7 = 0;
  }
  else
  {
    [(PHAsset *)self->_asset aspectRatio];
    BOOL v7 = v6 > 0.333333343;
  }
  uint64_t v8 = [(PHAsset *)self->_asset clsPeopleCount];
  if (v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v7;
  }
  if (v8) {
    BOOL v10 = !v7;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    v11 = [(PHAsset *)self->_asset clsConsolidatedPersonLocalIdentifiers];
    BOOL v9 = [v11 count] != 0;
  }
  if (v4)
  {
    uint64_t v12 = [(PHAsset *)self->_asset clsPeopleCount];
    LOBYTE(v13) = v12 != 1 && v9;
    if (v12 == 1 && v9)
    {
      v14 = [(PHAsset *)self->_asset clsPersonLocalIdentifiers];
      v15 = [v14 firstObject];
      int v13 = [v15 isEqualToString:v4] ^ 1;
    }
  }
  else
  {
    LOBYTE(v13) = v9;
  }

  return v13;
}

- (BOOL)isValidWithMeNodeLocalIdentifier:(id)a3
{
  int v4 = [(PGLongTailSuggestionCandidate *)self isValidBeforeKeyItemFilterWithMeNodeLocalIdentifier:a3];
  if (v4) {
    LOBYTE(v4) = [(PHAsset *)self->_asset clsAvoidIfPossibleAsKeyItemForMemories:0 allowGuestAsset:0] ^ 1;
  }
  return v4;
}

- (PGLongTailSuggestionCandidate)initWithAsset:(id)a3 score:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGLongTailSuggestionCandidate;
  uint64_t v8 = [(PGLongTailSuggestionCandidate *)&v11 init];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_asset, a3);
    v9->_score = a4;
  }

  return v9;
}

@end