@interface PXBlockActionConfiguration
- (BOOL)isDestructive;
- (BOOL)isSelected;
- (NSString)actionName;
- (PXBlockActionConfiguration)init;
- (PXBlockActionConfiguration)initWithBlock:(id)a3;
- (UIImage)image;
- (id)actionBlock;
- (id)canPerformBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)menuElementConstructor;
- (void)setActionBlock:(id)a3;
- (void)setActionName:(id)a3;
- (void)setCanPerformBlock:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setMenuElementConstructor:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PXBlockActionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuElementConstructor, 0);
  objc_storeStrong(&self->_canPerformBlock, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

- (void)setMenuElementConstructor:(id)a3
{
}

- (id)menuElementConstructor
{
  return self->_menuElementConstructor;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setCanPerformBlock:(id)a3
{
}

- (id)canPerformBlock
{
  return self->_canPerformBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setActionName:(id)a3
{
}

- (NSString)actionName
{
  return self->_actionName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PXBlockActionConfiguration alloc];
  v5 = [(PXBlockActionConfiguration *)self actionBlock];
  v6 = [(PXBlockActionConfiguration *)v4 initWithBlock:v5];

  v7 = [(PXBlockActionConfiguration *)self actionName];
  [(PXBlockActionConfiguration *)v6 setActionName:v7];

  v8 = [(PXBlockActionConfiguration *)self image];
  [(PXBlockActionConfiguration *)v6 setImage:v8];

  v9 = [(PXBlockActionConfiguration *)self canPerformBlock];
  [(PXBlockActionConfiguration *)v6 setCanPerformBlock:v9];

  [(PXBlockActionConfiguration *)v6 setDestructive:[(PXBlockActionConfiguration *)self isDestructive]];
  [(PXBlockActionConfiguration *)v6 setSelected:[(PXBlockActionConfiguration *)self isSelected]];
  v10 = [(PXBlockActionConfiguration *)self menuElementConstructor];
  [(PXBlockActionConfiguration *)v6 setMenuElementConstructor:v10];

  return v6;
}

- (PXBlockActionConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXBlockActionConfiguration.m", 23, @"%s is not available as initializer", "-[PXBlockActionConfiguration init]");

  abort();
}

- (PXBlockActionConfiguration)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXBlockActionConfiguration;
  v5 = [(PXBlockActionConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id actionBlock = v5->_actionBlock;
    v5->_id actionBlock = (id)v6;
  }
  return v5;
}

@end