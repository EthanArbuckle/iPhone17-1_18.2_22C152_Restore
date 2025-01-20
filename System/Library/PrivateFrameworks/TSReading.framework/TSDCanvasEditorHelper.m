@interface TSDCanvasEditorHelper
+ (BOOL)physicalKeyboardIsSender:(id)a3;
+ (Class)selectionClass;
+ (id)canvasSelectionWithInfos:(id)a3;
+ (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4;
- (BOOL)canDeleteComment;
- (BOOL)canGroupDrawables:(id)a3;
- (BOOL)canPerformMaskWithSender:(id)a3;
- (BOOL)canPerformMaskWithShapeTypeWithSender:(id)a3;
- (BOOL)canPerformMaskWithShapeWithSender:(id)a3;
- (BOOL)canPerformUnmaskWithSender:(id)a3;
- (BOOL)canUngroupWithSelection:(id)a3;
- (BOOL)isRepSelectable:(id)a3;
- (BOOL)p_canReduceFileSizeForSelectedImages;
- (BOOL)p_selectionContainsInlineObjects:(id)a3;
- (Class)editorClassForSelection:(id)a3;
- (Class)editorClassForSelectionIgnoringLockedState:(id)a3;
- (Class)p_editorClassForSelection:(id)a3 shouldIgnoreLockedState:(BOOL)a4;
- (TSDCanvasEditorHelper)initWithCanvasEditor:(id)a3;
- (id)canvasEditor;
- (id)canvasSelectionFromRep:(id)a3;
- (id)canvasSelectionWithInfos:(id)a3;
- (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4;
- (id)documentRoot;
- (id)editorToPopToOnEndEditingForSelection:(id)a3;
- (id)infosFromCanvasSelection:(id)a3;
- (id)interactiveCanvasController;
- (id)layoutsForAlignAndDistribute;
- (id)newEditorForEditorClass:(Class)a3;
- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformAlignAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformConnectWithConnectionLineAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformCopyAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformCopyStyleAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformCutAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformDeleteAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformDistributeAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformDuplicateAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformGroupAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformLockAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformSelectAllAction:(SEL)a3 withSender:(id)a4;
- (int)canvasEditorCanPerformUngroupAction:(SEL)a3 withSender:(id)a4;
- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4;
- (void)dealloc;
- (void)notifyRepsForSelectionChangeFrom:(id)a3 to:(id)a4;
- (void)p_copy:(id)a3;
- (void)pushNewEditorForSelection:(id)a3;
- (void)teardown;
@end

@implementation TSDCanvasEditorHelper

- (TSDCanvasEditorHelper)initWithCanvasEditor:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TSDCanvasEditorHelper;
  v4 = [(TSDCanvasEditorHelper *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->mCanvasEditor = (TSDCanvasEditor *)a3;
    mChangeNotifier = (TSKChangeNotifier *)(id)objc_msgSend(-[TSDCanvasEditorHelper documentRoot](v4, "documentRoot"), "changeNotifier");
    v5->mChangeNotifier = mChangeNotifier;
    if (!mChangeNotifier)
    {
      v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSDCanvasEditorHelper initWithCanvasEditor:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditorHelper.m"), 189, @"invalid nil value for '%s'", "mChangeNotifier");
      mChangeNotifier = v5->mChangeNotifier;
    }
    [(TSKChangeNotifier *)mChangeNotifier addObserver:v5 forChangeSourceOfClass:objc_opt_class()];
    v5->mTornDown = 0;
  }
  return v5;
}

- (id)canvasEditor
{
  return self->mCanvasEditor;
}

- (id)documentRoot
{
  id v2 = [(TSDCanvasEditorHelper *)self canvasEditor];

  return (id)[v2 documentRoot];
}

- (id)interactiveCanvasController
{
  id v2 = [(TSDCanvasEditorHelper *)self canvasEditor];

  return (id)[v2 interactiveCanvasController];
}

- (void)teardown
{
  self->mChangeNotifier = 0;
  self->mTornDown = 1;
}

- (void)dealloc
{
  if (!self->mTornDown)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDCanvasEditorHelper dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditorHelper.m"), 248, @"Need to call teardown on the editor helper");
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasEditorHelper;
  [(TSDCanvasEditorHelper *)&v5 dealloc];
}

- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) kind] == 5)
        {
          -[TSDCanvasEditorHelper pushNewEditorForSelection:](self, "pushNewEditorForSelection:", objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasSelection"));
          return;
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
}

- (BOOL)isRepSelectable:(id)a3
{
  return 1;
}

+ (Class)selectionClass
{
  return (Class)objc_opt_class();
}

- (void)notifyRepsForSelectionChangeFrom:(id)a3 to:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = [(TSDCanvasEditorHelper *)self interactiveCanvasController];
  if (a3 && [a3 count])
  {
    id v31 = a3;
    uint64_t v7 = (void *)[a3 mutableCopy];
    uint64_t v8 = v7;
    if (a4) {
      [v7 minusSet:a4];
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v45;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * v12);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v14 = (void *)[v6 repsForInfo:v13];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v41;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v41 != v17) {
                  objc_enumerationMutation(v14);
                }
                [*(id *)(*((void *)&v40 + 1) + 8 * v18++) becameNotSelected];
              }
              while (v16 != v18);
              uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
            }
            while (v16);
          }
          ++v12;
        }
        while (v12 != v10);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v10);
    }

    a3 = v31;
  }
  if (a4 && [a4 count])
  {
    v19 = (void *)[a4 mutableCopy];
    v20 = v19;
    if (a3) {
      [v19 minusSet:a3];
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * v24);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v26 = (void *)[v6 repsForInfo:v25];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v48 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v33;
            do
            {
              uint64_t v30 = 0;
              do
              {
                if (*(void *)v33 != v29) {
                  objc_enumerationMutation(v26);
                }
                [*(id *)(*((void *)&v32 + 1) + 8 * v30++) becameSelected];
              }
              while (v28 != v30);
              uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v48 count:16];
            }
            while (v28);
          }
          ++v24;
        }
        while (v24 != v22);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v49 count:16];
      }
      while (v22);
    }
  }
}

