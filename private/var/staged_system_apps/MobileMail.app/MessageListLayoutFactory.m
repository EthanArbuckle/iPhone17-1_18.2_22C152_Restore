@interface MessageListLayoutFactory
+ (id)_defaultLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 showPrioritySection:(BOOL)a6 configuration:(id)a7;
+ (id)_groupedSenderLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 configuration:(id)a6;
+ (id)_plainLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 configuration:(id)a6;
+ (id)_searchLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 configuration:(id)a6;
+ (id)layoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 layout:(int64_t)a6 configuration:(id)a7;
@end

@implementation MessageListLayoutFactory

+ (id)layoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 layout:(int64_t)a6 configuration:(id)a7
{
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  id v14 = a4;
  id v15 = a7;
  switch(a6)
  {
    case 0:
    case 4:
      int64_t v16 = +[MessageListLayoutFactory _defaultLayoutSectionAtSection:layoutEnvironment:layoutMargins:showPrioritySection:configuration:](MessageListLayoutFactory, "_defaultLayoutSectionAtSection:layoutEnvironment:layoutMargins:showPrioritySection:configuration:", a3, v14, a6 == 4, v15, top, leading, bottom, trailing);
      goto LABEL_6;
    case 1:
      int64_t v16 = +[MessageListLayoutFactory _searchLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:](MessageListLayoutFactory, "_searchLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:", a3, v14, v15, top, leading, bottom, trailing);
      goto LABEL_6;
    case 2:
      int64_t v16 = +[MessageListLayoutFactory _plainLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:](MessageListLayoutFactory, "_plainLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:", a3, v14, v15, top, leading, bottom, trailing);
      goto LABEL_6;
    case 3:
      int64_t v16 = +[MessageListLayoutFactory _groupedSenderLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:](MessageListLayoutFactory, "_groupedSenderLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:", a3, v14, v15, top, leading, bottom, trailing);
LABEL_6:
      a3 = v16;
      break;
    default:
      break;
  }

  return (id)a3;
}

+ (id)_defaultLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 showPrioritySection:(BOOL)a6 configuration:(id)a7
{
  BOOL v8 = a6;
  double trailing = a5.trailing;
  double leading = a5.leading;
  id v11 = a4;
  id v12 = a7;
  v34 = v11;
  v35 = v12;
  v13 = [v11 traitCollection];
  unsigned int v14 = [v13 mf_useSplitViewStyling];

  id v15 = objc_alloc((Class)UICollectionLayoutListConfiguration);
  if (v14) {
    uint64_t v16 = 4;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = [v15 initWithAppearance:v16];
  (*((void (**)(id, id))v12 + 2))(v12, v17);
  v18 = +[NSCollectionLayoutSection sectionWithListConfiguration:v17 layoutEnvironment:v11];
  v19 = v18;
  if (v14)
  {
    [v18 setContentInsets:0.0 leading:leading 0.0 trailing];
    [v19 setContentInsetsReference:2];
  }
  else
  {
    [v18 contentInsets];
    [v19 setContentInsets:0.0];
  }
  if (_os_feature_enabled_impl() && (EMIsGreymatterSupportedWithOverride() & v8) == 1)
  {
    v20 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v21 = +[NSCollectionLayoutDimension estimatedDimension:44.0];
    uint64_t v22 = +[NSCollectionLayoutSize sizeWithWidthDimension:v20 heightDimension:v21];

    v32 = (void *)v22;
    v33 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v22 elementKind:UICollectionElementKindSectionHeader alignment:1];
    v41 = v33;
    v23 = +[NSArray arrayWithObjects:&v41 count:1];
    [v19 setBoundarySupplementaryItems:v23];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v24 = [v19 boundarySupplementaryItems];
    id v25 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v37;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v29 = [v28 elementKind];
          unsigned int v30 = [v29 isEqualToString:UICollectionElementKindSectionHeader];

          if (v30) {
            [v28 setPinToVisibleBounds:0];
          }
        }
        id v25 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v25);
    }
  }

  return v19;
}

+ (id)_searchLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 configuration:(id)a6
{
  v6 = +[MessageListLayoutFactory _defaultLayoutSectionAtSection:layoutEnvironment:layoutMargins:showPrioritySection:configuration:](MessageListLayoutFactory, "_defaultLayoutSectionAtSection:layoutEnvironment:layoutMargins:showPrioritySection:configuration:", a3, a4, 0, a6, a5.top, a5.leading, a5.bottom, a5.trailing);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = [v6 boundarySupplementaryItems];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) setPinToVisibleBounds:0];
      }
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (id)_plainLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 configuration:(id)a6
{
  id v7 = a4;
  id v8 = (void (**)(id, id))a6;
  id v9 = [objc_alloc((Class)UICollectionLayoutListConfiguration) initWithAppearance:0];
  v8[2](v8, v9);
  v10 = +[NSCollectionLayoutSection sectionWithListConfiguration:v9 layoutEnvironment:v7];

  return v10;
}

+ (id)_groupedSenderLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 configuration:(id)a6
{
  id v7 = a4;
  id v8 = (void (**)(id, id))a6;
  id v9 = [v7 traitCollection];
  unsigned int v10 = [v9 mf_useSplitViewStyling];

  id v11 = objc_alloc((Class)UICollectionLayoutListConfiguration);
  if (v10) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = [v11 initWithAppearance:v12];
  v8[2](v8, v13);
  long long v14 = +[NSCollectionLayoutSection sectionWithListConfiguration:v13 layoutEnvironment:v7];

  return v14;
}

@end