@interface TUIStatefulElementBoxLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth;
- (BOOL)collectImpressionsForChild:(id)a3;
- (BOOL)collectLinkEntitiesForChild:(id)a3;
- (BOOL)groupedContainingIsGrouped;
- (BOOL)shouldDescendentsInheritRefSpec;
- (CGRect)computedErasableBoundsPrimitive;
- (NSMutableDictionary)stateNameToLayout;
- (UIEdgeInsets)groupedContainingInsets;
- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (unint64_t)groupedContainingContentMode;
- (unint64_t)groupedContainingInsetsMode;
- (void)_updateSpecifiedWidth;
- (void)computeLayout;
- (void)onChildrenUpdated;
- (void)onSpecifiedWidthChangedForChild:(id)a3;
- (void)setStateNameToLayout:(id)a3;
@end

@implementation TUIStatefulElementBoxLayout

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  __p = 0;
  v8 = 0;
  uint64_t v9 = 0;
  v3 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_E5320;
  v6[3] = &unk_2553E8;
  v6[4] = &__p;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthCombine((float *)__p, (v8 - (unsigned char *)__p) >> 4);
  if (__p)
  {
    v8 = __p;
    operator delete(__p);
  }
  return v4;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x4012000000;
  v15 = sub_E55F4;
  v16 = nullsub_4;
  v17 = "";
  CGSize v18 = CGSizeZero;
  v5 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
  id v6 = [v5 count];

  if (v6)
  {
    v7 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_E5604;
    v11[3] = &unk_255410;
    *(double *)&v11[6] = v4;
    v11[4] = self;
    v11[5] = &v12;
    [v7 enumerateKeysAndObjectsUsingBlock:v11];

    double v4 = v13[6];
    double v8 = v13[7];
  }
  else
  {
    [(TUILayout *)self computeHeight];
    double v8 = v9;
    v10 = v13;
    v13[6] = v4;
    v10[7] = v9;
  }
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v8);
  _Block_object_dispose(&v12, 8);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  double v4 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
  v5 = [v4 objectForKeyedSubscript:@"default"];

  if (v5)
  {
    id v6 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v5 computedWidth];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TUIStatefulElementBoxLayout;
    id v6 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[($881BB7C90C7D0DFCC1492E3DC022A30F *)&v9 computedContentWidth];
  }
  v7 = v6;

  return v7;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  double v4 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
  v5 = [v4 objectForKeyedSubscript:@"default"];

  if (v5)
  {
    id v6 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v5 computedHeight];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TUIStatefulElementBoxLayout;
    id v6 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[($881BB7C90C7D0DFCC1492E3DC022A30F *)&v9 computedContentWidth];
  }
  v7 = v6;

  return v7;
}

- (CGRect)computedErasableBoundsPrimitive
{
  v21.receiver = self;
  v21.super_class = (Class)TUIStatefulElementBoxLayout;
  [(TUILayout *)&v21 computedErasableBoundsPrimitive];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  v11 = [(TUILayout *)self box];
  uint64_t v12 = [v11 focusStyle];

  if (v12)
  {
    [(TUILayout *)self computedBounds];
    [v12 erasableBoundsWithBounds:];
    v25.origin.CGFloat x = v13;
    v25.origin.CGFloat y = v14;
    v25.size.CGFloat width = v15;
    v25.size.CGFloat height = v16;
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRect v23 = CGRectUnion(v22, v25);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)onChildrenUpdated
{
  v8.receiver = self;
  v8.super_class = (Class)TUIStatefulElementBoxLayout;
  [(TUILayout *)&v8 onChildrenUpdated];
  [(TUILayout *)self invalidateIntrinsicSize];
  double v3 = (NSMutableDictionary *)objc_opt_new();
  stateNameToLayout = self->_stateNameToLayout;
  self->_stateNameToLayout = v3;

  double v5 = [(TUILayout *)self box];
  id v6 = [v5 stateMap];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_E5A84;
  v7[3] = &unk_255438;
  v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];

  [(TUIStatefulElementBoxLayout *)self _updateSpecifiedWidth];
}

- (BOOL)collectImpressionsForChild:(id)a3
{
  id v4 = a3;
  double v5 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
  id v6 = [v5 objectForKeyedSubscript:@"default"];
  BOOL v7 = v6 == v4;

  return v7;
}

- (BOOL)collectLinkEntitiesForChild:(id)a3
{
  id v4 = a3;
  double v5 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
  id v6 = [v5 objectForKeyedSubscript:@"default"];
  BOOL v7 = v6 == v4;

  return v7;
}

- (void)_updateSpecifiedWidth
{
  double v3 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
  id v10 = [v3 objectForKeyedSubscript:@"default"];

  id v4 = [(TUILayout *)self box];
  [v4 width];
  if ((v5 & 0x6000000000000) == 0x2000000000000)
  {
    [v10 specifiedWidth];
    uint64_t v7 = HIWORD(v6) & 7;
    BOOL v9 = v7 == 4 || v7 == 1;
  }
  else
  {
    BOOL v9 = 0;
  }
  [(TUILayout *)self setSpecifiedWidthComputeInherited:v9];
}

