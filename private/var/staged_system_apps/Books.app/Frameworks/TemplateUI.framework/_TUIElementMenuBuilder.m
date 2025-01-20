@interface _TUIElementMenuBuilder
- (BOOL)isInline;
- (NSString)title;
- (TUIImageModel)imageModel;
- (id)finalizeMenuItem;
- (void)addImageModel:(id)a3 forRole:(id)a4;
- (void)addMenuItem:(id)a3;
- (void)addModel:(id)a3;
- (void)addText:(id)a3 forRole:(id)a4;
- (void)finalizeModelsWithParent:(id)a3;
- (void)finalizeModelsWithParent:(id)a3 context:(id)a4;
- (void)setImageModel:(id)a3;
- (void)setIsInline:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation _TUIElementMenuBuilder

- (void)addMenuItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    if (!self->_children)
    {
      v5 = (NSMutableArray *)objc_opt_new();
      children = self->_children;
      self->_children = v5;
    }
    v7 = [[_TUIMenuItemContainer alloc] initWithModel:v8];
    [(NSMutableArray *)self->_children addObject:v7];

    id v4 = v8;
  }
}

- (void)addModel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    children = self->_children;
    id v8 = v4;
    if (!children)
    {
      v6 = (NSMutableArray *)objc_opt_new();
      v7 = self->_children;
      self->_children = v6;

      children = self->_children;
    }
    [(NSMutableArray *)children addObject:v8];
    id v4 = v8;
  }
}

- (id)finalizeMenuItem
{
  if ([(NSMutableArray *)self->_children count]) {
    v3 = [[TUIMenuContainer alloc] initWithTitle:self->_title imageModel:self->_imageModel isInline:self->_isInline];
  }
  else {
    v3 = 0;
  }
  [(TUIMenuContainer *)v3 updateModelChildren:self->_children];

  return v3;
}

- (void)finalizeModelsWithParent:(id)a3 context:(id)a4
{
}

- (void)finalizeModelsWithParent:(id)a3
{
}

- (void)addText:(id)a3 forRole:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v6 || [v6 isEqualToString:@"title"])
  {
    id v8 = (NSString *)[v10 copy];
    title = self->_title;
    self->_title = v8;
  }
}

- (void)addImageModel:(id)a3 forRole:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7 || [v7 isEqualToString:@"image"]) {
    objc_storeStrong((id *)&self->_imageModel, a3);
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (TUIImageModel)imageModel
{
  return self->_imageModel;
}

- (void)setImageModel:(id)a3
{
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (void)setIsInline:(BOOL)a3
{
  self->_isInline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageModel, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end