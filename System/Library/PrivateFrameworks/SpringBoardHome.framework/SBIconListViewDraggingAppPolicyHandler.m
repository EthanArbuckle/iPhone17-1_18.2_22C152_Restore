@interface SBIconListViewDraggingAppPolicyHandler
- (BOOL)allowsSpringLoadForSession:(id)a3 onIconView:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (SBIconListViewDraggingDestinationDelegate)draggingDestinationDelegate;
- (id)_destinationFolderIconViewForDragItem:(id)a3 iconIndexPath:(id *)a4 folderRelativeIconIndexPath:(id *)a5;
- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4;
- (id)_iconForDragItem:(id)a3;
- (id)_iconViewForDragItem:(id)a3 createIfNecessary:(BOOL)a4;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (unint64_t)dragHitRegionForDropSession:(id)a3 iconListView:(id)a4 point:(CGPoint)a5 icon:(id)a6;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)handleSpringLoadOnIconView:(id)a3;
- (void)setDraggingDestinationDelegate:(id)a3;
@end

@implementation SBIconListViewDraggingAppPolicyHandler

- (unint64_t)dragHitRegionForDropSession:(id)a3 iconListView:(id)a4 point:(CGPoint)a5 icon:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v13 = objc_msgSend(a3, "items", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [(SBIconListViewDraggingAppPolicyHandler *)self _iconForDragItem:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        if (v18)
        {

          goto LABEL_11;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  unint64_t v19 = objc_msgSend(v11, "dragHitRegionForPoint:icon:", v12, x, y);
  return v19;
}

- (BOOL)allowsSpringLoadForSession:(id)a3 onIconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  v9 = [v8 iconListView];
  if ([v9 contentVisibility])
  {
    char v10 = 0;
  }
  else
  {
    id v11 = [v8 dragDelegate];
    char v10 = [v11 iconListView:v9 shouldAllowSpringLoadedInteractionForIconDropSession:v6 onIconView:v7];
  }
  return v10;
}

- (void)handleSpringLoadOnIconView:(id)a3
{
  id v4 = a3;
  id v7 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  v5 = [v7 iconListView];
  id v6 = [v7 dragDelegate];
  [v6 iconListView:v5 springLoadedInteractionForIconDragDidCompleteOnIconView:v4];
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5 = a4;
  id v6 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  id v7 = [v6 iconListView];
  v8 = [v6 dragDelegate];
  char v9 = [v8 iconListView:v7 canHandleIconDropSession:v5];

  return v9;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5 = a4;
  id v8 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  id v6 = [v8 iconListView];
  id v7 = [v8 dragDelegate];
  [v7 iconListView:v6 iconDropSessionDidEnter:v5];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5 = a4;
  id v6 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  id v7 = [v6 iconListView];
  id v8 = [v6 dragDelegate];
  char v9 = [v8 iconListView:v7 iconDropSessionDidUpdate:v5];

  return v9;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5 = a4;
  id v8 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  id v6 = [v8 iconListView];
  id v7 = [v8 dragDelegate];
  [v7 iconListView:v6 iconDropSessionDidExit:v5];
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = a4;
  id v8 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  id v6 = [v8 iconListView];
  id v7 = [v8 dragDelegate];
  [v7 iconListView:v6 performIconDrop:v5];
}

- (id)_iconForDragItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  id v6 = [v5 iconListView];
  id v7 = [v6 _iconForDragItem:v4];

  return v7;
}

