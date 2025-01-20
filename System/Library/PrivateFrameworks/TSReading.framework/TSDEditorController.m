@interface TSDEditorController
- (BOOL)anyEditorProhibitsAction:(SEL)a3;
- (BOOL)isChangingCurrentEditorsWhenCommittingInspectorChanges;
- (TSDEditorController)init;
- (TSDEditorController)initWithDocumentRoot:(id)a3;
- (id)currentEditors;
- (id)currentEditorsConformingToProtocol:(id)a3;
- (id)currentEditorsOfClass:(Class)a3;
- (id)editorForEditAction:(SEL)a3 withSender:(id)a4;
- (id)editorForEditAction:(SEL)a3 withSender:(id)a4 response:(int *)a5;
- (id)mostSpecificCurrentEditorOfClass:(Class)a3;
- (id)mostSpecificCurrentEditorOfClass:(Class)a3 conformingToProtocol:(id)a4;
- (id)mostSpecificEditorConformingToProtocol:(id)a3;
- (id)objectForInspectorPropertyKey:(id)a3;
- (id)textInputEditor;
- (void)beginTransaction;
- (void)dealloc;
- (void)didChangeCurrentEditorsWhenCommittingInspectorChanges;
- (void)editorDidChangeSelection:(id)a3 withSelectionFlags:(unint64_t)a4;
- (void)editorDidChangeSelectionAndWantsKeyboard:(id)a3 withSelectionFlags:(unint64_t)a4;
- (void)editorSelectionWasForciblyChanged:(id)a3;
- (void)endTransaction;
- (void)enumerateEditorsOnStackUsingBlock:(id)a3;
- (void)notifyResignedTextInputEditors;
- (void)p_didChangeCurrentEditors;
- (void)p_didChangeTextInputEditor;
- (void)p_setTextInputEditor:(id)a3;
- (void)p_willChangeCurrentEditors;
- (void)p_willChangeCurrentEditorsWithNewEditors:(id)a3;
- (void)p_willChangeTextInputEditor;
- (void)popEditor:(id)a3;
- (void)popEditor:(id)a3 andPushTextInputEditor:(id)a4;
- (void)popToEditor:(id)a3;
- (void)pushEditor:(id)a3;
- (void)removeObjectForInspectorPropertyKey:(id)a3;
- (void)setObject:(id)a3 forInspectorPropertyKey:(id)a4;
- (void)setTextInputEditor:(id)a3;
- (void)teardown;
- (void)willChangeCurrentEditorsWhenCommittingInspectorChanges;
@end

@implementation TSDEditorController

- (TSDEditorController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSDEditorController;
  result = [(TSDEditorController *)&v5 init];
  if (result)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDEditorController init]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 84, @"Use the designated initializer.");
    objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Use the designated initializer.", "-[TSDEditorController init]"), 0 reason userInfo]);
  }
  return result;
}

- (TSDEditorController)initWithDocumentRoot:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSDEditorController;
  uint64_t v4 = [(TSDEditorController *)&v8 init];
  if (v4)
  {
    if (!a3)
    {
      objc_super v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDEditorController initWithDocumentRoot:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 94, @"invalid nil value for '%s'", "docRoot");
    }
    v4->mDocumentRoot = (TSKDocumentRoot *)a3;
    v4->mEditorStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v4->mResignedTextInputEditors = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v4->mInspectorPropertyValueMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v4;
}

- (void)teardown
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = (void *)[(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [(TSDEditorController *)self popEditor:v8];
        if (objc_opt_respondsToSelector()) {
          [v8 teardown];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  self->mEditorStack = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDEditorController;
  [(TSDEditorController *)&v3 dealloc];
}

- (id)currentEditors
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithArray:self->mEditorStack];
}

- (id)textInputEditor
{
  return self->mTextInputEditor;
}

