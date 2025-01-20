@interface CRLiOSPresetCollectionViewCell
- (UIButton)presetButton;
- (void)prepareForReuse;
- (void)setPresetButton:(id)a3;
@end

@implementation CRLiOSPresetCollectionViewCell

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSPresetCollectionViewCell;
  [(CRLiOSPresetCollectionViewCell *)&v4 prepareForReuse];
  v3 = [(CRLiOSPresetCollectionViewCell *)self presetButton];
  [v3 setImage:0 forState:0];
}

- (UIButton)presetButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presetButton);

  return (UIButton *)WeakRetained;
}

- (void)setPresetButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end