- (id)_iconViewForDragItem:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBIconListViewDraggingAppPolicyHandler *)self _iconForDragItem:a3];
  if (v6)
  {
    id v7 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
    id v8 = [v7 iconListView];
    char v9 = [v8 displayedIconViewForIcon:v6];
    if (!v9 && v4)
    {
      [v8 layoutAndCreateIcon:v6];
      char v9 = [v8 iconViewForIcon:v6];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)_destinationFolderIconViewForDragItem:(id)a3 iconIndexPath:(id *)a4 folderRelativeIconIndexPath:(id *)a5
{
  id v7 = a3;
  id v8 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  char v9 = [v8 iconListView];
  char v10 = [(SBIconListViewDraggingAppPolicyHandler *)self _iconForDragItem:v7];

  if (v10)
  {
    id v11 = [v9 model];
    id v12 = [v11 folder];

    v13 = [v12 indexPathForIcon:v10];
    if (v13)
    {
      id v21 = 0;
      uint64_t v14 = [v12 folderContainingIndexPath:v13 relativeIndexPath:&v21];
      id v15 = v21;
      uint64_t v16 = [v14 icon];
      v17 = [v9 displayedIconViewForIcon:v16];
      if (a4) {
        *a4 = v13;
      }
      if (a5) {
        *a5 = v15;
      }
      id v18 = v17;
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  char v9 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  char v10 = [v9 iconListView];
  [v10 layoutIconsIfNeeded];
  id v11 = [(SBIconListViewDraggingAppPolicyHandler *)self _iconViewForDragItem:v7 createIfNecessary:1];
  if (v11 && ![v10 isDisplayingIconView:v11])
  {
    v35 = 0;
    v13 = v11;
  }
  else
  {
    id v12 = [v9 dragDelegate];
    v13 = [v12 iconListView:v10 iconViewForDroppingIconDragItem:v7 proposedIconView:v11];

    if (v13)
    {
      [v12 iconListView:v10 willUseIconView:v13 forDroppingIconDragItem:v7];
      id v14 = [v13 dropContainerView];
      [v13 bounds];
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      [v13 anchorPoint];
      double v24 = v23;
      double v26 = v25;
      v68.origin.double x = v16;
      v68.origin.double y = v18;
      v68.size.width = v20;
      v68.size.height = v22;
      double MinX = CGRectGetMinX(v68);
      v69.origin.double x = v16;
      v69.origin.double y = v18;
      v69.size.width = v20;
      v69.size.height = v22;
      double v28 = MinX + CGRectGetWidth(v69) * v24;
      v70.origin.double x = v16;
      v70.origin.double y = v18;
      v70.size.width = v20;
      v70.size.height = v22;
      double MinY = CGRectGetMinY(v70);
      v71.origin.double x = v16;
      v71.origin.double y = v18;
      v71.size.width = v20;
      v71.size.height = v22;
      objc_msgSend(v14, "convertPoint:fromView:", v13, v28, MinY + CGRectGetHeight(v71) * v26);
      double v31 = v30;
      double v33 = v32;
      v72.origin.double x = v16;
      v72.origin.double y = v18;
      v72.size.width = v20;
      v72.size.height = v22;
      if (CGRectIsEmpty(v72))
      {
        BOOL v34 = 0;
      }
      else
      {
        v74.origin.double x = v16;
        v74.origin.double y = v18;
        v74.size.width = v20;
        v74.size.height = v22;
        BOOL v34 = !CGRectIsInfinite(v74);
      }
      v55 = [v14 window];

      if (v55 && v34)
      {
        id v56 = objc_alloc(MEMORY[0x1E4FB1728]);
        long long v57 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v65.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v65.c = v57;
        *(_OWORD *)&v65.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        v54 = objc_msgSend(v56, "initWithContainer:center:transform:", v14, &v65, v31, v33);
      }
      else
      {
        v58 = SBLogIconDragging();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v65.a) = 138412290;
          *(void *)((char *)&v65.a + 4) = v14;
          _os_log_impl(&dword_1D7F0A000, v58, OS_LOG_TYPE_DEFAULT, "Drag preview target does not have a window or has a bad frame: %@", (uint8_t *)&v65, 0xCu);
        }

        v54 = 0;
      }
    }
    else
    {
      id v64 = 0;
      v36 = [(SBIconListViewDraggingAppPolicyHandler *)self _destinationFolderIconViewForDragItem:v7 iconIndexPath:0 folderRelativeIconIndexPath:&v64];
      id v14 = v64;
      if (v36
        && ([v36 isAnimatingScrolling] & 1) == 0
        && (uint64_t v37 = [v36 visibleMiniIconListIndex], v37 == objc_msgSend(v14, "sbListIndex")))
      {
        objc_msgSend(v36, "frameForMiniIconAtIndex:", objc_msgSend(v14, "sbIconIndex"));
        objc_msgSend(v10, "convertRect:fromView:", v36);
        CGFloat v39 = v38;
        CGFloat v41 = v40;
        CGFloat v43 = v42;
        CGFloat v45 = v44;
        UIRectGetCenter();
        double v47 = v46;
        double v49 = v48;
        [v10 alignmentIconSize];
        double v51 = v50;
        v73.origin.double x = v39;
        v73.origin.double y = v41;
        v73.size.width = v43;
        v73.size.height = v45;
        CGFloat Height = CGRectGetHeight(v73);
        memset(&v65, 0, sizeof(v65));
        CGAffineTransformMakeScale(&v65, Height / v51, Height / v51);
        id v53 = objc_alloc(MEMORY[0x1E4FB1728]);
        CGAffineTransform v63 = v65;
        v54 = objc_msgSend(v53, "initWithContainer:center:transform:", v10, &v63, v47, v49);
      }
      else
      {
        v54 = 0;
      }
    }
    id v59 = v8;
    v35 = v59;
    if (v54)
    {
      v60 = [v59 retargetedPreviewWithTarget:v54];

      objc_msgSend(v60, "set_springboardPlatterStyle:", 1);
      v35 = v60;
    }
    if (v12)
    {
      uint64_t v61 = [v12 iconListView:v10 previewForDroppingIconDragItem:v7 proposedPreview:v35];

      v35 = (void *)v61;
    }
  }
  return v35;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  char v9 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  char v10 = [v9 iconListView];
  id v11 = [v10 requireAllIconsShownForReason:@"Icon Drop"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__SBIconListViewDraggingAppPolicyHandler_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
  v14[3] = &unk_1E6AACB50;
  id v15 = v11;
  id v12 = v11;
  [v7 addCompletion:v14];
  v13 = [v9 dragDelegate];
  [v13 iconListView:v10 iconDragItem:v8 willAnimateDropWithAnimator:v7];
}

uint64_t __91__SBIconListViewDraggingAppPolicyHandler_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  id v5 = a4;
  id v6 = [(SBIconListViewDraggingAppPolicyHandler *)self draggingDestinationDelegate];
  id v7 = [v6 iconListView];
  id v8 = [v6 dragDelegate];
  char v9 = [v8 iconListView:v7 customSpringAnimationBehaviorForDroppingItem:v5];

  return v9;
}

- (SBIconListViewDraggingDestinationDelegate)draggingDestinationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_draggingDestinationDelegate);
  return (SBIconListViewDraggingDestinationDelegate *)WeakRetained;
}

- (void)setDraggingDestinationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end