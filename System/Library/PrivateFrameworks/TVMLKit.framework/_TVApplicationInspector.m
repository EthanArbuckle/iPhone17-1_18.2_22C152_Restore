@interface _TVApplicationInspector
- (BOOL)isInspectionModeEnabled;
- (NSHashTable)highlightViews;
- (TVApplicationController)applicationController;
- (_TVApplicationInspector)initWithApplicationController:(id)a3;
- (_TVInspectorCapturingView)capturingView;
- (id)_highlightViewForElement:(id)a3 contentColor:(id)a4 borderColor:(id)a5;
- (id)rootView;
- (void)cancelHighlight;
- (void)capturingView:(id)a3 didCaptureTapOnView:(id)a4;
- (void)highlightViewElements:(id)a3 contentColor:(id)a4 borderColor:(id)a5;
- (void)setInspectionModeEnabled:(BOOL)a3;
@end

@implementation _TVApplicationInspector

- (_TVApplicationInspector)initWithApplicationController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TVApplicationInspector;
  v5 = [(_TVApplicationInspector *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_applicationController, v4);
    v6->_inspectionModeEnabled = 0;
  }

  return v6;
}

- (NSHashTable)highlightViews
{
  highlightViews = self->_highlightViews;
  if (!highlightViews)
  {
    id v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v5 = self->_highlightViews;
    self->_highlightViews = v4;

    highlightViews = self->_highlightViews;
  }
  return highlightViews;
}

- (_TVInspectorCapturingView)capturingView
{
  capturingView = self->_capturingView;
  if (!capturingView)
  {
    id v4 = [_TVInspectorCapturingView alloc];
    v5 = -[_TVInspectorCapturingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v6 = self->_capturingView;
    self->_capturingView = v5;

    [(_TVInspectorCapturingView *)self->_capturingView setDelegate:self];
    capturingView = self->_capturingView;
  }
  return capturingView;
}

- (id)rootView
{
  v3 = [(_TVApplicationInspector *)self applicationController];
  id v4 = [v3 keyTraitEnvironment];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = [v3 keyTraitEnvironment];
  v7 = v6;
  if (isKindOfClass)
  {
    uint64_t v8 = [v6 view];
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v3 keyTraitEnvironment];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v11 = [(_TVApplicationInspector *)self applicationController];
    v12 = [v11 navigationController];
    v13 = [v12 view];
    id v10 = [v13 window];
  }
  return v10;
}

- (void)setInspectionModeEnabled:(BOOL)a3
{
  if (self->_inspectionModeEnabled != a3)
  {
    self->_inspectionModeEnabled = a3;
    if (a3)
    {
      id v6 = [(_TVApplicationInspector *)self rootView];
      id v4 = [(_TVApplicationInspector *)self capturingView];
      [v6 bounds];
      objc_msgSend(v4, "setFrame:");

      v5 = [(_TVApplicationInspector *)self capturingView];
      [v6 addSubview:v5];
    }
    else
    {
      id v6 = [(_TVApplicationInspector *)self capturingView];
      [v6 removeFromSuperview];
    }
  }
}

- (void)capturingView:(id)a3 didCaptureTapOnView:(id)a4
{
  objc_msgSend(MEMORY[0x263F4B4D0], "tv_approximateViewElementForView:", a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = [(_TVApplicationInspector *)self applicationController];
    id v6 = [v5 _appContext];
    [v6 inspectElement:v7];

    [(_TVApplicationInspector *)self setInspectionModeEnabled:0];
  }
}

- (void)highlightViewElements:(id)a3 contentColor:(id)a4 borderColor:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(_TVApplicationInspector *)self cancelHighlight];
  v11 = [(_TVApplicationInspector *)self highlightViews];
  [v11 removeAllObjects];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v24;
    *(void *)&long long v14 = 138412290;
    long long v22 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v19 = -[_TVApplicationInspector _highlightViewForElement:contentColor:borderColor:](self, "_highlightViewForElement:contentColor:borderColor:", v18, v9, v10, v22, (void)v23);
        if (v19)
        {
          v20 = [(_TVApplicationInspector *)self highlightViews];
          [v20 addObject:v19];
        }
        else
        {
          [(_TVApplicationInspector *)self cancelHighlight];
          v21 = TVMLKitLogObject;
          if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v22;
            uint64_t v28 = v18;
            _os_log_debug_impl(&dword_230B4C000, v21, OS_LOG_TYPE_DEBUG, "Couldn't find view to highlight for %@", buf, 0xCu);
          }
        }
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v15);
  }
}

