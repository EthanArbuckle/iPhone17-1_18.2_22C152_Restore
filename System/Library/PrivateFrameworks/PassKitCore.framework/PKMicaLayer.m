@interface PKMicaLayer
- (CALayer)rootLayer;
- (CGSize)boundsSizeToMatchPointScale:(double)a3;
- (NSDictionary)publishedColorLayers;
- (NSDictionary)publishedColorShapeLayers;
- (PKMicaLayer)init;
- (PKMicaLayer)initWithFrame:(CGRect)a3;
- (PKMicaLayer)initWithFrame:(CGRect)a3 package:(id)a4;
- (double)pointScaleToMatchBoundsSize:(CGSize)a3;
- (void)dealloc;
- (void)layoutSublayers;
@end

@implementation PKMicaLayer

- (PKMicaLayer)init
{
  return -[PKMicaLayer initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

- (PKMicaLayer)initWithFrame:(CGRect)a3
{
  return -[PKMicaLayer initWithFrame:package:](self, "initWithFrame:package:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKMicaLayer)initWithFrame:(CGRect)a3 package:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v10 = v9;
  if (!v9)
  {

    v43 = 0;
    goto LABEL_33;
  }
  v11 = [v9 rootLayer];
  objc_msgSend(v11, "setGeometryFlipped:", objc_msgSend(v10, "isGeometryFlipped"));
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  v71.origin.double x = x;
  v71.origin.double y = y;
  v71.size.double width = width;
  v71.size.double height = height;
  if (CGRectIsNull(v71))
  {
    double x = *MEMORY[0x1E4F1DAD8];
    double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double width = v13 * 0.5;
    double height = v15 * 0.5;
  }
  if (!v11)
  {

    goto LABEL_31;
  }
  v68.receiver = self;
  v68.super_class = (Class)PKMicaLayer;
  v16 = [(PKMicaLayer *)&v68 init];
  if (!v16)
  {
LABEL_31:
    v43 = 0;
    goto LABEL_32;
  }
  p_isa = (id *)&v16->super.super.isa;
  v18 = PKLayerNullActions();
  [p_isa setActions:v18];

  objc_msgSend(p_isa, "setFrame:", x, y, width, height);
  v54 = v11;
  objc_storeStrong(p_isa + 4, v11);
  id v19 = p_isa[4];
  v20 = PKLayerNullActions();
  [v19 setActions:v20];

  objc_msgSend(p_isa[4], "setAnchorPoint:", 0.5, 0.5);
  id v21 = p_isa[4];
  CGFloat v22 = fmin(width / v13, height / v15);
  CATransform3DMakeScale(&v67, v22, v22, 1.0);
  [v21 setTransform:&v67];
  v53 = (PKMicaLayer *)p_isa;
  [p_isa addSublayer:p_isa[4]];
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v65 = v23;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__PKMicaLayer_initWithFrame_package___block_invoke;
  aBlock[3] = &unk_1E56F6178;
  id v51 = v66;
  id v64 = v51;
  v24 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __37__PKMicaLayer_initWithFrame_package___block_invoke_2;
  v61[3] = &unk_1E56F61A0;
  id v52 = v23;
  id v62 = v52;
  v55 = (void (**)(void *, void *, void *))_Block_copy(v61);
  context = (void *)MEMORY[0x192FDC630]();
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28FD8]), "initWithPattern:options:error:", @"^\\((layer|shape)(?::([^\\)]+))?\\(?::.+)?$"), 0, 0);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v56 = v10;
  v26 = [v10 publishedObjectNames];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (!v27) {
    goto LABEL_24;
  }
  uint64_t v28 = v27;
  uint64_t v29 = *(void *)v58;
  do
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v58 != v29) {
        objc_enumerationMutation(v26);
      }
      v31 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      v32 = objc_msgSend(v25, "firstMatchInString:options:range:", v31, 4, 0, objc_msgSend(v31, "length"));
      unint64_t v33 = [v32 numberOfRanges];
      if (v33 >= 2)
      {
        unint64_t v34 = v33;
        uint64_t v35 = [v32 rangeAtIndex:1];
        v37 = objc_msgSend(v31, "substringWithRange:", v35, v36);
        if (v34 == 2 || (uint64_t v38 = [v32 rangeAtIndex:2], !v39))
        {
          v40 = 0;
        }
        else
        {
          v40 = objc_msgSend(v31, "substringWithRange:", v38, v39);
        }
        if ([v37 isEqualToString:@"layer"])
        {
          v41 = [v56 publishedObjectWithName:v31];
          v24[2](v24, v41, v40);
          goto LABEL_20;
        }
        if ([v37 isEqualToString:@"shape"])
        {
          v41 = [v56 publishedObjectWithName:v31];
          v55[2](v55, v41, v40);
LABEL_20:
        }
      }
    }
    uint64_t v28 = [v26 countByEnumeratingWithState:&v57 objects:v69 count:16];
  }
  while (v28);
