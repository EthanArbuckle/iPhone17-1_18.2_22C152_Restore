@interface UIClickPresentationInteraction
@end

@implementation UIClickPresentationInteraction

void __55___UIClickPresentationInteraction__performPresentation__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained presentationAssistant];

  if (v4)
  {
    id v7 = WeakRetained;
    uint64_t v8 = 1;
    uint64_t v5 = 9;
    if (!a2) {
      uint64_t v5 = 10;
    }
    v6 = objc_msgSend(WeakRetained, "presentationAssistant", v7, v8, v5);
    [v6 presentation];
    id v10 = 0;
    id v11 = 0;
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    [WeakRetained setPresentationAssistant:0];
    [WeakRetained _endInteractionWithContext:&v7];
  }
}

uint64_t __55___UIClickPresentationInteraction__performPresentation__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[35])
    {
      id v9 = [WeakRetained delegate];
      uint64_t v10 = [v9 _clickPresentationInteraction:v8 shouldMaintainKeyboardAssertionForFirstResponder:v5 presentation:v6];
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __55___UIClickPresentationInteraction__performPresentation__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke_3;
  v3[3] = &unk_1E52E3298;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)UIViewController, 1, v3);
}

uint64_t __55___UIClickPresentationInteraction__performPresentation__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationAssistant];
  [v2 presentFromSourcePreview:*(void *)(a1 + 40) lifecycleCompletion:*(void *)(a1 + 48)];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke_4;
  v4[3] = &unk_1E52D9F70;
  v4[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v4];
}

void __55___UIClickPresentationInteraction__performPresentation__block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _activeEffect];
  [v1 endForHandOff];
}

uint64_t __55___UIClickPresentationInteraction__performPresentation__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke(id *a1)
{
  v2 = [a1[4] view];
  v3 = [v2 _window];
  if (v3)
  {
    uint64_t v4 = *((void *)a1[4] + 1);

    if (v4 == 1)
    {
      objc_msgSend(a1[4], "setInitialLocation:", 1.79769313e308, 1.79769313e308, 1.79769313e308);
      [a1[4] setActiveDriver:a1[5]];
      if (!*((unsigned char *)a1[4] + 48)
        && ((objc_opt_respondsToSelector() & 1) == 0 || [a1[5] allowsFeedback]))
      {
        id v5 = a1[4];
        if (!v5[31])
        {
LABEL_9:
          v5[49] = 1;
          *((unsigned char *)a1[4] + 48) = 1;
          uint64_t v8 = [a1[4] feedbackGenerator];
          [v8 userInteractionStarted];

          goto LABEL_10;
        }
        id v6 = [v5 delegate];
        int v7 = [v6 _clickPresentationInteractionShouldPlayFeedback:a1[4]];

        if (v7)
        {
          id v5 = a1[4];
          goto LABEL_9;
        }
      }
LABEL_10:
      id v9 = [a1[4] delegate];
      uint64_t v10 = a1[4];
      if (*((unsigned char *)v10 + 21))
      {
        id v11 = [a1[4] _clickDriverTouch];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke_2;
        v16[3] = &unk_1E5300860;
        v16[4] = a1[4];
        id v17 = a1[6];
        [v9 _clickPresentationInteraction:v10 shouldBeginWithTouch:v11 completion:v16];
      }
      else if (*((unsigned char *)v10 + 16))
      {
        id v15 = a1[4];
        handleEvent(stateMachineSpec_3, v10[1], 0, (uint64_t)&v15, v10 + 1);
        v13 = [a1[4] delegate];
        char v14 = [v13 clickPresentationInteractionShouldBegin:a1[4]];

        *((unsigned char *)a1[4] + 51) = v14 ^ 1;
        (*((void (**)(void))a1[6] + 2))();
      }

      return;
    }
  }
  else
  {
  }
  v12 = (void (*)(void))*((void *)a1[6] + 2);
  v12();
}

