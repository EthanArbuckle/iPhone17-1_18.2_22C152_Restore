@interface RBStateCaptureItem
- (NSString)identifier;
- (NSString)title;
- (RBStateCaptureItem)initWithTitle:(id)a3 identifier:(id)a4 block:(id)a5;
- (id)block;
- (void)dealloc;
@end

@implementation RBStateCaptureItem

- (RBStateCaptureItem)initWithTitle:(id)a3 identifier:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)RBStateCaptureItem;
  v11 = [(RBStateCaptureItem *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    id block = v11->_block;
    v11->_id block = (id)v16;

    v18 = dispatch_get_global_queue(17, 0);
    uint64_t v19 = _RBLogAddStateCaptureBlockWithTitle(v18, v11->_title, v11->_block);
    invalidatable = v11->_invalidatable;
    v11->_invalidatable = (RBSInvalidatable *)v19;
  }
  return v11;
}

- (void)dealloc
{
  [(RBSInvalidatable *)self->_invalidatable invalidate];
  v3.receiver = self;
  v3.super_class = (Class)RBStateCaptureItem;
  [(RBStateCaptureItem *)&v3 dealloc];
}

- (id)block
{
  return self->_block;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_invalidatable, 0);
}

@end