- (Class)p_editorClassForSelection:(id)a3 shouldIgnoreLockedState:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!objc_msgSend((id)objc_msgSend(a3, "infos"), "count")) {
    return 0;
  }
  objc_msgSend((id)objc_msgSend(a3, "infos"), "anyObject");
  objc_opt_class();
  objc_super v5 = (void *)TSUClassAndProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v6 = objc_msgSend(v5, "editorClass", &unk_26D7828F0);
  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id obj = (id)[a3 infos];
    uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v17;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = (void *)TSUProtocolCast();
        if (objc_opt_respondsToSelector()) {
          uint64_t v13 = (void *)[v12 editorClass];
        }
        else {
          uint64_t v13 = 0;
        }
        if (objc_opt_respondsToSelector()) {
          v9 |= [v13 shouldSuppressMultiselection];
        }
        if (!v13 || (v9 & 1) != 0 && v13 != v6) {
          return 0;
        }
        if (([v13 isSubclassOfClass:v6] & 1) == 0 && v13 != v6)
        {
          id v6 = (void *)[v6 superclass];
          if (([v13 isSubclassOfClass:v6] & 1) == 0)
          {
            do
              id v6 = (void *)[v6 superclass];
            while (![v13 isSubclassOfClass:v6]);
          }
          if (objc_opt_class() != v6 && ![v6 isSubclassOfClass:objc_opt_class()]) {
            return 0;
          }
        }
        if (++v11 == v8)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            goto LABEL_6;
          }
          return (Class)v6;
        }
      }
    }
  }
  return (Class)v6;
}

- (Class)editorClassForSelectionIgnoringLockedState:(id)a3
{
  return [(TSDCanvasEditorHelper *)self p_editorClassForSelection:a3 shouldIgnoreLockedState:1];
}

- (Class)editorClassForSelection:(id)a3
{
  return [(TSDCanvasEditorHelper *)self p_editorClassForSelection:a3 shouldIgnoreLockedState:0];
}

- (id)editorToPopToOnEndEditingForSelection:(id)a3
{
  id v5 = [(TSDCanvasEditorHelper *)self canvasEditor];
  id v6 = objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "interactiveCanvasController");
  uint64_t v7 = [(TSDCanvasEditorHelper *)self editorClassForSelection:a3];
  if (!v7) {
    return v5;
  }
  uint64_t v8 = v7;
  int v9 = (void *)[v6 editorController];

  return (id)[v9 mostSpecificCurrentEditorOfClass:v8];
}

