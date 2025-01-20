@interface UISwipeActionController
- ($A7B7FA971CD029BAA4A09478E9E1AEDA)configureForSwipeDirection:(SEL)a3 configuration:(unint64_t)a4 startingAtTouchLocation:(id)a5;
- (BOOL)_isSwipeForIndexPathFirstOccurrenceBeginningOrLastOccurrenceEnding:(id)a3;
- (BOOL)_prefersRTL;
- (BOOL)swipeEnabled;
- (BOOL)swipeHandler:(id)a3 mayBeginSwipeAtLocation:(CGPoint)a4 withProposedDirection:(unint64_t)a5;
- (BOOL)touchAtLocationShouldDismissSwipedItem:(CGPoint)a3 isTouchUp:(BOOL)a4;
- (CGRect)swipeHandlerRestingFrame:(id)a3;
- (NSIndexPath)swipedIndexPath;
- (NSMutableSet)swipeOccurrences;
- (NSSet)swipedIndexPaths;
- (UIScrollView)containerView;
- (UISwipeActionController)initWithSwipeActionHost:(id)a3 style:(unint64_t)a4;
- (UISwipeActionHost)swipeActionHost;
- (UISwipeActionHost_Internal)_internalSwipeActionHost;
- (UISwipeActionsConfiguration)incomingSwipeActionsConfiguration;
- (UISwipeOccurrence)currentSwipeOccurrence;
- (UIView)swipedItemView;
- (_UISwipeHandler)swipeHandler;
- (id)_existingSwipeOccurrenceForIndexPath:(id)a3;
- (id)_swipeActionsConfigurationForSwipeDirection:(unint64_t)a3 indexPath:(id)a4;
- (id)_swipedViewForItemAtIndexPath:(id)a3;
- (unint64_t)_swipeDirectionForLeadingEdge:(BOOL)a3;
- (unint64_t)style;
- (void)_handleDeleteOfSwipeOccurrence:(id)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)dealloc;
- (void)deleteRowAtIndexPath:(id)a3;
- (void)deleteSectionAtIndex:(unint64_t)a3;
- (void)insertRowAtIndexPath:(id)a3;
- (void)insertSectionAtIndex:(unint64_t)a3;
- (void)moveRowAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)moveSectionAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)prepareForSwipeDirection:(unint64_t)a3 startingAtTouchLocation:(CGPoint)a4;
- (void)rebaseUnambiguousSwipeOccurrencesWithBlock:(id)a3;
- (void)reconfigureActiveSwipeOccurrences;
- (void)reloadData;
- (void)resetSwipedItemAnimated:(BOOL)a3 completion:(id)a4;
- (void)setContainerView:(id)a3;
- (void)setCurrentSwipeOccurrence:(id)a3;
- (void)setIncomingSwipeActionsConfiguration:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setSwipeActionHost:(id)a3;
- (void)setSwipeEnabled:(BOOL)a3;
- (void)setSwipeHandler:(id)a3;
- (void)setSwipeOccurrences:(id)a3;
- (void)swipeHandler:(id)a3 didConfirmSwipeWithInfo:(id *)a4;
- (void)swipeHandler:(id)a3 didGenerateSwipeWithInfo:(id *)a4 isTracking:(BOOL)a5;
- (void)swipeHandlerDidBeginSwipe:(id)a3;
- (void)swipeItemAtIndexPath:(id)a3 configuration:(id)a4 direction:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)swipeOccurrence:(id)a3 didChangeStateFrom:(int64_t)a4;
- (void)swipeOccurrence:(id)a3 willFinishWithDeletion:(BOOL)a4;
- (void)swipeOccurrenceDidFinish:(id)a3;
- (void)updateLayout;
@end

@implementation UISwipeActionController

- (id)_existingSwipeOccurrenceForIndexPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_swipeOccurrences;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "indexPath", (void)v15);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = v4;
        v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          char v13 = [v10 isEqual:v11];

          if (v13) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_swipeOccurrences count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
    if ([WeakRetained isTracking])
    {
    }
    else
    {
      id v5 = objc_loadWeakRetained((id *)&self->_containerView);
      int v6 = [v5 isScrollAnimating];

      if (!v6) {
        return;
      }
    }
    uint64_t v7 = [(UISwipeActionController *)self swipeHandler];
    int v8 = [v7 isInteracting];

    if (v8)
    {
      [(UISwipeActionController *)self updateLayout];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v9 = (void *)[(NSMutableSet *)self->_swipeOccurrences copy];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if ([v14 state] != 3 && objc_msgSend(v14, "state") != 4 && objc_msgSend(v14, "state") != 5) {
              [v14 resetAnimated:1 completion:0];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)updateLayout
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_swipeOccurrences;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "updateLayout", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSSet)swipedIndexPaths
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_swipeOccurrences count])
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableSet count](self->_swipeOccurrences, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = self->_swipeOccurrences;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "indexPath", (void)v11);
          [v3 addObject:v9];
        }
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v3;
}

