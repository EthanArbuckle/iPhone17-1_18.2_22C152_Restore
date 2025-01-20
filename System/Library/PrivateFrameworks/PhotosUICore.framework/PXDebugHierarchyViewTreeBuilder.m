@interface PXDebugHierarchyViewTreeBuilder
+ (id)createObjectForElement:(id)a3 parentObject:(id)a4 options:(unint64_t)a5;
@end

@implementation PXDebugHierarchyViewTreeBuilder

+ (id)createObjectForElement:(id)a3 parentObject:(id)a4 options:(unint64_t)a5
{
  id v6 = a4;
  id v7 = a3;
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = v6;
  v17 = objc_alloc_init(PXDebug);
  -[PXDebug setFrame:](v17, "setFrame:", v9, v11, v13, v15);
  [v7 alpha];
  -[PXDebug setAlpha:](v17, "setAlpha:");
  -[PXDebug setPreviewImage:](v17, "setPreviewImage:", [v7 previewImage]);
  -[PXDebug setBackgroundColor:](v17, "setBackgroundColor:", [v7 backgroundColor]);
  v18 = [v7 name];

  [(PXDebug *)v17 setName:v18];
  [v16 addSubview:v17];

  return v17;
}

@end