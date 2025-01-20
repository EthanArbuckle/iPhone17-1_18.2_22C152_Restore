@interface PUPhotosZoomingSharingGridCell
- (PUPhotosZoomingSharingGridCell)initWithFrame:(CGRect)a3 selectionView:(id)a4 optionView:(id)a5 layoutAnchor:(unint64_t)a6;
- (void)layoutSubviews;
@end

@implementation PUPhotosZoomingSharingGridCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionView, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
}

- (void)layoutSubviews
{
  *(void *)&rect.size.CGFloat width = self;
  *(void *)&rect.size.CGFloat height = PUPhotosZoomingSharingGridCell;
  [(CGSize *)(objc_super *)&rect.size layoutSubviews];
  [(PUPhotosZoomingSharingGridCell *)self bounds];
  CGFloat v7 = v6;
  double v9 = *MEMORY[0x1E4FB2E10];
  double v8 = *(double *)(MEMORY[0x1E4FB2E10] + 8);
  CGFloat v10 = v3;
  CGFloat v11 = v4;
  CGFloat v12 = v5;
  CGFloat y = self->_defaultBounds.origin.y;
  CGFloat width = self->_defaultBounds.size.width;
  CGFloat height = self->_defaultBounds.size.height;
  switch(self->_badgesLayoutAnchor)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
    case 8uLL:
      CGFloat x = self->_defaultBounds.origin.x;
      rect.origin.CGFloat x = x;
      CGFloat v17 = v7;
      double MaxX = CGRectGetMaxX(*(CGRect *)&v3);
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      double v9 = MaxX - CGRectGetMaxX(v37);
      v38.origin.CGFloat x = v10;
      v38.origin.CGFloat y = v11;
      v38.size.CGFloat width = v7;
      v38.size.CGFloat height = v12;
      double MaxY = CGRectGetMaxY(v38);
      v39.origin.CGFloat x = rect.origin.x;
      v39.origin.CGFloat y = y;
      v39.size.CGFloat width = width;
      v39.size.CGFloat height = height;
      double v8 = MaxY - CGRectGetMaxY(v39);
      break;
    case 1uLL:
      CGFloat v19 = self->_defaultBounds.size.width;
      rect.origin.CGFloat y = v19;
      CGFloat v20 = self->_defaultBounds.origin.x;
      CGFloat v21 = v7;
      double MinX = CGRectGetMinX(*(CGRect *)&v3);
      v40.origin.CGFloat x = v20;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = v19;
      v40.size.CGFloat height = height;
      double v22 = CGRectGetMinX(v40);
      goto LABEL_5;
    case 2uLL:
      CGFloat v23 = self->_defaultBounds.size.width;
      rect.origin.CGFloat y = v23;
      CGFloat v20 = self->_defaultBounds.origin.x;
      CGFloat v24 = v7;
      double MinX = CGRectGetMaxX(*(CGRect *)&v3);
      v41.origin.CGFloat x = v20;
      v41.origin.CGFloat y = y;
      v41.size.CGFloat width = v23;
      v41.size.CGFloat height = height;
      double v22 = CGRectGetMaxX(v41);
LABEL_5:
      double v9 = MinX - v22;
      v42.origin.CGFloat x = v10;
      v42.origin.CGFloat y = v11;
      v42.size.CGFloat width = v7;
      v42.size.CGFloat height = v12;
      double MinY = CGRectGetMinY(v42);
      v43.origin.CGFloat x = v20;
      v43.origin.CGFloat y = y;
      v43.size.CGFloat width = rect.origin.y;
      v43.size.CGFloat height = height;
      double v26 = CGRectGetMinY(v43);
      goto LABEL_7;
    case 4uLL:
      CGFloat v27 = self->_defaultBounds.size.width;
      rect.origin.CGFloat y = v27;
      CGFloat v28 = self->_defaultBounds.origin.x;
      CGFloat v29 = v7;
      double v35 = CGRectGetMinX(*(CGRect *)&v3);
      v44.origin.CGFloat x = v28;
      v44.origin.CGFloat y = y;
      v44.size.CGFloat width = v27;
      v44.size.CGFloat height = height;
      double v9 = v35 - CGRectGetMinX(v44);
      v45.origin.CGFloat x = v10;
      v45.origin.CGFloat y = v11;
      v45.size.CGFloat width = v7;
      v45.size.CGFloat height = v12;
      double MinY = CGRectGetMaxY(v45);
      v46.origin.CGFloat x = v28;
      v46.origin.CGFloat y = y;
      v46.size.CGFloat width = rect.origin.y;
      v46.size.CGFloat height = height;
      double v26 = CGRectGetMaxY(v46);
LABEL_7:
      double v8 = MinY - v26;
      break;
    default:
      break;
  }
  double v30 = v9 + self->_selectionViewDefaultCenter.x;
  double v31 = v9 + self->_optionViewDefaultCenter.x;
  double v32 = v8 + self->_optionViewDefaultCenter.y;
  -[UIView setCenter:](self->_selectionView, "setCenter:", v30, v8 + self->_selectionViewDefaultCenter.y);
  -[UIView setCenter:](self->_optionView, "setCenter:", v31, v32);
}

- (PUPhotosZoomingSharingGridCell)initWithFrame:(CGRect)a3 selectionView:(id)a4 optionView:(id)a5 layoutAnchor:(unint64_t)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PUPhotosZoomingSharingGridCell;
  v16 = -[PUPhotosSharingGridCell initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  CGFloat v17 = (PUPhotosZoomingSharingGridCell *)v16;
  if (v16)
  {
    *(_OWORD *)(v16 + 712) = *MEMORY[0x1E4F1DAD8];
    *((double *)v16 + 91) = width;
    *((double *)v16 + 92) = height;
    v18 = v16 + 760;
    [v14 center];
    void *v18 = v19;
    v17->_selectionViewDefaultCenter.double y = v20;
    objc_storeStrong((id *)&v17->_selectionView, a4);
    [(PUPhotosZoomingSharingGridCell *)v17 addSubview:v17->_selectionView];
    [v15 center];
    v17->_optionViewDefaultCenter.double x = v21;
    v17->_optionViewDefaultCenter.double y = v22;
    objc_storeStrong((id *)&v17->_optionView, a5);
    if (v17->_optionView) {
      -[PUPhotosZoomingSharingGridCell addSubview:](v17, "addSubview:");
    }
    v17->_badgesLayoutAnchor = a6;
    [(PUPhotosZoomingSharingGridCell *)v17 setUserInteractionEnabled:0];
  }

  return v17;
}

@end