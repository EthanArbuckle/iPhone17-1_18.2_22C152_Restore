@interface PXPhotosGridFloatingHeaderSnapshot
- (BOOL)floatingEnableOverview;
- (NSAttributedString)floatingSummarySubtitle;
- (NSAttributedString)floatingSummaryTitle;
- (NSAttributedString)subtitle;
- (NSAttributedString)title;
- (NSString)buttonTitle;
- (PXAssetCollectionReference)assetCollectionReference;
- (PXPhotosGridFloatingHeaderSnapshot)initWithTitle:(id)a3 subtitle:(id)a4 buttonTitle:(id)a5 buttonActionType:(unint64_t)a6 assetCollectionReference:(id)a7;
- (unint64_t)buttonActionType;
@end

@implementation PXPhotosGridFloatingHeaderSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (unint64_t)buttonActionType
{
  return self->_buttonActionType;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (NSAttributedString)floatingSummarySubtitle
{
  v2 = [(PXPhotosGridFloatingHeaderSnapshot *)self subtitle];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F00B0030];
  }
  v5 = v4;

  return (NSAttributedString *)v5;
}

- (NSAttributedString)floatingSummaryTitle
{
  v2 = [(PXPhotosGridFloatingHeaderSnapshot *)self title];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F00B0030];
  }
  v5 = v4;

  return (NSAttributedString *)v5;
}

- (BOOL)floatingEnableOverview
{
  v3 = [(PXPhotosGridFloatingHeaderSnapshot *)self assetCollectionReference];
  if (v3)
  {
    id v4 = [(PXPhotosGridFloatingHeaderSnapshot *)self buttonTitle];
    BOOL v5 = [v4 length] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (PXPhotosGridFloatingHeaderSnapshot)initWithTitle:(id)a3 subtitle:(id)a4 buttonTitle:(id)a5 buttonActionType:(unint64_t)a6 assetCollectionReference:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)PXPhotosGridFloatingHeaderSnapshot;
  v16 = [(PXPhotosGridFloatingHeaderSnapshot *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    title = v16->_title;
    v16->_title = (NSAttributedString *)v17;

    uint64_t v19 = [v13 copy];
    subtitle = v16->_subtitle;
    v16->_subtitle = (NSAttributedString *)v19;

    uint64_t v21 = [v14 copy];
    buttonTitle = v16->_buttonTitle;
    v16->_buttonTitle = (NSString *)v21;

    v16->_buttonActionType = a6;
    objc_storeStrong((id *)&v16->_assetCollectionReference, a7);
  }

  return v16;
}

@end