- (void)setTextInputEditor:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDEditorController setTextInputEditor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 170, @"invalid nil value for '%s'", "newTextInputEditor");
  }
  if ([(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:a3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDEditorController setTextInputEditor:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 171, @"can't set an editor to be the text input editor if it isn't on the stack");
  }
  if (a3) {
    [(TSDEditorController *)self p_setTextInputEditor:a3];
  }

  [(TSDEditorController *)self notifyResignedTextInputEditors];
}

- (id)editorForEditAction:(SEL)a3 withSender:(id)a4
{
  return [(TSDEditorController *)self editorForEditAction:a3 withSender:a4 response:0];
}

- (id)editorForEditAction:(SEL)a3 withSender:(id)a4 response:(int *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = (void *)[(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    long long v10 = 0;
    uint64_t v11 = *(void *)v19;
    long long v12 = &selRef_bootstrapPresetsOfKind_inTheme_alternate_;
LABEL_3:
    uint64_t v13 = 0;
    uint64_t v14 = v12;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v7);
      }
      v15 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
      if (objc_opt_respondsToSelector())
      {
        LODWORD(v8) = [v15 canPerformEditorAction:a3 withSender:a4];
        if (v8 == 1) {
          long long v10 = v15;
        }
        if (v8) {
          break;
        }
      }
      if (v9 == ++v13)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v9 = v8;
        long long v12 = v14;
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    long long v10 = 0;
  }
  if (a5) {
    *a5 = v8;
  }
  return v10;
}

- (BOOL)anyEditorProhibitsAction:(SEL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = (void *)[(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector() & 1) != 0 && ([v9 shouldProhibitAction:a3])
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (void)pushEditor:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDEditorController pushEditor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 260, @"invalid nil value for '%s'", "newEditor");
  }
  if ([(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:a3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDEditorController pushEditor:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 261, @"shouldn't push the same editor twice");
  }
  uint64_t v9 = [(NSMutableArray *)self->mEditorStack arrayByAddingObject:a3];
  if (a3)
  {
    uint64_t v10 = v9;
    if ([(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:a3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(TSDEditorController *)self p_willChangeCurrentEditorsWithNewEditors:v10];
      [(NSMutableArray *)self->mEditorStack addObject:a3];
      if (objc_opt_respondsToSelector()) {
        [a3 didBecomeCurrentEditor];
      }
      [(TSDEditorController *)self p_didChangeCurrentEditors];
      if (![(TSDEditorController *)self textInputEditor]) {
        [(TSDEditorController *)self p_setTextInputEditor:a3];
      }
    }
  }

  [(TSDEditorController *)self notifyResignedTextInputEditors];
}

- (void)popEditor:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDEditorController popEditor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 293, @"invalid nil value for '%s'", "poppedEditor");
  }
  if ([(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:a3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDEditorController popEditor:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 294, @"shouldn't pop an editor that isn't on the stack");
  }
  if (a3)
  {
    uint64_t v9 = [(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:a3];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v10 = v9;
      -[TSDEditorController p_willChangeCurrentEditorsWithNewEditors:](self, "p_willChangeCurrentEditorsWithNewEditors:", -[NSMutableArray subarrayWithRange:](self->mEditorStack, "subarrayWithRange:", 0, v9));
      id v11 = [(TSDEditorController *)self textInputEditor];
      if (v11
        && [(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:v11] >= v10)
      {
        if (v10) {
          uint64_t v12 = [(NSMutableArray *)self->mEditorStack objectAtIndex:v10 - 1];
        }
        else {
          uint64_t v12 = 0;
        }
        [(TSDEditorController *)self p_setTextInputEditor:v12];
      }
      uint64_t v13 = [(NSMutableArray *)self->mEditorStack count] + 1;
      do
      {
        if (!--v13) {
          break;
        }
        id v14 = (id)[(NSMutableArray *)self->mEditorStack lastObject];
        if (objc_opt_respondsToSelector()) {
          [v14 willResignCurrentEditor];
        }
        [(NSMutableArray *)self->mEditorStack removeLastObject];
      }
      while (v14 != a3);
      [(TSDEditorController *)self p_didChangeCurrentEditors];
    }
  }

  [(TSDEditorController *)self notifyResignedTextInputEditors];
}

- (void)popEditor:(id)a3 andPushTextInputEditor:(id)a4
{
  if (!a3)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDEditorController popEditor:andPushTextInputEditor:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 354, @"invalid nil value for '%s'", "oldEditor");
  }
  if ([(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:a3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDEditorController popEditor:andPushTextInputEditor:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 355, @"shouldn't pop an editor that isn't on the stack");
  }
  if (a3)
  {
    uint64_t v11 = [(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:a3];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = v11;
      -[TSDEditorController p_willChangeCurrentEditorsWithNewEditors:](self, "p_willChangeCurrentEditorsWithNewEditors:", objc_msgSend((id)-[NSMutableArray subarrayWithRange:](self->mEditorStack, "subarrayWithRange:", 0, v11), "arrayByAddingObject:", a4));
      [(NSMutableArray *)self->mEditorStack insertObject:a4 atIndex:v12];
      if (objc_opt_respondsToSelector()) {
        [a4 didBecomeCurrentEditor];
      }
      [(TSDEditorController *)self p_setTextInputEditor:a4];
      uint64_t v13 = [(NSMutableArray *)self->mEditorStack count] + 1;
      do
      {
        if (!--v13) {
          break;
        }
        id v14 = (id)[(NSMutableArray *)self->mEditorStack lastObject];
        if (objc_opt_respondsToSelector()) {
          [v14 willResignCurrentEditor];
        }
        [(NSMutableArray *)self->mEditorStack removeLastObject];
      }
      while (v14 != a3);
      [(TSDEditorController *)self p_didChangeCurrentEditors];
    }
  }

  [(TSDEditorController *)self notifyResignedTextInputEditors];
}

