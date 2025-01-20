@interface UIEmojiNoResultsView
- (BOOL)supportsGenmoji;
- (UIEmojiNoResultsView)initWithFrame:(CGRect)a3;
- (void)createNewEmoji;
- (void)setSupportsGenmoji:(BOOL)a3;
@end

@implementation UIEmojiNoResultsView

- (UIEmojiNoResultsView)initWithFrame:(CGRect)a3
{
  v32[4] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)UIEmojiNoResultsView;
  v3 = -[UIView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UILabel);
    noResultsLabel = v3->_noResultsLabel;
    v3->_noResultsLabel = v4;

    [(UIView *)v3->_noResultsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = _UILocalizedStringInSystemLanguage(@"No Results", @"No Results");
    [(UILabel *)v3->_noResultsLabel setText:v6];

    v7 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
    [(UILabel *)v3->_noResultsLabel setFont:v7];

    [(UILabel *)v3->_noResultsLabel setTextAlignment:1];
    v8 = +[UIColor labelColor];
    [(UILabel *)v3->_noResultsLabel setTextColor:v8];

    [(UIView *)v3 addSubview:v3->_noResultsLabel];
    v9 = objc_alloc_init(UILabel);
    createNewEmojiLabel = v3->_createNewEmojiLabel;
    v3->_createNewEmojiLabel = v9;

    [(UIView *)v3->_createNewEmojiLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = _UILocalizedStringInSystemLanguage(@"Create New Emoji", @"Create New Emoji");
    [(UILabel *)v3->_createNewEmojiLabel setText:v11];

    v12 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
    [(UILabel *)v3->_createNewEmojiLabel setFont:v12];

    [(UILabel *)v3->_createNewEmojiLabel setTextAlignment:1];
    v13 = +[_UIIntelligenceLightSourceDescriptor sharedLight];
    [(UILabel *)v3->_createNewEmojiLabel _setLightSourceDescriptor:v13];

    [(UIView *)v3 addSubview:v3->_createNewEmojiLabel];
    v25 = (void *)MEMORY[0x1E4F5B268];
    v30 = [(UIView *)v3->_noResultsLabel bottomAnchor];
    v29 = [(UIView *)v3 centerYAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:-10.0];
    v32[0] = v28;
    v27 = [(UIView *)v3->_noResultsLabel centerXAnchor];
    v26 = [(UIView *)v3 centerXAnchor];
    v14 = [v27 constraintEqualToAnchor:v26];
    v32[1] = v14;
    v15 = [(UIView *)v3->_createNewEmojiLabel topAnchor];
    v16 = [(UIView *)v3 centerYAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:10.0];
    v32[2] = v17;
    v18 = [(UIView *)v3->_createNewEmojiLabel centerXAnchor];
    v19 = [(UIView *)v3 centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v32[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    [v25 activateConstraints:v21];

    [(UILabel *)v3->_createNewEmojiLabel setUserInteractionEnabled:1];
    [v3->_createNewEmojiLabel setAccessibilityTraits:1];
    v22 = v3->_createNewEmojiLabel;
    v23 = [[UITapGestureRecognizer alloc] initWithTarget:v3 action:sel_createNewEmoji];
    [(UIView *)v22 addGestureRecognizer:v23];
  }
  return v3;
}

- (void)setSupportsGenmoji:(BOOL)a3
{
  self->_supportsGenmoji = a3;
  [(UIView *)self->_createNewEmojiLabel setHidden:!a3];
}

- (void)createNewEmoji
{
  v2 = +[_UISignalAnalytics getIASignalGenmojiCreationCreateNewEmojiSelected];
  +[_UISignalAnalytics sendGenmojiCreationSignal:v2 payload:0];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UIEmojiAndStickerShouldCreateNotification" object:0 userInfo:0];
}

- (BOOL)supportsGenmoji
{
  return self->_supportsGenmoji;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createNewEmojiLabel, 0);
  objc_storeStrong((id *)&self->_noResultsLabel, 0);
}

@end