- (NSMutableSet)swipeOccurrences
{
  return self->_swipeOccurrences;
}

- (void)reloadData
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_swipeOccurrences;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "_setDidReloadData", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(UISwipeActionController *)self resetSwipedItemAnimated:0 completion:0];
}

- (void)resetSwipedItemAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  uint64_t v7 = self->_preparingSwipeOccurrence;
  if (v7) {
    *(unsigned char *)&self->_flags |= 1u;
  }
  if ([(NSMutableSet *)self->_swipeOccurrences count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v8 = (void *)[(NSMutableSet *)self->_swipeOccurrences copy];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(UISwipeOccurrence **)(*((void *)&v16 + 1) + 8 * i);
          if (v13 == v7) {
            [(UISwipeOccurrence *)v7 resetWhilePreparing];
          }
          else {
            [(UISwipeOccurrence *)v13 resetAnimated:v4 completion:v6];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    long long v14 = [(UISwipeActionController *)self swipeHandler];
    [v14 resetSwipe];
  }
  else
  {
    long long v15 = [(UISwipeActionController *)self swipeHandler];
    [v15 resetSwipe];

    if (v6) {
      v6[2](v6, 1);
    }
  }
}

- (_UISwipeHandler)swipeHandler
{
  return self->_swipeHandler;
}

- (UISwipeActionController)initWithSwipeActionHost:(id)a3 style:(unint64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UISwipeActionController;
  uint64_t v7 = [(UISwipeActionController *)&v16 init];
  long long v8 = v7;
  if (v7)
  {
    [(UISwipeActionController *)v7 setStyle:a4];
    [(UISwipeActionController *)v8 setSwipeActionHost:v6];
    uint64_t v9 = [[_UISwipeHandler alloc] initWithSwipeController:v8];
    [(UISwipeActionController *)v8 setSwipeHandler:v9];

    uint64_t v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    swipeOccurrences = v8->_swipeOccurrences;
    v8->_swipeOccurrences = v10;

    long long v12 = [(UISwipeActionController *)v8 swipeActionHost];
    uint64_t v13 = [v12 itemContainerViewForSwipeActionController:v8];
    [(UISwipeActionController *)v8 setContainerView:v13];

    id WeakRetained = objc_loadWeakRetained((id *)&v8->_containerView);
    [WeakRetained _addScrollViewScrollObserver:v8];
  }
  return v8;
}

- (UISwipeActionHost)swipeActionHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swipeActionHost);
  return (UISwipeActionHost *)WeakRetained;
}

- (void)setSwipeHandler:(id)a3
{
}

- (void)setSwipeActionHost:(id)a3
{
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void)setContainerView:(id)a3
{
}

- (void)insertRowAtIndexPath:(id)a3
{
  id v4 = a3;
  swipeOccurrences = self->_swipeOccurrences;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__UISwipeActionController_insertRowAtIndexPath___block_invoke;
  v7[3] = &unk_1E5308360;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableSet *)swipeOccurrences enumerateObjectsUsingBlock:v7];
}

- (UISwipeOccurrence)currentSwipeOccurrence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentSwipeOccurrence);
  return (UISwipeOccurrence *)WeakRetained;
}

- (void)rebaseUnambiguousSwipeOccurrencesWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UISwipeActionController.m", 266, @"Invalid parameter not satisfying: %@", @"rebaseBlock != nil" object file lineNumber description];
  }
  id v6 = (void *)[(NSMutableSet *)self->_swipeOccurrences copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v12 _hasAmbiguousIndexPath] & 1) == 0)
        {
          uint64_t v13 = [v12 indexPath];
          long long v14 = v5[2](v5, v13);

          if (v14) {
            [v12 setIndexPath:v14];
          }
          else {
            [(UISwipeActionController *)self _handleDeleteOfSwipeOccurrence:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  [WeakRetained _removeScrollViewScrollObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)UISwipeActionController;
  [(UISwipeActionController *)&v4 dealloc];
}

- (UISwipeActionHost_Internal)_internalSwipeActionHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swipeActionHost);
  return (UISwipeActionHost_Internal *)WeakRetained;
}

- (void)setSwipeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISwipeActionController *)self swipeHandler];
  [v4 setActive:v3];
}

- (BOOL)swipeEnabled
{
  v2 = [(UISwipeActionController *)self swipeHandler];
  char v3 = [v2 isActive];

  return v3;
}

- (id)_swipeActionsConfigurationForSwipeDirection:(unint64_t)a3 indexPath:(id)a4
{
  id v6 = a4;
  int v7 = [(UISwipeActionController *)self _prefersRTL];
  int v8 = a3 != 1;
  uint64_t v9 = [(UISwipeActionController *)self swipeActionHost];
  uint64_t v10 = v9;
  if (v8 == v7) {
    [v9 swipeActionController:self trailingSwipeConfigurationForItemAtIndexPath:v6];
  }
  else {
  uint64_t v11 = [v9 swipeActionController:self leadingSwipeConfigurationForItemAtIndexPath:v6];
  }

  return v11;
}

