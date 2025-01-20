@interface PXToastConfiguration
- (BOOL)canSwipeToDismiss;
- (NSString)iconSystemImageName;
- (NSString)message;
- (PXToastConfiguration)init;
- (UIView)contentView;
- (UIView)sourceView;
- (double)autoDismissalDelay;
- (double)bottomMargin;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAutoDismissalDelay:(double)a3;
- (void)setBottomMargin:(double)a3;
- (void)setCanSwipeToDismiss:(BOOL)a3;
- (void)setContentView:(id)a3;
- (void)setIconSystemImageName:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSourceView:(id)a3;
@end

@implementation PXToastConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_iconSystemImageName, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setCanSwipeToDismiss:(BOOL)a3
{
  self->_canSwipeToDismiss = a3;
}

- (BOOL)canSwipeToDismiss
{
  return self->_canSwipeToDismiss;
}

- (void)setAutoDismissalDelay:(double)a3
{
  self->_autoDismissalDelay = a3;
}

- (double)autoDismissalDelay
{
  return self->_autoDismissalDelay;
}

- (void)setIconSystemImageName:(id)a3
{
}

- (NSString)iconSystemImageName
{
  return self->_iconSystemImageName;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PXToastConfiguration *)self message];
  [v4 setMessage:v5];

  v6 = [(PXToastConfiguration *)self iconSystemImageName];
  [v4 setIconSystemImageName:v6];

  [(PXToastConfiguration *)self autoDismissalDelay];
  objc_msgSend(v4, "setAutoDismissalDelay:");
  objc_msgSend(v4, "setCanSwipeToDismiss:", -[PXToastConfiguration canSwipeToDismiss](self, "canSwipeToDismiss"));
  v7 = [(PXToastConfiguration *)self contentView];
  [v4 setContentView:v7];

  v8 = [(PXToastConfiguration *)self sourceView];
  [v4 setSourceView:v8];

  [(PXToastConfiguration *)self bottomMargin];
  objc_msgSend(v4, "setBottomMargin:");
  return v4;
}

- (PXToastConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXToastConfiguration;
  result = [(PXToastConfiguration *)&v3 init];
  if (result) {
    result->_bottomMargin = 120.0;
  }
  return result;
}

@end