- (void)cancelHighlight
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(_TVApplicationInspector *)self highlightViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) removeFromSuperview];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_highlightViewForElement:(id)a3 contentColor:(id)a4 borderColor:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = objc_msgSend(v7, "tv_proxyView");
  v11 = [v10 window];
  if (!v11 || ([v10 isHidden] & 1) != 0)
  {

LABEL_4:
    uint64_t v12 = 0;
    goto LABEL_5;
  }
  [v10 alpha];
  double v15 = v14;

  if (v15 <= 0.0) {
    goto LABEL_4;
  }
  v47 = v10;
  uint64_t v16 = [_TVInspectorHighlightView alloc];
  v17 = -[_TVInspectorHighlightView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v49 = v8;
  [(_TVInspectorHighlightView *)v17 setContentColor:v8];
  v46 = v17;
  id v48 = v9;
  [(_TVInspectorHighlightView *)v17 setBorderColor:v9];
  id v18 = objc_alloc(MEMORY[0x263F089B8]);
  v19 = [v7 elementName];
  v20 = (void *)[v18 initWithString:v19];

  uint64_t v21 = *MEMORY[0x263F1C238];
  long long v22 = [MEMORY[0x263F1C658] monospacedDigitSystemFontOfSize:15.0 weight:0.0];
  long long v23 = [v20 string];
  objc_msgSend(v20, "addAttribute:value:range:", v21, v22, 0, objc_msgSend(v23, "length"));

  uint64_t v24 = *MEMORY[0x263F1C240];
  long long v25 = [MEMORY[0x263F1C550] systemDarkPinkColor];
  long long v26 = [v20 string];
  objc_msgSend(v20, "addAttribute:value:range:", v24, v25, 0, objc_msgSend(v26, "length"));

  v27 = [v7 attributes];
  uint64_t v28 = [v27 objectForKeyedSubscript:*MEMORY[0x263F4B2D0]];

  if ([v28 length])
  {
    v29 = [NSString stringWithFormat:@"#%@", v28];
    uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v29];
    v31 = [MEMORY[0x263F1C658] monospacedDigitSystemFontOfSize:15.0 weight:0.0];
    objc_msgSend(v30, "addAttribute:value:range:", v21, v31, 0, objc_msgSend(v29, "length"));

    v32 = [MEMORY[0x263F1C550] systemBlueColor];
    objc_msgSend(v30, "addAttribute:value:range:", v24, v32, 0, objc_msgSend(v29, "length"));

    [v20 appendAttributedString:v30];
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v50 = v7;
  v33 = [v7 attributes];
  v34 = [v33 objectForKeyedSubscript:*MEMORY[0x263F4B2C0]];
  v35 = [v34 componentsSeparatedByString:@" "];

  id obj = v35;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(obj);
        }
        v40 = [NSString stringWithFormat:@".%@", *(void *)(*((void *)&v52 + 1) + 8 * i)];
        v41 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v40];
        v42 = [MEMORY[0x263F1C658] monospacedDigitSystemFontOfSize:15.0 weight:0.0];
        objc_msgSend(v41, "addAttribute:value:range:", v21, v42, 0, objc_msgSend(v40, "length"));

        v43 = [MEMORY[0x263F1C550] systemDarkPinkColor];
        objc_msgSend(v41, "addAttribute:value:range:", v24, v43, 0, 1);

        v44 = [MEMORY[0x263F1C550] systemRedColor];
        objc_msgSend(v41, "addAttribute:value:range:", v24, v44, 1, objc_msgSend(v40, "length") - 1);

        [v20 appendAttributedString:v41];
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v37);
  }

  uint64_t v12 = v46;
  v45 = [(_TVInspectorHighlightView *)v46 descriptionLabel];
  [v45 setAttributedText:v20];

  long long v10 = v47;
  [(_TVInspectorHighlightView *)v46 highlightView:v47];

  id v8 = v49;
  id v7 = v50;
  id v9 = v48;
LABEL_5:

  return v12;
}

- (TVApplicationController)applicationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationController);
  return (TVApplicationController *)WeakRetained;
}

- (BOOL)isInspectionModeEnabled
{
  return self->_inspectionModeEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationController);
  objc_storeStrong((id *)&self->_capturingView, 0);
  objc_storeStrong((id *)&self->_highlightViews, 0);
}

@end