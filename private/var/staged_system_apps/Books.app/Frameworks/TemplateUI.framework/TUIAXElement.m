@interface TUIAXElement
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_presentContextMenu;
- (BOOL)_shouldInferAccessibilityLabel;
- (BOOL)accessibilityActivate;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (NSArray)children;
- (NSArray)retainedCustomActionTargets;
- (NSString)inferredLabel;
- (TUIAXCustomAction)decrementAction;
- (TUIAXCustomAction)defaultAction;
- (TUIAXCustomAction)incrementAction;
- (TUIAXElement)initWithEvaluationContext:(id)a3 accessibilityContainer:(id)a4;
- (TUIAXEvaluationContext)context;
- (TUIAXModel)axModel;
- (id)_accessibilityParentForFindingScrollParent;
- (id)_currentStateForControl;
- (id)_scrollAncestor;
- (id)_viewForOverrideIdentifier:(id)a3 outParentRenderModelSection:(id *)a4 outParentView:(id *)a5;
- (id)accessibilityContainer;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)controlViewForOverrideIdentifier:(id)a3;
- (id)description;
- (int64_t)accessibilityContainerType;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)dealloc;
- (void)setChildren:(id)a3;
- (void)setDecrementAction:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setIncrementAction:(id)a3;
- (void)setRetainedCustomActionTargets:(id)a3;
- (void)updateWithAXModel:(id)a3;
@end

@implementation TUIAXElement

- (TUIAXElement)initWithEvaluationContext:(id)a3 accessibilityContainer:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIAXElement;
  v8 = [(TUIAXElement *)&v11 initWithAccessibilityContainer:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_context, a3);
  }

  return v9;
}

- (void)dealloc
{
  v3 = [(TUIAXModel *)self->_axModel identifier];

  if (v3)
  {
    v4 = [(TUIAXEvaluationContext *)self->_context identifierToAXElementMap];
    v5 = [(TUIAXModel *)self->_axModel identifier];
    [v4 removeObjectForKey:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)TUIAXElement;
  [(TUIAXElement *)&v6 dealloc];
}

- (id)description
{
  v3 = [(TUIAXElement *)self _accessibilityTraitsAsHumanReadableStrings:[(TUIAXElement *)self accessibilityTraits]];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v30 = [(TUIAXElement *)self axModel];
  unsigned int v6 = [(TUIAXElement *)self isAccessibilityElement];
  id v7 = &stru_257BF0;
  CFStringRef v8 = @" accessible=YES;";
  if (!v6) {
    CFStringRef v8 = &stru_257BF0;
  }
  CFStringRef v29 = v8;
  [(TUIAXElement *)self accessibilityFrame];
  v9 = NSStringFromCGRect(v37);
  +[NSString stringWithFormat:@" frame=%@;", v9];
  v35 = v34 = v3;
  id v32 = [v3 count];
  if (v32)
  {
    v28 = [v3 componentsJoinedByString:@","];
    +[NSString stringWithFormat:@" traits=%@;", v28];
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v31 = [(TUIAXElement *)self accessibilityLabel];
  if (v31)
  {
    v27 = [(TUIAXElement *)self accessibilityLabel];
    +[NSString stringWithFormat:@" label=%@;", v27];
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = &stru_257BF0;
  }
  v10 = [(TUIAXElement *)self accessibilityValue];
  if (v10)
  {
    v26 = [(TUIAXElement *)self accessibilityValue];
    +[NSString stringWithFormat:@" value=%@;", v26];
    CFStringRef v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFStringRef v11 = &stru_257BF0;
  }
  v12 = [(TUIAXElement *)self accessibilityHint];
  if (v12)
  {
    v25 = [(TUIAXElement *)self accessibilityHint];
    +[NSString stringWithFormat:@" hint=%@;", v25];
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_257BF0;
  }
  v14 = [(TUIAXElement *)self axModel];
  if ([v14 shouldScrollVertically])
  {
    v15 = (__CFString *)v11;
    CFStringRef v22 = v11;
    v16 = (void *)v30;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; (%@) %@%@%@%@%@%@%@>",
      v5,
      self,
      v30,
      v29,
      v35,
      v7,
      v33,
      v22,
      v13,
    v17 = @" scroll=v");;
  }
  else
  {
    [(TUIAXElement *)self axModel];
    v18 = v24 = v9;
    unsigned int v19 = [v18 shouldScrollHorizontally];
    CFStringRef v20 = @" scroll=h;";
    if (!v19) {
      CFStringRef v20 = &stru_257BF0;
    }
    v15 = (__CFString *)v11;
    CFStringRef v23 = v11;
    v16 = (void *)v30;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; (%@) %@%@%@%@%@%@%@>",
      v5,
      self,
      v30,
      v29,
      v35,
      v7,
      v33,
      v23,
      v13,
    v17 = v20);

    v9 = v24;
  }

  if (v12)
  {
  }
  if (v10)
  {
  }
  if (v31)
  {
  }
  if (v32)
  {
  }

  return v17;
}

