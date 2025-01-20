@interface _UICollectionPreferredSize
+ (double)preferredSizeForOriginalSize:(double)a3 fittingSize:(uint64_t)a4 layoutSize:(void *)a5;
- (double)fittingSize;
- (double)preferredSizeForOriginalSize:(double)a3 layoutSize:(double)a4;
- (id)description;
- (id)initWithOriginalSize:(void *)a3 fittingSize:(double)a4 layoutSize:(double)a5 additionalData:(double)a6;
@end

@implementation _UICollectionPreferredSize

+ (double)preferredSizeForOriginalSize:(double)a3 fittingSize:(uint64_t)a4 layoutSize:(void *)a5
{
  self;
  v8 = [a5 widthDimension];
  int v9 = [v8 isEstimated];

  if (!v9) {
    a3 = a1;
  }
  v10 = [a5 heightDimension];
  [v10 isEstimated];

  return a3;
}

- (double)fittingSize
{
  if (a1) {
    return *(double *)(a1 + 24);
  }
  else {
    return 0.0;
  }
}

- (id)initWithOriginalSize:(void *)a3 fittingSize:(double)a4 layoutSize:(double)a5 additionalData:(double)a6
{
  if (!a1) {
    return 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)_UICollectionPreferredSize;
  v13 = (id *)objc_msgSendSuper2(&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    *((double *)v13 + 1) = a4;
    *((double *)v13 + 2) = a5;
    *((double *)v13 + 3) = a6;
    *((double *)v13 + 4) = a7;
    objc_storeStrong(v13 + 5, a2);
    objc_storeStrong(v14 + 7, a3);
    *((unsigned char *)v14 + 48) = 0;
  }
  return v14;
}

- (double)preferredSizeForOriginalSize:(double)a3 layoutSize:(double)a4
{
  if (a1) {
    return +[_UICollectionPreferredSize preferredSizeForOriginalSize:*(double *)(a1 + 24) fittingSize:(uint64_t)_UICollectionPreferredSize layoutSize:a2];
  }
  else {
    return 0.0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalData, 0);
  objc_storeStrong((id *)&self->_layoutSize, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromCGSize(self->_originalSize);
  uint64_t v7 = NSStringFromCGSize(self->_fittingSize);
  v8 = (void *)v7;
  if (self->_preferredSizeDirty) {
    int v9 = @"; DIRTY";
  }
  else {
    int v9 = &stru_1ED0E84C0;
  }
  v10 = [v3 stringWithFormat:@"<%@ - %p: original=%@ fitting=%@%@>", v5, self, v6, v7, v9];;

  return v10;
}

@end