- (id)newEditorForEditorClass:(Class)a3
{
  return 0;
}

- (void)pushNewEditorForSelection:(id)a3
{
  id v5 = [(TSDCanvasEditorHelper *)self canvasEditor];
  id v6 = objc_msgSend(-[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"), "editorController");
  [v6 beginTransaction];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__17;
  long long v16 = __Block_byref_object_dispose__17;
  uint64_t v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__TSDCanvasEditorHelper_pushNewEditorForSelection___block_invoke;
  v11[3] = &unk_2646B25D8;
  v11[4] = a3;
  v11[5] = &v12;
  [v6 enumerateEditorsOnStackUsingBlock:v11];
  [v6 popToEditor:v5];
  if ([v5 shouldPushNewEditorForNewSelection])
  {
    uint64_t v7 = [(TSDCanvasEditorHelper *)self editorClassForSelection:a3];
    if (v7)
    {
      id v8 = [(TSDCanvasEditorHelper *)self newEditorForEditorClass:v7];
      if (v8)
      {
LABEL_4:
        [v6 pushEditor:v8];

        goto LABEL_9;
      }
      if ([(objc_class *)v7 isSubclassOfClass:objc_opt_class()])
      {
        id v8 = (id)objc_msgSend([v7 alloc], "initWithInteractiveCanvasController:", -[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
        objc_msgSend(v8, "setInfos:", -[TSDCanvasEditorHelper infosFromCanvasSelection:](self, "infosFromCanvasSelection:", objc_msgSend(v5, "canvasSelection")));
        if (v8) {
          goto LABEL_4;
        }
      }
      else
      {
        int v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v10 = [NSString stringWithUTF8String:"-[TSDCanvasEditorHelper pushNewEditorForSelection:]"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditorHelper.m"), 486, @"Unknown editor class");
      }
    }
  }
LABEL_9:
  if (v13[5]) {
    objc_msgSend(v6, "pushEditor:");
  }
  [v6 endTransaction];
  _Block_object_dispose(&v12, 8);
}

uint64_t __51__TSDCanvasEditorHelper_pushNewEditorForSelection___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [a2 wantsToBePushedBackOntoStackForSelection:*(void *)(a1 + 32)];
    if (result)
    {
      uint64_t result = a2;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
      *a3 = 1;
    }
  }
  return result;
}

- (id)canvasSelectionFromRep:(id)a3
{
  if (!a3 || ([a3 isSelectable] & 1) == 0)
  {
    id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDCanvasEditorHelper canvasSelectionFromRep:]"];
    [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditorHelper.m"), 509, @"can't select a nil rep, or a rep that isn't selectable" file lineNumber description];
  }
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_msgSend(a3, "info"), 0);
  id v8 = [(TSDCanvasEditorHelper *)self canvasSelectionWithInfos:v7];

  return v8;
}

+ (id)canvasSelectionWithInfos:(id)a3
{
  uint64_t v4 = objc_opt_class();

  return (id)[v4 canvasSelectionWithInfos:a3 andContainer:0];
}

- (id)canvasSelectionWithInfos:(id)a3
{
  uint64_t v4 = objc_opt_class();

  return (id)[v4 canvasSelectionWithInfos:a3 andContainer:0];
}

+ (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4
{
  uint64_t v7 = [a3 count];
  id v8 = objc_alloc((Class)[a1 selectionClass]);
  if (v7) {
    id v9 = a3;
  }
  else {
    id v9 = 0;
  }
  uint64_t v10 = (void *)[v8 initWithInfos:v9 andContainer:a4];

  return v10;
}

- (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4
{
  uint64_t v6 = objc_opt_class();

  return (id)[v6 canvasSelectionWithInfos:a3 andContainer:a4];
}

- (id)infosFromCanvasSelection:(id)a3
{
  return (id)[a3 infos];
}

+ (BOOL)physicalKeyboardIsSender:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v3 = 1;
  }
  return v3 & 1;
}

- (int)canvasEditorCanPerformDeleteAction:(SEL)a3 withSender:(id)a4
{
  char v7 = [(id)objc_opt_class() physicalKeyboardIsSender:a4];
  if (!objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasEditorCanDeleteWithSender:", a4))return -1; {
  if (sel_delete_ == a3)
  }
    char v8 = v7;
  else {
    char v8 = 0;
  }
  int result = 1;
  if ((v8 & 1) == 0)
  {
    if (sel_deleteObject_ == a3) {
      return 1;
    }
    else {
      return -1;
    }
  }
  return result;
}

- (int)canvasEditorCanPerformCopyAction:(SEL)a3 withSender:(id)a4
{
  char v7 = [(id)objc_opt_class() physicalKeyboardIsSender:a4];
  if (!objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasEditorCanCopyWithSender:", a4))return -1; {
  if (sel_copy_ == a3)
  }
    char v8 = v7;
  else {
    char v8 = 0;
  }
  int result = 1;
  if ((v8 & 1) == 0)
  {
    if (sel_copyObject_ == a3) {
      return 1;
    }
    else {
      return -1;
    }
  }
  return result;
}

- (int)canvasEditorCanPerformCopyStyleAction:(SEL)a3 withSender:(id)a4
{
  if (objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasEditorCanCopyStyleWithSender:", a4))return 1; {
  else
  }
    return -1;
}

- (int)canvasEditorCanPerformCutAction:(SEL)a3 withSender:(id)a4
{
  int v7 = [(id)objc_opt_class() physicalKeyboardIsSender:a4];
  if (!objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasEditorCanCutWithSender:", a4))return -1; {
  if (sel_cut_ == a3)
  }
    int v8 = v7;
  else {
    int v8 = 0;
  }
  if (sel_cutObject_ == a3) {
    int v8 = 1;
  }
  if (v8) {
    return 1;
  }
  else {
    return -1;
  }
}

- (int)canvasEditorCanPerformDuplicateAction:(SEL)a3 withSender:(id)a4
{
  int v7 = [(id)objc_opt_class() physicalKeyboardIsSender:a4];
  if ((objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasEditorCanDuplicateWithSender:", a4) & v7 & (sel_duplicate_ == a3)) != 0)return 1; {
  else
  }
    return -1;
}

- (int)canvasEditorCanPerformSelectAllAction:(SEL)a3 withSender:(id)a4
{
  if (objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasEditorCanSelectAllWithSender:", a4))return 1; {
  else
  }
    return -1;
}

- (int)canvasEditorCanPerformGroupAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasEditorCanGroupWithSender:", a4))return -1; {
  id v5 = objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasSelection"), "infosOfClass:", objc_opt_class());
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * v9) containingGroup];
      if (v10)
      {
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", objc_msgSend(v10, "childInfos")), "isEqualToSet:", v5))return -1; {
      }
        }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        int result = 1;
        if (v7) {
          goto LABEL_4;
        }
        return result;
      }
    }
  }
  return 1;
}