- (void)swipeItemAtIndexPath:(id)a3 configuration:(id)a4 direction:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (!v13)
  {
    id v13 = [(UISwipeActionController *)self _swipeActionsConfigurationForSwipeDirection:a5 indexPath:v12];
  }
  if (v12)
  {
    if (v13)
    {
      uint64_t v15 = [v13 actions];
      if (v15)
      {
        long long v16 = (void *)v15;
        [v13 actions];
        BOOL v43 = a6;
        long long v17 = v42 = a5;
        uint64_t v18 = [v17 count];

        if (v18)
        {
          id v44 = v14;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v19 = self->_swipeOccurrences;
          uint64_t v20 = [(NSMutableSet *)v19 countByEnumeratingWithState:&v52 objects:v56 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v53;
            while (2)
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v53 != v22) {
                  objc_enumerationMutation(v19);
                }
                id v24 = [*(id *)(*((void *)&v52 + 1) + 8 * i) indexPath];
                id v25 = v12;
                v26 = v25;
                if (v24 == v25)
                {

LABEL_24:
                  id v14 = v44;
                  goto LABEL_27;
                }
                if (v24)
                {
                  char v27 = [v24 isEqual:v25];

                  if (v27) {
                    goto LABEL_24;
                  }
                }
                else
                {
                }
              }
              uint64_t v21 = [(NSMutableSet *)v19 countByEnumeratingWithState:&v52 objects:v56 count:16];
              if (v21) {
                continue;
              }
              break;
            }
          }

          long long v19 = [(UISwipeActionController *)self _swipedViewForItemAtIndexPath:v12];
          [(NSMutableSet *)v19 center];
          double v29 = v28;
          double v31 = v30;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
          v33 = [(NSMutableSet *)v19 superview];
          objc_msgSend(WeakRetained, "convertPoint:fromView:", v33, v29, v31);
          double v35 = v34;
          double v37 = v36;

          if (!v42) {
            [(UISwipeActionController *)self _prefersRTL];
          }
          -[_UISwipeHandler initiateSwipeWithDirection:configuration:location:userInitiated:](self->_swipeHandler, "initiateSwipeWithDirection:configuration:location:userInitiated:", v35, v37);
          long long v50 = 0u;
          long long v51 = 0u;
          swipeHandler = self->_swipeHandler;
          id v14 = v44;
          if (swipeHandler)
          {
            [(_UISwipeHandler *)swipeHandler currentSwipeConfig];
            uint64_t v39 = v50;
            uint64_t v40 = v51;
          }
          else
          {
            uint64_t v39 = 0;
            uint64_t v40 = 0;
          }
          v41 = [(UISwipeActionController *)self currentSwipeOccurrence];
          [v41 beginSwipeTracking:0];
          v45[0] = v39;
          v45[1] = 0;
          BOOL v46 = v43;
          memset(v47, 0, sizeof(v47));
          uint64_t v48 = v40;
          long long v49 = xmmword_186B9D220;
          [v41 updateOffsetWithSwipeInfo:v45 isTracking:0 completion:v44];

LABEL_27:
        }
      }
    }
  }
}

- (void)reconfigureActiveSwipeOccurrences
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)[(NSMutableSet *)self->_swipeOccurrences copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v10 = objc_msgSend(v9, "state", (void)v13);
        if ([v9 active]
          && ([v9 _hasAmbiguousIndexPath] & 1) == 0
          && v10 <= 1)
        {
          [v9 resetForReconfiguration];
          if ([v9 direction]) {
            uint64_t v11 = 2;
          }
          else {
            uint64_t v11 = 1;
          }
          id v12 = [v9 indexPath];
          [(UISwipeActionController *)self swipeItemAtIndexPath:v12 configuration:0 direction:v11 animated:0 completion:0];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (NSIndexPath)swipedIndexPath
{
  v2 = [(UISwipeActionController *)self currentSwipeOccurrence];
  char v3 = [v2 indexPath];

  return (NSIndexPath *)v3;
}

- (UIView)swipedItemView
{
  char v3 = [(UISwipeActionController *)self swipedIndexPath];
  id v4 = [(UISwipeActionController *)self _swipedViewForItemAtIndexPath:v3];

  return (UIView *)v4;
}

- (BOOL)_isSwipeForIndexPathFirstOccurrenceBeginningOrLastOccurrenceEnding:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_swipeOccurrences count] == 1)
  {
    uint64_t v5 = [(NSMutableSet *)self->_swipeOccurrences anyObject];
    id v6 = [v5 indexPath];
    id v7 = v4;
    int v8 = v7;
    if (v6 == v7)
    {
    }
    else
    {
      if (!v7 || !v6)
      {

        BOOL v10 = 0;
        uint64_t v11 = v6;
        goto LABEL_11;
      }
      int v9 = [v6 isEqual:v7];

      if (!v9)
      {
        BOOL v10 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    uint64_t v11 = [(UISwipeActionController *)self currentSwipeOccurrence];
    BOOL v10 = v11 == 0;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (id)_swipedViewForItemAtIndexPath:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(UISwipeActionController *)self swipeActionHost];
    id v6 = [v5 swipeActionController:self viewForItemAtIndexPath:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)_prefersRTL
{
  v2 = self;
  char v3 = [(UISwipeActionController *)self swipeActionHost];
  LOBYTE(v2) = [v3 layoutDirectionForSwipeActionController:v2] == 1;

  return (char)v2;
}

- (unint64_t)_swipeDirectionForLeadingEdge:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(UISwipeActionController *)self _prefersRTL];
  unint64_t v5 = 1;
  if (v3) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = 2;
  }
  if (v3) {
    unint64_t v5 = 2;
  }
  if (v4) {
    return v6;
  }
  else {
    return v5;
  }
}