- (void)beginTransaction
{
}

- (void)endTransaction
{
  unint64_t mTransactionLevel = self->mTransactionLevel;
  if (mTransactionLevel
    || (uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSDEditorController endTransaction]"],
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 407, @"unbalanced endTransaction"), (unint64_t mTransactionLevel = self->mTransactionLevel) != 0))
  {
    unint64_t v6 = mTransactionLevel - 1;
    self->unint64_t mTransactionLevel = v6;
    if (!v6)
    {
      if (self->mNotifiedWillChangeTextInputEditor || self->mDidChangeTextInputEditor)
      {
        [(TSDEditorController *)self p_willChangeTextInputEditor];
        [(TSDEditorController *)self p_didChangeTextInputEditor];
        self->mNotifiedWillChangeTextInputEditor = 0;
        self->mDidChangeTextInputEditor = 0;
      }
      if (self->mNotifiedWillChangeCurrentEditors || self->mDidChangeCurrentEditors)
      {
        [(TSDEditorController *)self p_willChangeCurrentEditors];
        [(TSDEditorController *)self p_didChangeCurrentEditors];
        self->mNotifiedWillChangeCurrentEditors = 0;
        self->mDidChangeCurrentEditors = 0;
      }
    }
  }
}

- (void)notifyResignedTextInputEditors
{
  if (!self->mIsReentrantResigningTextInputEditors)
  {
    self->mIsReentrantResigningTextInputEditors = 1;
    if ([(NSMutableArray *)self->mResignedTextInputEditors count])
    {
      unint64_t v3 = 0;
      do
      {
        uint64_t v4 = (void *)[(NSMutableArray *)self->mResignedTextInputEditors objectAtIndex:v3];
        if (objc_opt_respondsToSelector()) {
          [v4 didResignTextInputEditor];
        }
        ++v3;
      }
      while (v3 < [(NSMutableArray *)self->mResignedTextInputEditors count]);
    }
    [(NSMutableArray *)self->mResignedTextInputEditors removeAllObjects];
    self->mIsReentrantResigningTextInputEditors = 0;
  }
}

- (void)enumerateEditorsOnStackUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v13 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = (void *)[(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v4);
      }
      (*((void (**)(id, void, char *))a3 + 2))(a3, *(void *)(*((void *)&v9 + 1) + 8 * v8), &v13);
      if (v13) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
        if (v6) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (id)currentEditorsOfClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mEditorStack = self->mEditorStack;
  uint64_t v6 = [(NSMutableArray *)mEditorStack countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mEditorStack);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)mEditorStack countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v4;
}

- (id)mostSpecificCurrentEditorOfClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    unint64_t v3 = (void *)[(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (!v4) {
      return 0;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
      if (objc_opt_isKindOfClass()) {
        return v8;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_4;
        }
        return 0;
      }
    }
  }
  else
  {
    mEditorStack = self->mEditorStack;
    return (id)[(NSMutableArray *)mEditorStack lastObject];
  }
}

- (id)mostSpecificCurrentEditorOfClass:(Class)a3 conformingToProtocol:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = (void *)[(NSMutableArray *)self->mEditorStack reverseObjectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v14;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(v6);
    }
    long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
    if (!a3 || (objc_opt_isKindOfClass()) && ([v11 conformsToProtocol:a4]) {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)currentEditorsConformingToProtocol:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mEditorStack = self->mEditorStack;
  uint64_t v7 = [(NSMutableArray *)mEditorStack countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(mEditorStack);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 conformsToProtocol:a3]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)mEditorStack countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)mostSpecificEditorConformingToProtocol:(id)a3
{
  return [(TSDEditorController *)self mostSpecificCurrentEditorOfClass:0 conformingToProtocol:a3];
}

- (void)popToEditor:(id)a3
{
  if (!a3)
  {
    id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDEditorController popToEditor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 521, @"invalid nil value for '%s'", "editor");
  }
  uint64_t v7 = [(NSMutableArray *)self->mEditorStack indexOfObjectIdenticalTo:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDEditorController popToEditor:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"];
    [v8 handleFailureInFunction:v9, v10, 524, @"can't popToEditor:, that editor isn't in the stack" file lineNumber description];
  }
  else
  {
    uint64_t v11 = v7 + 1;
    if (v7 + 1 < (unint64_t)[(NSMutableArray *)self->mEditorStack count])
    {
      uint64_t v12 = [(NSMutableArray *)self->mEditorStack objectAtIndex:v11];
      [(TSDEditorController *)self popEditor:v12];
    }
  }
}

- (void)setObject:(id)a3 forInspectorPropertyKey:(id)a4
{
}

- (void)removeObjectForInspectorPropertyKey:(id)a3
{
}

- (id)objectForInspectorPropertyKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->mInspectorPropertyValueMap objectForKey:a3];
}

- (BOOL)isChangingCurrentEditorsWhenCommittingInspectorChanges
{
  return self->mChangingCurrentEditorsWhenCommittingInspectorChangesCount != 0;
}

- (void)willChangeCurrentEditorsWhenCommittingInspectorChanges
{
}

- (void)didChangeCurrentEditorsWhenCommittingInspectorChanges
{
  unint64_t mChangingCurrentEditorsWhenCommittingInspectorChangesCount = self->mChangingCurrentEditorsWhenCommittingInspectorChangesCount;
  if (mChangingCurrentEditorsWhenCommittingInspectorChangesCount
    || (uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSDEditorController didChangeCurrentEditorsWhenCommittingInspectorChanges]"], objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 563, @"Call to didChangeCurrentEditorsWhenCommittingInspectorChanges without a matching willChangeCurrentEditorsWhenCommittingInspectorChanges"), (mChangingCurrentEditorsWhenCommittingInspectorChangesCount = self->mChangingCurrentEditorsWhenCommittingInspectorChangesCount) != 0))
  {
    self->unint64_t mChangingCurrentEditorsWhenCommittingInspectorChangesCount = mChangingCurrentEditorsWhenCommittingInspectorChangesCount
                                                                     - 1;
  }
}

- (void)editorDidChangeSelection:(id)a3 withSelectionFlags:(unint64_t)a4
{
  if (!a3)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDEditorController editorDidChangeSelection:withSelectionFlags:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 574, @"invalid nil value for '%s'", "editor");
  }
  id v9 = objc_alloc(NSDictionary);
  id v10 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", a3, @"TSDEditorControllerEditorKey", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4), @"TSDEditorControllerSelectionFlagsKey", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSDEditorControllerSelectionDidChange", self, v10);
}

