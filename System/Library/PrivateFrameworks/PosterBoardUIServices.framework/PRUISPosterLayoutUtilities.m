@interface PRUISPosterLayoutUtilities
+ (id)titleBoundsForLayout:(unint64_t)a3 orientation:(int64_t)a4 role:(id)a5 error:(id *)a6;
+ (id)titleBoundsForLayout:(unint64_t)a3 orientation:(int64_t)a4 traitCollection:(id)a5 role:(id)a6 error:(id *)a7;
@end

@implementation PRUISPosterLayoutUtilities

+ (id)titleBoundsForLayout:(unint64_t)a3 orientation:(int64_t)a4 role:(id)a5 error:(id *)a6
{
  id v10 = a5;
  v11 = objc_opt_new();
  v12 = [a1 titleBoundsForLayout:a3 orientation:a4 traitCollection:v11 role:v10 error:a6];

  return v12;
}

+ (id)titleBoundsForLayout:(unint64_t)a3 orientation:(int64_t)a4 traitCollection:(id)a5 role:(id)a6 error:(id *)a7
{
  v45[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  if (a7)
  {
    if (a3)
    {
LABEL_3:
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08338];
      v45[0] = @"Unsupported layout, must be HorizontalTopCentered.";
      v15 = NSDictionary;
      v16 = (__CFString **)v45;
      v17 = &v44;
LABEL_23:
      v20 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
      objc_msgSend(v14, "pr_errorWithCode:userInfo:", 2, v20);
      v38 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }
  else
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PRUISPosterLayoutUtilities.m", 31, @"Invalid parameter not satisfying: %@", @"outError != nil" object file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
  }
  if (([v13 isEqualToString:*MEMORY[0x263F5F578]] & 1) == 0)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08338];
    v43 = @"Unsupported role, must be LockScreen.";
    v15 = NSDictionary;
    v16 = &v43;
    v17 = &v42;
    goto LABEL_23;
  }
  v19 = objc_msgSend(MEMORY[0x263F3F480], "pui_sharedDisplayMonitor");
  v20 = [v19 mainConfiguration];

  [v20 bounds];
  if (v21 >= v22) {
    double v23 = v22;
  }
  else {
    double v23 = v21;
  }
  if (v21 >= v22) {
    double v24 = v21;
  }
  else {
    double v24 = v22;
  }
  int IsLandscape = BSInterfaceOrientationIsLandscape();
  if (IsLandscape) {
    double v26 = v24;
  }
  else {
    double v26 = v23;
  }
  if (!IsLandscape) {
    double v23 = v24;
  }
  if (!v12)
  {
    id v12 = [MEMORY[0x263F1CB00] traitCollectionWithTraits:&__block_literal_global_12];
  }
  [v12 displayScale];
  if (v27 == 0.0)
  {
    v28 = (void *)MEMORY[0x263F1CB00];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __90__PRUISPosterLayoutUtilities_titleBoundsForLayout_orientation_traitCollection_role_error___block_invoke_2;
    v40[3] = &unk_26546BB48;
    id v41 = v20;
    uint64_t v29 = [v28 traitCollectionWithTraits:v40];

    id v12 = (id)v29;
  }
  id v30 = objc_alloc(MEMORY[0x263F5F4B0]);
  v31 = [[_PRUISFakeTraitEnvironment alloc] initWithTraitCollection:v12];
  v32 = (void *)[v30 initWithTraitEnvironment:v31];

  v33 = objc_msgSend(v32, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", 1, 1, 0, 0.0, 0.0, v26, v23);
  [v33 rect];
  v38 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v34 / v26, v35 / v23, v36 / v26, v37 / v23);

LABEL_24:

  return v38;
}

uint64_t __90__PRUISPosterLayoutUtilities_titleBoundsForLayout_orientation_traitCollection_role_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLayoutDirection:-1];
}

void __90__PRUISPosterLayoutUtilities_titleBoundsForLayout_orientation_traitCollection_role_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 pointScale];
  objc_msgSend(v3, "setDisplayScale:");
}

@end