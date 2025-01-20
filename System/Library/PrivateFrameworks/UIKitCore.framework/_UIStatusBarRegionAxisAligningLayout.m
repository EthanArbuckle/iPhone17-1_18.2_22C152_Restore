@interface _UIStatusBarRegionAxisAligningLayout
+ (id)aligningLayoutWithAlignment:(int64_t)a3;
- (BOOL)canOverflowItems;
- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6;
- (int64_t)alignment;
- (void)setAlignment:(int64_t)a3;
@end

@implementation _UIStatusBarRegionAxisAligningLayout

+ (id)aligningLayoutWithAlignment:(int64_t)a3
{
  v4 = objc_alloc_init(_UIStatusBarRegionAxisAligningLayout);
  [(_UIStatusBarRegionAxisAligningLayout *)v4 setAlignment:a3];
  return v4;
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = a3;
  v12 = [v10 array];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101___UIStatusBarRegionAxisAligningLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v18[3] = &unk_1E5305710;
  int64_t v21 = a6;
  v18[4] = self;
  id v13 = v12;
  id v19 = v13;
  id v20 = v9;
  id v14 = v9;
  [v11 enumerateObjectsUsingBlock:v18];

  v15 = v20;
  id v16 = v13;

  return v16;
}

- (BOOL)canOverflowItems
{
  return 0;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

@end