- (void)deleteSectionAtIndex:(unint64_t)a3
{
  swipeOccurrences = self->_swipeOccurrences;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__UISwipeActionController_deleteSectionAtIndex___block_invoke;
  v4[3] = &unk_1E53082F0;
  v4[4] = self;
  v4[5] = a3;
  [(NSMutableSet *)swipeOccurrences enumerateObjectsUsingBlock:v4];
}

void __48__UISwipeActionController_deleteSectionAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (([v14 _hasAmbiguousIndexPath] & 1) == 0)
  {
    unint64_t v3 = *(void *)(a1 + 40);
    BOOL v4 = [v14 indexPath];
    unint64_t v5 = [v4 section];

    if (v3 >= v5)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [v14 indexPath];
      uint64_t v13 = [v12 section];

      if (v11 == v13) {
        [*(id *)(a1 + 32) _handleDeleteOfSwipeOccurrence:v14];
      }
    }
    else
    {
      unint64_t v6 = (void *)MEMORY[0x1E4F28D58];
      id v7 = [v14 indexPath];
      uint64_t v8 = [v7 row];
      int v9 = [v14 indexPath];
      BOOL v10 = objc_msgSend(v6, "indexPathForRow:inSection:", v8, objc_msgSend(v9, "section") - 1);
      [v14 setIndexPath:v10];
    }
  }
}

- (void)deleteRowAtIndexPath:(id)a3
{
  id v4 = a3;
  swipeOccurrences = self->_swipeOccurrences;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__UISwipeActionController_deleteRowAtIndexPath___block_invoke;
  v7[3] = &unk_1E5308318;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  [(NSMutableSet *)swipeOccurrences enumerateObjectsUsingBlock:v7];
}

void __48__UISwipeActionController_deleteRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (([v16 _hasAmbiguousIndexPath] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) section];
    id v4 = [v16 indexPath];
    if (v3 == [v4 section])
    {
      uint64_t v5 = [*(id *)(a1 + 32) row];
      id v6 = [v16 indexPath];
      uint64_t v7 = [v6 row];

      id v8 = v16;
      if (v5 < v7)
      {
        int v9 = (void *)MEMORY[0x1E4F28D58];
        BOOL v10 = [v16 indexPath];
        uint64_t v11 = [v10 row] - 1;
        id v12 = [v16 indexPath];
        uint64_t v13 = objc_msgSend(v9, "indexPathForRow:inSection:", v11, objc_msgSend(v12, "section"));
        [v16 setIndexPath:v13];

        goto LABEL_8;
      }
    }
    else
    {

      id v8 = v16;
    }
    id v14 = *(void **)(a1 + 32);
    long long v15 = [v8 indexPath];
    LODWORD(v14) = [v14 isEqual:v15];

    if (v14) {
      [*(id *)(a1 + 40) _handleDeleteOfSwipeOccurrence:v16];
    }
  }
LABEL_8:
}

- (void)insertSectionAtIndex:(unint64_t)a3
{
  swipeOccurrences = self->_swipeOccurrences;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__UISwipeActionController_insertSectionAtIndex___block_invoke;
  v4[3] = &__block_descriptor_40_e31_v24__0__UISwipeOccurrence_8_B16l;
  v4[4] = a3;
  [(NSMutableSet *)swipeOccurrences enumerateObjectsUsingBlock:v4];
}

