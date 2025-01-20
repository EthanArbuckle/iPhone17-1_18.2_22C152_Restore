@interface PREditor
- (BOOL)pu_canApplyParallaxToViews;
- (BOOL)pu_isDepthEffectDisallowed;
- (PUPosterEditingLook)pu_currentLook;
- (UIAction)pu_placeholderAction;
- (UIEdgeInsets)pu_editingChromeDodgingInsets;
- (id)pu_disableIdleTimer;
- (id)pu_viewForMenuElementIdentifier:(id)a3;
- (void)pu_requestDismissalWithAction:(int64_t)a3;
- (void)pu_updateLookProperties;
- (void)pu_updateLooks;
- (void)pu_updateLuminanceValuesForLooks;
- (void)px_updatePreferences:(id)a3;
@end

@implementation PREditor

- (void)pu_requestDismissalWithAction:(int64_t)a3
{
  v4 = self;
  PREditor.pu_requestDismissal(with:)(a3);
}

- (BOOL)pu_canApplyParallaxToViews
{
  return 1;
}

- (void)pu_updateLooks
{
  v2 = self;
  PREditor.pu_updateLooks()();
}

- (void)pu_updateLookProperties
{
  v2 = self;
  PREditor.pu_updateLookProperties()();
}

- (void)pu_updateLuminanceValuesForLooks
{
  v2 = self;
  PREditor.pu_updateLuminanceValuesForLooks()();
}

- (BOOL)pu_isDepthEffectDisallowed
{
  v2 = self;
  unsigned __int8 v3 = PREditor.pu_isDepthEffectDisallowed.getter();

  return v3 & 1;
}

- (UIAction)pu_placeholderAction
{
  v2 = self;
  id v3 = PREditor.pu_placeholderAction.getter();

  return (UIAction *)v3;
}

- (PUPosterEditingLook)pu_currentLook
{
  v2 = self;
  id v3 = PREditor.pu_currentLook.getter();

  return (PUPosterEditingLook *)v3;
}

- (UIEdgeInsets)pu_editingChromeDodgingInsets
{
  v2 = self;
  double v3 = PREditor.pu_editingChromeDodgingInsets.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (void)px_updatePreferences:(id)a3
{
}

- (id)pu_disableIdleTimer
{
  v2 = self;
  id v3 = PREditor.pu_disableIdleTimer()();

  return v3;
}

- (id)pu_viewForMenuElementIdentifier:(id)a3
{
  uint64_t v4 = sub_100028CE0();
  double v6 = v5;
  double v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  double v9 = (void *)PREditor.pu_view(forMenuElementIdentifier:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

@end