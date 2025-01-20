@interface _UIContentInsetsEnvironment
+ (id)insetEnvironmentForInsetReference:(double)a3 safeAreaInsets:(double)a4 layoutMarginsInsets:(double)a5 readableContentInsets:(double)a6 scrollAccessoryInsets:(double)a7;
+ (id)insetEnvironmentForScrollView:(id)a3 insetReference:(int64_t)a4;
+ (id)insetEnvironmentForView:(id)a3 insetReference:(int64_t)a4;
+ (id)insetEnvironmentFromParentEnvironment:(id)a3 insetReference:(int64_t)a4;
+ (id)nullEnvironment;
- (BOOL)isEqual:(id)a3;
- (NSDirectionalEdgeInsets)effectiveInsets;
- (NSDirectionalEdgeInsets)layoutMarginsInsets;
- (NSDirectionalEdgeInsets)readableContentInsets;
- (NSDirectionalEdgeInsets)safeAreaInsets;
- (NSDirectionalEdgeInsets)scrollAccessoryInsets;
- (NSString)description;
- (double)initWithInsetReference:(double)a3 safeAreaInsets:(double)a4 layoutMarginsInsets:(double)a5 readableContentInsets:(double)a6 scrollAccessoryInsets:(double)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layoutContainerForContainerSize:(CGSize)a3 layoutAxis:(unint64_t)a4;
- (id)layoutContainerForInsetReference:(int64_t)a3 containerSize:(CGSize)a4 layoutAxis:(unint64_t)a5;
- (int64_t)insetReference;
- (void)setInsetReference:(int64_t)a3;
- (void)setLayoutMarginsInsets:(NSDirectionalEdgeInsets)a3;
- (void)setReadableContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setSafeAreaInsets:(NSDirectionalEdgeInsets)a3;
- (void)setScrollAccessoryInsets:(NSDirectionalEdgeInsets)a3;
@end

@implementation _UIContentInsetsEnvironment

- (NSDirectionalEdgeInsets)effectiveInsets
{
  v2 = &NSDirectionalEdgeInsetsZero;
  p_leading = &NSDirectionalEdgeInsetsZero.leading;
  p_trailing = &NSDirectionalEdgeInsetsZero.trailing;
  p_bottom = &NSDirectionalEdgeInsetsZero.bottom;
  int64_t insetReference = self->_insetReference;
  p_readableContentInsets = &self->_readableContentInsets;
  v8 = &self->_readableContentInsets.leading;
  v9 = &self->_readableContentInsets.bottom;
  v10 = &self->_readableContentInsets.trailing;
  p_layoutMarginsInsets = &self->_layoutMarginsInsets;
  v12 = &self->_layoutMarginsInsets.leading;
  v13 = &self->_layoutMarginsInsets.bottom;
  v14 = &self->_layoutMarginsInsets.trailing;
  p_safeAreaInsets = &self->_safeAreaInsets;
  v16 = &self->_safeAreaInsets.leading;
  v17 = &self->_safeAreaInsets.bottom;
  v18 = &self->_safeAreaInsets.trailing;
  if (insetReference == 2)
  {
    p_bottom = v17;
    p_trailing = v18;
    p_leading = v16;
    v2 = p_safeAreaInsets;
  }
  if (insetReference == 3)
  {
    p_bottom = v13;
    p_trailing = v14;
    p_leading = v12;
    v2 = p_layoutMarginsInsets;
  }
  if (insetReference == 4)
  {
    p_bottom = v9;
    p_trailing = v10;
    p_leading = v8;
    v2 = p_readableContentInsets;
  }
  double top = v2->top;
  double v20 = *p_leading;
  double v21 = *p_trailing;
  double v22 = *p_bottom;
  result.trailing = v21;
  result.bottom = v22;
  result.leading = v20;
  result.double top = top;
  return result;
}