- (NSString)inferredLabel
{
  v3 = objc_opt_new();
  v4 = [(TUIAXElement *)self children];
  v5 = +[NSMutableArray tui_stackWithObjectsFromArray:v4];

  while ([v5 count])
  {
    unsigned int v6 = [v5 tui_pop];
    id v7 = [v6 axModel];
    CFStringRef v8 = [v7 axAttributes];

    if ([v8 isAXElement]
      && ([v8 axLabel],
          v9 = objc_claimAutoreleasedReturnValue(),
          id v10 = [v9 length],
          v9,
          v10))
    {
      CFStringRef v11 = [v8 axLabel];
      [v3 addObject:v11];
    }
    else
    {
      v12 = [v6 children];
      id v13 = [v12 count];

      if (!v13) {
        goto LABEL_9;
      }
      CFStringRef v11 = [v6 children];
      [v5 tui_pushObjectsFromArray:v11];
    }

LABEL_9:
  }
  v14 = [v3 componentsJoinedByString:@", "];

  return (NSString *)v14;
}

- (void)updateWithAXModel:(id)a3
{
  id v5 = a3;
  unsigned int v6 = self->_axModel;
  id v7 = [v5 identifier];
  v64 = v6;
  CFStringRef v8 = [(TUIAXModel *)v6 identifier];
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = [(TUIAXModel *)v6 identifier];

    if (v10)
    {
      CFStringRef v11 = [(TUIAXEvaluationContext *)self->_context identifierToAXElementMap];
      v12 = [(TUIAXModel *)v6 identifier];
      [v11 removeObjectForKey:v12];
    }
    id v13 = [v5 identifier];

    if (v13)
    {
      v14 = [(TUIAXEvaluationContext *)self->_context identifierToAXElementMap];
      v15 = [v5 identifier];
      [v14 setObject:self forKey:v15];
    }
  }
  objc_storeStrong((id *)&self->_axModel, a3);
  v67 = objc_opt_new();
  if ([v5 isControl]
    && ([(TUIAXElement *)self context],
        v16 = objc_claimAutoreleasedReturnValue(),
        [v16 renderModelSection],
        v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        v17))
  {
    v18 = [(TUIAXElement *)self _currentStateForControl];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    unsigned int v19 = [v5 children];
    id v20 = [v19 countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v20)
    {
      id v21 = v20;
      v69 = 0;
      uint64_t v22 = *(void *)v79;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v79 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          v25 = [v24 stateName];
          unsigned int v26 = [v18 isEqualToString:v25];

          if (v26)
          {
            id v27 = v24;

            v69 = v27;
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v78 objects:v84 count:16];
      }
      while (v21);
    }
    else
    {
      v69 = 0;
    }
  }
  else
  {
    v69 = 0;
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v28 = [v5 children];
  id v29 = [v28 countByEnumeratingWithState:&v74 objects:v83 count:16];
  v68 = v5;
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v75;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v75 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
        if ([v33 hasAccessibleDescendants])
        {
          if (([v33 hidden] & 1) == 0)
          {
            if (![v5 isControl]) {
              goto LABEL_33;
            }
            v34 = [(TUIAXElement *)self context];
            v35 = [v34 renderModelSection];

            if (!v35
              || v33 == v69
              || !v69
              && ([v33 stateName],
                  v36 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v37 = [v36 isEqualToString:@"default"],
                  v36,
                  v37))
            {
LABEL_33:
              v38 = [v33 identifier];
              v39 = [(TUIAXElement *)self context];
              v40 = [v39 identifierToAXElementMap];
              v41 = [v40 objectForKey:v38];

              if (!v41)
              {
                v42 = [TUIAXElement alloc];
                v43 = [(TUIAXElement *)self context];
                v41 = [(TUIAXElement *)v42 initWithEvaluationContext:v43 accessibilityContainer:self];
              }
              if (v41 != self)
              {
                [(TUIAXElement *)v41 updateWithAXModel:v33];
                [(TUIAXElement *)v41 setAccessibilityContainer:self];
                [v67 addObject:v41];
              }

              id v5 = v68;
            }
          }
        }
      }
      id v30 = [v28 countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v30);
  }

  v44 = [v5 resolvedCustomActions];
  if ([v44 count])
  {
  }
  else
  {
    unsigned __int8 v45 = [v5 hasContextMenu];

    if ((v45 & 1) == 0)
    {
      [(TUIAXElement *)self setAccessibilityCustomActions:0];
      [(TUIAXElement *)self setRetainedCustomActionTargets:0];
      goto LABEL_60;
    }
  }
  v66 = objc_opt_new();
  v65 = objc_opt_new();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v46 = [v5 resolvedCustomActions];
  id v47 = [v46 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v71;
    do
    {
      for (k = 0; k != v48; k = (char *)k + 1)
      {
        if (*(void *)v71 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = *(void **)(*((void *)&v70 + 1) + 8 * (void)k);
        if ([v51 isDefault])
        {
          [(TUIAXElement *)self setDefaultAction:v51];
        }
        else
        {
          v52 = [v51 trigger];
          unsigned int v53 = [v52 isEqualToString:@"accessibilityIncrement"];

          if (v53)
          {
            [(TUIAXElement *)self setIncrementAction:v51];
          }
          else
          {
            v54 = [v51 trigger];
            unsigned int v55 = [v54 isEqualToString:@"accessibilityDecrement"];

            if (v55)
            {
              [(TUIAXElement *)self setDecrementAction:v51];
            }
            else
            {
              v56 = [[TUIAXCustomActionInstantiation alloc] initWithCustomAction:v51 arguments:0 axElement:self];
              id v57 = objc_alloc((Class)UIAccessibilityCustomAction);
              v58 = [v51 label];
              id v59 = [v57 initWithName:v58 target:v56 selector:"invoke"];

              [v66 addObject:v59];
              [v65 addObject:v56];
            }
          }
        }
      }
      id v48 = [v46 countByEnumeratingWithState:&v70 objects:v82 count:16];
    }
    while (v48);
  }

  id v5 = v68;
  if ([v68 hasContextMenu])
  {
    v60 = TUIBundle();
    v61 = [v60 localizedStringForKey:@"Show menu" value:&stru_257BF0 table:@"TemplateUILocalizable"];

    id v62 = [objc_alloc((Class)UIAccessibilityCustomAction) initWithName:v61 target:self selector:"_presentContextMenu"];
    [v66 addObject:v62];
  }
  id v63 = [v66 copy];
  [(TUIAXElement *)self setAccessibilityCustomActions:v63];

  [(TUIAXElement *)self setRetainedCustomActionTargets:v65];
LABEL_60:
  [(TUIAXElement *)self setChildren:v67];
}

