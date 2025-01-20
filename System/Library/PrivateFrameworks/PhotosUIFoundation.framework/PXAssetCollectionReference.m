@interface PXAssetCollectionReference
- (PXAssetCollectionReference)initWithAssetCollection:(id)a3 keyAssetReference:(id)a4 indexPath:(PXSimpleIndexPath *)a5;
- (PXAssetReference)keyAssetReference;
- (PXDisplayAssetCollection)assetCollection;
@end

@implementation PXAssetCollectionReference

- (PXAssetCollectionReference)initWithAssetCollection:(id)a3 keyAssetReference:(id)a4 indexPath:(PXSimpleIndexPath *)a5
{
  id v9 = a4;
  long long v10 = *(_OWORD *)&a5->item;
  v14[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v14[1] = v10;
  v11 = [(PXSectionedObjectReference *)self initWithSectionObject:a3 itemObject:0 subitemObject:0 indexPath:v14];
  v12 = v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_keyAssetReference, a4);
  }

  return v12;
}

- (void).cxx_destruct
{
}

- (PXAssetReference)keyAssetReference
{
  return self->_keyAssetReference;
}

- (PXDisplayAssetCollection)assetCollection
{
  v4 = [(PXSectionedObjectReference *)self sectionObject];
  v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:&unk_2707C79B8]) {
      goto LABEL_3;
    }
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:a2, self, @"PXAssetCollectionReference.m", 15, @"%@ should conform to protocol %@, but %@ doesn't", @"self.sectionObject", @"PXDisplayAssetCollection", v8 object file lineNumber description];
  }
  else
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXAssetCollectionReference.m", 15, @"%@ should conform to protocol %@, but it is nil", @"self.sectionObject", @"PXDisplayAssetCollection" object file lineNumber description];
  }

LABEL_3:

  return (PXDisplayAssetCollection *)v5;
}

@end