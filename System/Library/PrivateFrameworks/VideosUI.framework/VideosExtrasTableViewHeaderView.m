@interface VideosExtrasTableViewHeaderView
- (CGSize)intrinsicContentSize;
- (VideosExtrasTableViewHeaderView)initWithReuseIdentifier:(id)a3;
- (void)configureForHeaderElement:(id)a3;
- (void)dealloc;
@end

@implementation VideosExtrasTableViewHeaderView

- (VideosExtrasTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)VideosExtrasTableViewHeaderView;
  v3 = [(VideosExtrasTableViewHeaderView *)&v35 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(VideosExtrasTableViewHeaderView *)v3 frame];
    v5 = objc_msgSend(v4, "initWithFrame:");
    [(VideosExtrasTableViewHeaderView *)v3 setBackgroundView:v5];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__dynamicTypeDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    v7 = [(VideosExtrasTableViewHeaderView *)v3 textLabel];
    objc_msgSend(v7, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);

    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1EB0]) initForAutolayout];
    v9 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.2];
    [v8 setBackgroundColor:v9];

    v10 = [(VideosExtrasTableViewHeaderView *)v3 contentView];
    [v10 addSubview:v8];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1EB0]) initForAutolayout];
    v12 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.2];
    [v11 setBackgroundColor:v12];

    v13 = [(VideosExtrasTableViewHeaderView *)v3 contentView];
    [v13 addSubview:v11];

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15 = (void *)MEMORY[0x1E4F28DC8];
    v16 = [(VideosExtrasTableViewHeaderView *)v3 contentView];
    double v17 = *MEMORY[0x1E4FB2848];
    double v18 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v19 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v20 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    v21 = objc_msgSend(v15, "constraintsByAttachingView:toView:alongEdges:insets:", v8, v16, 11, *MEMORY[0x1E4FB2848], v18, v19, v20);

    v22 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v23 scale];
    v25 = [v22 constraintWithItem:v8 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0 / v24];

    v26 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(VideosExtrasTableViewHeaderView *)v3 contentView];
    v28 = objc_msgSend(v26, "constraintsByAttachingView:toView:alongEdges:insets:", v11, v27, 14, v17, v18, v19, v20);

    v29 = (void *)MEMORY[0x1E4F28DC8];
    v30 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v30 scale];
    v32 = [v29 constraintWithItem:v11 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0 / v31];

    [v14 addObjectsFromArray:v21];
    [v14 addObject:v25];
    [v14 addObjectsFromArray:v28];
    [v14 addObject:v32];
    v33 = [(VideosExtrasTableViewHeaderView *)v3 contentView];
    [v33 addConstraints:v14];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasTableViewHeaderView;
  [(VideosExtrasTableViewHeaderView *)&v4 dealloc];
}

- (void)configureForHeaderElement:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  v6 = [v4 colorWithWhite:0.0 alpha:0.4];
  v7 = [(VideosExtrasTableViewHeaderView *)self backgroundView];
  [v7 setBackgroundColor:v6];

  id v13 = [(VideosExtrasTableViewHeaderView *)self textLabel];
  v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v13 setBackgroundColor:v8];

  v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
  [v13 setTextColor:v9];

  v10 = [v5 title];

  uint64_t v11 = *MEMORY[0x1E4FB28F0];
  v12 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0]];
  [v13 configureForIKTextElement:v10 fontDescriptor:v12 textStyle:v11 capitalize:1];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(VideosExtrasTableViewHeaderView *)self textLabel];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v6 + 15.0;
  double v8 = v4;
  result.height = v7;
  result.width = v8;
  return result;
}

@end