@interface TUIMenuModel
+ (id)menuWithTitle:(id)a3 imageModel:(id)a4 isInline:(BOOL)a5 children:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInline;
- (BOOL)isPrimary;
- (NSArray)children;
- (NSString)title;
- (TUIActionHandlerDelegate)actionDelegate;
- (TUIImageModel)imageModel;
- (TUIMenuModel)initWithOther:(id)a3;
- (TUIMenuModel)initWithTitle:(id)a3 imageModel:(id)a4 isInline:(BOOL)a5 children:(id)a6;
- (id)actionObject;
- (id)menuWithIsPrimary:(BOOL)a3 actionObject:(id)a4 actionDelegate:(id)a5;
- (id)newUIMenuElement;
- (id)newUIMenuElementWithActionObject:(id)a3 delegate:(id)a4;
- (void)loadImagesFromResourceMap:(id)a3;
@end

@implementation TUIMenuModel

- (TUIMenuModel)initWithTitle:(id)a3 imageModel:(id)a4 isInline:(BOOL)a5 children:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TUIMenuModel;
  v13 = [(TUIMenuModel *)&v19 init];
  if (v13)
  {
    v14 = (NSString *)[v10 copy];
    title = v13->_title;
    v13->_title = v14;

    objc_storeStrong((id *)&v13->_imageModel, a4);
    v13->_isInline = a5;
    v16 = (NSArray *)[v12 copy];
    children = v13->_children;
    v13->_children = v16;
  }
  return v13;
}

+ (id)menuWithTitle:(id)a3 imageModel:(id)a4 isInline:(BOOL)a5 children:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[TUIMenuModel alloc] initWithTitle:v11 imageModel:v10 isInline:v6 children:v9];

  return v12;
}

- (TUIMenuModel)initWithOther:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIMenuModel;
  v5 = [(TUIMenuModel *)&v9 init];
  BOOL v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_title, *((id *)v4 + 2));
    objc_storeStrong((id *)&v6->_imageModel, *((id *)v4 + 3));
    v6->_isInline = *((unsigned char *)v4 + 9);
    objc_storeStrong((id *)&v6->_children, *((id *)v4 + 4));
    v6->_isPrimary = *((unsigned char *)v4 + 8);
    objc_storeStrong(&v6->_actionObject, *((id *)v4 + 5));
    id WeakRetained = objc_loadWeakRetained((id *)v4 + 6);
    objc_storeWeak((id *)&v6->_actionDelegate, WeakRetained);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v5 = a3;
    uint64_t v6 = objc_opt_class();
    v7 = TUIDynamicCast(v6, v5);
  }
  return self == a3;
}

- (id)menuWithIsPrimary:(BOOL)a3 actionObject:(id)a4 actionDelegate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [[TUIMenuModel alloc] initWithOther:self];
  v10->_isPrimary = a3;
  id actionObject = v10->_actionObject;
  v10->_id actionObject = v8;

  objc_storeWeak((id *)&v10->_actionDelegate, v9);

  return v10;
}

- (void)loadImagesFromResourceMap:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    imageModel = self->_imageModel;
    if (imageModel && ![(TUIImageModel *)imageModel isLoaded])
    {
      uint64_t v6 = [(TUIImageModel *)self->_imageModel identifier];
      v7 = [v4 objectForKeyedSubscript:v6];

      if (v7)
      {
        id v8 = self->_imageModel;
        id v9 = objc_alloc_init((Class)UIImage);
        [(TUIImageModel *)v8 loadImageFromResource:v7 placeholderImage:v9];
      }
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = self->_children;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) loadImagesFromResourceMap:v4];
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (id)newUIMenuElementWithActionObject:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self->_children, "count")];
  children = self->_children;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1345D0;
  v19[3] = &unk_2560A8;
  id v20 = v6;
  id v21 = v7;
  id v22 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  [(NSArray *)children enumerateObjectsUsingBlock:v19];
  BOOL isInline = self->_isInline;
  imageModel = self->_imageModel;
  if (self->_title) {
    CFStringRef title = (const __CFString *)self->_title;
  }
  else {
    CFStringRef title = &stru_257BF0;
  }
  long long v16 = [(TUIImageModel *)imageModel image];
  long long v17 = +[UIMenu menuWithTitle:title image:v16 identifier:0 options:isInline children:v10];

  return v17;
}

- (id)newUIMenuElement
{
  id actionObject = self->_actionObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  id v5 = [(TUIMenuModel *)self newUIMenuElementWithActionObject:actionObject delegate:WeakRetained];

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (TUIImageModel)imageModel
{
  return self->_imageModel;
}

- (NSArray)children
{
  return self->_children;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (id)actionObject
{
  return self->_actionObject;
}

- (TUIActionHandlerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (TUIActionHandlerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong(&self->_actionObject, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_imageModel, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end