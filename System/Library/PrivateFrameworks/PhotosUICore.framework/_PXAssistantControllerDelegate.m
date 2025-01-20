@interface _PXAssistantControllerDelegate
- (_PXAssistantControllerDelegate)init;
- (_PXAssistantControllerDelegate)initWithAssistantController:(id)a3 completionHandler:(id)a4;
- (void)assistantController:(id)a3 completedWithError:(id)a4;
@end

@implementation _PXAssistantControllerDelegate

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
}

- (void)assistantController:(id)a3 completedWithError:(id)a4
{
}

- (_PXAssistantControllerDelegate)initWithAssistantController:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXAssistantUtilities.m", 31, @"Invalid parameter not satisfying: %@", @"assistantController" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PXAssistantUtilities.m", 32, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)_PXAssistantControllerDelegate;
  v11 = [(_PXAssistantControllerDelegate *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assistantController, a3);
    [(PXAssistantController *)v12->_assistantController setDelegate:v12];
    v13 = _Block_copy(v10);
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v13;
  }
  return v12;
}

- (_PXAssistantControllerDelegate)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssistantUtilities.m", 27, @"%s is not available as initializer", "-[_PXAssistantControllerDelegate init]");

  abort();
}

@end