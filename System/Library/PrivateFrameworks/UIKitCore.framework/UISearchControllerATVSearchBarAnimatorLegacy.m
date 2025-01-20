@interface UISearchControllerATVSearchBarAnimatorLegacy
@end

@implementation UISearchControllerATVSearchBarAnimatorLegacy

void __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _resultsControllerViewContainer];
  [v1 setAlpha:1.0];
}

void __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsFocusUpdate];
  objc_msgSend(*(id *)(a1 + 40), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
  id v2 = [*(id *)(a1 + 32) presentationController];
  [v2 _disableMenuPressForBackGesture];
}

void __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  v3 = [*(id *)(a1 + 32) searchBar];
  [v3 _setDisableFocus:0];

  v4 = [*(id *)(a1 + 32) searchBar];
  int v5 = [v4 isFirstResponder];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) searchBar];
    [v6 resignFirstResponder];
  }
  id v8 = [*(id *)(a1 + 32) presentingViewController];
  if ([v8 definesPresentationContext])
  {
    v7 = [v8 presentingViewController];

    if (v7) {
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", objc_msgSend(*(id *)(a1 + 40), "isAnimated"), 0);
    }
  }
}

uint64_t __67___UISearchControllerATVSearchBarAnimatorLegacy_animateTransition___block_invoke_4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

uint64_t __80___UISearchControllerATVSearchBarAnimatorLegacy_didFocusSearchBarForController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v10[0] = *MEMORY[0x1E4F1DAB8];
  v10[1] = v3;
  v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v10];

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168));
  double v4 = *(double *)(a1 + 176);
  double v5 = *(double *)(a1 + 184);
  double v6 = *(double *)(a1 + 192);
  double v7 = *(double *)(a1 + 200);
  id v8 = [*(id *)(a1 + 64) _resultsControllerViewContainer];
  objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);

  return [*(id *)(a1 + 72) setAlpha:1.0];
}

void __80___UISearchControllerATVSearchBarAnimatorLegacy_didFocusSearchBarForController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setConstant:*(double *)(a1 + 88)];
  double v2 = *(double *)(a1 + 96);
  double v3 = *(double *)(a1 + 104);
  double v4 = *(double *)(a1 + 112);
  double v5 = *(double *)(a1 + 120);
  double v6 = [*(id *)(a1 + 40) superview];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184));
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216));
  double v7 = *(double *)(a1 + 224);
  double v8 = *(double *)(a1 + 232);
  double v9 = *(double *)(a1 + 240);
  double v10 = *(double *)(a1 + 248);
  v11 = [*(id *)(a1 + 72) _resultsControllerViewContainer];
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  id v13 = [*(id *)(a1 + 80) view];
  v12 = [v13 superview];
  [v12 layoutIfNeeded];
}

uint64_t __82___UISearchControllerATVSearchBarAnimatorLegacy_didUnfocusSearchBarForController___block_invoke(uint64_t a1)
{
  memset(&v14, 0, sizeof(v14));
  double v2 = *(double *)(a1 + 104);
  CGAffineTransformMakeTranslation(&v14, 0.0, v2 * -0.5 + -1.0);
  CGAffineTransform v12 = v14;
  CGAffineTransformScale(&v13, &v12, 1.0, 1.0 / v2);
  CGAffineTransform v14 = v13;
  CGAffineTransform v11 = v13;
  double v3 = [*(id *)(a1 + 32) view];
  CGAffineTransform v10 = v11;
  [v3 setTransform:&v10];

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
  double v4 = *(double *)(a1 + 208);
  double v5 = *(double *)(a1 + 216);
  double v6 = *(double *)(a1 + 224);
  double v7 = *(double *)(a1 + 232);
  double v8 = [*(id *)(a1 + 64) _resultsControllerViewContainer];
  objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);

  return [*(id *)(a1 + 72) setAlpha:0.0];
}

void __82___UISearchControllerATVSearchBarAnimatorLegacy_didUnfocusSearchBarForController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setConstant:*(double *)(a1 + 88)];
  double v2 = *(double *)(a1 + 96);
  double v3 = *(double *)(a1 + 104);
  double v4 = *(double *)(a1 + 112);
  double v5 = *(double *)(a1 + 120);
  double v6 = [*(id *)(a1 + 40) superview];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184));
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216));
  double v7 = *(double *)(a1 + 224);
  double v8 = *(double *)(a1 + 232);
  double v9 = *(double *)(a1 + 240);
  double v10 = *(double *)(a1 + 248);
  CGAffineTransform v11 = [*(id *)(a1 + 72) _resultsControllerViewContainer];
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  id v13 = [*(id *)(a1 + 80) view];
  CGAffineTransform v12 = [v13 superview];
  [v12 layoutIfNeeded];
}

void __97___UISearchControllerATVSearchBarAnimatorLegacy_willFocusOffscreenViewForController_withHeading___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216), *(double *)(a1 + 224));
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(a1 + 232), *(double *)(a1 + 240), *(double *)(a1 + 248), *(double *)(a1 + 256));
  objc_msgSend(*(id *)(a1 + 72), "setFrame:", *(double *)(a1 + 264), *(double *)(a1 + 272), *(double *)(a1 + 280), *(double *)(a1 + 288));
  objc_msgSend(*(id *)(a1 + 80), "setFrame:", *(double *)(a1 + 296), *(double *)(a1 + 304), *(double *)(a1 + 312), *(double *)(a1 + 320));
  [*(id *)(a1 + 88) setConstant:*(double *)(a1 + 328)];
  double v2 = *(double *)(a1 + 336);
  double v3 = *(double *)(a1 + 344);
  double v4 = *(double *)(a1 + 352);
  double v5 = *(double *)(a1 + 360);
  double v6 = [*(id *)(a1 + 96) view];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  id v8 = [*(id *)(a1 + 96) view];
  double v7 = [v8 superview];
  [v7 layoutIfNeeded];
}

@end