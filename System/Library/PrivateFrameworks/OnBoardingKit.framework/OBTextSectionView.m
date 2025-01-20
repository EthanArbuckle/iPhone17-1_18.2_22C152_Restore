@interface OBTextSectionView
- (OBTextSectionView)initWithHeader:(id)a3 content:(id)a4;
- (UILabel)contentLabel;
- (UILabel)headerLabel;
- (id)_contentFont;
- (id)_headerFont;
- (void)setContentLabel:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OBTextSectionView

- (OBTextSectionView)initWithHeader:(id)a3 content:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)OBTextSectionView;
  v8 = -[OBTextSectionView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    [(OBTextSectionView *)v8 setAxis:1];
    [(OBTextSectionView *)v9 setAlignment:1];
    if ([v6 length])
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      [(OBTextSectionView *)v9 setHeaderLabel:v10];

      v11 = [(OBTextSectionView *)v9 headerLabel];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

      v12 = [(OBTextSectionView *)v9 headerLabel];
      [v12 setText:v6];

      v13 = [(OBTextSectionView *)v9 headerLabel];
      [v13 setTextAlignment:4];

      v14 = [MEMORY[0x1E4FB1618] labelColor];
      v15 = [(OBTextSectionView *)v9 headerLabel];
      [v15 setTextColor:v14];

      v16 = [(OBTextSectionView *)v9 _headerFont];
      v17 = [(OBTextSectionView *)v9 headerLabel];
      [v17 setFont:v16];

      v18 = [(OBTextSectionView *)v9 headerLabel];
      [v18 setNumberOfLines:0];

      v19 = [(OBTextSectionView *)v9 headerLabel];
      [(OBTextSectionView *)v9 addArrangedSubview:v19];
    }
    if ([v7 length])
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      [(OBTextSectionView *)v9 setContentLabel:v20];

      v21 = [(OBTextSectionView *)v9 contentLabel];
      [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

      v22 = [(OBTextSectionView *)v9 contentLabel];
      [v22 setText:v7];

      v23 = [(OBTextSectionView *)v9 contentLabel];
      [v23 setTextAlignment:4];

      v24 = [MEMORY[0x1E4FB1618] labelColor];
      v25 = [(OBTextSectionView *)v9 contentLabel];
      [v25 setTextColor:v24];

      v26 = [(OBTextSectionView *)v9 _contentFont];
      v27 = [(OBTextSectionView *)v9 contentLabel];
      [v27 setFont:v26];

      v28 = [(OBTextSectionView *)v9 contentLabel];
      [v28 setNumberOfLines:0];

      v29 = [(OBTextSectionView *)v9 contentLabel];
      [(OBTextSectionView *)v9 addArrangedSubview:v29];

      v30 = [(OBTextSectionView *)v9 headerLabel];

      if (v30)
      {
        v31 = [(OBTextSectionView *)v9 headerLabel];
        [(OBTextSectionView *)v9 setCustomSpacing:v31 afterView:6.0];
      }
    }
  }

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OBTextSectionView;
  [(OBTextSectionView *)&v8 traitCollectionDidChange:a3];
  v4 = [(OBTextSectionView *)self _headerFont];
  v5 = [(OBTextSectionView *)self headerLabel];
  [v5 setFont:v4];

  id v6 = [(OBTextSectionView *)self _contentFont];
  id v7 = [(OBTextSectionView *)self contentLabel];
  [v7 setFont:v6];
}

- (id)_headerFont
{
  v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  v4 = [v2 fontDescriptorWithSymbolicTraits:2];
  v5 = [v3 fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (id)_contentFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  v4 = [v2 fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (void)setContentLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end