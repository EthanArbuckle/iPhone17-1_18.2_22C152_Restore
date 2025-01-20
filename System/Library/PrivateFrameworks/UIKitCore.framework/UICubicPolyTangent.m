@interface UICubicPolyTangent
@end

@implementation UICubicPolyTangent

void __44___UICubicPolyTangent_keyboardTrackpadCurve__block_invoke()
{
  v0 = objc_alloc_init(_UICubicPolyTangent);
  v1 = (void *)_MergedGlobals_1294;
  _MergedGlobals_1294 = (uint64_t)v0;

  [(id)_MergedGlobals_1294 setInitialLinearGain:0.0];
  v2 = +[_UITextSelectionSettings sharedInstance];
  [v2 gain];
  objc_msgSend((id)_MergedGlobals_1294, "setParabolicGain:");

  [(id)_MergedGlobals_1294 setCubicGain:0.0];
  [(id)_MergedGlobals_1294 setQuarticGain:0.0];
  v3 = +[_UITextSelectionSettings sharedInstance];
  [v3 linear];
  objc_msgSend((id)_MergedGlobals_1294, "setTangentLineSpeed:");

  v4 = +[_UITextSelectionSettings sharedInstance];
  [v4 parabolic];
  objc_msgSend((id)_MergedGlobals_1294, "setTangentSqrtSpeed:");

  [(id)_MergedGlobals_1294 setTangentCbrtSpeed:0.0];
  [(id)_MergedGlobals_1294 setTangentHyperCbrtSpeed:0.0];
  id v5 = +[_UITextSelectionSettings sharedInstance];
  [v5 addKeyObserver:_MergedGlobals_1294];
}

@end