- (id)controlViewForOverrideIdentifier:(id)a3
{
  return [(TUIAXElement *)self _viewForOverrideIdentifier:a3 outParentRenderModelSection:0 outParentView:0];
}

- (id)_viewForOverrideIdentifier:(id)a3 outParentRenderModelSection:(id *)a4 outParentView:(id *)a5
{
  id v8 = a3;
  unsigned __int8 v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    CFStringRef v11 = [(TUIAXElement *)self axModel];
    id v10 = [v11 identifier];
  }
  v12 = [(TUIAXElement *)self axModel];
  id v13 = [v12 scrollAncestorIdentifier];

  v14 = [(TUIAXElement *)self context];
  v15 = v14;
  v46 = a4;
  if (!v13)
  {
    unsigned int v26 = [v14 renderModelSection];
    id v27 = [v26 identifierToModelMap];
    CFStringRef v23 = [v27 objectForKey:v10];

    if (v23)
    {
      id v28 = [v23 itemIndex];
      id v29 = [(TUIAXElement *)self context];
      id v30 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v28, [v29 sectionIndex]);

      uint64_t v31 = [(TUIAXElement *)self context];
      id v32 = [v31 screenOffsetProvider];
      v33 = [v32 feedViewForAX];
      v25 = [v33 viewAtIndexPath:v30];

      id v21 = 0;
      if (!a5) {
        goto LABEL_13;
      }
    }
    else
    {
      v43 = [(TUIAXElement *)self context];
      v44 = [v43 screenOffsetProvider];
      unsigned __int8 v45 = [v44 feedViewForAX];

      v25 = [v45 descendentViewWithIdentifier:v10];

      id v21 = 0;
      CFStringRef v23 = 0;
      if (!a5) {
        goto LABEL_13;
      }
    }
