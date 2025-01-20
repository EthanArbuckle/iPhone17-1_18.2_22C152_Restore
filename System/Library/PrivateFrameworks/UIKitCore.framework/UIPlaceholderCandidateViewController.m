@interface UIPlaceholderCandidateViewController
- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
@end

@implementation UIPlaceholderCandidateViewController

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v5 = a3;
  if ([(UIPlaceholderPredictiveViewController *)self showsRemoteInputDashViewController])
  {
    goto LABEL_2;
  }
  v7 = +[UIKeyboardImpl activeInstance];
  char v8 = [v7 _showsScribbleIconsInAssistantView];

  if (v8) {
    goto LABEL_4;
  }
  v10 = +[UIKeyboardImpl activeInstance];
  char v11 = [v10 showsCandidateBar];

  if (v11)
  {
LABEL_2:
    LOBYTE(v6) = 1;
    goto LABEL_5;
  }
  if (!UIKeyboardAlwaysShowCandidateBarForCurrentInputMode())
  {
LABEL_4:
    LOBYTE(v6) = 0;
    goto LABEL_5;
  }
  v12 = +[UIKeyboardImpl activeInstance];
  v13 = [v12 textInputTraits];

  if ([v5 conformsToProtocolCached:&unk_1ED431E48])
  {
    v14 = [v5 textInputTraits];
    uint64_t v15 = +[UITextInputTraits traitsByAdoptingTraits:v14];

    v13 = (void *)v15;
  }
  if (!v13)
  {
    if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")|| ![v5 conformsToProtocolCached:&unk_1ED700940]|| (+[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v5), (v13 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ([v5 conformsToProtocolCached:&unk_1ED42F658])
      {
        v13 = +[UITextInputTraits traitsByAdoptingTraits:v5];
      }
      else
      {
        v13 = 0;
      }
    }
  }
  if ([v13 disableInputBars]) {
    LOBYTE(v6) = 0;
  }
  else {
    int v6 = [v13 hidePrediction] ^ 1;
  }

LABEL_5:
  return v6;
}

@end