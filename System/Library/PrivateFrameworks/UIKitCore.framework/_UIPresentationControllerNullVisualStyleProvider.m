@interface _UIPresentationControllerNullVisualStyleProvider
- (Class)presentationControllerClassForModalPresentationStyle:(int64_t)a3 inIdiom:(int64_t)a4;
- (_UISheetPresentationMetrics)defaultSheetMetrics;
- (id)defaultStyleForPresentationController:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 inIdiom:(int64_t)a4;
- (id)styleForAlertPresentationController:(id)a3;
- (id)styleForPopoverPresentationController:(id)a3;
- (id)styleForRootPresentationController:(id)a3;
- (id)styleForSearchPresentationController:(id)a3;
- (id)styleForSheetPresentationController:(id)a3;
- (int64_t)defaultConcretePresentationStyleForViewController:(id)a3;
- (int64_t)defaultConcreteTransitionStyleForViewController:(id)a3;
@end

@implementation _UIPresentationControllerNullVisualStyleProvider

- (int64_t)defaultConcreteTransitionStyleForViewController:(id)a3
{
  return 0;
}

- (int64_t)defaultConcretePresentationStyleForViewController:(id)a3
{
  id v4 = a3;
  if (qword_1EB261E90 != -1) {
    dispatch_once(&qword_1EB261E90, &__block_literal_global_390);
  }
  if (_MergedGlobals_1161)
  {
    NSClassFromString(&cfstr_ChatkitAppcard.isa);
    int isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v4 topViewController];
      NSClassFromString(&cfstr_Cnvisualidenti.isa);
      int v7 = objc_opt_isKindOfClass();

      isKindOfClass |= v7;
    }
  }
  else
  {
    int isKindOfClass = 0;
  }
  if (byte_1EB261E89)
  {
    NSClassFromString(&cfstr_PosterboardPos.isa);
    int v8 = objc_opt_isKindOfClass();
  }
  else
  {
    int v8 = 0;
  }
  if (((isKindOfClass | v8) & 1) == 0) {
    goto LABEL_21;
  }
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v9 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1) {
    goto LABEL_14;
  }
  int v11 = _UIInternalPreference_ForceFormSheetsAsDefault;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_ForceFormSheetsAsDefault) {
    goto LABEL_14;
  }
  int64_t v10 = 1;
  while (v9 >= v11)
  {
    _UIInternalPreferenceSync(v9, &_UIInternalPreference_ForceFormSheetsAsDefault, @"ForceFormSheetsAsDefault", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    int v11 = _UIInternalPreference_ForceFormSheetsAsDefault;
    if (v9 == _UIInternalPreference_ForceFormSheetsAsDefault) {
      goto LABEL_25;
    }
  }
  if (!byte_1E8FD535C)
  {
LABEL_14:
    int64_t v10 = 1;
  }
  else
  {
LABEL_21:
    v12 = [(_UIPresentationControllerNullVisualStyleProvider *)self defaultSheetMetrics];
    if ([v12 defaultMode]) {
      int64_t v10 = 2;
    }
    else {
      int64_t v10 = 1;
    }
  }
LABEL_25:

  return v10;
}

- (_UISheetPresentationMetrics)defaultSheetMetrics
{
  return (_UISheetPresentationMetrics *)+[_UISheetPresentationMetrics _defaultMetrics];
}

- (id)styleForRootPresentationController:(id)a3
{
  id v3 = a3;
  id v4 = [[_UIPresentationControllerVisualStyle alloc] initWithPresentationController:v3];

  return v4;
}

- (id)presentationControllerForPresentedViewController:(id)a3 inIdiom:(int64_t)a4
{
  id v6 = a3;
  int v7 = objc_msgSend(objc_alloc(-[_UIPresentationControllerNullVisualStyleProvider presentationControllerClassForModalPresentationStyle:inIdiom:](self, "presentationControllerClassForModalPresentationStyle:inIdiom:", objc_msgSend(v6, "modalPresentationStyle"), a4)), "initWithPresentedViewController:presentingViewController:", v6, 0);

  return v7;
}

- (Class)presentationControllerClassForModalPresentationStyle:(int64_t)a3 inIdiom:(int64_t)a4
{
  v5 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 16:
    case 17:
    case 18:
      goto LABEL_3;
    case 4:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
      break;
    default:
      if (a3 == 100)
      {
LABEL_3:
        v5 = objc_opt_class();
      }
      break;
  }
  return (Class)v5;
}

- (id)defaultStyleForPresentationController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[_UIPresentationControllerVisualStyle alloc] initWithPresentationController:v3];

  return v4;
}

- (id)styleForSheetPresentationController:(id)a3
{
  return 0;
}

- (id)styleForPopoverPresentationController:(id)a3
{
  return 0;
}

- (id)styleForAlertPresentationController:(id)a3
{
  return 0;
}

- (id)styleForSearchPresentationController:(id)a3
{
  return 0;
}

- (id)presentationControllerForPresentedViewController:(id)a3
{
  id v4 = a3;
  v5 = [v4 traitCollection];
  id v6 = -[_UIPresentationControllerNullVisualStyleProvider presentationControllerForPresentedViewController:inIdiom:](self, "presentationControllerForPresentedViewController:inIdiom:", v4, [v5 userInterfaceIdiom]);

  return v6;
}

@end