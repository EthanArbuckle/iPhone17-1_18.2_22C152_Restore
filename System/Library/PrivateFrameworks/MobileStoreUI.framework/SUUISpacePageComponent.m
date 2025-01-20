@interface SUUISpacePageComponent
- (SUUISpacePageComponent)initWithCustomPageContext:(id)a3;
- (double)height;
- (int64_t)componentType;
@end

@implementation SUUISpacePageComponent

- (SUUISpacePageComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUISpacePageComponent;
  v5 = [(SUUIPageComponent *)&v12 initWithCustomPageContext:v4];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"size"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = SUUISpacePageComponentHeightForString(v7);
    }
    else
    {
      char v9 = objc_opt_respondsToSelector();
      double v8 = 7.0;
      if (v9)
      {
        objc_msgSend(v7, "floatValue", 7.0);
        double v8 = v10;
      }
    }
    v5->_height = v8;
  }
  return v5;
}

- (int64_t)componentType
{
  return 14;
}

- (double)height
{
  return self->_height;
}

@end