void __48__UISwipeActionController_insertSectionAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (([v11 _hasAmbiguousIndexPath] & 1) == 0)
  {
    unint64_t v3 = *(void *)(a1 + 32);
    id v4 = [v11 indexPath];
    unint64_t v5 = [v4 section];

    if (v3 <= v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v7 = [v11 indexPath];
      uint64_t v8 = [v7 row];
      int v9 = [v11 indexPath];
      BOOL v10 = objc_msgSend(v6, "indexPathForRow:inSection:", v8, objc_msgSend(v9, "section") + 1);
      [v11 setIndexPath:v10];
    }
  }
}

void __48__UISwipeActionController_insertRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (([v12 _hasAmbiguousIndexPath] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) section];
    id v4 = [v12 indexPath];
    if (v3 == [v4 section])
    {
      uint64_t v5 = [*(id *)(a1 + 32) row];
      id v6 = [v12 indexPath];
      uint64_t v7 = [v6 row];

      if (v5 > v7) {
        goto LABEL_6;
      }
      uint64_t v8 = (void *)MEMORY[0x1E4F28D58];
      id v4 = [v12 indexPath];
      uint64_t v9 = [v4 row] + 1;
      BOOL v10 = [v12 indexPath];
      id v11 = objc_msgSend(v8, "indexPathForRow:inSection:", v9, objc_msgSend(v10, "section"));
      [v12 setIndexPath:v11];
    }
  }
LABEL_6:
}

- (void)moveSectionAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  swipeOccurrences = self->_swipeOccurrences;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__UISwipeActionController_moveSectionAtIndex_toIndex___block_invoke;
  v5[3] = &__block_descriptor_48_e31_v24__0__UISwipeOccurrence_8_B16l;
  v5[4] = a3;
  v5[5] = a4;
  [(NSMutableSet *)swipeOccurrences enumerateObjectsUsingBlock:v5];
}

void __54__UISwipeActionController_moveSectionAtIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  id v23 = a2;
  if (([v23 _hasAmbiguousIndexPath] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [v23 indexPath];
    uint64_t v5 = [v4 section];

    if (v3 == v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v7 = [v23 indexPath];
      uint64_t v8 = objc_msgSend(v6, "indexPathForRow:inSection:", objc_msgSend(v7, "row"), *(void *)(a1 + 40));
      [v23 setIndexPath:v8];
LABEL_8:

      goto LABEL_9;
    }
    unint64_t v9 = *(void *)(a1 + 32);
    BOOL v10 = [v23 indexPath];
    unint64_t v11 = [v10 section];

    if (v9 < v11)
    {
      id v12 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v13 = [v23 indexPath];
      uint64_t v14 = [v13 row];
      long long v15 = [v23 indexPath];
      id v16 = objc_msgSend(v12, "indexPathForRow:inSection:", v14, objc_msgSend(v15, "section") - 1);
      [v23 setIndexPath:v16];
    }
    unint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = [v23 indexPath];
    unint64_t v19 = [v18 section];

    if (v17 <= v19)
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v7 = [v23 indexPath];
      uint64_t v21 = [v7 row];
      uint64_t v8 = [v23 indexPath];
      uint64_t v22 = objc_msgSend(v20, "indexPathForRow:inSection:", v21, objc_msgSend(v8, "section") + 1);
      [v23 setIndexPath:v22];

      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)moveRowAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  swipeOccurrences = self->_swipeOccurrences;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__UISwipeActionController_moveRowAtIndexPath_toIndexPath___block_invoke;
  v11[3] = &unk_1E5308318;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSMutableSet *)swipeOccurrences enumerateObjectsUsingBlock:v11];
}

void __58__UISwipeActionController_moveRowAtIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v25 = a2;
  char v3 = [v25 _hasAmbiguousIndexPath];
  id v4 = v25;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v25 indexPath];
    LODWORD(v5) = [v5 isEqual:v6];

    if (v5)
    {
      [v25 setIndexPath:*(void *)(a1 + 40)];
LABEL_12:
      id v4 = v25;
      goto LABEL_13;
    }
    uint64_t v7 = [*(id *)(a1 + 32) section];
    uint64_t v8 = [v25 indexPath];
    if (v7 == [v8 section])
    {
      uint64_t v9 = [*(id *)(a1 + 32) row];
      id v10 = [v25 indexPath];
      uint64_t v11 = [v10 row];

      if (v9 >= v11)
      {
LABEL_8:
        uint64_t v16 = [*(id *)(a1 + 40) section];
        unint64_t v17 = [v25 indexPath];
        if (v16 == [v17 section])
        {
          uint64_t v18 = [*(id *)(a1 + 40) row];
          unint64_t v19 = [v25 indexPath];
          uint64_t v20 = [v19 row];

          id v4 = v25;
          if (v18 > v20) {
            goto LABEL_13;
          }
          uint64_t v21 = (void *)MEMORY[0x1E4F28D58];
          unint64_t v17 = [v25 indexPath];
          uint64_t v22 = [v17 row] + 1;
          id v23 = [v25 indexPath];
          id v24 = objc_msgSend(v21, "indexPathForRow:inSection:", v22, objc_msgSend(v23, "section"));
          [v25 setIndexPath:v24];
        }
        goto LABEL_12;
      }
      id v12 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v8 = [v25 indexPath];
      uint64_t v13 = [v8 row] - 1;
      uint64_t v14 = [v25 indexPath];
      long long v15 = objc_msgSend(v12, "indexPathForRow:inSection:", v13, objc_msgSend(v14, "section"));
      [v25 setIndexPath:v15];
    }
    goto LABEL_8;
  }
