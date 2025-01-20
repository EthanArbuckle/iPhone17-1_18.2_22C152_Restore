@interface PXProgrammaticNavigationRequest
- (PXProgrammaticNavigationDestination)destination;
- (PXProgrammaticNavigationRequest)init;
- (PXProgrammaticNavigationRequest)initWithDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (id)description;
- (unint64_t)options;
- (void)cancel;
@end

@implementation PXProgrammaticNavigationRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (PXProgrammaticNavigationRequest)initWithDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXProgrammaticNavigationRequest;
  v11 = [(PXProgrammaticNavigationRequest *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_destination, a3);
    v12->_options = a4;
    if (v10) {
      v13 = v10;
    }
    else {
      v13 = &__block_literal_global_284856;
    }
    uint64_t v14 = [v13 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = (id)v14;
  }
  return v12;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (unint64_t)options
{
  return self->_options;
}

- (PXProgrammaticNavigationDestination)destination
{
  return self->_destination;
}

- (void)cancel
{
  v2 = [(PXProgrammaticNavigationRequest *)self completionHandler];
  v2[2](v2, 4, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PXProgrammaticNavigationRequest *)self destination];
  v7 = [v3 stringWithFormat:@"<%@: %p, destination=%@>", v5, self, v6];

  return v7;
}

- (PXProgrammaticNavigationRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXProgrammaticNavigationRequest.m", 17, @"%s is not available as initializer", "-[PXProgrammaticNavigationRequest init]");

  abort();
}

@end