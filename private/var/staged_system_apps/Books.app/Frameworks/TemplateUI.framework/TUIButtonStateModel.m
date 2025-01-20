@interface TUIButtonStateModel
- (TUIButtonAttributes)attributes;
- (TUIButtonStateModel)initWithButtonAttributes:(id)a3 contentModel:(id)a4;
- (TUIButtonStateModel)initWithTitle:(id)a3 image:(id)a4;
- (TUIModelContaining)parentModel;
- (id)modelForButtonType:(unint64_t)a3 context:(id)a4;
- (unint64_t)modelKind;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)appendLayoutModelsToArray:(id)a3;
- (void)onContainedModelsChanged;
- (void)setParentModel:(id)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation TUIButtonStateModel

- (TUIButtonStateModel)initWithTitle:(id)a3 image:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIButtonStateModel;
  v8 = [(TUIButtonStateModel *)&v13 init];
  if (v8) {
    BOOL v9 = (v6 | v7) == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v10 = [[TUIButtonAttributes alloc] initWithTitle:v6 image:v7];
    attributes = v8->_attributes;
    v8->_attributes = v10;
  }
  return v8;
}

- (TUIButtonStateModel)initWithButtonAttributes:(id)a3 contentModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIButtonStateModel;
  BOOL v9 = [(TUIButtonStateModel *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributes, a3);
    objc_storeStrong((id *)&v10->_contentModel, a4);
  }

  return v10;
}

- (id)modelForButtonType:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = self;
  uint64_t v8 = [(TUIButtonAttributes *)v7->_attributes attributesForButtonType:a3];
  BOOL v9 = (void *)v8;
  if (a3 && v7->_contentModel)
  {
    if (v8) {
      v10 = [[TUIButtonStateModel alloc] initWithButtonAttributes:v8 contentModel:0];
    }
    else {
      v10 = 0;
    }

    [v6 reportError:1019];
  }
  else
  {
    if ((TUIButtonAttributes *)v8 == v7->_attributes) {
      goto LABEL_10;
    }
    v10 = [[TUIButtonStateModel alloc] initWithButtonAttributes:v8 contentModel:v7->_contentModel];
  }
  id v7 = v10;
LABEL_10:

  return v7;
}

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutChildrenToArray:(id)a3
{
}

- (void)appendLayoutModelsToArray:(id)a3
{
}

- (void)appendContainedChildrenToArray:(id)a3
{
  contentModel = self->_contentModel;
  if (contentModel) {
    [a3 addObject:contentModel];
  }
}

- (void)onContainedModelsChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);
  [WeakRetained onContainedModelsChanged];
}

- (void)updateModelChildren:(id)a3
{
  contentModel = self->_contentModel;
  id v5 = a3;
  [(TUIModel *)contentModel setParentModel:0];
  id v6 = [v5 firstObject];

  id v7 = self->_contentModel;
  self->_contentModel = v6;

  [(TUIModel *)self->_contentModel setParentModel:self];

  [(TUIButtonStateModel *)self onContainedModelsChanged];
}

- (TUIModelContaining)parentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);

  return (TUIModelContaining *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (TUIButtonAttributes)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_destroyWeak((id *)&self->_parentModel);

  objc_storeStrong((id *)&self->_contentModel, 0);
}

@end