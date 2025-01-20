@interface TSDTextInputResponder
- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4;
- (CGRect)_accessibilitySpeakRectForRange:(id)a3;
- (id)_accessibilitySpeakTextSelectionViews;
- (id)_tsaxEditingTextRep;
@end

@implementation TSDTextInputResponder

- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4
{
  return NSSelectorFromString(@"_accessibilitySpeak:") == a3
      || NSSelectorFromString(@"_accessibilityPauseSpeaking:") == a3;
}

- (id)_tsaxEditingTextRep
{
  id v2 = [(TSDTextInputResponder *)self tsaxValueForKey:@"editor"];
  NSClassFromString(@"TSWPEditingController");
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = [v2 tsaxValueForKey:@"editingReps"];
  char v8 = 0;
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)__TSAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  id v6 = [v5 anyObject];
  NSClassFromString(@"TSWPRep");
  if (objc_opt_isKindOfClass()) {
    return v6;
  }
  else {
    return 0;
  }
}

- (id)_accessibilitySpeakTextSelectionViews
{
  id v2 = [(TSDTextInputResponder *)self _tsaxEditingTextRep];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 tsaxValueForKey:@"_selectionHighlightLayer"];
    id v5 = [v3 tsaxValueForKey:@"overlayLayers"];
    id v6 = [v3 tsaxValueForKey:@"knobs"];
    v7 = objc_opt_new();
    id v3 = v7;
    if (v4) {
      [v7 addObject:v4];
    }
    if (v5) {
      [v3 addObjectsFromArray:v5];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) tsaxValueForKey:@"layer"];
          if (v12) {
            [v3 addObject:v12];
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v3;
}

- (CGRect)_accessibilitySpeakRectForRange:(id)a3
{
  uint64_t v16 = 0;
  long long v17 = (double *)&v16;
  uint64_t v18 = 0x4010000000;
  v19 = &unk_41622E;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v21 = size;
  NSClassFromString(@"TSDTextRange");
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(TSDTextInputResponder *)self _tsaxEditingTextRep];
    if (v6)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_27255C;
      v15[3] = &unk_46C120;
      v15[4] = a3;
      v15[5] = v6;
      v15[6] = objc_msgSend(objc_msgSend(v6, "tsaxValueForKey:", @"canvas"), "tsaxValueForKey:", @"canvasController");
      v15[7] = &v16;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v15)) {
        abort();
      }
    }
  }
  double v7 = v17[4];
  double v8 = v17[5];
  double v9 = v17[6];
  double v10 = v17[7];
  _Block_object_dispose(&v16, 8);
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end