LABEL_13:
}

- (void)_handleDeleteOfSwipeOccurrence:(id)a3
{
  id v7 = a3;
  [v7 _setHasAmbiguousIndexPath];
  char v3 = [v7 currentAction];
  id v4 = v7;
  if (v3)
  {
    uint64_t v5 = [v7 currentAction];
    if ([v5 style] == 1)
    {
      uint64_t v6 = [v7 state];

      id v4 = v7;
      if (v6 == 3)
      {
        [v7 _transitionToState:4];
        goto LABEL_7;
      }
    }
    else
    {

      id v4 = v7;
    }
  }
  [v4 resetAnimated:0 completion:0];
LABEL_7:
}

- (void)prepareForSwipeDirection:(unint64_t)a3 startingAtTouchLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = [(UISwipeActionController *)self swipeActionHost];
  uint64_t v12 = objc_msgSend(v8, "swipeActionController:indexPathForTouchLocation:", self, x, y);

  uint64_t v9 = (void *)v12;
  if (a3 && v12)
  {
    id v10 = [(UISwipeActionController *)self _existingSwipeOccurrenceForIndexPath:v12];
    uint64_t v11 = v10;
    if (v10 && !_canReuseExistingSwipeOccurrenceForSwipeDirection(v10, a3)) {
      [v11 _forceTeardown];
    }

    uint64_t v9 = (void *)v12;
  }
}

- ($A7B7FA971CD029BAA4A09478E9E1AEDA)configureForSwipeDirection:(SEL)a3 configuration:(unint64_t)a4 startingAtTouchLocation:(id)a5
{
  double y = a6.y;
  double x = a6.x;
  uint64_t v12 = (UISwipeActionsConfiguration *)a5;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  uint64_t v13 = [(UISwipeActionController *)self swipeActionHost];
  uint64_t v14 = objc_msgSend(v13, "swipeActionController:indexPathForTouchLocation:", self, x, y);

  if (!a4 || !v14) {
    goto LABEL_31;
  }
  long long v15 = [(UISwipeActionController *)self _existingSwipeOccurrenceForIndexPath:v14];
  if (v15)
  {
    uint64_t v16 = v15;
    if (!_canReuseExistingSwipeOccurrenceForSwipeDirection(v15, a4))
    {
      double v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a3, self, @"UISwipeActionController.m", 419, @"There is an existing swipe occurrence for %@ and it can't be reused for swipe direction %ld, so it should have been cleaned up in prepareForSwipeDirection: %@", v14, a4, v16 object file lineNumber description];
    }
    [(UISwipeOccurrence *)v16 updateSwipedView];
    if (v12) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  uint64_t v16 = [[UISwipeOccurrence alloc] initWithController:self indexPath:v14 defaultStyle:[(UISwipeActionController *)self style]];
  [(NSMutableSet *)self->_swipeOccurrences addObject:v16];
  if (!v12)
  {
LABEL_9:
    incomingSwipeActionsConfiguration = self->_incomingSwipeActionsConfiguration;
    if (incomingSwipeActionsConfiguration)
    {
      uint64_t v18 = incomingSwipeActionsConfiguration;
    }
    else
    {
      uint64_t v18 = [(UISwipeActionController *)self _swipeActionsConfigurationForSwipeDirection:a4 indexPath:v14];
    }
    uint64_t v12 = v18;
  }
LABEL_13:
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  p_preparingSwipeOccurrence = &self->_preparingSwipeOccurrence;
  preparingSwipeOccurrence = self->_preparingSwipeOccurrence;
  if (has_internal_diagnostics)
  {
    if (preparingSwipeOccurrence || (*(unsigned char *)&self->_flags & 1) != 0)
    {
      v33 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v33, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: reentrantly preparing a swipe occurrence is not supported", buf, 2u);
      }
    }
  }
  else if (preparingSwipeOccurrence || (*(unsigned char *)&self->_flags & 1) != 0)
  {
    v32 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1238) + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: reentrantly preparing a swipe occurrence is not supported", buf, 2u);
    }
  }
  objc_storeStrong((id *)&self->_preparingSwipeOccurrence, v16);
  if (v16)
  {
    [(UISwipeOccurrence *)v16 prepareWithSwipeDirection:a4 configuration:v12];
  }
  else
  {
    *(_OWORD *)buf = 0u;
    long long v38 = 0u;
  }
  long long v22 = v38;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)buf;
  *(_OWORD *)&retstr->var3 = v22;
  char flags = (char)self->_flags;
  if (os_variant_has_internal_diagnostics())
  {
    if ((flags & 1) == 0 && *p_preparingSwipeOccurrence != v16)
    {
      double v34 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v34, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: preparingSwipeOccurrence was unexpectedly changed to a different occurrence", buf, 2u);
      }
    }
  }
  else if ((flags & 1) == 0 && *p_preparingSwipeOccurrence != v16)
  {
    double v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2634A8) + 8);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: preparingSwipeOccurrence was unexpectedly changed to a different occurrence", buf, 2u);
    }
  }
  id v24 = self->_preparingSwipeOccurrence;
  self->_preparingSwipeOccurrence = 0;

  *(unsigned char *)&self->_flags &= ~1u;
  if (retstr->var0 && [(UISwipeOccurrence *)v16 active] && (flags & 1) == 0)
  {
    id v25 = [(UISwipeActionController *)self swipeActionHost];
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      char v27 = [(UISwipeActionController *)self swipeActionHost];
      [v27 swipeActionController:self willBeginSwipeForItemAtIndexPath:v14];
    }
    [(UISwipeActionController *)self setCurrentSwipeOccurrence:v16];
    double v28 = [(UISwipeActionController *)self swipeActionHost];
    char v29 = objc_opt_respondsToSelector();

    if (v29)
    {
      double v30 = [(UISwipeActionController *)self swipeActionHost];
      [v30 swipeActionController:self didBeginSwipeForItemAtIndexPath:v14];
    }
  }
  else
  {
    [(NSMutableSet *)self->_swipeOccurrences removeObject:v16];
  }

