@interface _UICAMLPackageView
- (BOOL)setState:(id)a3;
- (BOOL)setState:(id)a3 animated:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)publishedObjectNames;
- (_UICAMLPackageView)initWithPackageName:(id)a3 inBundle:(id)a4;
- (_UICAMLPackageView)initWithURL:(id)a3;
- (id)publishedObjectWithName:(id)a3;
- (void)layoutSubviews;
@end

@implementation _UICAMLPackageView

- (_UICAMLPackageView)initWithPackageName:(id)a3 inBundle:(id)a4
{
  v5 = [a4 URLForResource:a3 withExtension:@"ca"];
  v6 = [(_UICAMLPackageView *)self initWithURL:v5];

  return v6;
}

- (_UICAMLPackageView)initWithURL:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F3A4C0];
  id v35 = 0;
  v6 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v4 type:v5 options:0 error:&v35];
  id v7 = v35;
  v8 = [v6 rootLayer];
  [v8 frame];
  v34.receiver = self;
  v34.super_class = (Class)_UICAMLPackageView;
  v9 = -[UIView initWithFrame:](&v34, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    id v28 = v7;
    id v29 = v4;
    p_rootLayer = (id *)&v9->_rootLayer;
    objc_storeStrong((id *)&v9->_rootLayer, v8);
    [v8 frame];
    v10->_originalSize.width = v12;
    v10->_originalSize.height = v13;
    objc_msgSend(*p_rootLayer, "setGeometryFlipped:", objc_msgSend(v6, "isGeometryFlipped"));
    v14 = [(UIView *)v10 layer];
    [v14 addSublayer:*p_rootLayer];

    v15 = [v6 publishedObjectNames];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v18 = 0;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v22 = [v6 publishedObjectWithName:v21];
          if (v22)
          {
            if (!v18) {
              v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
            }
            [v18 setObject:v22 forKey:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }
    uint64_t v23 = [v18 copy];
    publishedObjectMap = v10->_publishedObjectMap;
    v10->_publishedObjectMap = (NSDictionary *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F39CB0]) initWithLayer:v10->_rootLayer];
    stateController = v10->_stateController;
    v10->_stateController = (CAStateController *)v25;

    id v7 = v28;
    id v4 = v29;
  }

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_originalSize.width;
  double height = self->_originalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)_UICAMLPackageView;
  [(UIView *)&v8 layoutSubviews];
  [(UIView *)self bounds];
  if (v3 / self->_originalSize.width >= v4 / self->_originalSize.height) {
    double v5 = v4 / self->_originalSize.height;
  }
  else {
    double v5 = v3 / self->_originalSize.width;
  }
  -[CALayer setPosition:](self->_rootLayer, "setPosition:", v3 * 0.5, v4 * 0.5);
  rootLayer = self->_rootLayer;
  CATransform3DMakeScale(&v7, v5, v5, 1.0);
  [(CALayer *)rootLayer setTransform:&v7];
}

- (id)publishedObjectWithName:(id)a3
{
  return [(NSDictionary *)self->_publishedObjectMap objectForKey:a3];
}

- (NSArray)publishedObjectNames
{
  return [(NSDictionary *)self->_publishedObjectMap allKeys];
}

- (BOOL)setState:(id)a3
{
  return [(_UICAMLPackageView *)self setState:a3 animated:1];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(CALayer *)self->_rootLayer stateWithName:a3];
  if (v6)
  {
    stateController = self->_stateController;
    rootLayer = self->_rootLayer;
    if (v4)
    {
      LODWORD(v7) = 1.0;
      [(CAStateController *)stateController setState:v6 ofLayer:rootLayer transitionSpeed:v7];
    }
    else
    {
      [(CAStateController *)stateController setState:v6 ofLayer:rootLayer];
    }
  }

  return v6 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishedObjectMap, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end