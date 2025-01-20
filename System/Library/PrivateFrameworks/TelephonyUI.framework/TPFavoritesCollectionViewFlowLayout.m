@interface TPFavoritesCollectionViewFlowLayout
- (TPFavoritesCollectionViewFlowLayout)init;
- (double)caption2FontScaledValueForValue:(double)a3;
@end

@implementation TPFavoritesCollectionViewFlowLayout

- (TPFavoritesCollectionViewFlowLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPFavoritesCollectionViewFlowLayout;
  v2 = [(UICollectionViewFlowLayout *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UICollectionViewFlowLayout *)v2 setMinimumInteritemSpacing:4.0];
    [(TPFavoritesCollectionViewFlowLayout *)v3 caption2FontScaledValueForValue:20.0];
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:");
    -[UICollectionViewFlowLayout setSectionInset:](v3, "setSectionInset:", 0.0, 0.0, 0.0, 0.0);
  }
  return v3;
}

- (double)caption2FontScaledValueForValue:(double)a3
{
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  [v4 _scaledValueForValue:a3];
  double v6 = ceil(v5);

  return v6;
}

@end