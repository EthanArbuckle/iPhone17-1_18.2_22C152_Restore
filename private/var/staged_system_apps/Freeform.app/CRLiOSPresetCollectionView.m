@interface CRLiOSPresetCollectionView
- (CRLiOSPresetCollectionViewDelegate)presetCollectionViewDelegate;
- (void)layoutSubviews;
- (void)setPresetCollectionViewDelegate:(id)a3;
@end

@implementation CRLiOSPresetCollectionView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSPresetCollectionView;
  [(CRLiOSPresetCollectionView *)&v4 layoutSubviews];
  v3 = [(CRLiOSPresetCollectionView *)self presetCollectionViewDelegate];
  [v3 presetCollectionViewDidLayoutSubviews:self];
}

- (CRLiOSPresetCollectionViewDelegate)presetCollectionViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presetCollectionViewDelegate);

  return (CRLiOSPresetCollectionViewDelegate *)WeakRetained;
}

- (void)setPresetCollectionViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end