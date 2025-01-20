@interface UIKBEmojiSnapshotSizingView
- (CGSize)intrinsicContentSize;
- (UIKBEmojiSnapshotSizingView)initWithSnapshotView:(id)a3;
- (UIView)snapshotView;
@end

@implementation UIKBEmojiSnapshotSizingView

- (UIKBEmojiSnapshotSizingView)initWithSnapshotView:(id)a3
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)UIKBEmojiSnapshotSizingView;
  v6 = -[UIView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    id v26 = v5;
    p_snapshotView = (id *)&v6->_snapshotView;
    objc_storeStrong((id *)&v6->_snapshotView, a3);
    [*p_snapshotView bounds];
    v7->_snapshotSize.width = v9;
    v7->_snapshotSize.height = v10;
    [*p_snapshotView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v7 addSubview:*p_snapshotView];
    v21 = (void *)MEMORY[0x1E4F5B268];
    v25 = [*p_snapshotView topAnchor];
    v24 = [(UIView *)v7 topAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v28[0] = v23;
    v22 = [*p_snapshotView bottomAnchor];
    v11 = [(UIView *)v7 bottomAnchor];
    v12 = [v22 constraintEqualToAnchor:v11];
    v28[1] = v12;
    v13 = [*p_snapshotView centerXAnchor];
    v14 = [(UIView *)v7 centerXAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v28[2] = v15;
    v16 = [*p_snapshotView widthAnchor];
    v17 = [*p_snapshotView heightAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 multiplier:v7->_snapshotSize.width / v7->_snapshotSize.height];
    v28[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v21 activateConstraints:v19];

    id v5 = v26;
  }

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_snapshotSize.width;
  double height = self->_snapshotSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void).cxx_destruct
{
}

@end