LABEL_31:
  return result;
}

- (BOOL)touchAtLocationShouldDismissSwipedItem:(CGPoint)a3 isTouchUp:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = self->_swipeOccurrences;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v11), "shouldDismissWithTouchLocation:", x, y, (void)v24))break; {
        if (v9 == ++v11)
        }
        {
          uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
          BOOL v12 = 1;
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_25;
        }
      }
LABEL_23:
      BOOL v12 = 0;
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    uint64_t v13 = [(UISwipeActionController *)self swipeActionHost];
    id v7 = [v13 gestureRecognizerViewForSwipeActionController:self];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v14 = self->_swipeOccurrences;
    uint64_t v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          unint64_t v19 = [*(id *)(*((void *)&v28 + 1) + 8 * i) indexPath];
          uint64_t v20 = [(UISwipeActionController *)self _swipedViewForItemAtIndexPath:v19];
          if (v20)
          {
            -[NSMutableSet convertPoint:toView:](v7, "convertPoint:toView:", v20, x, y);
            if (v21 >= 0.0)
            {
              double v22 = v21;
              [v20 bounds];
              if (v22 <= CGRectGetHeight(v35))
              {

                goto LABEL_23;
              }
            }
          }
        }
        uint64_t v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    BOOL v12 = [(NSMutableSet *)self->_swipeOccurrences count] != 0;
  }
LABEL_25:

  return v12;
}

- (void)swipeOccurrence:(id)a3 willFinishWithDeletion:(BOOL)a4
{
  id v10 = a3;
  uint64_t v5 = [(UISwipeActionController *)self swipeActionHost];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(UISwipeActionController *)self swipeActionHost];
    uint64_t v8 = [v10 indexPath];
    [v7 swipeActionController:self willEndSwipeForItemAtIndexPath:v8];
  }
  uint64_t v9 = [(UISwipeActionController *)self swipeHandler];
  [v9 resetSwipe];
}

- (void)swipeOccurrenceDidFinish:(id)a3
{
  id v9 = a3;
  id v4 = [(UISwipeActionController *)self currentSwipeOccurrence];

  if (v4 == v9) {
    [(UISwipeActionController *)self setCurrentSwipeOccurrence:0];
  }
  uint64_t v5 = [(UISwipeActionController *)self swipeActionHost];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(UISwipeActionController *)self swipeActionHost];
    uint64_t v8 = [v9 indexPath];
    [v7 swipeActionController:self didEndSwipeForItemAtIndexPath:v8];
  }
  [(NSMutableSet *)self->_swipeOccurrences removeObject:v9];
}

- (void)swipeOccurrence:(id)a3 didChangeStateFrom:(int64_t)a4
{
  id v9 = a3;
  char v6 = [(UISwipeActionController *)self _internalSwipeActionHost];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(UISwipeActionController *)self _internalSwipeActionHost];
    objc_msgSend(v8, "swipeActionController:swipeOccurrence:didChangeStateFrom:to:", self, v9, a4, objc_msgSend(v9, "state"));
  }
}