uint64_t __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 51) = a2 != 0;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v3 = *(void **)(a1 + 32);
    return [v3 setActiveDriver:0];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    handleEvent(stateMachineSpec_3, *(void *)(v5 + 8), 0, (uint64_t)&v5, (uint64_t *)(v5 + 8));
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86___UIClickPresentationInteraction__attemptDragLiftAtLocation_useDefaultLiftAnimation___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (([*(id *)(a1 + 32) allowsSimultaneousRecognitionDuringLift] & 1) == 0)
    {
      id v4 = [*(id *)(a1 + 40) exclusionRelationshipGestureRecognizer];
      [v4 _succeed];
    }
  }
  else
  {
    v3 = *(unsigned char **)(a1 + 40);
    if (v3[51])
    {
      -[_UIClickPresentationInteraction _endInteractionDidComplete:completion:](v3, 0);
    }
  }
}

void __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained[25])
  {
    uint64_t v5 = [WeakRetained delegate];
    id v6 = [v4 presentationAssistant];
    int v7 = [v6 presentation];
    uint64_t v8 = [v5 _clickPresentationInteraction:v4 liveDragPreviewForPresentation:v7 dragItem:v9];

    if (v8)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
      [v9 setTargetedLiftPreview:v8];
    }
  }
}

uint64_t __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = [v7 _fenceHandler];

        if (v8)
        {
          id v9 = [v7 _fenceHandler];
          v9[2]();
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke_3;
  v11[3] = &unk_1E52D9F70;
  v11[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v11];
}

void __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke_3(uint64_t a1)
{
}

void __61___UIClickPresentationInteraction__handleTransitionToPreview__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3 && v3[1] == 4)
  {
    if (a2)
    {
      [v3 present];
    }
    else
    {
      [v3 _cancelWithReason:11 alongsideActions:0 completion:0];
    }
  }
  else
  {
    uint64_t v4 = [NSNumber numberWithBool:a2];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

unsigned char *__83___UIClickPresentationInteraction__handleDidTransitionToPossibleFromState_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(v2 + 32);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v2 = *(void *)(a1 + 48);
  }
  if (!*(void *)(v2 + 24))
  {
    uint64_t v4 = [*(id *)(a1 + 32) presentation];
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;
  }
  result = *(unsigned char **)(a1 + 40);
  if ((result[19] || result[30]) && *(void *)(*(void *)(a1 + 48) + 16) != 1)
  {
    return (unsigned char *)objc_msgSend(result, "_delegate_interactionEndedWithContext:");
  }
  return result;
}

_UIGravityWellEffect *__60___UIClickPresentationInteraction__prepareInteractionEffect__block_invoke(uint64_t a1)
{
  return +[_UIGravityWellEffect effectWithDescriptor:*(void *)(a1 + 32) continuationPreview:*(void *)(a1 + 40)];
}

id __60___UIClickPresentationInteraction__prepareInteractionEffect__block_invoke_2(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1[8] + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = +[_UIClickHighlightInteractionEffect effectWithPreview:a1[4] continuingFromPreview:a1[5]];
    uint64_t v4 = *(void *)(a1[8] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void *)(*(void *)(a1[8] + 8) + 40);
  }
  id v6 = +[_UIGravityWellAdaptorEffect effectWithAdaptedClickEffect:v2];
  [v6 setDescriptor:a1[6] andKey:a1[7]];
  return v6;
}

void __95___UIClickPresentationInteraction__dragInteractionPresentation_sessionDidEnd_withoutBeginning___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[28])
  {
    uint64_t v3 = [v2 delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) items];
    [v3 _clickPresentationInteraction:v4 dragSessionDidEndForItems:v5];

    uint64_t v2 = *(unsigned char **)(a1 + 32);
  }
  id v6 = [v2 associatedDragInteraction];
  int v7 = [*(id *)(a1 + 32) latentAssociatedDragInteraction];

  if (v6 != v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) latentAssociatedDragInteraction];
    [v8 _setPresentationDelegate:0];

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 88);
    *(void *)(v9 + 88) = 0;
  }
}

@end