@interface UIClickPresentationFeedbackGeneratorConfiguration
@end

@implementation UIClickPresentationFeedbackGeneratorConfiguration

void __70___UIClickPresentationFeedbackGeneratorConfiguration_previewedPattern__block_invoke()
{
  uint64_t v0 = +[_UIFeedbackPattern feedbackPattern];
  v1 = (void *)_MergedGlobals_1268;
  _MergedGlobals_1268 = v0;

  [(id)_MergedGlobals_1268 _setCategory:0x1ED11D500];
  id v11 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:23382 systemSoundID:1519];
  v2 = [v11 hapticParameters];
  LODWORD(v3) = 1.0;
  [v2 setVolume:v3];

  [v11 setHapticOutputMode:3];
  [v11 _setCategory:0x1ED11D500];
  if (v11) {
    [(id)_MergedGlobals_1268 addFeedback:v11 atTime:0.0];
  }
  v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 _feedbackSupportLevel];

  if (v5 >= 2)
  {
    v6 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:32555 systemSoundID:_UISystemSoundIDNone];
    v7 = [v6 audioParameters];
    LODWORD(v8) = *(_DWORD *)"\nף=";
    [v7 setVolume:v8];

    v9 = [v6 audioParameters];
    LODWORD(v10) = 1036831949;
    [v9 setTransposition:v10];

    if (v6)
    {
      [(id)_MergedGlobals_1268 addFeedback:v6 atTime:0.0];
    }
  }
}

void __68___UIClickPresentationFeedbackGeneratorConfiguration_draggedPattern__block_invoke()
{
  uint64_t v0 = +[_UIFeedbackPattern feedbackPattern];
  v1 = (void *)qword_1EB264810;
  qword_1EB264810 = v0;

  [(id)qword_1EB264810 _setCategory:0x1ED11D500];
  id v5 = +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:8023 systemSoundID:1519];
  v2 = [v5 hapticParameters];
  LODWORD(v3) = 1055957975;
  [v2 setVolume:v3];

  [v5 setHapticOutputMode:3];
  [v5 _setCategory:0x1ED11D500];
  v4 = v5;
  if (v5)
  {
    [(id)qword_1EB264810 addFeedback:v5 atTime:0.0];
    v4 = v5;
  }
}

@end