LABEL_12:
    *a5 = v21;
    goto LABEL_13;
  }
  v16 = [v14 identifierToAXElementMap];
  v17 = [v16 objectForKey:v13];

  uint64_t v18 = objc_opt_class();
  id v47 = 0;
  unsigned int v19 = [v17 _viewForOverrideIdentifier:0 outParentRenderModelSection:&v47 outParentView:0];
  id v20 = v47;
  id v21 = TUIDynamicCast(v18, v19);

  uint64_t v22 = [v20 identifierToModelMap];
  CFStringRef v23 = [v22 objectForKey:v10];

  if (v23)
  {
    v24 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v23 itemIndex], 0);
    v25 = [v21 viewAtIndexPath:v24];
  }
  else
  {
    v25 = [v21 descendentViewWithIdentifier:v10];
  }

  if (a5) {
    goto LABEL_12;
  }
LABEL_13:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v34 = objc_opt_class();
    v35 = TUIDynamicCast(v34, v25);
    uint64_t v36 = [v35 scrollView];

    v25 = (void *)v36;
  }
  if (v25)
  {
    uint64_t v37 = objc_opt_class();
    v38 = TUIDynamicCast(v37, v25);
    v39 = [v38 renderModel];

    v40 = [v39 sections];
    v41 = [v40 objectAtIndexedSubscript:0];

    if (v46) {
      id *v46 = v41;
    }
  }

  return v25;
}

- (id)_scrollAncestor
{
  id v5 = 0;
  id v2 = [(TUIAXElement *)self _viewForOverrideIdentifier:0 outParentRenderModelSection:0 outParentView:&v5];
  id v3 = v5;

  return v3;
}

- (id)_currentStateForControl
{
  uint64_t v3 = objc_opt_class();
  v4 = [(TUIAXElement *)self controlViewForOverrideIdentifier:0];
  id v5 = TUIDynamicCast(v3, v4);

  if (v5)
  {
    unsigned int v6 = [v5 currentState];
  }
  else
  {
    unsigned int v6 = @"default";
  }
  id v7 = v6;

  return v7;
}

- (BOOL)_shouldInferAccessibilityLabel
{
  uint64_t v2 = [(TUIAXElement *)self axModel];
  uint64_t v3 = [(id)v2 axAttributes];

  LODWORD(v2) = [v3 isAXElement];
  unsigned int v4 = [v3 accessibilityTraits];
  LODWORD(v2) = (v2 | (v4 >> 2)) & ([v3 axTouchContainer] ^ 1);

  return v2;
}

- (BOOL)_presentContextMenu
{
  uint64_t v3 = objc_opt_class();
  unsigned int v4 = [(TUIAXElement *)self axModel];
  id v5 = [v4 identifier];
  unsigned int v6 = [(TUIAXElement *)self controlViewForOverrideIdentifier:v5];
  id v7 = TUIDynamicCast(v3, v6);

  LOBYTE(v6) = [v7 presentContextMenuForAccessibility];
  return (char)v6;
}

- (id)accessibilityIdentifier
{
  uint64_t v3 = [(TUIAXElement *)self axModel];
  unsigned int v4 = [v3 axAttributes];
  id v5 = [v4 axIdentifier];

  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)TUIAXElement;
    id v5 = [(TUIAXElement *)&v7 accessibilityIdentifier];
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v2 = [(TUIAXElement *)self axModel];
  uint64_t v3 = [v2 axAttributes];
  unsigned __int8 v4 = [v3 isAXElement];

  return v4;
}

