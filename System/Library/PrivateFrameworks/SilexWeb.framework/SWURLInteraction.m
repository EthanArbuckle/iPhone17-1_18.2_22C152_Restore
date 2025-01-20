@interface SWURLInteraction
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSURL)URL;
- (SWNavigationManager)navigationManager;
- (SWURLInteraction)initWithURL:(id)a3 navigationManager:(id)a4;
- (unint64_t)type;
- (void)perform;
@end

@implementation SWURLInteraction

- (SWURLInteraction)initWithURL:(id)a3 navigationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)SWURLInteraction;
    v8 = [(SWURLInteraction *)&v13 init];
    if (v8)
    {
      uint64_t v9 = [v6 copy];
      URL = v8->_URL;
      v8->_URL = (NSURL *)v9;

      objc_storeStrong((id *)&v8->_navigationManager, a4);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)type
{
  return 2;
}

- (void)perform
{
  id v6 = [(SWURLInteraction *)self navigationManager];
  v3 = (void *)MEMORY[0x263F08BD8];
  v4 = [(SWURLInteraction *)self URL];
  v5 = [v3 requestWithURL:v4];
  [v6 actionForRequest:v5];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SWURLInteraction *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t v5 = [(SWURLInteraction *)self type], v5 == [(SWURLInteraction *)v4 type]))
    {
      id v6 = [(SWURLInteraction *)self URL];
      id v7 = [(SWURLInteraction *)v4 URL];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  if ([(SWURLInteraction *)self type] == 1)
  {
    v3 = @"interactable";
  }
  else if ([(SWURLInteraction *)self type] == 2)
  {
    v3 = @"selectable";
  }
  else
  {
    v3 = @"none";
  }
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  id v6 = [(SWURLInteraction *)self URL];
  id v7 = [v4 stringWithFormat:@"<%@: %p; type: %@; URL: %@>", v5, self, v3, v6];

  return (NSString *)v7;
}

- (NSURL)URL
{
  return self->_URL;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end