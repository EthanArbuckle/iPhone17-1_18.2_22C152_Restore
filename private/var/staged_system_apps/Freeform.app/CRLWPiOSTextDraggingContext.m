@interface CRLWPiOSTextDraggingContext
- (CRLEditorController)editorController;
- (CRLSelectionPath)reverseSelectionPath;
- (CRLSelectionPath)sourceSelectionPath;
- (CRLWPiOSTextDraggingContext)initWithEditorController:(id)a3 sourceSelectionPath:(id)a4 changeCount:(unint64_t)a5 reverseSelectionPath:(id)a6;
- (unint64_t)changeCount;
- (void)setChangeCount:(unint64_t)a3;
@end

@implementation CRLWPiOSTextDraggingContext

- (CRLWPiOSTextDraggingContext)initWithEditorController:(id)a3 sourceSelectionPath:(id)a4 changeCount:(unint64_t)a5 reverseSelectionPath:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CRLWPiOSTextDraggingContext;
  v14 = [(CRLWPiOSTextDraggingContext *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_editorController, a3);
    objc_storeStrong((id *)&v15->_sourceSelectionPath, a4);
    v15->_changeCount = a5;
    objc_storeStrong((id *)&v15->_reverseSelectionPath, a6);
  }

  return v15;
}

- (CRLEditorController)editorController
{
  return self->_editorController;
}

- (CRLSelectionPath)sourceSelectionPath
{
  return self->_sourceSelectionPath;
}

- (unint64_t)changeCount
{
  return self->_changeCount;
}

- (void)setChangeCount:(unint64_t)a3
{
  self->_changeCount = a3;
}

- (CRLSelectionPath)reverseSelectionPath
{
  return self->_reverseSelectionPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseSelectionPath, 0);
  objc_storeStrong((id *)&self->_sourceSelectionPath, 0);

  objc_storeStrong((id *)&self->_editorController, 0);
}

@end