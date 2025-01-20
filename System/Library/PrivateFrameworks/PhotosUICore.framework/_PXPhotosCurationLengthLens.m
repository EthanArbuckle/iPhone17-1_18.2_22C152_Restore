@interface _PXPhotosCurationLengthLens
- (BOOL)allowsActionType:(id)a3;
- (BOOL)ignoresTopSafeAreaInset;
- (BOOL)isDefaultCurationLength;
- (BOOL)wantsCuration;
- (_PXPhotosCurationLengthLens)initWithCurationLength:(int64_t)a3 isDefault:(BOOL)a4;
- (int64_t)curationLength;
@end

@implementation _PXPhotosCurationLengthLens

- (BOOL)isDefaultCurationLength
{
  return self->_isDefaultCurationLength;
}

- (int64_t)curationLength
{
  return self->_curationLength;
}

- (BOOL)ignoresTopSafeAreaInset
{
  return 1;
}

- (BOOL)wantsCuration
{
  return 1;
}

- (BOOL)allowsActionType:(id)a3
{
  uint64_t v3 = _PXPhotosViewLensAllowedActionsForCuratedLens_onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_PXPhotosViewLensAllowedActionsForCuratedLens_onceToken, &__block_literal_global_330);
  }
  char v5 = [(id)_PXPhotosViewLensAllowedActionsForCuratedLens_allowedActions containsObject:v4];

  return v5;
}

- (_PXPhotosCurationLengthLens)initWithCurationLength:(int64_t)a3 isDefault:(BOOL)a4
{
  if ((unint64_t)(a3 - 1) >= 5)
  {
    if (!a3)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXPhotosViewLens.m" lineNumber:197 description:@"Creating a lens with undefined curation length is not supported."];

      abort();
    }
  }
  else
  {
    v7 = PXLocalizedStringFromTable(@"PXPhotosGridLensSummary", @"LemonadeLocalizable");
    self = [(PXPhotosViewLens *)self initWithTitle:v7 symbolName:0 defaultSectionBodyStyle:3];
  }
  self->_curationLength = a3;
  self->_isDefaultCurationLength = a4;
  return self;
}

@end