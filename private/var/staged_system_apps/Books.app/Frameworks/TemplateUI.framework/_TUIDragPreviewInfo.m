@interface _TUIDragPreviewInfo
- (TUIReusableRenderView)view;
- (_TUIDragPreviewInfo)initWithDragInfo:(id)a3 view:(id)a4;
- (_TUIDragTriggerInfo)dragInfo;
- (void)setDragInfo:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _TUIDragPreviewInfo

- (_TUIDragPreviewInfo)initWithDragInfo:(id)a3 view:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDragPreviewInfo;
  v9 = [(_TUIDragPreviewInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dragInfo, a3);
    objc_storeStrong((id *)&v10->_view, a4);
  }

  return v10;
}

- (_TUIDragTriggerInfo)dragInfo
{
  return self->_dragInfo;
}

- (void)setDragInfo:(id)a3
{
}

- (TUIReusableRenderView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);

  objc_storeStrong((id *)&self->_dragInfo, 0);
}

@end