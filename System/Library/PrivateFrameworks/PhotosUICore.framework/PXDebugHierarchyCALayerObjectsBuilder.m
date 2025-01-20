@interface PXDebugHierarchyCALayerObjectsBuilder
+ (id)buildLayerTreeForDebugHierarchyWithIdentifier:(id)a3 provider:(id)a4 options:(unint64_t)a5;
+ (id)createObjectForElement:(id)a3 parentObject:(id)a4 options:(unint64_t)a5;
@end

@implementation PXDebugHierarchyCALayerObjectsBuilder

+ (id)createObjectForElement:(id)a3 parentObject:(id)a4 options:(unint64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  [v6 frame];
  if (v7)
  {
    [v7 bounds];
    PXRectFlippedVertically();
  }
  objc_msgSend(v8, "setFrame:", v9, v10, v11, v12);
  [v6 zPosition];
  objc_msgSend(v8, "setZPosition:");
  [v6 alpha];
  *(float *)&double v13 = v13;
  [v8 setOpacity:v13];
  objc_msgSend(v8, "setContents:", objc_msgSend(v6, "previewImage"));
  v14 = [v6 contentsGravity];
  [v8 setContentsGravity:v14];

  [v6 contentsRect];
  objc_msgSend(v8, "setContentsRect:");
  [v8 setMasksToBounds:1];
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v6, "backgroundColor"));
  v15 = [v6 name];
  [v8 setName:v15];

  [0 addSublayer:v8];
  return v8;
}

+ (id)buildLayerTreeForDebugHierarchyWithIdentifier:(id)a3 provider:(id)a4 options:(unint64_t)a5
{
  id v7 = [a1 buildObjectTreeForDebugHierarchyWithIdentifier:a3 provider:a4 options:a5];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      double v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      double v12 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
      [v9 handleFailureInMethod:a2, a1, @"PXDebugHierarchyCALayerObjectsBuilder.m", 19, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[self buildObjectTreeForDebugHierarchyWithIdentifier:identifier provider:provider options:options]", v11, v12 object file lineNumber description];
    }
  }
  return v7;
}

@end