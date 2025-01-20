@interface CRLBoardEditor
- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5;
- (CRLBoardEditor)initWithInteractiveCanvasController:(id)a3;
- (CRLEditorController)editorController;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5;
- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7;
- (void)setEditorController:(id)a3;
@end

@implementation CRLBoardEditor

- (CRLBoardEditor)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLBoardEditor;
  v5 = [(CRLBoardEditor *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
  }

  return v6;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  v2 = [(CRLBoardEditor *)self interactiveCanvasController];
  v3 = [v2 editingCoordinator];

  return (_TtC8Freeform21CRLEditingCoordinator *)v3;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  v5 = [(CRLBoardEditor *)self interactiveCanvasController];
  v6 = [v5 canvasEditor];

  return v6;
}

- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7
{
  id v7 = a4;

  return v7;
}

- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (CRLEditorController)editorController
{
  return self->_editorController;
}

- (void)setEditorController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorController, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end