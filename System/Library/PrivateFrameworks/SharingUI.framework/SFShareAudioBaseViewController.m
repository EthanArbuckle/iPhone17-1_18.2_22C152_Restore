@interface SFShareAudioBaseViewController
- (BOOL)viewActive;
- (SFShareAudioViewController)mainController;
- (UILabel)titleLabel;
- (UIView)cardView;
- (void)setCardView:(id)a3;
- (void)setMainController:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setViewActive:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFShareAudioBaseViewController

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFShareAudioBaseViewController;
  [(SFShareAudioBaseViewController *)&v7 viewWillAppear:a3];
  self->_viewActive = 1;
  char v4 = [(SFShareAudioViewController *)self->_mainController flags];
  if ((v4 & 2) != 0)
  {
    v5 = [MEMORY[0x263F825C8] darkGrayColor];
    [(UIView *)self->_cardView setBackgroundColor:v5];
  }
  if (v4) {
    [(UIView *)self->_cardView _setContinuousCornerRadius:0.0];
  }
  v6 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83610] variant:1280];
  [(UILabel *)self->_titleLabel setFont:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFShareAudioBaseViewController;
  [(SFShareAudioBaseViewController *)&v4 viewWillDisappear:a3];
  self->_viewActive = 0;
}

- (SFShareAudioViewController)mainController
{
  return self->_mainController;
}

- (void)setMainController:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
}

- (BOOL)viewActive
{
  return self->_viewActive;
}

- (void)setViewActive:(BOOL)a3
{
  self->_viewActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mainController, 0);
}

@end