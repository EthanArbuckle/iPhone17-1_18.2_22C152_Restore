@interface PXMockAssistantView
- (PXMockAssistantView)initWithTitle:(id)a3;
@end

@implementation PXMockAssistantView

- (void).cxx_destruct
{
}

- (PXMockAssistantView)initWithTitle:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXMockAssistantView+iOS.m", 21, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)PXMockAssistantView;
  v6 = -[PXMockAssistantView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PXMockAssistantView *)v6 setBackgroundColor:v7];

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = v8;

    [(UILabel *)v6->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
    [(UILabel *)v6->_titleLabel setFont:v10];

    [(UILabel *)v6->_titleLabel setText:v5];
    [(PXMockAssistantView *)v6 addSubview:v6->_titleLabel];
    v11 = [(PXMockAssistantView *)v6 safeAreaLayoutGuide];
    v12 = (void *)MEMORY[0x1E4F28DC8];
    v13 = [(UILabel *)v6->_titleLabel centerYAnchor];
    [v11 centerYAnchor];
    v14 = id v22 = v5;
    v15 = [v13 constraintEqualToAnchor:v14];
    v24[0] = v15;
    v16 = [(UILabel *)v6->_titleLabel centerXAnchor];
    v17 = [v11 centerXAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v24[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    [v12 activateConstraints:v19];

    id v5 = v22;
  }

  return v6;
}

@end