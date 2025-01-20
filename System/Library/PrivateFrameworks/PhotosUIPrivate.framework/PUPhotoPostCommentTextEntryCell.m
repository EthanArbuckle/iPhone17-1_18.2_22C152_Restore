@interface PUPhotoPostCommentTextEntryCell
+ (double)heightForWidth:(double)a3;
+ (void)preferredContentSizeDidChange;
- (PUPhotoCommentEntryView)textEntryView;
- (PUPhotoPostCommentTextEntryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setTextEntryView:(id)a3;
@end

@implementation PUPhotoPostCommentTextEntryCell

- (void).cxx_destruct
{
}

- (void)setTextEntryView:(id)a3
{
}

- (PUPhotoCommentEntryView)textEntryView
{
  return self->_textEntryView;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPostCommentTextEntryCell;
  [(PUPhotoPostCommentTextEntryCell *)&v8 layoutSubviews];
  v3 = [(PUPhotoPostCommentTextEntryCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[PUPhotoCommentEntryView setFrame:](self->_textEntryView, "setFrame:", 0.0, 0.0, v5, v7);
}

- (PUPhotoPostCommentTextEntryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoPostCommentTextEntryCell;
  double v4 = [(PUPhotoPostCommentTextEntryCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4)
  {
    [(PUPhotoPostCommentTextEntryCell *)v4 setSelectionStyle:0];
    double v6 = [PUPhotoCommentEntryView alloc];
    uint64_t v7 = -[PUPhotoCommentEntryView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textEntryView = v5->_textEntryView;
    v5->_textEntryView = (PUPhotoCommentEntryView *)v7;

    v9 = [(PUPhotoPostCommentTextEntryCell *)v5 contentView];
    [v9 addSubview:v5->_textEntryView];
  }
  return v5;
}

+ (void)preferredContentSizeDidChange
{
  _cachedAccessibilityHeight = 0xBFF0000000000000;
}

+ (double)heightForWidth:(double)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PUPhotoPostCommentTextEntryCell_heightForWidth___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (heightForWidth__onceToken != -1) {
    dispatch_once(&heightForWidth__onceToken, block);
  }
  double v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v5 = [v4 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (!IsAccessibilityCategory) {
    return 54.0;
  }
  double result = *(double *)&_cachedAccessibilityHeight;
  if (*(double *)&_cachedAccessibilityHeight < 0.0)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    v9 = [MEMORY[0x1E4F8A5D8] sharedCache];
    v10 = [v9 commentEntryFont];
    [v8 setFont:v10];

    [v8 setText:@"A"];
    objc_msgSend(v8, "sizeThatFits:", a3, 0.0);
    double v12 = v11;
    [v8 textContainerInset];
    double v14 = v12 + v13;
    [v8 textContainerInset];
    *(double *)&_cachedAccessibilityHeight = v14 + v15;

    return *(double *)&_cachedAccessibilityHeight;
  }
  return result;
}

void __50__PUPhotoPostCommentTextEntryCell_heightForWidth___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_preferredContentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];
}

@end