- (id)accessibilityElements
{
  uint64_t v3 = [(TUIAXElement *)self children];
  unsigned __int8 v4 = [(TUIAXElement *)self axModel];
  unsigned int v5 = [v4 shouldVendControlView];

  if (v5)
  {
    unsigned int v6 = [(TUIAXElement *)self axModel];
    objc_super v7 = [v6 identifier];
    id v8 = [(TUIAXElement *)self controlViewForOverrideIdentifier:v7];

    if (v8)
    {
      CFStringRef v11 = v8;
      uint64_t v9 = +[NSArray arrayWithObjects:&v11 count:1];

      [v8 setAccessibilityContainer:self];
      uint64_t v3 = (void *)v9;
    }
  }

  return v3;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(TUIAXElement *)self axModel];
  unsigned __int8 v4 = [v3 axAttributes];
  unsigned int v5 = [v4 axLabel];

  if (![v5 length]
    && [(TUIAXElement *)self _shouldInferAccessibilityLabel])
  {
    uint64_t v6 = [(TUIAXElement *)self inferredLabel];

    unsigned int v5 = (void *)v6;
  }
  objc_super v7 = [(TUIAXElement *)self axModel];
  if (![v7 isControl]) {
    goto LABEL_12;
  }
  if (![v5 length])
  {

    goto LABEL_9;
  }
  id v8 = [(TUIAXElement *)self axModel];
  unsigned int v9 = [v8 isEditableControl];

  if (v9)
  {
LABEL_9:
    objc_super v7 = [(TUIAXElement *)self controlViewForOverrideIdentifier:0];
    id v10 = [v7 accessibilityLabel];
    if ([v10 length])
    {
      id v11 = v10;

      unsigned int v5 = v11;
    }

LABEL_12:
  }

  return v5;
}

- (id)accessibilityValue
{
  uint64_t v2 = [(TUIAXElement *)self axModel];
  uint64_t v3 = [v2 axAttributes];
  unsigned __int8 v4 = [v3 axValue];

  return v4;
}

- (id)accessibilityHint
{
  uint64_t v2 = [(TUIAXElement *)self axModel];
  uint64_t v3 = [v2 axAttributes];
  unsigned __int8 v4 = [v3 axHint];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v24.receiver = self;
  v24.super_class = (Class)TUIAXElement;
  unint64_t v3 = [(TUIAXElement *)&v24 accessibilityTraits];
  unsigned __int8 v4 = [(TUIAXElement *)self axModel];
  unsigned int v5 = [v4 axAttributes];
  unsigned int v6 = [v5 axButton];
  UIAccessibilityTraits v7 = UIAccessibilityTraitButton;
  if (!v6) {
    UIAccessibilityTraits v7 = 0;
  }
  UIAccessibilityTraits v8 = v7 | v3;
  if ([v5 axImage]) {
    UIAccessibilityTraits v9 = UIAccessibilityTraitImage;
  }
  else {
    UIAccessibilityTraits v9 = 0;
  }
  unsigned int v10 = [v5 axHeading];
  UIAccessibilityTraits v11 = UIAccessibilityTraitHeader;
  if (!v10) {
    UIAccessibilityTraits v11 = 0;
  }
  UIAccessibilityTraits v12 = v8 | v9 | v11;
  if (([v4 shouldScrollVertically] & 1) != 0
    || [v4 shouldScrollHorizontally])
  {
    v12 |= UIAccessibilityTraitScrollable;
  }
  if ([v5 axDisabled]) {
    UIAccessibilityTraits v13 = UIAccessibilityTraitNotEnabled;
  }
  else {
    UIAccessibilityTraits v13 = 0;
  }
  unsigned int v14 = [v5 axAdjustable];
  UIAccessibilityTraits v15 = UIAccessibilityTraitAdjustable;
  if (!v14) {
    UIAccessibilityTraits v15 = 0;
  }
  UIAccessibilityTraits v16 = v12 | v15;
  unsigned int v17 = [v5 axToggle];
  UIAccessibilityTraits v18 = UIAccessibilityTraitToggleButton;
  if (!v17) {
    UIAccessibilityTraits v18 = 0;
  }
  UIAccessibilityTraits v19 = v13 | v18;
  unsigned int v20 = [v5 axStaticText];
  UIAccessibilityTraits v21 = UIAccessibilityTraitStaticText;
  if (!v20) {
    UIAccessibilityTraits v21 = 0;
  }
  unint64_t v22 = v19 | v21 | v16;

  return v22;
}

- (BOOL)canBecomeFocused
{
  if (UIAccessibilityIsVoiceOverRunning()
    && [(TUIAXElement *)self _accessibilityIsFKARunningForFocusItem])
  {
    return [(TUIAXElement *)self isAccessibilityElement];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TUIAXElement;
    return [(TUIAXElement *)&v4 canBecomeFocused];
  }
}

