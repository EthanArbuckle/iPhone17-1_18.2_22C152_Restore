@interface _UIStoryboardUnwindChain
- (UIViewController)commonAncestorViewController;
- (UIViewController)modalAncestorContainingSourceViewController;
- (id)debugDescription;
- (id)initFromSourceViewController:(id)a3 toDestinationViewController:(id)a4;
- (void)enumerateViewControllersFromModalAncestorUpToButNotIncludingDestination:(id)a3;
@end

@implementation _UIStoryboardUnwindChain

- (id)initFromSourceViewController:(id)a3 toDestinationViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)_UIStoryboardUnwindChain;
  v9 = [(_UIStoryboardUnwindChain *)&v31 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    viewControllers = v9->_viewControllers;
    v9->_viewControllers = (NSMutableArray *)v10;

    id v12 = v7;
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
      while (1)
      {
        [(NSMutableArray *)v9->_viewControllers addObject:v14];
        if (v14 == v8) {
          break;
        }
        uint64_t v15 = _UIInternalPreference_ForceIOSDeviceInsets_block_invoke(v14);

        id v14 = (id)v15;
        if (!v15)
        {
          v16 = 0;
          goto LABEL_8;
        }
      }
      v16 = v8;
LABEL_8:
    }
    if ((unint64_t)[(NSMutableArray *)v9->_viewControllers count] <= 1)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2, v9, @"UIStoryboardUnwindSegueTemplate.m", 83, @"Could not unwind from %@ to %@ because the parent view controller of %@ could not be found.", v13, v8, v13 object file lineNumber description];
    }
    uint64_t v17 = [(NSMutableArray *)v9->_viewControllers count];
    v9->_unint64_t commonAncestorIdx = 0x7FFFFFFFFFFFFFFFLL;
    id v18 = v8;
    id v19 = v18;
    if (v18)
    {
      v20 = v18;
      while (1)
      {
        uint64_t v21 = [(NSMutableArray *)v9->_viewControllers indexOfObject:v20];
        v9->_unint64_t commonAncestorIdx = v21;
        v22 = v9->_viewControllers;
        if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        [(NSMutableArray *)v22 insertObject:v20 atIndex:v17];
        uint64_t v23 = _UIInternalPreference_ForceIOSDeviceInsets_block_invoke(v20);

        v20 = (void *)v23;
        if (!v23) {
          goto LABEL_17;
        }
      }
      -[NSMutableArray removeObjectsInRange:](v22, "removeObjectsInRange:", v21 + 1, v17 + ~v21);
    }
LABEL_17:
    unint64_t commonAncestorIdx = v9->_commonAncestorIdx;
    if (commonAncestorIdx == 0x7FFFFFFFFFFFFFFFLL)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2, v9, @"UIStoryboardUnwindSegueTemplate.m", 120, @"Could not unwind from %@ to %@ because a common ancestor could not be found. (Note that it is not supported to unwind from a view controller to one of its descendants.)", v13, v19 object file lineNumber description];

      unint64_t commonAncestorIdx = v9->_commonAncestorIdx;
    }
    v9->_modalAncestorContainingSourceIdx = 0x7FFFFFFFFFFFFFFFLL;
    if (commonAncestorIdx)
    {
      while (1)
      {
        v25 = [(NSMutableArray *)v9->_viewControllers objectAtIndexedSubscript:commonAncestorIdx];
        v26 = [v25 childModalViewController];

        if (v26) {
          break;
        }

        if (!--commonAncestorIdx) {
          goto LABEL_24;
        }
      }
      v9->_modalAncestorContainingSourceIdx = commonAncestorIdx;
    }
LABEL_24:
    v27 = v9;
  }

  return v9;
}

- (UIViewController)commonAncestorViewController
{
  return (UIViewController *)[(NSMutableArray *)self->_viewControllers objectAtIndexedSubscript:self->_commonAncestorIdx];
}

- (UIViewController)modalAncestorContainingSourceViewController
{
  if (self->_modalAncestorContainingSourceIdx == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[NSMutableArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:");
  }
  return (UIViewController *)v2;
}

- (void)enumerateViewControllersFromModalAncestorUpToButNotIncludingDestination:(id)a3
{
  uint64_t v10 = (void (**)(id, void *, void *))a3;
  if (self->_modalAncestorContainingSourceIdx == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t modalAncestorContainingSourceIdx = 0;
  }
  else {
    unint64_t modalAncestorContainingSourceIdx = self->_modalAncestorContainingSourceIdx;
  }
  uint64_t v5 = [(NSMutableArray *)self->_viewControllers count];
  if (modalAncestorContainingSourceIdx < v5 - 1)
  {
    uint64_t v6 = v5;
    unint64_t v7 = modalAncestorContainingSourceIdx + 1;
    do
    {
      id v8 = [(NSMutableArray *)self->_viewControllers objectAtIndexedSubscript:v7 - 1];
      v9 = [(NSMutableArray *)self->_viewControllers objectAtIndexedSubscript:v7];
      v10[2](v10, v8, v9);

      ++v7;
    }
    while (v6 != v7);
  }
}

- (id)debugDescription
{
  unint64_t v3 = [(NSMutableArray *)self->_viewControllers count];
  if ([(NSMutableArray *)self->_viewControllers count] == 1)
  {
    v4 = [NSString stringWithFormat:@"<%@:%p (invalid chain)>", objc_opt_class(), self];
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_viewControllers objectAtIndexedSubscript:0];
    uint64_t v6 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v7 = objc_opt_class();
    v20 = (void *)v5;
    v4 = [v6 stringWithFormat:@"<%@:%p %@:%p", v7, self, objc_opt_class(), v5];
    if (v3 >= 2)
    {
      for (uint64_t i = 1; i != v3; ++i)
      {
        v9 = [(NSMutableArray *)self->_viewControllers objectAtIndexedSubscript:i - 1];
        uint64_t v10 = [(NSMutableArray *)self->_viewControllers objectAtIndexedSubscript:i];
        v11 = [v10 parentModalViewController];

        if (v9 == v11)
        {
          uint64_t v15 = @" --(presents)--> ";
        }
        else
        {
          id v12 = [v10 childModalViewController];

          if (v9 == v12)
          {
            uint64_t v15 = @" --(presented by)--> ";
          }
          else
          {
            id v13 = [v10 parentViewController];

            if (v9 == v13)
            {
              uint64_t v15 = @" --(parent of)--> ";
            }
            else
            {
              id v14 = [v9 parentViewController];

              if (v14 == v10) {
                uint64_t v15 = @" --(child of)--> ";
              }
              else {
                uint64_t v15 = @" --(unknown relation!)--> ";
              }
            }
          }
        }
        [v4 appendString:v15];
        objc_msgSend(v4, "appendFormat:", @" (%@:%p"), objc_opt_class(), v10;
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x2020000000;
        char v25 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __44___UIStoryboardUnwindChain_debugDescription__block_invoke;
        aBlock[3] = &unk_1E53081E0;
        uint64_t v23 = v24;
        id v16 = v4;
        id v22 = v16;
        uint64_t v17 = _Block_copy(aBlock);
        id v18 = (void (**)(void, void))v17;
        if (i == self->_commonAncestorIdx) {
          (*((void (**)(void *, __CFString *))v17 + 2))(v17, @"common ancestor");
        }
        if (i == self->_modalAncestorContainingSourceIdx) {
          ((void (**)(void, __CFString *))v18)[2](v18, @"modal ancestor of source");
        }
        [v16 appendString:@""]);

        _Block_object_dispose(v24, 8);
      }
    }
    [v4 appendString:@">"];
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end