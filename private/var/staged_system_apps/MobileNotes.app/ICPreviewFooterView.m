@interface ICPreviewFooterView
- (NSString)contentsSubtitle;
- (NSString)sharingSubtitle;
- (NSString)title;
- (UILabel)contentsLabel;
- (UILabel)sharingLabel;
- (UILabel)titleLabel;
- (void)awakeFromNib;
- (void)setContentsLabel:(id)a3;
- (void)setContentsSubtitle:(id)a3;
- (void)setSharingLabel:(id)a3;
- (void)setSharingSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation ICPreviewFooterView

- (void)awakeFromNib
{
  v20.receiver = self;
  v20.super_class = (Class)ICPreviewFooterView;
  [(ICPreviewFooterView *)&v20 awakeFromNib];
  v3 = [(ICPreviewFooterView *)self titleLabel];
  [v3 setText:0];

  v4 = [(ICPreviewFooterView *)self titleLabel];
  v5 = [v4 font];
  v6 = [v5 ic_fontWithSingleLineA];
  v7 = [(ICPreviewFooterView *)self titleLabel];
  [v7 setFont:v6];

  v8 = [(ICPreviewFooterView *)self contentsLabel];
  [v8 setText:0];

  v9 = [(ICPreviewFooterView *)self contentsLabel];
  v10 = [v9 font];
  v11 = [v10 ic_fontWithSingleLineA];
  v12 = [(ICPreviewFooterView *)self contentsLabel];
  [v12 setFont:v11];

  v13 = [(ICPreviewFooterView *)self contentsLabel];
  [v13 setHidden:1];

  v14 = [(ICPreviewFooterView *)self sharingLabel];
  [v14 setText:0];

  v15 = [(ICPreviewFooterView *)self sharingLabel];
  v16 = [v15 font];
  v17 = [v16 ic_fontWithSingleLineA];
  v18 = [(ICPreviewFooterView *)self sharingLabel];
  [v18 setFont:v17];

  v19 = [(ICPreviewFooterView *)self sharingLabel];
  [v19 setHidden:1];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  v6 = [(ICPreviewFooterView *)self titleLabel];
  [v6 setText:v5];

  id v7 = [(ICPreviewFooterView *)self titleLabel];
  [v7 setHidden:v5 == 0];
}

- (void)setContentsSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_contentsSubtitle, a3);
  id v5 = a3;
  v6 = [(ICPreviewFooterView *)self contentsLabel];
  [v6 setText:v5];

  id v7 = [(ICPreviewFooterView *)self contentsLabel];
  [v7 setHidden:v5 == 0];
}

- (void)setSharingSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSubtitle, a3);
  id v5 = a3;
  v6 = [(ICPreviewFooterView *)self sharingLabel];
  [v6 setText:v5];

  id v7 = [(ICPreviewFooterView *)self sharingLabel];
  [v7 setHidden:v5 == 0];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)contentsSubtitle
{
  return self->_contentsSubtitle;
}

- (NSString)sharingSubtitle
{
  return self->_sharingSubtitle;
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)contentsLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentsLabel);

  return (UILabel *)WeakRetained;
}

- (void)setContentsLabel:(id)a3
{
}

- (UILabel)sharingLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sharingLabel);

  return (UILabel *)WeakRetained;
}

- (void)setSharingLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sharingLabel);
  objc_destroyWeak((id *)&self->_contentsLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_storeStrong((id *)&self->_sharingSubtitle, 0);
  objc_storeStrong((id *)&self->_contentsSubtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end