- (id)accessibilityContainer
{
  v10.receiver = self;
  v10.super_class = (Class)TUIAXElement;
  unint64_t v3 = [(TUIAXElement *)&v10 accessibilityContainer];
  if (!_AXSFullKeyboardAccessEnabled() || !UIAccessibilityIsVoiceOverRunning())
  {
    id v8 = v3;
    goto LABEL_12;
  }
  objc_super v4 = [(TUIAXElement *)self context];
  unsigned int v5 = [v4 screenOffsetProvider];
  unsigned int v6 = v5;
  if (v5)
  {
    UIAccessibilityTraits v7 = [v5 topLevelAXElement];
    if (v7 == self)
    {
      id v8 = [(TUIAXElement *)self _scrollAncestor];
      if (v8 || ([v6 feedViewForAX], (id v8 = (id)objc_claimAutoreleasedReturnValue()) != 0))
      {

        goto LABEL_11;
      }
    }
  }
  id v8 = v3;
LABEL_11:

LABEL_12:

  return v8;
}

- (int64_t)accessibilityContainerType
{
  unint64_t v3 = [(TUIAXElement *)self axModel];
  objc_super v4 = [v3 axAttributes];
  v7.receiver = self;
  v7.super_class = (Class)TUIAXElement;
  id v5 = [(TUIAXElement *)&v7 accessibilityContainerType];
  if ([v4 axTouchContainer]) {
    id v5 = &dword_4;
  }

  return (int64_t)v5;
}

