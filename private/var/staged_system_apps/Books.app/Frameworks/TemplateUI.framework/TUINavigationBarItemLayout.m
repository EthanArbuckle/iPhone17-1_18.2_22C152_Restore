@interface TUINavigationBarItemLayout
- (BOOL)collectHostingPropertiesWithCollector:(id)a3;
- (NSMutableDictionary)stateNameToLayout;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (void)computeLayout;
- (void)setStateNameToLayout:(id)a3;
@end

@implementation TUINavigationBarItemLayout

- (void)computeLayout
{
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = COERCE_FLOAT([(TUILayout *)self specifiedWidth]);
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(TUILayout *)self children];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 setSpecifiedWidthComputeInherited:1];
        [v9 setContainingWidth:v3];
        [v9 validateLayout];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)collectHostingPropertiesWithCollector:(id)a3
{
  id v4 = a3;
  id v5 = [(TUILayout *)self box];
  id v6 = [v5 hostingIdentifiers];

  if (v6)
  {
    uint64_t v7 = [v5 hostingIdentifiers];
    id v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      do
      {
        long long v10 = [v5 hostingIdentifiers];
        long long v11 = [v10 objectAtIndexedSubscript:v9];

        long long v12 = [v5 hostingProperties];
        long long v13 = [v12 objectAtIndexedSubscript:v9];

        [v4 hostingCollectorAddProperties:v13 forIdentifier:v11];
        ++v9;
        v14 = [v5 hostingIdentifiers];
        id v15 = [v14 count];
      }
      while (v9 < (unint64_t)v15);
    }
  }

  return 0;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = [(TUILayout *)self box];
  id v86 = [v6 width];
  float v81 = v7;

  id v8 = [(TUILayout *)self children];
  uint64_t v9 = [v8 firstObject];

  if (v9)
  {
    v92 = [v5 renderModelForLayout:v9 kind:6];
  }
  else
  {
    v92 = 0;
  }
  long long v10 = [(TUILayout *)self box];
  v84 = (void *)v9;
  if ([v10 axHasNonDefaultAttributess])
  {
    long long v11 = [TUIAXAttributes alloc];
    long long v12 = [(TUILayout *)self box];
    v91 = [(TUIAXAttributes *)v11 initWithAXAttributes:v12];
  }
  else
  {
    v91 = 0;
  }

  long long v13 = [(TUILayout *)self box];
  v14 = [v13 actionHandler];

  id v15 = [(TUILayout *)self box];
  v16 = [v15 menuContainer];
  v17 = [v16 menuModel];
  v18 = [(TUILayout *)self box];
  id v19 = [v18 menuIsPrimary];
  v20 = [v14 actionObject];
  v90 = v14;
  v21 = [v14 actionDelegate];
  v89 = [v17 menuWithIsPrimary:v19 actionObject:v20 actionDelegate:v21];

  v22 = [(TUILayout *)self box];
  v23 = [v22 menuContainer];
  v24 = [v23 imageModelsToLoad];

  v85 = v5;
  v83 = v24;
  if ([v24 count])
  {
    v26 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v24 count]);
    [v5 contentsScale];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id obj = v24;
    id v97 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
    if (v97)
    {
      uint64_t v95 = *(void *)v100;
      do
      {
        v27 = 0;
        do
        {
          if (*(void *)v100 != v95) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v99 + 1) + 8 * (void)v27);
          v29 = [(TUILayout *)self controller];
          v30 = [v29 manager];
          v31 = [v30 imageResourceCache];
          v32 = [v28 urlString];
          [v28 baseURL];
          v34 = v33 = self;
          [v28 size];
          v35 = [v31 imageResourceForTemplatedURL:v32 baseURL:v34 naturalSize:0 contentsScale:0];

          self = v33;
          v36 = [v28 identifier];
          [v26 setObject:v35 forKeyedSubscript:v36];

          v27 = (char *)v27 + 1;
        }
        while (v97 != v27);
        id v97 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
      }
      while (v97);
    }
    v88 = v26;

    id v5 = v85;
  }
  else
  {
    v88 = 0;
  }
  LODWORD(v25) = v86;
  double v37 = v81;
  double v38 = *((float *)&v86 + 1);
  double v39 = *(float *)&v86;
  v82 = [(TUILayout *)self box];
  id v72 = [v82 itemType];
  v80 = [(TUILayout *)self box];
  v98 = [v80 identifier];
  v79 = [(TUILayout *)self box];
  id obja = [v79 title];
  v78 = [(TUILayout *)self box];
  v69 = [v78 attributedTitle];
  v77 = [(TUILayout *)self box];
  v96 = [v77 image];
  v76 = [(TUILayout *)self box];
  unsigned __int8 v66 = [v76 isEnabled];
  v75 = [(TUILayout *)self box];
  id v64 = [v75 buttonType];
  v74 = [(TUILayout *)self box];
  id v62 = [v74 buttonRole];
  v71 = [(TUILayout *)self box];
  v87 = [v71 text];
  v70 = [(TUILayout *)self box];
  id v60 = [v70 searchTextMaxLength];
  v68 = [(TUILayout *)self box];
  v58 = [v68 placeholderText];
  v67 = [v5 environment];
  uint64_t v57 = TUIKeyboardAppearanceFromEnvironmentStyle((uint64_t)[v67 style]);
  v65 = [(TUILayout *)self box];
  [v65 navigationBarBackgroundOpacity];
  double v41 = v40;
  v63 = [(TUILayout *)self box];
  v56 = [v63 observeTrigger];
  v61 = [(TUILayout *)self box];
  id v55 = [v61 observeTriggerValue];
  v59 = [(TUILayout *)self box];
  unsigned __int8 v42 = [v59 ignoreInsetsForOpacityTrigger];
  v43 = [(TUILayout *)self box];
  [v43 refId];
  v45 = v44 = self;
  v46 = [(TUILayout *)v44 box];
  v47 = [v46 refInstance];
  v48 = [(TUILayout *)v44 box];
  v49 = [v48 hostingIdentifiers];
  v50 = [(TUILayout *)v44 box];
  v51 = [v50 hostingProperties];
  LOBYTE(v54) = v42;
  LOBYTE(v53) = v66;
  +[TUIRenderModelNavigationItem renderModelWithItemType:identifier:imageModelIDToResource:actionHandler:title:attributedTitle:image:enabled:buttonType:buttonRole:width:minWidth:maxWidth:text:searchTextMaxLength:placeholderText:keyboardAppearance:navigationBarBackgroundOpacity:observeTrigger:observeTriggerValue:ignoreInsetsForOpacityTrigger:menu:subview:axAttributes:refId:refInstance:hostingIdentifiers:hostingProperties:](TUIRenderModelNavigationItem, "renderModelWithItemType:identifier:imageModelIDToResource:actionHandler:title:attributedTitle:image:enabled:buttonType:buttonRole:width:minWidth:maxWidth:text:searchTextMaxLength:placeholderText:keyboardAppearance:navigationBarBackgroundOpacity:observeTrigger:observeTriggerValue:ignoreInsetsForOpacityTrigger:menu:subview:axAttributes:refId:refInstance:hostingIdentifiers:hostingProperties:", v72, v98, v88, v90, obja, v69, v39, v38, v37, v41, v96, v53, v64, v62,
    v87,
    v60,
    v58,
    v57,
    v56,
    v55,
    v54,
    v89,
    v92,
    v91,
    v45,
    v47,
    v49,
  v73 = v51);

  return v73;
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