@interface PRComplicationGalleryApplicationCell
- (BOOL)isSeparatorVisible;
- (PRComplicationGalleryApplicationCell)initWithFrame:(CGRect)a3;
- (PRComplicationGalleryApplicationTitleView)titleView;
- (UIView)separatorView;
- (void)setSeparatorView:(id)a3;
- (void)setSeparatorVisible:(BOOL)a3;
@end

@implementation PRComplicationGalleryApplicationCell

- (PRComplicationGalleryApplicationCell)initWithFrame:(CGRect)a3
{
  v47[4] = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)PRComplicationGalleryApplicationCell;
  v3 = -[PRComplicationGalleryApplicationCell initWithFrame:](&v45, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PRComplicationGalleryApplicationCell *)v3 contentView];
    v6 = objc_alloc_init(PRComplicationGalleryApplicationTitleView);
    titleView = v4->_titleView;
    v4->_titleView = v6;

    [v5 addSubview:v4->_titleView];
    [(PRComplicationGalleryApplicationTitleView *)v4->_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = (void *)MEMORY[0x1E4F28DC8];
    v42 = [(PRComplicationGalleryApplicationTitleView *)v4->_titleView leadingAnchor];
    v40 = [v5 leadingAnchor];
    v38 = [v42 constraintEqualToAnchor:v40];
    v47[0] = v38;
    v36 = [(PRComplicationGalleryApplicationTitleView *)v4->_titleView trailingAnchor];
    v34 = [v5 trailingAnchor];
    v8 = [v36 constraintEqualToAnchor:v34];
    v47[1] = v8;
    v9 = [(PRComplicationGalleryApplicationTitleView *)v4->_titleView topAnchor];
    v44 = v5;
    v10 = [v5 topAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v47[2] = v11;
    v12 = [(PRComplicationGalleryApplicationTitleView *)v4->_titleView bottomAnchor];
    v13 = [v5 bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v47[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    [v33 activateConstraints:v15];

    -[PRComplicationGalleryApplicationTitleView setContentInsets:](v4->_titleView, "setContentInsets:", 12.0, 27.0, 12.0, 27.0);
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v16;

    [(UIView *)v4->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = v4->_separatorView;
    v19 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v18 setBackgroundColor:v19];

    [(PRComplicationGalleryApplicationCell *)v4 setSeparatorVisible:1];
    [v44 addSubview:v4->_separatorView];
    v35 = (void *)MEMORY[0x1E4F28DC8];
    v43 = [(UIView *)v4->_separatorView leadingAnchor];
    v41 = [(PRComplicationGalleryApplicationTitleView *)v4->_titleView titleLabelLeadingAnchor];
    v39 = [v43 constraintEqualToAnchor:v41];
    v46[0] = v39;
    v37 = [(UIView *)v4->_separatorView trailingAnchor];
    v20 = [v44 trailingAnchor];
    v21 = [v37 constraintEqualToAnchor:v20];
    v46[1] = v21;
    v22 = [(UIView *)v4->_separatorView bottomAnchor];
    v23 = [v44 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v46[2] = v24;
    v25 = [(UIView *)v4->_separatorView heightAnchor];
    v26 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v26 scale];
    v28 = [v25 constraintEqualToConstant:1.0 / v27];
    v46[3] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
    [v35 activateConstraints:v29];

    id v30 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v31 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    [v30 setBackgroundColor:v31];

    [(PRComplicationGalleryApplicationCell *)v4 setSelectedBackgroundView:v30];
  }
  return v4;
}

- (void)setSeparatorVisible:(BOOL)a3
{
  if (self->_separatorVisible != a3)
  {
    self->_separatorVisible = a3;
    [(UIView *)self->_separatorView setHidden:!a3];
  }
}

- (BOOL)isSeparatorVisible
{
  return self->_separatorVisible;
}

- (PRComplicationGalleryApplicationTitleView)titleView
{
  return self->_titleView;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end