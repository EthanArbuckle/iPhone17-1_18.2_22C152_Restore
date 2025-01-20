@interface CRLCanvasSubview
+ (Class)layerClass;
- (BOOL)containsView:(id)a3;
- (CALayerDelegate)layerDelegate;
- (CRLCanvasSubview)initWithFrame:(CGRect)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setLayerDelegate:(id)a3;
- (void)setSubviews:(id)a3;
@end

@implementation CRLCanvasSubview

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CRLCanvasSubview)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasSubview;
  v3 = -[CRLCanvasSubview initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CRLCanvasSubview *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v4;
}

- (void)setSubviews:(id)a3
{
  id v4 = a3;
  v5 = [(CRLCanvasSubview *)self subviews];
  unsigned __int8 v6 = [v5 isEqualToArray:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_alloc((Class)NSMutableOrderedSet);
    v8 = [(CRLCanvasSubview *)self subviews];
    id v9 = [v7 initWithArray:v8];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v9 containsObject:v15])
          {
            v16 = [(CRLCanvasSubview *)self subviews];
            v17 = [v16 lastObject];

            if (v15 != v17)
            {
              v18 = [v15 superview];

              if (v18 == self)
              {
                [(CRLCanvasSubview *)self bringSubviewToFront:v15];
              }
              else
              {
                [v15 removeFromSuperview];
                [(CRLCanvasSubview *)self addSubview:v15];
              }
            }
            [v9 removeObject:v15];
          }
          else
          {
            [(CRLCanvasSubview *)self addSubview:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = v9;
    id v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) removeFromSuperview];
        }
        id v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v21);
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasSubview;
  -[CRLCanvasSubview hitTest:withEvent:](&v7, "hitTest:withEvent:", a4, a3.x, a3.y);
  v5 = (CRLCanvasSubview *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }

  return v5;
}

- (BOOL)containsView:(id)a3
{
  return [a3 isDescendantOfView:self];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CRLCanvasSubview *)self layerDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v8 actionForLayer:v6 forKey:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  if (+[NSThread isMainThread])
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLCanvasSubview;
    [(CRLCanvasSubview *)&v5 layoutSublayersOfLayer:v4];
  }
}

- (CALayerDelegate)layerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerDelegate);

  return (CALayerDelegate *)WeakRetained;
}

- (void)setLayerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end