@interface PXCMMShowPhotosPickerActionPerformer
- (PXGridPresentation)gridPresentation;
- (id)performActionWithSession:(id)a3 completionHandler:(id)a4;
- (void)performPhotosPickerActionWithSession:(id)a3 gridPresentation:(id)a4 completionHandler:(id)a5;
@end

@implementation PXCMMShowPhotosPickerActionPerformer

- (void).cxx_destruct
{
}

- (PXGridPresentation)gridPresentation
{
  return self->_gridPresentation;
}

- (id)performActionWithSession:(id)a3 completionHandler:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PXCMMActionManager.m" lineNumber:221 description:@"Photos Picker presentation requires a grid presentation"];

  return 0;
}

- (void)performPhotosPickerActionWithSession:(id)a3 gridPresentation:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXCMMActionManager.m", 215, @"Invalid parameter not satisfying: %@", @"gridPresentation" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_gridPresentation, a4);
  v14.receiver = self;
  v14.super_class = (Class)PXCMMShowPhotosPickerActionPerformer;
  id v12 = [(PXCMMActionPerformer *)&v14 performActionWithSession:v9 completionHandler:v11];
}

@end