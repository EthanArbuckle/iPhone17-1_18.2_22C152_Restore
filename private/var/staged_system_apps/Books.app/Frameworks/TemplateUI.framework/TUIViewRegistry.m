@interface TUIViewRegistry
- (BOOL)useHostedViewFactoryForType:(id)a3;
- (TUIViewRegistry)init;
- (id)hostedViewFactoryForType:(id)a3;
- (id)hostedViewFactoryTypesWithGeometryReuse;
- (id)newSubviewWithReuseIdentifier:(id)a3;
- (void)registerClass:(Class)a3 forSubviewWithReuseIdentifier:(id)a4;
- (void)registerHostedViewFactory:(id)a3 forType:(id)a4;
@end

@implementation TUIViewRegistry

- (TUIViewRegistry)init
{
  v4.receiver = self;
  v4.super_class = (Class)TUIViewRegistry;
  v2 = [(TUIViewRegistry *)&v4 init];
  if (v2)
  {
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierBarChartView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierContainerView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierControlView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierEmbeddedCollectionView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierImpressionOverlayView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIIdentifierLayerContainerView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierNowPlayingView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierProgressView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierRatingsView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierSearchBarView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierSegmentedControlView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierSpinnerView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierStyledView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierStatsIndicatorView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierTextFieldView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierTextView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierToggleView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierTrackTimeRemainingView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierVideoView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierHoverVisibleView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierPageControlView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierFocusContainerView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierHostingView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierHostingAnchorView"];
    [(TUIViewRegistry *)v2 registerClass:objc_opt_class() forSubviewWithReuseIdentifier:@"TUIReuseIdentifierOverlayFadeView"];
  }
  return v2;
}

- (void)registerClass:(Class)a3 forSubviewWithReuseIdentifier:(id)a4
{
  id v6 = a4;
  v7 = v6;
  id v10 = v6;
  if (self->_subviewClassDict)
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v8 = (NSMutableDictionary *)objc_opt_new();
  subviewClassDict = self->_subviewClassDict;
  self->_subviewClassDict = v8;

  v7 = v10;
  if (v10)
  {
LABEL_3:
    [(NSMutableDictionary *)self->_subviewClassDict setObject:a3 forKeyedSubscript:v10];
    v7 = v10;
  }
LABEL_4:
}

- (id)newSubviewWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_subviewClassDict objectForKeyedSubscript:v4];

    if (v5)
    {
      id v5 = [objc_alloc((Class)v5) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      [v5 setReuseIdentifier:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)registerHostedViewFactory:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!self->_hostedViewFactoryDict)
  {
    v17 = (NSMutableDictionary *)objc_opt_new();
    hostedViewFactoryDict = self->_hostedViewFactoryDict;
    self->_hostedViewFactoryDict = v17;

    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v7)
  {
LABEL_3:
    [(NSMutableDictionary *)self->_hostedViewFactoryDict setObject:v6 forKeyedSubscript:v8];
    v9 = [(NSMutableDictionary *)self->_hostedViewFactoryDict allKeys];
    id v10 = +[NSSet setWithArray:v9];
    hostedViewFactoryTypes = self->_hostedViewFactoryTypes;
    self->_hostedViewFactoryTypes = v10;

    v12 = objc_opt_new();
    v13 = self->_hostedViewFactoryDict;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_4F540;
    v19[3] = &unk_252D20;
    id v20 = v12;
    id v14 = v12;
    [(NSMutableDictionary *)v13 enumerateKeysAndObjectsUsingBlock:v19];
    v15 = (NSSet *)[v14 copy];
    hostedViewFactoryTypesWithGeometryReuseSupport = self->_hostedViewFactoryTypesWithGeometryReuseSupport;
    self->_hostedViewFactoryTypesWithGeometryReuseSupport = v15;
  }
LABEL_4:
}

- (BOOL)useHostedViewFactoryForType:(id)a3
{
  if (a3) {
    return -[NSSet containsObject:](self->_hostedViewFactoryTypes, "containsObject:");
  }
  else {
    return 0;
  }
}

- (id)hostedViewFactoryForType:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_hostedViewFactoryDict, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)hostedViewFactoryTypesWithGeometryReuse
{
  return self->_hostedViewFactoryTypesWithGeometryReuseSupport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedViewFactoryTypesWithGeometryReuseSupport, 0);
  objc_storeStrong((id *)&self->_hostedViewFactoryTypes, 0);
  objc_storeStrong((id *)&self->_hostedViewFactoryDict, 0);

  objc_storeStrong((id *)&self->_subviewClassDict, 0);
}

@end