@interface TUIExpandableBox
- (Class)layoutClass;
- (NSString)pointerRefId;
- (TUIMutableDynamicValue)viewState;
- (TUIPointerStyle)pointerStyle;
- (void)setPointerRefId:(id)a3;
- (void)setPointerStyle:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation TUIExpandableBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
}

- (NSString)pointerRefId
{
  return self->_pointerRefId;
}

- (void)setPointerRefId:(id)a3
{
}

- (TUIPointerStyle)pointerStyle
{
  return self->_pointerStyle;
}

- (void)setPointerStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerStyle, 0);
  objc_storeStrong((id *)&self->_pointerRefId, 0);

  objc_storeStrong((id *)&self->_viewState, 0);
}

@end