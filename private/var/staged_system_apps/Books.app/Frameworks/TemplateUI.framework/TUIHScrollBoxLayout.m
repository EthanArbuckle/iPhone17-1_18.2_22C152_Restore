@interface TUIHScrollBoxLayout
- (BOOL)collectImpressionsForChild:(id)a3;
- (BOOL)collectImpressionsForChildren;
- (BOOL)collectLinkEntitiesForChild:(id)a3;
- (BOOL)collectLinkEntitiesForChildren;
- (BOOL)shouldAppendChildAnchorsForAncestor;
- (BOOL)shouldAutoInvalidateRenderModelOnChildInvalidate;
- (CGPoint)scrollAdditionalAXTranslation;
- (CGRect)computedErasableBounds;
- (TUIHScrollBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (id)_embeddedCollectionModelWithContext:(id)a3;
- (id)childrenForHoverRegions;
- (id)modelIdentifierForScrollable;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (unint64_t)scrollAxis;
- (void)_updateAnchorSet;
- (void)_validateLayout;
- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 origin:(CGPoint)a6 toModels:(id)a7;
- (void)appendEmbeddedAnchorsToSet:(id)a3 inRoot:(id)a4;
- (void)appendEmbeddedIdentifierMaps:(id)a3 updateControllers:(id)a4 UUIDs:(id)a5;
- (void)computeLayout;
- (void)onChildTransformedSizeDidChange:(id)a3;
- (void)validateRenderModelWithContext:(id)a3 transactionGroup:(id)a4;
@end

@implementation TUIHScrollBoxLayout

- (TUIHScrollBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TUIHScrollBoxLayout;
  v5 = [(TUILayout *)&v9 initWithModel:a3 parent:a4 controller:a5];
  v6 = v5;
  if (v5)
  {
    [(TUILayout *)v5 specifiedWidth];
    if ((v7 & 0x6000000000000) == 0x2000000000000) {
      [(TUILayout *)v6 setSpecifiedWidthComputeInherited:1];
    }
  }
  return v6;
}

- (unint64_t)scrollAxis
{
  return 1;
}

- (CGPoint)scrollAdditionalAXTranslation
{
  v3 = [(TUILayout *)self children];
  v4 = [v3 firstObject];

  if (objc_opt_respondsToSelector())
  {
    [v4 layoutScrollGradientInsets];
    double left = v5;
  }
  else
  {
    double left = UIEdgeInsetsZero.left;
  }
  uint64_t v7 = [(TUILayout *)self controller];
  [v7 contentsScale];
  -[TUILayout erasableInsetsForContentsScale:](self, "erasableInsetsForContentsScale:");
  double v9 = v8;
  double v11 = v10;

  if (left >= 0.0) {
    double left = v11;
  }

  double v12 = left;
  double v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)childrenForHoverRegions
{
  return 0;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  double v5 = [(TUILayout *)self children];
  id v12 = [v5 firstObject];

  v6 = [(TUILayout *)self layoutAncestor];
  unsigned int v7 = [v6 shouldUpdateContainingMetricsForScrollableContent];

  if (v7) {
    [v12 setContainingWidth:NAN];
  }
  [v12 validateLayout];
  [v12 computedTransformedSize];
  double v9 = v8;
  if (objc_opt_respondsToSelector())
  {
    [v12 layoutScrollContentScrollSizeWithProposedSize:v4, v9];
    double v4 = v10;
    double v9 = v11;
  }
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v9);
  [(TUIHScrollBoxLayout *)self _updateAnchorSet];
}

- (void)onChildTransformedSizeDidChange:(id)a3
{
  id v4 = a3;
  [(TUIHScrollBoxLayout *)self _updateAnchorSet];
  [(TUILayout *)self computedNaturalSize];
  double v6 = v5;
  [v4 computedTransformedSize];
  double v8 = v7;

  if (v6 != v8)
  {
    [(TUILayout *)self invalidateLayout];
  }
}

- (BOOL)shouldAppendChildAnchorsForAncestor
{
  return 0;
}

- (void)appendEmbeddedAnchorsToSet:(id)a3 inRoot:(id)a4
{
}