- (int)canvasEditorCanPerformUngroupAction:(SEL)a3 withSender:(id)a4
{
  if (objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasEditorCanUngroupWithSender:", a4))return 1; {
  else
  }
    return -1;
}

- (int)canvasEditorCanPerformConnectWithConnectionLineAction:(SEL)a3 withSender:(id)a4
{
  if (+[TSDConnectionLineRep infosToConnectFromSelection:withInteractiveCanvasController:](TSDConnectionLineRep, "infosToConnectFromSelection:withInteractiveCanvasController:", objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3, a4), "canvasEditor"), "canvasSelection"), -[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController")))
  {
    return 1;
  }
  else
  {
    return -1;
  }
}

- (int)canvasEditorCanPerformAlignAction:(SEL)a3 withSender:(id)a4
{
  if (objc_msgSend(-[TSDCanvasEditorHelper layoutsForAlignAndDistribute](self, "layoutsForAlignAndDistribute", a3, a4), "count"))
  {
    return 1;
  }
  else
  {
    return -1;
  }
}

- (int)canvasEditorCanPerformDistributeAction:(SEL)a3 withSender:(id)a4
{
  if ((unint64_t)objc_msgSend(-[TSDCanvasEditorHelper layoutsForAlignAndDistribute](self, "layoutsForAlignAndDistribute", a3, a4), "count") > 2)return 1; {
  else
  }
    return -1;
}