- (NSDirectionalEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double leading = self->_safeAreaInsets.leading;
  double bottom = self->_safeAreaInsets.bottom;
  double trailing = self->_safeAreaInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSDirectionalEdgeInsets)layoutMarginsInsets
{
  double top = self->_layoutMarginsInsets.top;
  double leading = self->_layoutMarginsInsets.leading;
  double bottom = self->_layoutMarginsInsets.bottom;
  double trailing = self->_layoutMarginsInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

+ (id)nullEnvironment
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___UIContentInsetsEnvironment_nullEnvironment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25F4A8 != -1) {
    dispatch_once(&qword_1EB25F4A8, block);
  }
  v2 = (void *)qword_1EB25F4B0;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int64_t v5 = [(_UIContentInsetsEnvironment *)self insetReference],
        v5 == [v4 insetReference]))
  {
    [(_UIContentInsetsEnvironment *)self safeAreaInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v4 safeAreaInsets];
    BOOL v17 = 0;
    if (v9 == v18 && v7 == v14 && v13 == v16 && v11 == v15)
    {
      [(_UIContentInsetsEnvironment *)self layoutMarginsInsets];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      [v4 layoutMarginsInsets];
      BOOL v17 = 0;
      if (v22 == v30 && v20 == v27 && v26 == v29 && v24 == v28)
      {
        [(_UIContentInsetsEnvironment *)self readableContentInsets];
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        [v4 readableContentInsets];
        BOOL v17 = 0;
        if (v34 == v42 && v32 == v39 && v38 == v41 && v36 == v40)
        {
          [(_UIContentInsetsEnvironment *)self scrollAccessoryInsets];
          double v44 = v43;
          double v46 = v45;
          double v48 = v47;
          double v50 = v49;
          [v4 scrollAccessoryInsets];
          BOOL v54 = v46 == v53;
          if (v44 != v55) {
            BOOL v54 = 0;
          }
          if (v50 != v52) {
            BOOL v54 = 0;
          }
          BOOL v17 = v48 == v51 && v54;
        }
      }
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (id)insetEnvironmentFromParentEnvironment:(id)a3 insetReference:(int64_t)a4
{
  int64_t v4 = a4;
  if (!a4)
  {
    unint64_t v7 = [a3 insetReference];
    if (v7 <= 1) {
      int64_t v4 = 1;
    }
    else {
      int64_t v4 = v7;
    }
  }
  [a3 safeAreaInsets];
  double v35 = v9;
  double v36 = v8;
  double v33 = v11;
  double v34 = v10;
  [a3 layoutMarginsInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [a3 readableContentInsets];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  [a3 scrollAccessoryInsets];
  return (id)objc_msgSend(a1, "insetEnvironmentForInsetReference:safeAreaInsets:layoutMarginsInsets:readableContentInsets:scrollAccessoryInsets:", v4, v36, v35, v34, v33, v13, v15, v17, v19, v21, v23, v25, v27, v28, v29, v30, v31);
}

+ (id)insetEnvironmentForInsetReference:(double)a3 safeAreaInsets:(double)a4 layoutMarginsInsets:(double)a5 readableContentInsets:(double)a6 scrollAccessoryInsets:(double)a7
{
  uint64_t v22 = objc_msgSend([a1 alloc], "initWithInsetReference:safeAreaInsets:layoutMarginsInsets:readableContentInsets:scrollAccessoryInsets:", a11, a2, a3, a4, a5, a6, a7, a8, a9, a17, a18, a19, a20, a21, a22);
  return v22;
}

- (double)initWithInsetReference:(double)a3 safeAreaInsets:(double)a4 layoutMarginsInsets:(double)a5 readableContentInsets:(double)a6 scrollAccessoryInsets:(double)a7
{
  v34.receiver = a1;
  v34.super_class = (Class)_UIContentInsetsEnvironment;
  NSDirectionalEdgeInsets result = (double *)objc_msgSendSuper2(&v34, sel_init);
  if (result)
  {
    *((void *)result + 1) = a11;
    result[2] = a2;
    result[3] = a3;
    result[4] = a4;
    result[5] = a5;
    result[6] = a6;
    result[7] = a7;
    result[8] = a8;
    result[9] = a9;
    *((void *)result + 10) = a17;
    *((void *)result + 11) = a18;
    *((void *)result + 12) = a19;
    *((void *)result + 13) = a20;
    *((void *)result + 14) = a21;
    *((void *)result + 15) = a22;
    *((void *)result + 16) = a23;
    *((void *)result + 17) = a24;
  }
  return result;
}

- (NSDirectionalEdgeInsets)scrollAccessoryInsets
{
  double top = self->_scrollAccessoryInsets.top;
  double leading = self->_scrollAccessoryInsets.leading;
  double bottom = self->_scrollAccessoryInsets.bottom;
  double trailing = self->_scrollAccessoryInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSDirectionalEdgeInsets)readableContentInsets
{
  double top = self->_readableContentInsets.top;
  double leading = self->_readableContentInsets.leading;
  double bottom = self->_readableContentInsets.bottom;
  double trailing = self->_readableContentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (id)layoutContainerForContainerSize:(CGSize)a3 layoutAxis:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = [(_UIContentInsetsEnvironment *)self insetReference];
  double v12 = _UIDirectionalEdgesForContentInsetEnvironment(self, v8, a4, v9, v10, v11);
  double v16 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:insetsEnvironment:]([_UICollectionLayoutContainer alloc], self, width, height, v12, v13, v14, v15);
  return v16;
}

- (int64_t)insetReference
{
  return self->_insetReference;
}

+ (id)insetEnvironmentForScrollView:(id)a3 insetReference:(int64_t)a4
{
  int64_t v5 = [a1 insetEnvironmentForView:a3 insetReference:a4];
  [a3 _directionalAccessoryEdgeInsets];
  objc_msgSend(v5, "setScrollAccessoryInsets:");
  return v5;
}

- (void)setScrollAccessoryInsets:(NSDirectionalEdgeInsets)a3
{
  self->_scrollAccessoryInsets = a3;
}

+ (id)insetEnvironmentForView:(id)a3 insetReference:(int64_t)a4
{
  [a3 safeAreaInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (a3)
  {
    uint64_t v15 = [a3 effectiveUserInterfaceLayoutDirection];
    if (v15 == 1) {
      double v16 = v10;
    }
    else {
      double v16 = v14;
    }
    if (v15 == 1) {
      double v10 = v14;
    }
    double v14 = v16;
  }
  [a3 directionalLayoutMargins];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v25 = -[UIView _directionalReadableContentInsets](a3);
  return (id)objc_msgSend(a1, "insetEnvironmentForInsetReference:safeAreaInsets:layoutMarginsInsets:readableContentInsets:scrollAccessoryInsets:", a4, v8, v10, v12, v14, v18, v20, v22, v24, *(void *)&v25, v26, v27, v28, 0, 0, 0, 0);
}

- (id)layoutContainerForInsetReference:(int64_t)a3 containerSize:(CGSize)a4 layoutAxis:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  double v9 = _UIDirectionalEdgesForContentInsetEnvironment(self, a3, a5, a4.width, a4.height, v5);
  double v13 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:insetsEnvironment:]([_UICollectionLayoutContainer alloc], self, width, height, v9, v10, v11, v12);
  return v13;
}

- (NSString)description
{
  v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  unint64_t insetReference = self->_insetReference;
  if (insetReference >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown value: %ld)", self->_insetReference);
    double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v7 = off_1E52E1300[insetReference];
  }
  [(_UIContentInsetsEnvironment *)self effectiveInsets];
  double v8 = NSStringFromDirectionalEdgeInsets(v12);
  double v9 = [v3 stringWithFormat:@"<%@ %p: insetReference=%@ insets=%@>", v5, self, v7, v8];;

  return (NSString *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(_UIContentInsetsEnvironment *)self insetReference];
  [(_UIContentInsetsEnvironment *)self safeAreaInsets];
  double v33 = v7;
  double v34 = v6;
  double v31 = v9;
  double v32 = v8;
  [(_UIContentInsetsEnvironment *)self layoutMarginsInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(_UIContentInsetsEnvironment *)self readableContentInsets];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  [(_UIContentInsetsEnvironment *)self scrollAccessoryInsets];
  return (id)objc_msgSend(v4, "initWithInsetReference:safeAreaInsets:layoutMarginsInsets:readableContentInsets:scrollAccessoryInsets:", v5, v34, v33, v32, v31, v11, v13, v15, v17, v19, v21, v23, v25, v26, v27, v28, v29);
}

- (void)setInsetReference:(int64_t)a3
{
  self->_unint64_t insetReference = a3;
}

- (void)setSafeAreaInsets:(NSDirectionalEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (void)setLayoutMarginsInsets:(NSDirectionalEdgeInsets)a3
{
  self->_layoutMarginsInsets = a3;
}

- (void)setReadableContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_readableContentInsets = a3;
}

@end