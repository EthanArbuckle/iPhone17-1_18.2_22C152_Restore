@interface _UIOutlineItemRenderer
- (_UIOutlineItemRenderer)initWithIdentifier:(id)a3 cellClass:(Class)a4 handler:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)willUpdateCellHandler;
- (void)setWillUpdateCellHandler:(id)a3;
@end

@implementation _UIOutlineItemRenderer

- (_UIOutlineItemRenderer)initWithIdentifier:(id)a3 cellClass:(Class)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UIOutlineItemRenderer_initWithIdentifier_cellClass_handler___block_invoke;
  aBlock[3] = &unk_1E5311B28;
  objc_copyWeak(&v19, &location);
  id v10 = v9;
  id v18 = v10;
  v11 = _Block_copy(aBlock);
  v12 = [MEMORY[0x1E4F29128] UUID];
  v13 = [v12 UUIDString];
  v16.receiver = self;
  v16.super_class = (Class)_UIOutlineItemRenderer;
  v14 = [(_UIDiffableDataSourceItemRenderer *)&v16 initWithIdentifier:v8 cellClass:a4 handler:v11 cellReuseIdentifier:v13];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(_UIDiffableDataSourceItemRenderer *)self rendererIdentifier];
  v6 = [(_UIDiffableDataSourceItemRenderer *)self cellClass];
  v7 = [(_UIDiffableDataSourceItemRenderer *)self handler];
  id v8 = (void *)[v7 copy];
  id v9 = (void *)[v4 initWithIdentifier:v5 cellClass:v6 handler:v8];

  return v9;
}

- (id)willUpdateCellHandler
{
  return self->_willUpdateCellHandler;
}

- (void)setWillUpdateCellHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end