@interface ICGalleryAttachmentViewCollectionViewLayout
+ (double)contentWidthForAttachmentGalleryModel:(id)a3 itemHeight:(double)a4 itemSpacing:(double)a5;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)cachedContentSize;
- (CGSize)margins;
- (ICAttachmentGalleryModel)attachmentModel;
- (ICGalleryAttachmentViewCollectionViewLayout)initWithAttachmentGalleryModel:(id)a3 itemHeight:(double)a4 itemSpacing:(double)a5 margins:(CGSize)a6;
- (NSArray)itemAttributes;
- (double)itemHeight;
- (double)itemSpacing;
- (void)invalidateLayoutWithNewItemHeight:(double)a3;
- (void)setAttachmentModel:(id)a3;
- (void)setCachedContentSize:(CGSize)a3;
- (void)setItemAttributes:(id)a3;
- (void)setItemHeight:(double)a3;
- (void)setItemSpacing:(double)a3;
- (void)setMargins:(CGSize)a3;
@end

@implementation ICGalleryAttachmentViewCollectionViewLayout

- (ICGalleryAttachmentViewCollectionViewLayout)initWithAttachmentGalleryModel:(id)a3 itemHeight:(double)a4 itemSpacing:(double)a5 margins:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICGalleryAttachmentViewCollectionViewLayout;
  v12 = [(UICollectionViewFlowLayout *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(ICGalleryAttachmentViewCollectionViewLayout *)v12 setAttachmentModel:v11];
    [(ICGalleryAttachmentViewCollectionViewLayout *)v13 setItemHeight:a4];
    [(ICGalleryAttachmentViewCollectionViewLayout *)v13 setItemSpacing:a5];
    -[ICGalleryAttachmentViewCollectionViewLayout setMargins:](v13, "setMargins:", width, height);
    [(UICollectionViewFlowLayout *)v13 setMinimumInteritemSpacing:a5];
    -[UICollectionViewFlowLayout setItemSize:](v13, "setItemSize:", a4, a4);
    [(UICollectionViewFlowLayout *)v13 setScrollDirection:1];
  }

  return v13;
}

+ (double)contentWidthForAttachmentGalleryModel:(id)a3 itemHeight:(double)a4 itemSpacing:(double)a5
{
  id v7 = a3;
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __108__ICGalleryAttachmentViewCollectionViewLayout_contentWidthForAttachmentGalleryModel_itemHeight_itemSpacing___block_invoke;
  v11[3] = &unk_2640BBE00;
  v11[4] = &v12;
  *(double *)&v11[5] = a4;
  [v7 enumerateSubAttachmentsWithBlock:v11];
  if ((unint64_t)[v7 subAttachmentCount] <= 1)
  {
    double v9 = v13[3];
  }
  else
  {
    uint64_t v8 = [v7 subAttachmentCount];
    double v9 = v13[3] + (double)(unint64_t)(v8 - 1) * a5;
    v13[3] = v9;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

double __108__ICGalleryAttachmentViewCollectionViewLayout_contentWidthForAttachmentGalleryModel_itemHeight_itemSpacing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 sizeWidth];
  double v5 = v4;
  [v3 sizeHeight];
  double v7 = v6;

  +[ICGalleryAttachmentView effectiveAspectRatioForWidth:v5 height:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = round(v8 * *(double *)(a1 + 40)) + *(double *)(v9 + 24);
  *(double *)(v9 + 24) = result;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 0;
}

- (void)invalidateLayoutWithNewItemHeight:(double)a3
{
  -[ICGalleryAttachmentViewCollectionViewLayout setItemHeight:](self, "setItemHeight:");
  -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:", a3, a3);

  [(ICGalleryAttachmentViewCollectionViewLayout *)self invalidateLayout];
}

- (double)itemHeight
{
  return self->_itemHeight;
}

- (void)setItemHeight:(double)a3
{
  self->_itemHeight = a3;
}

- (ICAttachmentGalleryModel)attachmentModel
{
  return self->_attachmentModel;
}

- (void)setAttachmentModel:(id)a3
{
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (CGSize)margins
{
  double width = self->_margins.width;
  double height = self->_margins.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMargins:(CGSize)a3
{
  self->_margins = a3;
}

- (NSArray)itemAttributes
{
  return self->_itemAttributes;
}

- (void)setItemAttributes:(id)a3
{
}

- (CGSize)cachedContentSize
{
  double width = self->_cachedContentSize.width;
  double height = self->_cachedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedContentSize:(CGSize)a3
{
  self->_cachedContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemAttributes, 0);

  objc_storeStrong((id *)&self->_attachmentModel, 0);
}

@end