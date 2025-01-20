@interface PUPhotosSharingCollectionViewItemSublayout
- (CGRect)badgesContainerFrame;
- (CGRect)floatingBadgesContainerFrame;
- (CGRect)itemFrame;
- (CGRect)visibleItemFrame;
- (CGSize)optionBadgeSize;
- (CGSize)selectionBadgeSize;
- (NSIndexPath)indexPath;
- (PUPhotosSharingCollectionViewItemSublayout)initWithIndexPath:(id)a3 itemFrame:(CGRect)a4;
- (UICollectionViewLayoutAttributes)optionBadgeLayoutAttributes;
- (UICollectionViewLayoutAttributes)selectionBadgeLayoutAttributes;
- (UIOffset)badgesOffset;
- (double)bottomBadgeInset;
- (unint64_t)badgesCorner;
- (void)prepareSublayout;
- (void)setBadgesCorner:(unint64_t)a3;
- (void)setBadgesOffset:(UIOffset)a3;
- (void)setBottomBadgeInset:(double)a3;
- (void)setFloatingOffset:(UIOffset)a3;
- (void)setOptionBadgeSize:(CGSize)a3;
- (void)setSelectionBadgeSize:(CGSize)a3;
- (void)setVisibleItemFrame:(CGRect)a3;
@end

@implementation PUPhotosSharingCollectionViewItemSublayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionBadgeLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_selectionBadgeLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

- (CGRect)floatingBadgesContainerFrame
{
  double x = self->_floatingBadgesContainerFrame.origin.x;
  double y = self->_floatingBadgesContainerFrame.origin.y;
  double width = self->_floatingBadgesContainerFrame.size.width;
  double height = self->_floatingBadgesContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)badgesContainerFrame
{
  double x = self->_badgesContainerFrame.origin.x;
  double y = self->_badgesContainerFrame.origin.y;
  double width = self->_badgesContainerFrame.size.width;
  double height = self->_badgesContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UICollectionViewLayoutAttributes)optionBadgeLayoutAttributes
{
  return self->_optionBadgeLayoutAttributes;
}

- (UICollectionViewLayoutAttributes)selectionBadgeLayoutAttributes
{
  return self->_selectionBadgeLayoutAttributes;
}

- (void)setBadgesCorner:(unint64_t)a3
{
  self->_badgesCorner = a3;
}

- (unint64_t)badgesCorner
{
  return self->_badgesCorner;
}

- (void)setBadgesOffset:(UIOffset)a3
{
  self->_badgesOffset = a3;
}

