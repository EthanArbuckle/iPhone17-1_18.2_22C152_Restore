@interface SWURLAction
- (BOOL)canHandle;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSURL)URL;
- (SWNavigationManager)navigationManager;
- (SWURLAction)initWithURL:(id)a3 navigationManager:(id)a4;
- (unint64_t)type;
- (void)perform;
@end

@implementation SWURLAction

- (SWURLAction)initWithURL:(id)a3 navigationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)SWURLAction;
    v8 = [(SWURLAction *)&v13 init];
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
  return 1;
}

- (BOOL)canHandle
{
  return 1;
}

- (void)perform
{
  id v6 = [(SWURLAction *)self navigationManager];
  v3 = (void *)MEMORY[0x263F08BD8];
  v4 = [(SWURLAction *)self URL];
  v5 = [v3 requestWithURL:v4];
  [v6 actionForRequest:v5];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SWURLAction *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t v5 = [(SWURLAction *)self type], v5 == [(SWURLAction *)v4 type]))
    {
      id v6 = [(SWURLAction *)self URL];
      id v7 = [(SWURLAction *)v4 URL];
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
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(SWURLAction *)self URL];
  id v6 = [v3 stringWithFormat:@"<%@: %p; type: %@; URL: %@>", v4, self, @"URL", v5];

  return (NSString *)v6;
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