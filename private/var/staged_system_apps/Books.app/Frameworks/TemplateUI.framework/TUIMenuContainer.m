@interface TUIMenuContainer
- (TUIMenuContainer)initWithTitle:(id)a3 imageModel:(id)a4 isInline:(BOOL)a5;
- (TUIMenuModel)menuModel;
- (TUIModelContaining)parentModel;
- (id)imageModelsToLoad;
- (unint64_t)modelKind;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4;
- (void)onContainedModelsChanged;
- (void)setParentModel:(id)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation TUIMenuContainer

- (TUIMenuContainer)initWithTitle:(id)a3 imageModel:(id)a4 isInline:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIMenuContainer;
  v10 = [(TUIMenuContainer *)&v14 init];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    title = v10->_title;
    v10->_title = v11;

    objc_storeStrong((id *)&v10->_imageModel, a4);
    v10->_isInline = a5;
  }

  return v10;
}

- (id)imageModelsToLoad
{
  v3 = +[NSMutableArray array];
  [(TUIMenuContainer *)self appendObjectsWithProtocol:&OBJC_PROTOCOL___TUIImageModel toArray:v3];
  v4 = +[NSPredicate predicateWithBlock:&stru_2560E8];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (unint64_t)modelKind
{
  return 2;
}

- (void)updateModelChildren:(id)a3
{
  children = self->_children;
  id v5 = a3;
  [(NSArray *)children enumerateObjectsUsingBlock:&stru_256108];
  v6 = (NSArray *)[v5 copy];

  v7 = self->_children;
  self->_children = v6;

  id v8 = self->_children;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1349B8;
  v9[3] = &unk_251AE0;
  v9[4] = self;
  [(NSArray *)v8 enumerateObjectsUsingBlock:v9];
  [(TUIMenuContainer *)self onContainedModelsChanged];
}

- (void)onContainedModelsChanged
{
  v3 = objc_opt_new();
  children = self->_children;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_134AA8;
  v9[3] = &unk_251AE0;
  id v10 = v3;
  id v5 = v3;
  [(NSArray *)children enumerateObjectsUsingBlock:v9];
  v6 = +[TUIMenuModel menuWithTitle:self->_title imageModel:self->_imageModel isInline:self->_isInline children:v5];
  menuModel = self->_menuModel;
  self->_menuModel = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);
  [WeakRetained onContainedModelsChanged];
}

- (void)appendContainedChildrenToArray:(id)a3
{
}

- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4
{
  v6 = (__objc2_prot *)a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_menuModel) {
    BOOL v9 = &OBJC_PROTOCOL___TUIMenuItemModel == v6;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    [v7 addObject:];
  }
  if (&OBJC_PROTOCOL___TUIImageModel == v6)
  {
    v17 = v6;
    if (self->_imageModel) {
      [v8 addObject:];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = self->_children;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        objc_super v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v14);
          if (objc_opt_respondsToSelector())
          {
            [v15 appendObjectsWithProtocol:&OBJC_PROTOCOL___TUIImageModel toArray:v8];
          }
          else
          {
            v16 = TUIDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              sub_192AAC(v22, (uint64_t)v15, &v23, v16);
            }
          }
          objc_super v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v12);
    }

    v6 = v17;
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

- (TUIMenuModel)menuModel
{
  return self->_menuModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuModel, 0);
  objc_destroyWeak((id *)&self->_parentModel);
  objc_storeStrong((id *)&self->_imageModel, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end