- (UIOffset)badgesOffset
{
  double horizontal = self->_badgesOffset.horizontal;
  double vertical = self->_badgesOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setBottomBadgeInset:(double)a3
{
  self->_bottomBadgeInset = a3;
}

- (double)bottomBadgeInset
{
  return self->_bottomBadgeInset;
}

- (void)setVisibleItemFrame:(CGRect)a3
{
  self->_visibleItemFrame = a3;
}

- (CGRect)visibleItemFrame
{
  double x = self->_visibleItemFrame.origin.x;
  double y = self->_visibleItemFrame.origin.y;
  double width = self->_visibleItemFrame.size.width;
  double height = self->_visibleItemFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)itemFrame
{
  double x = self->_itemFrame.origin.x;
  double y = self->_itemFrame.origin.y;
  double width = self->_itemFrame.size.width;
  double height = self->_itemFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setFloatingOffset:(UIOffset)a3
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  -[UICollectionViewLayoutAttributes setCenter:](self->_selectionBadgeLayoutAttributes, "setCenter:", a3.horizontal + self->_selectionBadgeCenter.x, a3.vertical + self->_selectionBadgeCenter.y);
  self->_floatingBadgesContainerFrame = CGRectOffset(self->_badgesContainerFrame, horizontal, vertical);
}

- (void)prepareSublayout
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  selectionBadgeLayoutAttributes = self->_selectionBadgeLayoutAttributes;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&selectionBadgeLayoutAttributes count:1];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v61;
    double v8 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v61 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        [v11 size];
        if (v13 != v8 || v12 != v9) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v6);
  }

  unint64_t v15 = [(PUPhotosSharingCollectionViewItemSublayout *)self badgesCorner] & 0xA;
  unint64_t v16 = [(PUPhotosSharingCollectionViewItemSublayout *)self badgesCorner] & 0xC;
  CGFloat x = self->_itemFrame.origin.x;
  CGFloat y = self->_itemFrame.origin.y;
  CGFloat width = self->_itemFrame.size.width;
  CGFloat height = self->_itemFrame.size.height;
  if (v15) {
    double v21 = CGRectGetMaxX(*(CGRect *)&x) - self->_badgesOffset.horizontal;
  }
  else {
    double v21 = CGRectGetMinX(*(CGRect *)&x) + self->_badgesOffset.horizontal;
  }
  v22 = (CGFloat *)MEMORY[0x1E4F1DB20];
  CGFloat v23 = self->_itemFrame.origin.x;
  CGFloat v24 = self->_itemFrame.origin.y;
  CGFloat v25 = self->_itemFrame.size.width;
  CGFloat v26 = self->_itemFrame.size.height;
  if (v16) {
    double v27 = CGRectGetMaxY(*(CGRect *)&v23) - self->_bottomBadgeInset - self->_badgesOffset.vertical;
  }
  else {
    double v27 = CGRectGetMinY(*(CGRect *)&v23) + self->_badgesOffset.vertical;
  }
  CGFloat v28 = v22[1];
  CGFloat v55 = *v22;
  CGFloat v30 = v22[2];
  CGFloat v29 = v22[3];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v31 = v3;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v57 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        objc_msgSend(v36, "frame", *(void *)&v29);
        CGFloat v41 = v38;
        double v42 = v39;
        double v43 = v40;
        if (v15) {
          double v21 = v21 - CGRectGetWidth(*(CGRect *)&v37);
        }
        double v44 = v27;
        if (v16)
        {
          v68.origin.CGFloat x = v21;
          v68.origin.CGFloat y = v41;
          v68.size.CGFloat width = v42;
          v68.size.CGFloat height = v43;
          double v44 = v27 - CGRectGetHeight(v68);
        }
        objc_msgSend(v36, "setFrame:", v21, v44, v42, v43);
        v69.size.CGFloat height = v54;
        v69.origin.CGFloat x = v55;
        v69.origin.CGFloat y = v28;
        v69.size.CGFloat width = v30;
        v71.origin.CGFloat x = v21;
        v71.origin.CGFloat y = v44;
        v71.size.CGFloat width = v42;
        v71.size.CGFloat height = v43;
        CGRect v70 = CGRectUnion(v69, v71);
        CGFloat v55 = v70.origin.x;
        CGFloat v28 = v70.origin.y;
        CGFloat v30 = v70.size.width;
        CGFloat v29 = v70.size.height;
        double v45 = v21;
        double v46 = v44;
        double v47 = v42;
        double v48 = v43;
        if (v15) {
          double v21 = CGRectGetMinX(*(CGRect *)&v45) - self->_badgesOffset.horizontal;
        }
        else {
          double v21 = CGRectGetMaxX(*(CGRect *)&v45) + self->_badgesOffset.horizontal;
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v33);
  }

  self->_badgesContainerFrame.origin.CGFloat x = v55;
  self->_badgesContainerFrame.origin.CGFloat y = v28;
  self->_badgesContainerFrame.size.CGFloat width = v30;
  self->_badgesContainerFrame.size.CGFloat height = v29;
  CGSize size = self->_badgesContainerFrame.size;
  self->_floatingBadgesContainerFrame.origin = self->_badgesContainerFrame.origin;
  self->_floatingBadgesContainerFrame.CGSize size = size;
  [(UICollectionViewLayoutAttributes *)self->_selectionBadgeLayoutAttributes center];
  self->_selectionBadgeCenter.CGFloat x = v50;
  self->_selectionBadgeCenter.CGFloat y = v51;
  [(UICollectionViewLayoutAttributes *)self->_optionBadgeLayoutAttributes center];
  self->_optionBadgeCenter.CGFloat x = v52;
  self->_optionBadgeCenter.CGFloat y = v53;
}

- (CGSize)optionBadgeSize
{
  [(UICollectionViewLayoutAttributes *)self->_optionBadgeLayoutAttributes size];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setOptionBadgeSize:(CGSize)a3
{
}

- (CGSize)selectionBadgeSize
{
  [(UICollectionViewLayoutAttributes *)self->_selectionBadgeLayoutAttributes size];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setSelectionBadgeSize:(CGSize)a3
{
}

- (PUPhotosSharingCollectionViewItemSublayout)initWithIndexPath:(id)a3 itemFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUPhotosSharingCollectionViewItemSublayout;
  v11 = [(PUPhotosSharingCollectionViewItemSublayout *)&v18 init];
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_indexPath, a3);
    v12->_itemFrame.origin.CGFloat x = x;
    v12->_itemFrame.origin.CGFloat y = y;
    v12->_itemFrame.size.CGFloat width = width;
    v12->_itemFrame.size.CGFloat height = height;
    v12->_visibleItemFrame.origin.CGFloat x = x;
    v12->_visibleItemFrame.origin.CGFloat y = y;
    v12->_visibleItemFrame.size.CGFloat width = width;
    v12->_visibleItemFrame.size.CGFloat height = height;
    v12->_badgesCorner = 8;
    uint64_t v13 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:@"PUPhotosSharingSelectionBadgeKind" withIndexPath:v10];
    selectionBadgeLayoutAttributes = v12->_selectionBadgeLayoutAttributes;
    v12->_selectionBadgeLayoutAttributes = (UICollectionViewLayoutAttributes *)v13;

    uint64_t v15 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:@"PUPhotosSharingOptionBadgeKind" withIndexPath:v10];
    optionBadgeLayoutAttributes = v12->_optionBadgeLayoutAttributes;
    v12->_optionBadgeLayoutAttributes = (UICollectionViewLayoutAttributes *)v15;
  }
  return v12;
}

@end