- (void)editorSelectionWasForciblyChanged:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDEditorController editorSelectionWasForciblyChanged:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 589, @"invalid nil value for '%s'", "editor");
  }
  id v7 = objc_alloc(NSDictionary);
  id v8 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", a3, @"TSDEditorControllerEditorKey", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 0), @"TSDEditorControllerSelectionFlagsKey", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSDEditorControllerSelectionWasForciblyChanged", self, v8);
}

- (void)editorDidChangeSelectionAndWantsKeyboard:(id)a3 withSelectionFlags:(unint64_t)a4
{
  if (!a3)
  {
    id v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDEditorController editorDidChangeSelectionAndWantsKeyboard:withSelectionFlags:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 604, @"invalid nil value for '%s'", "editor");
  }
  id v9 = objc_alloc(NSDictionary);
  id v10 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", a3, @"TSDEditorControllerEditorKey", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4), @"TSDEditorControllerSelectionFlagsKey", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSDEditorControllerSelectionDidChangeAndWantsKeyboard", self, v10);
}

- (void)p_setTextInputEditor:(id)a3
{
  if (self->mTextInputEditor != a3)
  {
    [(TSDEditorController *)self p_willChangeTextInputEditor];
    if (self->mTextInputEditor) {
      -[NSMutableArray addObject:](self->mResignedTextInputEditors, "addObject:");
    }
    if (objc_opt_respondsToSelector()) {
      [(TSDEditor *)self->mTextInputEditor willResignTextInputEditor];
    }
    self->mTextInputEditor = (TSDEditor *)a3;
    if (objc_opt_respondsToSelector()) {
      [(TSDEditor *)self->mTextInputEditor didBecomeTextInputEditor];
    }
    [(TSDEditorController *)self p_didChangeTextInputEditor];
  }
}

- (void)p_willChangeTextInputEditor
{
  if (!self->mNotifiedWillChangeTextInputEditor)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDEditorControllerWillChangeTextInputEditor", self);
    self->mNotifiedWillChangeTextInputEditor = 1;
  }
}

- (void)p_didChangeTextInputEditor
{
  if (self->mTransactionLevel)
  {
    char v3 = 1;
    uint64_t v4 = 40;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDEditorControllerDidChangeTextInputEditor", self);
    char v3 = 0;
    uint64_t v4 = 42;
  }
  *((unsigned char *)&self->super.isa + v4) = v3;
}

- (void)p_willChangeCurrentEditorsWithNewEditors:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  if (!self->mNotifiedWillChangeCurrentEditors)
  {
    if (a3 && !self->mTransactionLevel)
    {
      uint64_t v5 = @"TSDEditorControllerNewEditorsKey";
      v6[0] = a3;
      uint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    }
    else
    {
      uint64_t v4 = 0;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSDEditorControllerWillChangeCurrentEditors", self, v4);
    self->mNotifiedWillChangeCurrentEditors = 1;
  }
}

- (void)p_willChangeCurrentEditors
{
}

- (void)p_didChangeCurrentEditors
{
  if (self->mTransactionLevel)
  {
    char v3 = 1;
    uint64_t v4 = 41;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDEditorControllerDidChangeCurrentEditors", self);
    char v3 = 0;
    uint64_t v4 = 43;
  }
  *((unsigned char *)&self->super.isa + v4) = v3;
}

@end