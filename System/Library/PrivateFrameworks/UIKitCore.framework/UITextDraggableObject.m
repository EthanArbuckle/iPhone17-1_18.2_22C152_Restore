@interface UITextDraggableObject
+ (id)draggableObjectWithItemProvider:(id)a3 fromRange:(id)a4;
- (NSItemProvider)itemProvider;
- (UITextRange)range;
- (id)previewProvider;
- (id)targetedPreviewProvider;
- (void)setItemProvider:(id)a3;
- (void)setPreviewProvider:(id)a3;
- (void)setRange:(id)a3;
- (void)setTargetedPreviewProvider:(id)a3;
@end

@implementation UITextDraggableObject

+ (id)draggableObjectWithItemProvider:(id)a3 fromRange:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setItemProvider:v6];

  [v7 setRange:v5];
  return v7;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (UITextRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
}

- (id)targetedPreviewProvider
{
  return self->_targetedPreviewProvider;
}

- (void)setTargetedPreviewProvider:(id)a3
{
}

- (id)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewProvider, 0);
  objc_storeStrong(&self->_targetedPreviewProvider, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end