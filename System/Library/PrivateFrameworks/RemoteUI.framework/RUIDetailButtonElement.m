@interface RUIDetailButtonElement
- (RUIDetailButtonElement)initWithAttributes:(id)a3 parent:(id)a4;
- (int64_t)visibility;
- (void)setVisibility:(int64_t)a3;
- (void)startActivityIndicator;
- (void)stopActivityIndicator;
@end

@implementation RUIDetailButtonElement

- (RUIDetailButtonElement)initWithAttributes:(id)a3 parent:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)RUIDetailButtonElement;
  v4 = [(RUIElement *)&v14 initWithAttributes:a3 parent:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(RUIElement *)v4 attributes];
    v7 = [v6 objectForKeyedSubscript:@"visibility"];
    char v8 = [v7 isEqualToString:@"editing"];

    if (v8)
    {
      uint64_t v9 = 1;
    }
    else
    {
      v10 = [(RUIElement *)v5 attributes];
      v11 = [v10 objectForKeyedSubscript:@"visibility"];
      int v12 = [v11 isEqualToString:@"notEditing"];

      if (v12) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    [(RUIDetailButtonElement *)v5 setVisibility:v9];
  }
  return v5;
}

- (void)startActivityIndicator
{
  id v2 = [(RUIElement *)self parent];
  [v2 startActivityIndicator];
}

- (void)stopActivityIndicator
{
  id v2 = [(RUIElement *)self parent];
  [v2 stopActivityIndicator];
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

@end