- (BOOL)canPerformMaskWithSender:(id)a3
{
  char v3 = objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasSelection"), "infos");
  if ([v3 count] == 1
    && (uint64_t v4 = (void *)[v3 anyObject], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v4 isLocked] & 1) == 0
    && ([v4 isInlineWithText] & 1) == 0)
  {
    return objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", objc_msgSend(v4, "imageData"), 1), "isError") ^ 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)canPerformUnmaskWithSender:(id)a3
{
  char v3 = objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasSelection"), "infos");
  if ([v3 count] != 1) {
    return 0;
  }
  uint64_t v4 = (void *)[v3 anyObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 || ([v4 isLocked]) {
    return 0;
  }

  return [v4 maskCanBeReset];
}

- (BOOL)canPerformMaskWithShapeWithSender:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = [(TSDCanvasEditorHelper *)self interactiveCanvasController];
  id v5 = objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasSelection"), "infos");
  if ([v5 count] == 2)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      char v8 = 0;
      char v15 = 0;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          [v4 repForInfo:v11];
          long long v12 = (void *)TSUDynamicCast();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ![v11 isLocked])
          {
            char v8 = 1;
          }
          else if (v12 && ([v11 isLocked] & 1) == 0)
          {
            char v15 = [v12 canBeUsedForImageMask];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
    else
    {
      char v8 = 0;
      char v15 = 0;
    }
    char v13 = v8 & v15;
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

- (BOOL)canPerformMaskWithShapeTypeWithSender:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v3 = objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasSelection"), "infos");
  if ([v3 count] == 1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          char v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ![v8 isLocked])
          {
            LOBYTE(v4) = 1;
            return v4;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        LOBYTE(v4) = 0;
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (int)canvasEditorCanPerformLockAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3, a4), "canvasSelection"), "infos", 0, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        long long v10 = (void *)TSUDynamicCast();
        if (v10)
        {
          long long v11 = v10;
          if ((sel_lock_ == a3) != [v10 isLocked]
            && ([v11 isLockable] & 1) != 0)
          {
            return 1;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return -1;
}

- (BOOL)canUngroupWithSelection:(id)a3
{
  uint64_t v4 = objc_opt_class();

  return [a3 containsUnlockedKindOfClass:v4];
}

- (BOOL)p_selectionContainsInlineObjects:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v3 = objc_msgSend(a3, "infos", 0, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        uint64_t v8 = (void *)TSUDynamicCast();
        if (v8 && ([v8 isInlineWithText] & 1) != 0)
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  if (sel_cut_ == a3 || sel_cutObject_ == a3)
  {
    return -[TSDCanvasEditorHelper canvasEditorCanPerformCutAction:withSender:](self, "canvasEditorCanPerformCutAction:withSender:");
  }
  else if (sel_copy_ == a3 || sel_copyObject_ == a3)
  {
    return -[TSDCanvasEditorHelper canvasEditorCanPerformCopyAction:withSender:](self, "canvasEditorCanPerformCopyAction:withSender:");
  }
  else if (sel_copyStyle_ == a3)
  {
    return -[TSDCanvasEditorHelper canvasEditorCanPerformCopyStyleAction:withSender:](self, "canvasEditorCanPerformCopyStyleAction:withSender:");
  }
  else if (sel_deleteObject_ == a3 || sel_delete_ == a3)
  {
    return -[TSDCanvasEditorHelper canvasEditorCanPerformDeleteAction:withSender:](self, "canvasEditorCanPerformDeleteAction:withSender:");
  }
  else
  {
    if (sel_isEqual(a3, sel_duplicate_))
    {
      return [(TSDCanvasEditorHelper *)self canvasEditorCanPerformDuplicateAction:a3 withSender:a4];
    }
    if (sel_selectAll_ == a3)
    {
      return [(TSDCanvasEditorHelper *)self canvasEditorCanPerformSelectAllAction:a3 withSender:a4];
    }
    else if (sel_group_ == a3)
    {
      return [(TSDCanvasEditorHelper *)self canvasEditorCanPerformGroupAction:a3 withSender:a4];
    }
    else if (sel_ungroup_ == a3)
    {
      return [(TSDCanvasEditorHelper *)self canvasEditorCanPerformUngroupAction:a3 withSender:a4];
    }
    else if (sel_connectWithConnectionLine_ == a3)
    {
      return [(TSDCanvasEditorHelper *)self canvasEditorCanPerformConnectWithConnectionLineAction:a3 withSender:a4];
    }
    else if (sel_alignDrawablesByLeftEdge_ == a3 {
           || sel_alignDrawablesByRightEdge_ == a3
    }
           || sel_alignDrawablesByTopEdge_ == a3
           || sel_alignDrawablesByBottomEdge_ == a3
           || sel_alignDrawablesByHorizontalCenter_ == a3
           || sel_alignDrawablesByVerticalCenter_ == a3)
    {
      return [(TSDCanvasEditorHelper *)self canvasEditorCanPerformAlignAction:a3 withSender:a4];
    }
    else
    {
      if (sel_distributeDrawablesHorizontally_ != a3
        && sel_distributeDrawablesVertically_ != a3
        && sel_distributeDrawablesEvenly_ != a3)
      {
        if (sel_reduceDocumentFileSize_ != a3)
        {
          if (sel_reduceFileSizeForSelectedImages_ == a3)
          {
            BOOL v12 = [(TSDCanvasEditorHelper *)self p_canReduceFileSizeForSelectedImages];
            goto LABEL_83;
          }
          if (sel_unmask_ == a3)
          {
            BOOL v12 = [(TSDCanvasEditorHelper *)self canPerformMaskWithSender:a4];
            goto LABEL_83;
          }
          if (sel_mask_ == a3)
          {
            BOOL v12 = [(TSDCanvasEditorHelper *)self canPerformUnmaskWithSender:a4];
            goto LABEL_83;
          }
          if (sel_maskWithShape_ == a3)
          {
            BOOL v12 = [(TSDCanvasEditorHelper *)self canPerformMaskWithShapeWithSender:a4];
            goto LABEL_83;
          }
          if (sel_maskWithSelection_ != a3)
          {
            if (sel_maskWithShapeType_ != a3)
            {
              if (sel_lock_ == a3 || sel_unlock_ == a3)
              {
                return [(TSDCanvasEditorHelper *)self canvasEditorCanPerformLockAction:a3 withSender:a4];
              }
              else
              {
                return sel_deleteComment_ == a3 && [(TSDCanvasEditorHelper *)self canDeleteComment];
              }
            }
            BOOL v12 = [(TSDCanvasEditorHelper *)self canPerformMaskWithShapeTypeWithSender:a4];
LABEL_83:
            if (v12) {
              return 1;
            }
            else {
              return -1;
            }
          }
          if (![(TSDCanvasEditorHelper *)self canPerformMaskWithShapeWithSender:a4]&& ![(TSDCanvasEditorHelper *)self canPerformMaskWithSender:a4])
          {
            return -1;
          }
        }
        return 1;
      }
      return [(TSDCanvasEditorHelper *)self canvasEditorCanPerformDistributeAction:a3 withSender:a4];
    }
  }
}

- (void)p_copy:(id)a3
{
  id v4 = [(TSDCanvasEditorHelper *)self canvasEditor];

  [v4 copy:a3];
}

- (BOOL)canGroupDrawables:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = [(TSDCanvasEditorHelper *)self canvasEditor];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(a3);
      }
      int v9 = [v4 canGroupDrawable:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
      if (!v9) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)p_canReduceFileSizeForSelectedImages
{
  id v2 = objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasSelection");
  uint64_t v3 = objc_opt_class();

  return [v2 containsKindOfClass:v3];
}

- (id)layoutsForAlignAndDistribute
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasSelection"), "unlockedInfos");
  uint64_t v4 = objc_msgSend(v3, "filteredSetUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithBlock:", &__block_literal_global_54));
  uint64_t v5 = objc_msgSend(-[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"), "layoutController");

  return (id)[v5 layoutsForInfos:v4];
}

uint64_t __53__TSDCanvasEditorHelper_layoutsForAlignAndDistribute__block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  uint64_t v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    uint64_t v4 = v3;
    if ([v3 connectedTo] || objc_msgSend(v4, "connectedFrom")) {
      return 0;
    }
  }
  if ([a2 isAnchoredToText]) {
    return 0;
  }
  else {
    return [a2 isInlineWithText] ^ 1;
  }
}

- (BOOL)canDeleteComment
{
  return 0;
}

@end