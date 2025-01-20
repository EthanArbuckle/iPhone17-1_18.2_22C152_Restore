@interface PXCuratedLibraryHitTestResult
- (PXAssetCollectionReference)assetCollectionReference;
- (PXAssetReference)assetReference;
- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5;
- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5 assetCollectionReference:(id)a6;
- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5 assetReference:(id)a6;
- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5 assetReference:(id)a6 assetCollectionReference:(id)a7;
- (PXCuratedLibraryHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userData:(id)a6;
- (int64_t)control;
@end

@implementation PXCuratedLibraryHitTestResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (PXAssetReference)assetReference
{
  return self->_assetReference;
}

- (int64_t)control
{
  return self->_control;
}

- (PXCuratedLibraryHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryHitTestResult.m", 38, @"%s is not available as initializer", "-[PXCuratedLibraryHitTestResult initWithSpriteReference:layout:identifier:userData:]");

  abort();
}

- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5 assetReference:(id)a6 assetCollectionReference:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v15 = v14;
  if (v13) {
    v16 = v13;
  }
  else {
    v16 = v14;
  }
  id v17 = v16;
  v21.receiver = self;
  v21.super_class = (Class)PXCuratedLibraryHitTestResult;
  v18 = [(PXGHitTestResult *)&v21 initWithSpriteReference:a4 layout:a5 identifier:0 userData:v17];
  v19 = v18;
  if (v18)
  {
    v18->_control = a3;
    objc_storeStrong((id *)&v18->_assetReference, a6);
    objc_storeStrong((id *)&v19->_assetCollectionReference, a7);
  }

  return v19;
}

- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5 assetCollectionReference:(id)a6
{
  return [(PXCuratedLibraryHitTestResult *)self initWithControl:a3 spriteReference:a4 layout:a5 assetReference:0 assetCollectionReference:a6];
}

- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5 assetReference:(id)a6
{
  return [(PXCuratedLibraryHitTestResult *)self initWithControl:a3 spriteReference:a4 layout:a5 assetReference:a6 assetCollectionReference:0];
}

- (PXCuratedLibraryHitTestResult)initWithControl:(int64_t)a3 spriteReference:(id)a4 layout:(id)a5
{
  return [(PXCuratedLibraryHitTestResult *)self initWithControl:a3 spriteReference:a4 layout:a5 assetReference:0 assetCollectionReference:0];
}

@end