- (CGRect)accessibilityFrame
{
  CGFloat x = CGPointZero.x;
  CGFloat y = CGPointZero.y;
  id v5 = [(TUIAXElement *)self axModel];
  [v5 accessibilityFrameRelativeToScrollAncestor];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  objc_super v10 = self;
  UIAccessibilityTraits v11 = v10;
  do
  {
    UIAccessibilityTraits v12 = [v11 axModel];
    [v12 accessibilityFrameRelativeToScrollAncestor];
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v119.origin.CGFloat x = x;
    v119.origin.CGFloat y = y;
    v119.size.CGFloat width = v7;
    v119.size.CGFloat height = v9;
    CGRect v120 = CGRectOffset(v119, v14, v16);
    CGFloat v17 = v120.origin.x;
    CGFloat v18 = v120.origin.y;
    CGFloat width = v120.size.width;
    CGFloat height = v120.size.height;
    uint64_t v21 = objc_opt_class();
    unint64_t v22 = [v11 _scrollAncestor];
    CFStringRef v23 = TUIDynamicCast(v21, v22);

    [v23 contentOffset];
    CGFloat v25 = -v24;
    [v23 contentOffset];
    CGFloat v27 = -v26;
    v121.origin.CGFloat x = v17;
    v121.origin.CGFloat y = v18;
    v121.size.CGFloat width = width;
    v121.size.CGFloat height = height;
    CGRect v122 = CGRectOffset(v121, v25, v27);
    CGFloat x = v122.origin.x;
    CGFloat y = v122.origin.y;
    CGFloat v7 = v122.size.width;
    CGFloat v9 = v122.size.height;
    id v28 = [v11 axModel];
    unsigned int v29 = [v28 flipsHorizontal];

    if (v29)
    {
      [v23 contentSize];
      double v31 = v30;
      [v23 bounds];
      CGFloat v33 = v31 - v32;
      v123.origin.CGFloat x = x;
      v123.origin.CGFloat y = y;
      v123.size.CGFloat width = v7;
      v123.size.CGFloat height = v9;
      CGRect v124 = CGRectOffset(v123, v33, 0.0);
      CGFloat x = v124.origin.x;
      CGFloat y = v124.origin.y;
      CGFloat v7 = v124.size.width;
      CGFloat v9 = v124.size.height;
    }
    uint64_t v34 = [v11 axModel];
    v35 = [v34 scrollAncestorIdentifier];

    uint64_t v36 = [(TUIAXElement *)v10 context];
    uint64_t v37 = [v36 identifierToAXElementMap];
    uint64_t v38 = [v37 objectForKey:v35];

    UIAccessibilityTraits v11 = (void *)v38;
  }
  while (v38);
  v39 = [(TUIAXElement *)v10 context];
  [v39 sectionOffset];
  CGFloat v41 = v40;
  v42 = [(TUIAXElement *)v10 context];
  [v42 sectionOffset];
  CGFloat v44 = v43;
  v125.origin.CGFloat x = x;
  v125.origin.CGFloat y = y;
  v125.size.CGFloat width = v7;
  v125.size.CGFloat height = v9;
  CGRect v126 = CGRectOffset(v125, v41, v44);
  double v45 = v126.origin.x;
  double v46 = v126.origin.y;
  double v47 = v126.size.width;
  double v48 = v126.size.height;

  uint64_t v49 = [(TUIAXElement *)v10 context];
  v50 = [v49 screenOffsetProvider];

  v51 = [(TUIAXElement *)v10 axModel];
  v52 = [v51 liveTransformAncestorIdentifier];

  unsigned int v53 = [(TUIAXElement *)v10 context];
  v54 = [v53 identifierToAXElementMap];
  unsigned int v55 = [v54 objectForKey:v52];

  if (v55
    || ([(TUIAXElement *)v10 axModel],
        v90 = objc_claimAutoreleasedReturnValue(),
        id v91 = [v90 liveTransformKind],
        v90,
        v91)
    && (unsigned int v55 = v10) != 0)
  {
    CGFloat v118 = v45;
    [v50 boundsForFeedView];
    CGFloat rect = v56;
    double v116 = v57;
    v58 = [(TUIAXElement *)v55 axModel];
    [v58 accessibilityFrameRelativeToScrollAncestor];
    CGFloat v60 = v59;
    CGFloat v62 = v61;
    CGFloat v64 = v63;
    CGFloat v66 = v65;
    v67 = [(TUIAXElement *)v10 context];
    [v67 sectionOffset];
    CGFloat v69 = v68;
    long long v70 = [(TUIAXElement *)v10 context];
    [v70 sectionOffset];
    CGFloat v72 = v71;
    v127.origin.CGFloat x = v60;
    v127.origin.CGFloat y = v62;
    v127.size.CGFloat width = v64;
    v127.size.CGFloat height = v66;
    CGRect v128 = CGRectOffset(v127, v69, v72);
    CGFloat v73 = v128.origin.x;
    CGFloat v74 = v128.origin.y;
    CGFloat v75 = v128.size.width;
    CGFloat v76 = v128.size.height;

    [v50 contentOffset];
    CGFloat v78 = -v77;
    [v50 contentOffset];
    CGFloat v80 = -v79;
    v129.origin.CGFloat x = v73;
    v129.origin.CGFloat y = v74;
    v129.size.CGFloat width = v75;
    v129.size.CGFloat height = v76;
    CGRect v130 = CGRectOffset(v129, v78, v80);
    CGFloat v81 = v130.origin.x;
    CGFloat v82 = v130.origin.y;
    CGFloat v83 = v130.size.width;
    CGFloat v84 = v130.size.height;
    v85 = [(TUIAXElement *)v55 axModel];
    v86 = (char *)[v85 liveTransformKind];

    switch((unint64_t)v86)
    {
      case 2uLL:
        v132.origin.CGFloat x = v81;
        v132.origin.CGFloat y = v82;
        v132.size.CGFloat width = v83;
        v132.size.CGFloat height = v84;
        double v89 = -CGRectGetMinY(v132);
        break;
      case 3uLL:
        goto LABEL_22;
      case 4uLL:
        v92 = [(TUIAXElement *)v10 context];
        [v92 sectionOffset];
        double v94 = v93;

        if (v94 <= 0.0)
        {
LABEL_22:
          v135.origin.CGFloat x = v81;
          v135.origin.CGFloat y = v82;
          v135.size.CGFloat width = v83;
          v135.size.CGFloat height = v84;
          double v89 = v116 * 0.5 - CGRectGetMidY(v135);
        }
        else
        {
          [(TUIAXEvaluationContext *)v10->_context sectionOffset];
          double v117 = v95;
          [v50 availableHeight];
          double v114 = v96;
          [v50 contentOffset];
          CGFloat v98 = -v97;
          [v50 contentOffset];
          v133.origin.CGFloat y = -v99;
          v133.size.CGFloat height = v114 + v117;
          v133.origin.CGFloat x = v98;
          v133.size.CGFloat width = rect;
          double MidY = CGRectGetMidY(v133);
          v134.origin.CGFloat x = v81;
          v134.origin.CGFloat y = v82;
          v134.size.CGFloat width = v83;
          v134.size.CGFloat height = v84;
          double v101 = MidY - CGRectGetMidY(v134);
          if (v101 >= 0.0) {
            double v89 = v101;
          }
          else {
            double v89 = 0.0;
          }
        }
        break;
      case 5uLL:
      case 6uLL:
        v131.origin.CGFloat x = v81;
        v131.origin.CGFloat y = v82;
        v131.size.CGFloat width = v83;
        v131.size.CGFloat height = v84;
        double v87 = v116 - CGRectGetMaxY(v131);
        if (v87 < 0.0 && v86 == (unsigned char *)&dword_4 + 1) {
          double v89 = 0.0;
        }
        else {
          double v89 = v87;
        }
        break;
      default:
        double v89 = 0.0;
        break;
    }
    v136.origin.CGFloat x = v118;
    v136.origin.CGFloat y = v46;
    v136.size.CGFloat width = v47;
    v136.size.CGFloat height = v48;
    CGRect v137 = CGRectOffset(v136, 0.0, v89);
    double v45 = v137.origin.x;
    double v46 = v137.origin.y;
    double v47 = v137.size.width;
    double v48 = v137.size.height;
  }
  [v50 screenCoordinatesForFrame:v45, v46, v47, v48];
  double v103 = v102;
  double v105 = v104;
  double v107 = v106;
  double v109 = v108;

  double v110 = v103;
  double v111 = v105;
  double v112 = v107;
  double v113 = v109;
  result.size.CGFloat height = v113;
  result.size.CGFloat width = v112;
  result.origin.CGFloat y = v111;
  result.origin.CGFloat x = v110;
  return result;
}

