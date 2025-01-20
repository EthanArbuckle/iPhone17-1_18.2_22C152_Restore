@interface UITextDraggableGeometrySameViewDropOperationResult
+ (UITextDraggableGeometrySameViewDropOperationResult)resultWithRange:(id)a3 targetedPreviewProvider:(id)a4;
- (UITextDraggableGeometrySameViewDropOperationResult)initWithRange:(id)a3 targetedPreviewProvider:(id)a4;
- (UITextRange)resultRange;
- (id)targetedPreviewProvider;
@end

@implementation UITextDraggableGeometrySameViewDropOperationResult

- (UITextDraggableGeometrySameViewDropOperationResult)initWithRange:(id)a3 targetedPreviewProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UITextDraggableGeometrySameViewDropOperationResult;
  v9 = [(UITextDraggableGeometrySameViewDropOperationResult *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultRange, a3);
    v11 = _Block_copy(v8);
    id targetedPreviewProvider = v10->_targetedPreviewProvider;
    v10->_id targetedPreviewProvider = v11;
  }
  return v10;
}

+ (UITextDraggableGeometrySameViewDropOperationResult)resultWithRange:(id)a3 targetedPreviewProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithRange:v7 targetedPreviewProvider:v6];

  return (UITextDraggableGeometrySameViewDropOperationResult *)v8;
}

- (UITextRange)resultRange
{
  return self->_resultRange;
}

- (id)targetedPreviewProvider
{
  return self->_targetedPreviewProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_targetedPreviewProvider, 0);
  objc_storeStrong((id *)&self->_resultRange, 0);
}

@end