- (void)_updateAnchorSet
{
  double v10 = [(TUIAnchorSet *)[TUIMutableAnchorSet alloc] initWithAxis:1];
  double v3 = [(TUILayout *)self layout];
  id v4 = (char *)[v3 computedLayoutDirection];
  double v5 = [(TUILayout *)self box];
  [v5 anchorOffset];
  if (v4 == (unsigned char *)&def_141F14 + 2) {
    double v6 = -v6;
  }
  [(TUIAnchorSet *)v10 setOffset:v6];

  [(TUILayout *)self appendChildAnchorsToSet:v10 inRoot:self];
  double v7 = [(TUILayout *)self controller];
  [v7 contentsScale];
  -[TUIMutableAnchorSet finalizeWithContentsScale:](v10, "finalizeWithContentsScale:");

  double v8 = (TUIAnchorSet *)[(TUIMutableAnchorSet *)v10 copy];
  anchorSet = self->_anchorSet;
  self->_anchorSet = v8;
}

- (void)_validateLayout
{
  v2.receiver = self;
  v2.super_class = (Class)TUIHScrollBoxLayout;
  [(TUILayout *)&v2 _validateLayout];
}

- (CGRect)computedErasableBounds
{
  v11.receiver = self;
  v11.super_class = (Class)TUIHScrollBoxLayout;
  [(TUILayout *)&v11 computedErasableBounds];
  double v4 = v3;
  double v6 = v5;
  [(TUILayout *)self computedBounds];
  double v9 = v4;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v9;
  result.origin.x = v7;
  return result;
}

- (id)_embeddedCollectionModelWithContext:(id)a3
{
  id v4 = a3;
  double v5 = [(TUILayout *)self controller];
  [v5 cachedRenderModelValidatedForLayout:self];

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_13B6B4;
  v25 = sub_13B6C4;
  id v26 = 0;
  if (!self->_renderModelidentifierMap)
  {
    double v6 = [(TUILayout *)self box];
    double v7 = [v6 identifier];
    double v8 = [v4 embeddedIdentifierMapForIdentifier:v7];
    renderModelidentifierMap = self->_renderModelidentifierMap;
    self->_renderModelidentifierMap = v8;
  }
  if (!self->_sectionUUID)
  {
    double v10 = [(TUILayout *)self box];
    objc_super v11 = [v10 identifier];
    id v12 = [v4 embeddedUUIDForIdentifier:v11];
    sectionUUID = self->_sectionUUID;
    self->_sectionUUID = v12;
  }
  v14 = self->_renderModelidentifierMap;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_13B6CC;
  v18[3] = &unk_251800;
  v18[4] = self;
  id v15 = v4;
  id v19 = v15;
  v20 = &v21;
  [v15 evaluateWithIdentifierMap:v14 block:v18];
  id v16 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v16;
}