- (BOOL)accessibilityActivate
{
  unint64_t v3 = [(TUIAXElement *)self defaultAction];
  if (v3)
  {
    objc_super v4 = [(TUIAXElement *)self axModel];
    id v5 = [v4 axAttributes];
    unsigned __int8 v6 = [v5 axDisabled];

    if ((v6 & 1) == 0)
    {
      CGFloat v7 = [[TUIAXCustomActionInstantiation alloc] initWithCustomAction:v3 arguments:0 axElement:self];
      [(TUIAXCustomActionInstantiation *)v7 invoke];
    }
  }

  return v3 != 0;
}

- (void)accessibilityIncrement
{
  unint64_t v3 = [(TUIAXElement *)self axModel];
  objc_super v4 = [v3 axAttributes];
  unsigned __int8 v5 = [v4 axDisabled];

  if ((v5 & 1) == 0)
  {
    unsigned __int8 v6 = [TUIAXCustomActionInstantiation alloc];
    id v8 = [(TUIAXElement *)self incrementAction];
    CGFloat v7 = [(TUIAXCustomActionInstantiation *)v6 initWithCustomAction:v8 arguments:0 axElement:self];
    [(TUIAXCustomActionInstantiation *)v7 invoke];
  }
}

- (void)accessibilityDecrement
{
  unint64_t v3 = [(TUIAXElement *)self axModel];
  objc_super v4 = [v3 axAttributes];
  unsigned __int8 v5 = [v4 axDisabled];

  if ((v5 & 1) == 0)
  {
    unsigned __int8 v6 = [TUIAXCustomActionInstantiation alloc];
    id v8 = [(TUIAXElement *)self decrementAction];
    CGFloat v7 = [(TUIAXCustomActionInstantiation *)v6 initWithCustomAction:v8 arguments:0 axElement:self];
    [(TUIAXCustomActionInstantiation *)v7 invoke];
  }
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)_accessibilityParentForFindingScrollParent
{
  unint64_t v3 = [(TUIAXElement *)self _scrollAncestor];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    unsigned __int8 v6 = [(TUIAXElement *)self context];
    CGFloat v7 = [v6 screenOffsetProvider];
    id v5 = [v7 feedViewForAX];
  }

  return v5;
}

- (TUIAXModel)axModel
{
  return self->_axModel;
}

- (TUIAXEvaluationContext)context
{
  return self->_context;
}

- (TUIAXCustomAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (TUIAXCustomAction)incrementAction
{
  return self->_incrementAction;
}

- (void)setIncrementAction:(id)a3
{
}

- (TUIAXCustomAction)decrementAction
{
  return self->_decrementAction;
}

- (void)setDecrementAction:(id)a3
{
}

- (NSArray)retainedCustomActionTargets
{
  return self->_retainedCustomActionTargets;
}

- (void)setRetainedCustomActionTargets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedCustomActionTargets, 0);
  objc_storeStrong((id *)&self->_decrementAction, 0);
  objc_storeStrong((id *)&self->_incrementAction, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_axModel, 0);
}

@end