- (BOOL)swipeHandler:(id)a3 mayBeginSwipeAtLocation:(CGPoint)a4 withProposedDirection:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = [(UISwipeActionController *)self swipeActionHost];
  id v10 = objc_msgSend(v9, "swipeActionController:indexPathForTouchLocation:", self, x, y);

  if (v10)
  {
    uint64_t v11 = [(UISwipeActionController *)self currentSwipeOccurrence];
    BOOL v12 = v11;
    if (v11
      && ([v11 state] & 0xFFFFFFFFFFFFFFFELL) == 4
      && ([v12 _hasAmbiguousIndexPath] & 1) != 0)
    {
      goto LABEL_13;
    }
    uint64_t v13 = [(UISwipeActionController *)self swipeActionHost];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      uint64_t v15 = [(UISwipeActionController *)self swipeActionHost];
      int v16 = [v15 swipeActionController:self mayBeginSwipeForItemAtIndexPath:v10];

      if (!v16)
      {
LABEL_13:
        BOOL v21 = 0;
        goto LABEL_22;
      }
    }
    if (v12)
    {
      id v17 = [v12 indexPath];
      id v18 = v10;
      unint64_t v19 = v18;
      if (v17 == v18)
      {

        goto LABEL_19;
      }
      if (v17)
      {
        char v20 = [v17 isEqual:v18];

        if (v20)
        {
          BOOL v21 = 1;
LABEL_22:

          goto LABEL_23;
        }
      }
      else
      {
      }
    }
    double v22 = [(UISwipeActionController *)self _swipeActionsConfigurationForSwipeDirection:a5 indexPath:v10];
    unint64_t v19 = v22;
    if (!v22
      || ([v22 actions],
          id v23 = objc_claimAutoreleasedReturnValue(),
          uint64_t v24 = [v23 count],
          v23,
          !v24))
    {
      [(UISwipeActionController *)self setIncomingSwipeActionsConfiguration:0];
      BOOL v21 = 0;
      goto LABEL_21;
    }
    [(UISwipeActionController *)self setIncomingSwipeActionsConfiguration:v19];
LABEL_19:
    BOOL v21 = 1;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v21 = 0;
LABEL_23:

  return v21;
}

- (void)swipeHandlerDidBeginSwipe:(id)a3
{
  uint64_t v5 = [(UISwipeActionController *)self currentSwipeOccurrence];
  id v7 = v5;
  if (!v5)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UISwipeActionController.m" lineNumber:575 description:@"No current swipe occurrence"];

    uint64_t v5 = 0;
  }
  [v5 beginSwipeTracking:1];
  [(UISwipeActionController *)self setIncomingSwipeActionsConfiguration:0];
}

- (void)swipeHandler:(id)a3 didGenerateSwipeWithInfo:(id *)a4 isTracking:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [(UISwipeActionController *)self currentSwipeOccurrence];
  if (!v9)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UISwipeActionController.m" lineNumber:585 description:@"No current swipe occurrence"];
  }
  long long v10 = *(_OWORD *)&a4->var2;
  v12[0] = *(_OWORD *)&a4->var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a4->var4;
  [v9 updateOffsetWithSwipeInfo:v12 isTracking:v5 completion:0];
}

- (void)swipeHandler:(id)a3 didConfirmSwipeWithInfo:(id *)a4
{
  id v7 = [(UISwipeActionController *)self currentSwipeOccurrence];
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"UISwipeActionController.m" lineNumber:593 description:@"No current swipe occurrence"];
  }
  long long v8 = *(_OWORD *)&a4->var2;
  v10[0] = *(_OWORD *)&a4->var0;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&a4->var4;
  [v7 performPrimaryActionWithSwipeInfo:v10];
}

- (CGRect)swipeHandlerRestingFrame:(id)a3
{
  char v3 = [(UISwipeActionController *)self currentSwipeOccurrence];
  if (!v3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "No current swipe occurrence.", buf, 2u);
      }
    }
    else
    {
      int v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &swipeHandlerRestingFrame____s_category) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18[0] = 0;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "No current swipe occurrence.", (uint8_t *)v18, 2u);
      }
    }
  }
  [v3 swipedViewRestingFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (unint64_t)style
{
  return self->_style;
}

- (UISwipeActionsConfiguration)incomingSwipeActionsConfiguration
{
  return self->_incomingSwipeActionsConfiguration;
}

- (void)setIncomingSwipeActionsConfiguration:(id)a3
{
}

- (UIScrollView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIScrollView *)WeakRetained;
}

- (void)setSwipeOccurrences:(id)a3
{
}

- (void)setCurrentSwipeOccurrence:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentSwipeOccurrence);
  objc_storeStrong((id *)&self->_swipeOccurrences, 0);
  objc_storeStrong((id *)&self->_swipeHandler, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_incomingSwipeActionsConfiguration, 0);
  objc_destroyWeak((id *)&self->_swipeActionHost);
  objc_storeStrong((id *)&self->_preparingSwipeOccurrence, 0);
}

@end