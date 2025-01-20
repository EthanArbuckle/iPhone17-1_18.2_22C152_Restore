@interface SUUISegmentedControlCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUISegmentedControlCollectionViewCell

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  objc_msgSend(a5, "sizeForViewElement:width:", a4);
  double v7 = a3;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(SUUISegmentedControlViewElementController *)self->_elementController viewElement];

  if (v9 == v7)
  {
    [(SUUISegmentedControlViewElementController *)self->_elementController reloadAfterDocumentUpdate];
  }
  else
  {
    bottomDividerView = self->_bottomDividerView;
    self->_bottomDividerView = 0;

    elementController = self->_elementController;
    self->_elementController = 0;

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __78__SUUISegmentedControlCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
    v12[3] = &unk_2654026E8;
    id v13 = v7;
    id v14 = v8;
    v15 = self;
    [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:v12];
  }
}

void __78__SUUISegmentedControlCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  v3 = [v18 addReusableViewWithReuseIdentifier:0x270504D50];
  double v4 = [*(id *)(a1 + 32) style];
  double v5 = [*(id *)(a1 + 40) tintColor];
  double v6 = SUUIViewElementPlainColorWithStyle(v4, v5);

  if (!v6)
  {
    double v6 = [MEMORY[0x263F825C8] colorWithWhite:0.588235294 alpha:1.0];
  }
  [v3 setTintColor:v6];
  id v7 = [[SUUISegmentedControlViewElementController alloc] initWithViewElement:*(void *)(a1 + 32) segmentedControl:v3];
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(void **)(v8 + 824);
  *(void *)(v8 + 824) = v7;

  v10 = *(void **)(*(void *)(a1 + 48) + 824);
  v11 = [*(id *)(a1 + 40) clientContext];
  [v10 setClientContext:v11];

  v12 = *(void **)(*(void *)(a1 + 48) + 824);
  id v13 = [*(id *)(a1 + 40) parentViewController];
  [v12 setParentViewController:v13];

  id v14 = [*(id *)(a1 + 32) bottomDivider];
  if (v14)
  {
    uint64_t v15 = [v18 addDividerWithElement:v14 context:*(void *)(a1 + 40)];
    uint64_t v16 = *(void *)(a1 + 48);
    v17 = *(void **)(v16 + 816);
    *(void *)(v16 + 816) = v15;

    [*(id *)(*(void *)(a1 + 48) + 816) setDividerOrientation:0];
    [*(id *)(*(void *)(a1 + 48) + 816) setDividerSize:0.0];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SUUISegmentedControlCollectionViewCell;
  [(SUUICollectionViewCell *)&v28 layoutSubviews];
  v3 = [(SUUISegmentedControlCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(SUUIViewReuseCollectionViewCell *)self contentInset];
  double v13 = v5 + v12;
  double v15 = v7 + v14;
  double v17 = v9 - (v12 + v16);
  double v19 = v11 - (v14 + v18);
  v20 = [(SUUISegmentedControlViewElementController *)self->_elementController segmentedControlView];
  objc_msgSend(v20, "sizeThatFits:", v17, v19);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  *(float *)&double v21 = v13 + (v17 - v21) * 0.5;
  *(float *)&double v23 = v15 + (v19 - v23) * 0.5;
  objc_msgSend(v20, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(floorf(*(float *)&v21), floorf(*(float *)&v23), v22, v24, v5, v7, v9, v11));
  if (self->_bottomDividerView)
  {
    v25 = [MEMORY[0x263F82B60] mainScreen];
    [v25 scale];
    CGFloat v27 = 1.0 / v26;

    [(SUUIDividerView *)self->_bottomDividerView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(0.0, v11 - v27, v9, v27, v5, v7, v9, v11)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementController, 0);
  objc_storeStrong((id *)&self->_bottomDividerView, 0);
}

@end