LABEL_24:

  v42 = (void *)MEMORY[0x192FDC630]();
  v43 = v53;
  if ([v51 count])
  {
    uint64_t v44 = __37__PKMicaLayer_initWithFrame_package___block_invoke_3(&v66);
    publishedColorLayers = v53->_publishedColorLayers;
    v53->_publishedColorLayers = (NSDictionary *)v44;
  }
  id v46 = v52;
  v11 = v54;
  if ([v52 count])
  {
    uint64_t v47 = __37__PKMicaLayer_initWithFrame_package___block_invoke_3(&v65);
    publishedColorShapeLayers = v53->_publishedColorShapeLayers;
    v53->_publishedColorShapeLayers = (NSDictionary *)v47;

    id v46 = v65;
  }

  v10 = v56;
LABEL_32:

LABEL_33:
  return v43;
}

void __37__PKMicaLayer_initWithFrame_package___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  v5 = a3;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v5) {
        v5 = &stru_1EE0F5368;
      }
      id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      if (!v6)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
      }
      [v6 addObject:v7];
    }
  }
}

void __37__PKMicaLayer_initWithFrame_package___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  v5 = a3;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v5) {
        v5 = &stru_1EE0F5368;
      }
      id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      if (!v6)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
      }
      [v6 addObject:v7];
    }
  }
}

id __37__PKMicaLayer_initWithFrame_package___block_invoke_3(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = *a1;
  v3 = [v2 allKeys];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v2 objectForKeyedSubscript:v8];
        v10 = (void *)[v9 copy];
        [v2 setObject:v10 forKeyedSubscript:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  id v11 = *a1;
  *a1 = 0;

  double v12 = (void *)[v2 copy];
  return v12;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKMicaLayer;
  [(PKMicaLayer *)&v2 dealloc];
}

- (void)layoutSublayers
{
  v15.receiver = self;
  v15.super_class = (Class)PKMicaLayer;
  [(PKMicaLayer *)&v15 layoutSublayers];
  [(PKMicaLayer *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[PKMicaLayer pointScaleToMatchBoundsSize:](self, "pointScaleToMatchBoundsSize:", v7, v9);
  rootLayer = self->_rootLayer;
  CATransform3DMakeScale(&v14, v12 * 0.5, v12 * 0.5, 1.0);
  [(CALayer *)rootLayer setTransform:&v14];
  v16.origin.double x = v4;
  v16.origin.double y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  double MidX = CGRectGetMidX(v16);
  v17.origin.double x = v4;
  v17.origin.double y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  -[CALayer setPosition:](self->_rootLayer, "setPosition:", MidX, CGRectGetMidY(v17));
}

- (double)pointScaleToMatchBoundsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CALayer *)self->_rootLayer bounds];
  double v7 = width / v6;
  double v8 = 0.0;
  if (v6 == 0.0) {
    double v7 = 0.0;
  }
  if (v5 != 0.0) {
    double v8 = height / v5;
  }
  double v9 = fmin(v7, v8);
  return v9 + v9;
}

- (CGSize)boundsSizeToMatchPointScale:(double)a3
{
  double v3 = a3 * 0.5;
  [(CALayer *)self->_rootLayer bounds];
  double v5 = v3 * v4;
  double v7 = v3 * v6;
  result.double height = v7;
  result.double width = v5;
  return result;
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (NSDictionary)publishedColorLayers
{
  return self->_publishedColorLayers;
}

- (NSDictionary)publishedColorShapeLayers
{
  return self->_publishedColorShapeLayers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishedColorShapeLayers, 0);
  objc_storeStrong((id *)&self->_publishedColorLayers, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
}

@end