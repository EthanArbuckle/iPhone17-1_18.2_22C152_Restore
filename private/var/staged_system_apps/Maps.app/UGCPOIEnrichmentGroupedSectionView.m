@interface UGCPOIEnrichmentGroupedSectionView
+ (id)groupedSectionRowItemWithRowItems:(id)a3 bottomSpacing:(double)a4;
- (NSArray)rowItems;
- (UGCPOIEnrichmentGroupedSectionView)initWithRowItems:(id)a3;
@end

@implementation UGCPOIEnrichmentGroupedSectionView

- (UGCPOIEnrichmentGroupedSectionView)initWithRowItems:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UGCPOIEnrichmentGroupedSectionView;
  v5 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v25, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    rowItems = v5->_rowItems;
    v5->_rowItems = v6;

    id v8 = [objc_alloc((Class)MUPlatterView) initWithContentView:0];
    [v8 _mapsui_resetLayoutMarginsWithPreservesSuperview:1];
    [v8 setDirectionalLayoutMargins:0.0, kMUPlacePlatterPadding, 0.0, kMUPlacePlatterPadding];
    [(UGCPOIEnrichmentGroupedSectionView *)v5 addSubview:v8];
    id v9 = objc_alloc((Class)MUEdgeLayout);
    v10 = [(UGCPOIEnrichmentGroupedSectionView *)v5 layoutMarginsGuide];
    id v11 = [v9 initWithItem:v8 container:v10];

    id v12 = [objc_alloc((Class)MUStackLayout) initWithContainer:v8 axis:1];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v4;
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v17) rowView:(void)v21];
          [v18 setPreservesSuperviewLayoutMargins:1];
          [v8 addSubview:v18];
          [v12 addArrangedLayoutItem:v18];

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v15);
    }

    v26[0] = v11;
    v26[1] = v12;
    v19 = +[NSArray arrayWithObjects:v26 count:2];
    +[NSLayoutConstraint _mapsui_activateLayouts:v19];
  }
  return v5;
}

+ (id)groupedSectionRowItemWithRowItems:(id)a3 bottomSpacing:(double)a4
{
  id v5 = a3;
  v6 = [[UGCPOIEnrichmentGroupedSectionView alloc] initWithRowItems:v5];

  v7 = +[UGCPOIEnrichmentRowItem rowItemWithView:v6 bottomSpacing:a4];

  return v7;
}

- (NSArray)rowItems
{
  return self->_rowItems;
}

- (void).cxx_destruct
{
}

@end