@interface CRLCanvasRootLayout
- (BOOL)isRootLayoutForInspectorGeometry;
- (BOOL)isRootLevelForInlineGeometry;
- (BOOL)providesGuidesForChildLayouts;
- (CRLCanvasLayoutController)layoutController;
- (CRLCanvasRootLayout)initWithLayoutController:(id)a3;
- (id)childLayoutsInRect:(CGRect)a3 deep:(BOOL)a4;
@end

@implementation CRLCanvasRootLayout

- (CRLCanvasRootLayout)initWithLayoutController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasRootLayout;
  v5 = [(CRLCanvasAbstractLayout *)&v8 init];
  v6 = (CRLCanvasRootLayout *)v5;
  if (v5) {
    objc_storeWeak((id *)(v5 + 74), v4);
  }

  return v6;
}

- (id)childLayoutsInRect:(CGRect)a3 deep:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = [(CRLCanvasAbstractLayout *)self children];
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) addLayoutsInRect:v10 toArray:v4 deep:x y:y width:width height:height];
      }
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  return v10;
}

- (BOOL)providesGuidesForChildLayouts
{
  return 1;
}

- (BOOL)isRootLayoutForInspectorGeometry
{
  return 1;
}

- (BOOL)isRootLevelForInlineGeometry
{
  return 1;
}

- (CRLCanvasLayoutController)layoutController
{
  id WeakRetained = objc_loadWeakRetained((id *)(&self->super._lastInterimPositionYSet + 1));

  return (CRLCanvasLayoutController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end