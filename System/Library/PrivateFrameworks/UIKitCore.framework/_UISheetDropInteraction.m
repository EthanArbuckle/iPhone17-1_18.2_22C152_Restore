@interface _UISheetDropInteraction
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (NSMapTable)activityTypesOrActivities;
- (UIDropInteraction)dropInteraction;
- (UIPresentationController)presentationController;
- (UIView)view;
- (_UISheetDropInteraction)initWithDelegate:(id)a3;
- (_UISheetDropInteractionDelegate)delegate;
- (id)_activityTypeForSession:(id)a3;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (void)_activityForSession:(id)a3 completion:(id)a4;
- (void)_removeActivityTypeOrActivityForSession:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)setPresentationController:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UISheetDropInteraction

- (void)didMoveToView:(id)a3
{
}

- (_UISheetDropInteraction)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UISheetDropInteraction;
  v5 = [(_UISheetDropInteraction *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [[UIDropInteraction alloc] initWithDelegate:v6];
    dropInteraction = v6->_dropInteraction;
    v6->_dropInteraction = v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    activityTypesOrActivities = v6->_activityTypesOrActivities;
    v6->_activityTypesOrActivities = (NSMapTable *)v9;
  }
  return v6;
}

- (void)willMoveToView:(id)a3
{
  v3 = [(_UISheetDropInteraction *)self view];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (id)_activityTypeForSession:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_UISheetDropInteraction *)self activityTypesOrActivities];
  v6 = [v5 objectForKey:v4];

  if (v6) {
    goto LABEL_2;
  }
  v8 = [(_UISheetDropInteraction *)self activityTypesOrActivities];
  uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  [v8 setObject:v9 forKey:v4];

  v10 = [v4 items];
  v11 = [v10 firstObject];
  objc_super v12 = [v11 itemProvider];

  if (([v12 hasItemConformingToTypeIdentifier:@"com.apple.uikit.scene"] & 1) == 0)
  {
LABEL_15:

    v6 = 0;
    goto LABEL_16;
  }
  v13 = [v12 teamData];
  v14 = [v12 teamData];

  if (!v14
    || ([MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:0],
        (v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_15;
  }
  v16 = v15;
  v17 = [v15 activityType];

  if (v17)
  {
    v6 = [v16 activityType];
    if (v6)
    {
LABEL_9:
      v18 = [(_UISheetDropInteraction *)self activityTypesOrActivities];
      [v18 setObject:v6 forKey:v4];
    }
  }
  else
  {
    v21 = [v16 sceneIdentifier];

    if (!v21)
    {

      v6 = 0;
      goto LABEL_2;
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [(id)UIApp _openSessionsIncludingInternal:1];
    v6 = (void *)[obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v6)
    {
      v30 = v13;
      uint64_t v32 = *(void *)v34;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v34 != v32) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v24 = [v23 persistentIdentifier];
          v25 = v16;
          v26 = [v16 sceneIdentifier];
          int v27 = [v24 isEqualToString:v26];

          if (v27)
          {
            v28 = [v23 scene];

            if (v28)
            {
              v29 = [v23 scene];
              +[_UICanvasUserActivityManager _saveRestorationStateForScene:v29];
            }
            v6 = [v23 stateRestorationActivity];
            v13 = v30;
            v16 = v25;
            goto LABEL_33;
          }
          v16 = v25;
        }
        v6 = (void *)[obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v6) {
          continue;
        }
        break;
      }
      v13 = v30;
    }
LABEL_33:

    if (v6) {
      goto LABEL_9;
    }
  }

LABEL_2:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v6 = v7;
LABEL_13:
    v19 = v7;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 activityType];
    goto LABEL_13;
  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (void)_activityForSession:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void *))a4;
  uint64_t v9 = [(_UISheetDropInteraction *)self activityTypesOrActivities];
  v10 = [v9 objectForKey:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[2](v8, v10);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = objc_opt_class();
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58___UISheetDropInteraction__activityForSession_completion___block_invoke;
      v14[3] = &unk_1E52E3E60;
      v15 = v8;
      id v12 = (id)[v7 loadObjectsOfClass:v11 completion:v14];
    }
    else
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"_UISheetDropInteraction.m" lineNumber:160 description:@"Called _activityForSession: for a session that does not have an activity or activity type."];
    }
  }
}

- (void)_removeActivityTypeOrActivityForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(_UISheetDropInteraction *)self activityTypesOrActivities];
  [v5 removeObjectForKey:v4];
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5 = [(_UISheetDropInteraction *)self _activityTypeForSession:a4];
  if (v5)
  {
    v6 = [(_UISheetDropInteraction *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0
      || ([(_UISheetDropInteraction *)self delegate],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 _sheetDropInteraction:self canHandleUserActivityOfType:v5],
          v8,
          v9))
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v4 = [[UIDropProposal alloc] initWithDropOperation:2];
  return v4;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6 = a4;
  char v7 = [(_UISheetDropInteraction *)self _activityTypeForSession:v6];
  if (v7)
  {
    v8 = [(_UISheetDropInteraction *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(_UISheetDropInteraction *)self delegate];
      uint64_t v11 = [v10 _sheetDropInteraction:self presentingViewControllerForDroppingUserActivityOfType:v7];
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v12 = [(_UISheetDropInteraction *)self delegate];
    v13 = [v12 _sheetDropInteraction:self viewControllerForDroppingUserActivityOfType:v7];

    if (!v13)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"_UISheetDropInteraction.m" lineNumber:207 description:@"_sheetDropInteraction:viewControllerForDroppingUserActivityOfType: must return a non-nil view controller."];
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55___UISheetDropInteraction_dropInteraction_performDrop___block_invoke;
    v21[3] = &unk_1E52D9F98;
    id v22 = v11;
    id v14 = v13;
    id v23 = v14;
    id v15 = v11;
    +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)UIViewController, 1, v21);
    v16 = [v14 _existingPresentationControllerImmediate:1 effective:1];
    [(_UISheetDropInteraction *)self setPresentationController:v16];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __55___UISheetDropInteraction_dropInteraction_performDrop___block_invoke_2;
    v19[3] = &unk_1E52FF210;
    v19[4] = self;
    id v20 = v14;
    id v17 = v14;
    [(_UISheetDropInteraction *)self _activityForSession:v6 completion:v19];
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v6 = a5;
  char v7 = [(_UISheetDropInteraction *)self presentationController];

  if (v7)
  {
    v8 = objc_opt_new();
    [v8 _setPreviewMode:2];
    v19 = [UITargetedDragPreview alloc];
    id v20 = [(_UISheetDropInteraction *)self presentationController];
    char v9 = [v20 presentedView];
    v10 = [UIDragPreviewTarget alloc];
    uint64_t v11 = [(_UISheetDropInteraction *)self presentationController];
    id v12 = [v11 presentedView];
    v13 = [v12 superview];
    id v14 = [(_UISheetDropInteraction *)self presentationController];
    id v15 = [v14 presentedView];
    [v15 center];
    v16 = -[UIPreviewTarget initWithContainer:center:](v10, "initWithContainer:center:", v13);
    id v17 = [(UITargetedDragPreview *)v19 initWithView:v9 parameters:v8 target:v16];
  }
  else
  {
    id v17 = (UITargetedDragPreview *)v6;
  }

  return v17;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v6 = a5;
  char v7 = [(_UISheetDropInteraction *)self presentationController];
  v8 = [v7 presentedView];
  [v8 setAlpha:0.0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76___UISheetDropInteraction_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
  v9[3] = &unk_1E52DC698;
  v9[4] = self;
  [v6 addCompletion:v9];
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
}

- (_UISheetDropInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UISheetDropInteractionDelegate *)WeakRetained;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (NSMapTable)activityTypesOrActivities
{
  return self->_activityTypesOrActivities;
}

- (UIPresentationController)presentationController
{
  return self->_presentationController;
}

- (void)setPresentationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_activityTypesOrActivities, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end