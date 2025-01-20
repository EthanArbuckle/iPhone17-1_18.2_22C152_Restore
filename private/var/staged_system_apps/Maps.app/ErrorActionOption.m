@interface ErrorActionOption
- (BOOL)cancels;
- (ErrorActionOption)initWithTitle:(id)a3 cancels:(BOOL)a4 handler:(id)a5;
- (NSString)title;
- (id)handler;
@end

@implementation ErrorActionOption

- (ErrorActionOption)initWithTitle:(id)a3 cancels:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ErrorActionOption;
  v10 = [(ErrorActionOption *)&v16 init];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    title = v10->_title;
    v10->_title = v11;

    v10->_cancels = a4;
    id v13 = [v9 copy];
    id handler = v10->_handler;
    v10->_id handler = v13;
  }
  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)cancels
{
  return self->_cancels;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end