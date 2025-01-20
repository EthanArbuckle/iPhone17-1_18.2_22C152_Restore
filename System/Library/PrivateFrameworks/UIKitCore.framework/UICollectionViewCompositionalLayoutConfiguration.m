@interface UICollectionViewCompositionalLayoutConfiguration
+ (id)defaultConfiguration;
- (CGFloat)interSectionSpacing;
- (NSArray)boundarySupplementaryItems;
- (UICollectionViewCompositionalLayoutConfiguration)init;
- (UICollectionViewCompositionalLayoutConfiguration)initWithScrollDirection:(int64_t)a3 interSectionSpacing:(double)a4 boundarySupplememtaryItems:(id)a5 contentInsetsReference:(int64_t)a6;
- (UICollectionViewScrollDirection)scrollDirection;
- (UIContentInsetsReference)contentInsetsReference;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)differencesFromConfiguration:(id)a3;
- (void)setBoundarySupplementaryItems:(NSArray *)boundarySupplementaryItems;
- (void)setContentInsetsReference:(UIContentInsetsReference)contentInsetsReference;
- (void)setInterSectionSpacing:(CGFloat)interSectionSpacing;
- (void)setScrollDirection:(UICollectionViewScrollDirection)scrollDirection;
@end

@implementation UICollectionViewCompositionalLayoutConfiguration

- (UICollectionViewScrollDirection)scrollDirection
{
  return self->_scrollDirection;
}

- (void).cxx_destruct
{
}

- (CGFloat)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (void)setBoundarySupplementaryItems:(NSArray *)boundarySupplementaryItems
{
}

- (unint64_t)differencesFromConfiguration:(id)a3
{
  if (!a3)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"UICollectionViewCompositionalLayout.m", 2239, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  UICollectionViewScrollDirection v5 = [(UICollectionViewCompositionalLayoutConfiguration *)self scrollDirection];
  BOOL v6 = v5 != [a3 scrollDirection];
  [(UICollectionViewCompositionalLayoutConfiguration *)self interSectionSpacing];
  double v8 = v7;
  [a3 interSectionSpacing];
  if (vabdd_f64(v8, v9) <= 0.001) {
    uint64_t v10 = 2 * v6;
  }
  else {
    uint64_t v10 = (2 * v6) | 4;
  }
  v11 = [(UICollectionViewCompositionalLayoutConfiguration *)self boundarySupplementaryItems];
  v12 = [a3 boundarySupplementaryItems];
  int v13 = [v11 isEqualToArray:v12];

  if (v13) {
    unint64_t v14 = v10;
  }
  else {
    unint64_t v14 = v10 | 8;
  }
  UIContentInsetsReference v15 = [(UICollectionViewCompositionalLayoutConfiguration *)self contentInsetsReference];
  if (v15 == [a3 contentInsetsReference]) {
    return v14;
  }
  else {
    return v14 | 0x10;
  }
}

+ (id)defaultConfiguration
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 initWithScrollDirection:0 interSectionSpacing:MEMORY[0x1E4F1CBF0] boundarySupplememtaryItems:2 contentInsetsReference:0.0];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  UICollectionViewScrollDirection v5 = [(UICollectionViewCompositionalLayoutConfiguration *)self scrollDirection];
  [(UICollectionViewCompositionalLayoutConfiguration *)self interSectionSpacing];
  double v7 = v6;
  double v8 = [(UICollectionViewCompositionalLayoutConfiguration *)self boundarySupplementaryItems];
  double v9 = objc_msgSend(v4, "initWithScrollDirection:interSectionSpacing:boundarySupplememtaryItems:contentInsetsReference:", v5, v8, -[UICollectionViewCompositionalLayoutConfiguration contentInsetsReference](self, "contentInsetsReference"), v7);

  return v9;
}

- (NSArray)boundarySupplementaryItems
{
  return self->_boundarySupplementaryItems;
}

- (UICollectionViewCompositionalLayoutConfiguration)initWithScrollDirection:(int64_t)a3 interSectionSpacing:(double)a4 boundarySupplememtaryItems:(id)a5 contentInsetsReference:(int64_t)a6
{
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewCompositionalLayoutConfiguration;
  uint64_t v10 = [(UICollectionViewCompositionalLayoutConfiguration *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_contentInsetsReference = a6;
    v10->_scrollDirection = a3;
    v10->_interSectionSpacing = a4;
    if (a5)
    {
      uint64_t v12 = [a5 copy];
      boundarySupplementaryItems = v11->_boundarySupplementaryItems;
      v11->_boundarySupplementaryItems = (NSArray *)v12;
    }
    else
    {
      boundarySupplementaryItems = v10->_boundarySupplementaryItems;
      v10->_boundarySupplementaryItems = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v11;
}

- (UIContentInsetsReference)contentInsetsReference
{
  return self->_contentInsetsReference;
}

- (void)setContentInsetsReference:(UIContentInsetsReference)contentInsetsReference
{
  self->_contentInsetsReference = contentInsetsReference;
}

- (UICollectionViewCompositionalLayoutConfiguration)init
{
  return [(UICollectionViewCompositionalLayoutConfiguration *)self initWithScrollDirection:0 interSectionSpacing:MEMORY[0x1E4F1CBF0] boundarySupplememtaryItems:2 contentInsetsReference:0.0];
}

- (void)setScrollDirection:(UICollectionViewScrollDirection)scrollDirection
{
  self->_scrollDirection = scrollDirection;
}

- (void)setInterSectionSpacing:(CGFloat)interSectionSpacing
{
  self->_interSectionSpacing = interSectionSpacing;
}

@end