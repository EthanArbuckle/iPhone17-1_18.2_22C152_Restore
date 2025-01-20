@interface NTKCFaceDetailDescriptionSectionController
+ (BOOL)hasDescriptionSectionForFace:(id)a3 inGallery:(BOOL)a4 orExternal:(BOOL)a5;
+ (id)_descriptionForFace:(id)a3 inGallery:(BOOL)a4 orExternal:(BOOL)a5;
- (BOOL)expanded;
- (BOOL)external;
- (NTKCFaceDetailDescriptionSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 external:(BOOL)a6;
- (NTKCFaceDetailDescriptionSectionDelegate)delegate;
- (id)_faceDescription;
- (id)titleForHeader;
- (void)_commonInit;
- (void)descriptionCellDidExpand:(id)a3;
- (void)faceDidChange;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExternal:(BOOL)a3;
@end

@implementation NTKCFaceDetailDescriptionSectionController

+ (BOOL)hasDescriptionSectionForFace:(id)a3 inGallery:(BOOL)a4 orExternal:(BOOL)a5
{
  v5 = [a1 _descriptionForFace:a3 inGallery:a4 orExternal:a5];
  BOOL v6 = [v5 length] != 0;

  return v6;
}

- (NTKCFaceDetailDescriptionSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 external:(BOOL)a6
{
  BOOL v6 = a6;
  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailDescriptionSectionController;
  v7 = [(NTKCFaceDetailSectionController *)&v10 initWithTableViewController:a3 face:a4 inGallery:a5];
  v8 = v7;
  if (v7) {
    [(NTKCFaceDetailDescriptionSectionController *)v7 setExternal:v6];
  }
  return v8;
}

- (void)_commonInit
{
  v3 = objc_opt_new();
  [(NTKCFaceDetailSectionController *)self setCell:v3];

  id v4 = [(NTKCFaceDetailSectionController *)self cell];
  [v4 setDelegate:self];
}

- (id)titleForHeader
{
  return NTKCCustomizationLocalizedString(@"DESCRIPTION_TITLE", @"Description", v2);
}

- (void)faceDidChange
{
  v3 = [(NTKCFaceDetailDescriptionSectionController *)self _faceDescription];
  uint64_t v4 = [v3 length];
  v5 = [(NTKCFaceDetailSectionController *)self cell];
  BOOL v6 = v5;
  if (!v4)
  {
    [v5 setText:0];
LABEL_6:

    goto LABEL_7;
  }
  v7 = [v5 text];
  char v8 = [v3 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    v9 = [(NTKCFaceDetailSectionController *)self cell];
    [v9 rowHeight];
    uint64_t v11 = v10;

    v12 = [(NTKCFaceDetailSectionController *)self cell];
    [v12 setText:v3];

    v13 = [(NTKCFaceDetailSectionController *)self cell];
    [v13 rowHeight];
    uint64_t v15 = v14;

    v16 = [(NTKCFaceDetailSectionController *)self tableView];
    v17 = [(NTKCFaceDetailSectionController *)self cell];
    BOOL v6 = [v16 indexPathForCell:v17];

    if (v6)
    {
      v18 = (void *)MEMORY[0x1E4FB1EB0];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __59__NTKCFaceDetailDescriptionSectionController_faceDidChange__block_invoke;
      v19[3] = &unk_1E62C5CA8;
      uint64_t v21 = v15;
      uint64_t v22 = v11;
      v19[4] = self;
      id v20 = v6;
      [v18 performWithoutAnimation:v19];
    }
    goto LABEL_6;
  }
LABEL_7:
}

void __59__NTKCFaceDetailDescriptionSectionController_faceDidChange__block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  double v2 = *(double *)(a1 + 48) - *(double *)(a1 + 56);
  double v3 = -v2;
  if (v2 >= 0.0) {
    double v3 = *(double *)(a1 + 48) - *(double *)(a1 + 56);
  }
  if (v3 > 0.00000011920929)
  {
    uint64_t v4 = [*(id *)(a1 + 32) tableView];
    [v4 contentOffset];
    double v6 = v5;
    double v8 = v7;

    double v9 = v2 + v8;
    uint64_t v10 = [*(id *)(a1 + 32) tableView];
    [v10 contentInset];
    double v12 = v11;
    v13 = [*(id *)(a1 + 32) tableView];
    [v13 safeAreaInsets];
    double v15 = v12 + v14;

    if (v9 >= -v15) {
      double v16 = v9;
    }
    else {
      double v16 = -v15;
    }
    v17 = [*(id *)(a1 + 32) tableView];
    objc_msgSend(v17, "setContentOffset:", v6, v16);
  }
  v18 = [*(id *)(a1 + 32) tableView];
  v20[0] = *(void *)(a1 + 40);
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v18 reloadRowsAtIndexPaths:v19 withRowAnimation:5];
}

- (BOOL)expanded
{
  double v2 = [(NTKCFaceDetailSectionController *)self cell];
  char v3 = [v2 expanded];

  return v3;
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NTKCFaceDetailSectionController *)self cell];
  [v4 setExpanded:v3];
}

- (id)_faceDescription
{
  BOOL v3 = objc_opt_class();
  id v4 = [(NTKCFaceDetailSectionController *)self face];
  double v5 = objc_msgSend(v3, "_descriptionForFace:inGallery:orExternal:", v4, -[NTKCFaceDetailSectionController inGallery](self, "inGallery"), -[NTKCFaceDetailDescriptionSectionController external](self, "external"));

  return v5;
}

+ (id)_descriptionForFace:(id)a3 inGallery:(BOOL)a4 orExternal:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  double v8 = v7;
  if (v5)
  {
    uint64_t v9 = [v7 faceDescriptionForExternal];
  }
  else
  {
    if (v6) {
      [v7 faceDescription];
    }
    else {
    uint64_t v9 = [v7 faceDescriptionForLibrary];
    }
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (void)descriptionCellDidExpand:(id)a3
{
  id v4 = [(NTKCFaceDetailDescriptionSectionController *)self delegate];
  [v4 descriptionSection:self didExpand:1];
}

- (NTKCFaceDetailDescriptionSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCFaceDetailDescriptionSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)external
{
  return self->_external;
}

- (void)setExternal:(BOOL)a3
{
  self->_external = a3;
}

- (void).cxx_destruct
{
}

@end