- (void)onSpecifiedWidthChangedForChild:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIStatefulElementBoxLayout;
  [(TUILayout *)&v5 onSpecifiedWidthChangedForChild:v4];
  [(TUIStatefulElementBoxLayout *)self _updateSpecifiedWidth];
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  v46 = v6;
  if (a3 < 4)
  {
    if (a3 == 3)
    {
      v24 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
      CGRect v25 = [v24 objectForKeyedSubscript:@"default"];

      if (v25)
      {
        v45 = objc_opt_new();
        [(TUILayout *)self computedNaturalSize];
        memset(&v51, 0, sizeof(v51));
        CGAffineTransformMakeTranslation(&v51, v26 * 0.5, v27 * 0.5);
        v28 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
        v29 = [v28 objectForKeyedSubscript:@"default"];
        CGAffineTransform v50 = v51;
        [v29 appendRenderModelCompatibleWithKind:3 context:v6 transform:&v50 toModels:v45];

        v30 = -[TUIContainerLayerConfig initWithSize:]([TUIContainerLayerConfig alloc], "initWithSize:", CGSizeZero.width, CGSizeZero.height);
        v31 = [TUIRenderModelLayer alloc];
        id v32 = [v45 copy];
        v33 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:](v31, "initWithSubmodels:config:erasableInsets:", v32, v30, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

        [(TUILayout *)self renderModelSizeWithContext:v6];
        -[TUIRenderModelLayer setSize:](v33, "setSize:");
        v34 = [(TUILayout *)self box];
        v35 = [v34 identifier];
        [(TUIRenderModelLayer *)v33 setIdentifier:v35];

        goto LABEL_19;
      }
    }
LABEL_15:
    v33 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = [(TUILayout *)self box];
  objc_super v8 = [v7 renderModelBlock];

  if (!v8) {
    goto LABEL_15;
  }
  v41 = objc_opt_new();
  BOOL v9 = [(TUILayout *)self box];
  id v10 = [v9 pointer];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_E6558;
  v56[3] = &unk_255488;
  v49 = self;
  v56[4] = self;
  id v57 = v6;
  id v44 = v41;
  id v58 = v44;
  id v42 = v57;
  [v57 evaluateWithPointer:v10 block:v56];

  v11 = [(TUILayout *)self box];
  uint64_t v12 = [v11 menuContainer];
  v43 = [v12 imageModelsToLoad];

  if ([v43 count])
  {
    v48 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v43 count]);
    [v42 contentsScale];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v43;
    id v13 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v53;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v53 != v14) {
            objc_enumerationMutation(obj);
          }
          CGFloat v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          double v17 = [(TUILayout *)v49 controller];
          double v18 = [v17 manager];
          double v19 = [v18 imageResourceCache];
          double v20 = [v16 urlString];
          objc_super v21 = [v16 baseURL];
          [v16 size];
          CGRect v22 = [v19 imageResourceForTemplatedURL:v20 baseURL:v21 naturalSize:0 contentsScale:0];

          CGRect v23 = [v16 identifier];
          [v48 setObject:v22 forKeyedSubscript:v23];
        }
        id v13 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v13);
    }

    self = v49;
  }
  else
  {
    v48 = 0;
  }
  v36 = [(TUILayout *)self box];
  v37 = [v36 renderModelBlock];
  v38 = [(TUILayout *)self box];
  v39 = [v38 animationGroups];
  ((void (**)(void, TUIStatefulElementBoxLayout *, id, void *, void *))v37)[2](v37, self, v44, v48, v39);
  v33 = (TUIRenderModelLayer *)objc_claimAutoreleasedReturnValue();

  [(TUILayout *)v49 renderModelSizeWithContext:v42];
  -[TUIRenderModelLayer setSize:](v33, "setSize:");

LABEL_19:
  return v33;
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v35.receiver = self;
  v35.super_class = (Class)TUIStatefulElementBoxLayout;
  CGFloat v15 = -[TUILayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](&v35, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", v12, v13, v14, x, y);
  [v15 setIsControl:1];
  CGFloat v16 = [(TUILayout *)self box];
  [v15 setIsEditableControl:[v16 isEditableControl]];

  double v17 = [(TUILayout *)self box];
  double v18 = [v17 triggerHandler];
  unsigned int v19 = [v18 hasActionForTrigger:@"context-menu"];
  if (v19)
  {
    id v6 = [(TUILayout *)self box];
    uint64_t v20 = [v6 menuIsPrimary] ^ 1;
  }
  else
  {
    uint64_t v20 = 0;
  }
  [v15 setHasContextMenu:v20];
  if (v19) {

  }
  objc_super v21 = [(TUIStatefulElementBoxLayout *)self stateNameToLayout];
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  v31 = sub_E698C;
  id v32 = &unk_255460;
  v33 = self;
  id v22 = v15;
  id v34 = v22;
  [v21 enumerateKeysAndObjectsUsingBlock:&v29];

  if (v12)
  {
    CGRect v23 = [(TUILayout *)self box];
    v24 = [v23 triggerHandler];
    CGRect v25 = [v22 identifier];
    [v12 addActionTriggerHandler:v24 controlIdentifier:v25];
  }
  double v26 = v34;
  id v27 = v22;

  return v27;
}

- (BOOL)shouldDescendentsInheritRefSpec
{
  return 0;
}

- (BOOL)groupedContainingIsGrouped
{
  v2 = [(TUILayout *)self box];
  unsigned __int8 v3 = [v2 grouped];

  return v3;
}

- (UIEdgeInsets)groupedContainingInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)groupedContainingInsetsMode
{
  return 1;
}

- (unint64_t)groupedContainingContentMode
{
  return 1;
}

- (NSMutableDictionary)stateNameToLayout
{
  return self->_stateNameToLayout;
}

- (void)setStateNameToLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end