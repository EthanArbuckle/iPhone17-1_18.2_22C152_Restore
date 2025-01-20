@interface _UIDiffableDataSourceItemRenderer
- (Class)cellClass;
- (NSString)cellReuseIdentifier;
- (_UIDiffableDataSourceItemRenderer)initWithIdentifier:(id)a3 cellClass:(Class)a4 handler:(id)a5;
- (_UIDiffableDataSourceItemRenderer)initWithIdentifier:(id)a3 cellClass:(Class)a4 handler:(id)a5 cellReuseIdentifier:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handler;
- (id)rendererIdentifier;
@end

@implementation _UIDiffableDataSourceItemRenderer

- (_UIDiffableDataSourceItemRenderer)initWithIdentifier:(id)a3 cellClass:(Class)a4 handler:(id)a5 cellReuseIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_UIDiffableDataSourceItemRenderer;
  v14 = [(_UIDiffableDataSourceItemRenderer *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->_rendererIdentifier, a3);
    objc_storeStrong((id *)&v15->_cellClass, a4);
    v16 = _Block_copy(v12);
    id handler = v15->_handler;
    v15->_id handler = v16;

    objc_storeStrong((id *)&v15->_cellReuseIdentifier, a6);
  }

  return v15;
}

- (_UIDiffableDataSourceItemRenderer)initWithIdentifier:(id)a3 cellClass:(Class)a4 handler:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 UUID];
  id v12 = [v11 UUIDString];
  id v13 = [(_UIDiffableDataSourceItemRenderer *)self initWithIdentifier:v10 cellClass:a4 handler:v9 cellReuseIdentifier:v12];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id rendererIdentifier = self->_rendererIdentifier;
  Class cellClass = self->_cellClass;
  v7 = (void *)[self->_handler copy];
  v8 = (void *)[v4 initWithIdentifier:rendererIdentifier cellClass:cellClass handler:v7 cellReuseIdentifier:self->_cellReuseIdentifier];

  return v8;
}

- (id)rendererIdentifier
{
  return self->_rendererIdentifier;
}

- (Class)cellClass
{
  return self->_cellClass;
}

- (NSString)cellReuseIdentifier
{
  return self->_cellReuseIdentifier;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_cellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_cellClass, 0);
  objc_storeStrong(&self->_rendererIdentifier, 0);
}

@end