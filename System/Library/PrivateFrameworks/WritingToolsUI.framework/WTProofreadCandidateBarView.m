@interface WTProofreadCandidateBarView
- (CGSize)intrinsicContentSize;
- (UILabel)badgeView;
- (WTProofreadCandidateBarView)init;
- (void)setBadgeView:(id)a3;
- (void)setSuggestionCount:(unint64_t)a3;
@end

@implementation WTProofreadCandidateBarView

- (WTProofreadCandidateBarView)init
{
  id v3 = objc_alloc(MEMORY[0x263F82FE0]);
  v4 = [MEMORY[0x263F82FF8] sharedLight];
  v5 = (void *)[v3 initWithLightSource:v4];
  v15.receiver = self;
  v15.super_class = (Class)WTProofreadCandidateBarView;
  v6 = [(WTProofreadCandidateBarView *)&v15 initWithEffect:v5];

  if (v6)
  {
    [(WTProofreadCandidateBarView *)v6 setUserInteractionEnabled:0];
    [(WTProofreadCandidateBarView *)v6 setExclusiveTouch:0];
    v7 = [MEMORY[0x263F827E8] systemImageNamed:@"text.magnifyingglass"];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    badgeView = v6->_badgeView;
    v6->_badgeView = v8;

    v10 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v6->_badgeView setFont:v10];

    v11 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v7];
    [v11 setContentMode:1];
    v12 = [(WTProofreadCandidateBarView *)v6 contentView];
    [v12 addSubview:v11];

    v13 = [(WTProofreadCandidateBarView *)v6 contentView];
    [v13 addSubview:v6->_badgeView];

    -[WTProofreadCandidateBarView setFrame:](v6, "setFrame:", 0.0, 0.0, 50.0, 48.0);
    objc_msgSend(v11, "setFrame:", 12.0, 12.0, 24.0, 24.0);
    -[UILabel setFrame:](v6->_badgeView, "setFrame:", 30.0, 6.0, 14.0, 16.0);
  }
  return v6;
}

- (void)setSuggestionCount:(unint64_t)a3
{
  v4 = (void *)MEMORY[0x263F08A30];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [v4 localizedStringFromNumber:v7 numberStyle:0];
  v6 = [(WTProofreadCandidateBarView *)self badgeView];
  [v6 setText:v5];
}

- (CGSize)intrinsicContentSize
{
  [(WTProofreadCandidateBarView *)self frame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (UILabel)badgeView
{
  return (UILabel *)objc_getProperty(self, a2, 536, 1);
}

- (void)setBadgeView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end