- (id)modelIdentifierForScrollable
{
  objc_super v2 = [(TUILayout *)self box];
  double v3 = [v2 modelIdentifierForScrollable];

  return v3;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  if (a3 < 4)
  {
    v25 = 0;
  }
  else
  {
    uint64_t v7 = [(TUIHScrollBoxLayout *)self _embeddedCollectionModelWithContext:v6];
    renderModelUpdateController = self->_renderModelUpdateController;
    if (!renderModelUpdateController)
    {
      double v9 = [(TUILayout *)self box];
      double v10 = [v9 identifier];
      objc_super v11 = [v6 embeddedUpdateControllerForIdentifier:v10 renderModel:0];
      id v12 = self->_renderModelUpdateController;
      self->_renderModelUpdateController = v11;

      renderModelUpdateController = self->_renderModelUpdateController;
    }
    double v13 = [v6 transactionGroup];
    [(TUIRenderUpdateCollectionController *)renderModelUpdateController updateWithRenderModel:v7 viewState:0 flags:0 transactionGroup:v13];

    v14 = [(TUILayout *)self children];
    id v15 = [v14 firstObject];

    char v16 = objc_opt_respondsToSelector();
    uint64_t v17 = 0;
    if (v16)
    {
      uint64_t v17 = [v15 scrollPolicy];
    }
    v54 = (void *)v17;
    if (objc_opt_respondsToSelector())
    {
      [v15 layoutScrollGradientInsets];
      double top = v18;
      double left = v19;
      double bottom = v21;
      double right = v23;
    }
    else
    {
      double left = UIEdgeInsetsZero.left;
      double top = UIEdgeInsetsZero.top;
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
    }
    double v26 = 1.0;
    double v27 = 1.0;
    double v28 = 1.0;
    double v29 = 1.0;
    if (objc_opt_respondsToSelector())
    {
      [v15 layoutScrollGradientFraction];
      double v29 = v30;
      double v28 = v31;
      double v27 = v32;
      double v26 = v33;
    }
    v52 = (void *)v7;
    double v34 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [v15 layoutScrollPageGap];
      double v34 = v35;
    }
    v36 = self->_renderModelUpdateController;
    v37 = [v6 uid];
    v38 = [v6 UUID];
    v51 = [(TUILayout *)self box];
    v50 = [v51 identifier];
    v48 = [(TUIHScrollBoxLayout *)self modelIdentifierForScrollable];
    v46 = [(TUILayout *)self modelIdentifierForEnclosingScrollable];
    [(TUILayout *)self box];
    v49 = id v53 = v6;
    unsigned __int8 v39 = [v49 acceptsDrop];
    v40 = [(TUILayout *)self box];
    v41 = [v40 dropHandler];
    v42 = [(TUILayout *)self box];
    [v42 decelerationRate];
    LOBYTE(v45) = v39;
    +[TUIEmbeddedCollectionView renderModelWithUpdateController:uid:UUID:identifier:scrollIdentifier:ancestorScrollIdentifier:scrollPolicy:pageGap:gradientInsets:gradientFraction:acceptsDrop:dropHandler:decelerationRate:](TUIEmbeddedCollectionView, "renderModelWithUpdateController:uid:UUID:identifier:scrollIdentifier:ancestorScrollIdentifier:scrollPolicy:pageGap:gradientInsets:gradientFraction:acceptsDrop:dropHandler:decelerationRate:", v36, v37, v38, v50, v48, v46, v34, top, left, bottom, right, v54, *(void *)&v29, *(void *)&v28, *(void *)&v27, *(void *)&v26,
      v45,
      v41,
    v25 = v43);

    id v6 = v53;
    [(TUILayout *)self renderModelSizeWithContext:v53];
    [v25 setSize:];
  }
  return v25;
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 origin:(CGPoint)a6 toModels:(id)a7
{
  if (a3 <= 3)
  {
    uint64_t v10 = v7;
    uint64_t v11 = v8;
    v9.receiver = self;
    v9.super_class = (Class)TUIHScrollBoxLayout;
    -[TUILayout appendChildRenderModelCompatibleWithKind:context:transform:toModels:](&v9, "appendChildRenderModelCompatibleWithKind:context:transform:toModels:", *(void *)&a5->a, *(void *)&a5->b, *(void *)&a5->c, *(void *)&a5->d, *(void *)&a5->tx, *(void *)&a5->ty);
  }
}

- (BOOL)collectImpressionsForChildren
{
  return 0;
}

- (BOOL)collectImpressionsForChild:(id)a3
{
  return 0;
}

- (BOOL)collectLinkEntitiesForChildren
{
  return 0;
}

- (BOOL)collectLinkEntitiesForChild:(id)a3
{
  return 0;
}

- (void)validateRenderModelWithContext:(id)a3 transactionGroup:(id)a4
{
  id v6 = a4;
  id v7 = [(TUIHScrollBoxLayout *)self _embeddedCollectionModelWithContext:a3];
  [(TUIRenderUpdateCollectionController *)self->_renderModelUpdateController updateWithRenderModel:v7 viewState:0 flags:0 transactionGroup:v6];
}

- (BOOL)shouldAutoInvalidateRenderModelOnChildInvalidate
{
  return 0;
}

- (void)appendEmbeddedIdentifierMaps:(id)a3 updateControllers:(id)a4 UUIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(TUILayout *)self box];
  id v12 = [v11 identifier];

  if (v12)
  {
    [v8 setObject:self->_renderModelidentifierMap forKeyedSubscript:v12];
    [v9 setObject:self->_renderModelUpdateController forKeyedSubscript:v12];
    [v10 setObject:self->_sectionUUID forKeyedSubscript:v12];
  }
  v13.receiver = self;
  v13.super_class = (Class)TUIHScrollBoxLayout;
  [(TUILayout *)&v13 appendEmbeddedIdentifierMaps:v8 updateControllers:v9 UUIDs:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorSet, 0);
  objc_storeStrong((id *)&self->_renderModelUpdateController, 0);
  objc_storeStrong((id *)&self->_sectionUUID, 0);

  objc_storeStrong((id *)&self->_renderModelidentifierMap, 0);
}

@end