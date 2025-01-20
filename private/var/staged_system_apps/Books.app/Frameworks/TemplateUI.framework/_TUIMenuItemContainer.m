@interface _TUIMenuItemContainer
- (TUIMenuItemModel)model;
- (TUIModelContaining)parentModel;
- (_TUIMenuItemContainer)initWithModel:(id)a3;
- (unint64_t)modelKind;
- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4;
- (void)setParentModel:(id)a3;
@end

@implementation _TUIMenuItemContainer

- (unint64_t)modelKind
{
  return 2;
}

- (_TUIMenuItemContainer)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIMenuItemContainer;
  v6 = [(_TUIMenuItemContainer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4
{
  v12 = (__objc2_prot *)a3;
  id v6 = a4;
  model = self->_model;
  if (model) {
    BOOL v8 = &OBJC_PROTOCOL___TUIMenuItemModel == v12;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    [v6 addObject:];
    model = self->_model;
  }
  objc_super v9 = [(TUIMenuItemModel *)model imageModel];

  if (v9) {
    BOOL v10 = &OBJC_PROTOCOL___TUIImageModel == v12;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    v11 = [(TUIMenuItemModel *)self->_model imageModel];
    [v6 addObject:v11];
  }
}

- (TUIModelContaining)parentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);

  return (TUIModelContaining *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (TUIMenuItemModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_destroyWeak((id *)&self->_parentModel);
}

@end