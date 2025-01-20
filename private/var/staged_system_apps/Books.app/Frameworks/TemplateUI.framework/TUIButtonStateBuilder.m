@interface TUIButtonStateBuilder
- (id)finalizeButtonStateModelWithContext:(id)a3;
- (void)addAttributedString:(id)a3 forRole:(id)a4;
- (void)addContentModel:(id)a3;
- (void)addImageModel:(id)a3 forRole:(id)a4;
@end

@implementation TUIButtonStateBuilder

- (void)addAttributedString:(id)a3 forRole:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v6 || [v6 isEqualToString:@"title"])
  {
    v8 = (NSAttributedString *)[v10 copy];
    title = self->_title;
    self->_title = v8;
  }
}

- (void)addImageModel:(id)a3 forRole:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v6 || [v6 isEqualToString:@"image"])
  {
    v8 = [v10 image];
    image = self->_image;
    self->_image = v8;
  }
}

- (void)addContentModel:(id)a3
{
}

- (id)finalizeButtonStateModelWithContext:(id)a3
{
  id v4 = a3;
  if (*(_OWORD *)&self->_title == 0 && !self->_contentModel)
  {
    v5 = 0;
  }
  else
  {
    v5 = [[TUIButtonStateModel alloc] initWithTitle:self->_title image:self->_image];
    if (self->_contentModel)
    {
      contentModel = self->_contentModel;
      id v6 = +[NSArray arrayWithObjects:&contentModel count:1];
      [(TUIButtonStateModel *)v5 updateModelChildren:v6];
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModel, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end