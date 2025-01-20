@interface UITransformer
- (BOOL)isEqual:(id)a3;
- (NSArray)transforms;
- (id)_initWithTransformer:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation UITransformer

- (id)_initWithTransformer:(id)a3
{
  v4 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)UITransformer;
  v5 = [(UITransform *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4[7] mutableCopy];
    transforms = v5->_transforms;
    v5->_transforms = (NSMutableArray *)v6;

    uint64_t v8 = [v4[8] mutableCopy];
    transformReasonAssociations = v5->_transformReasonAssociations;
    v5->_transformReasonAssociations = (NSMutableArray *)v8;
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = [(NSMutableArray *)self->_transforms firstObject];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NSMutableArray *)self->_transforms hash];
  uint64_t v6 = [(NSMutableArray *)self->_transformReasonAssociations firstObject];
  uint64_t v7 = [v6 hash];
  unint64_t v8 = [(NSMutableArray *)self->_transformReasonAssociations hash] * v7 + v5 * v4 + 3;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UITransformer *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && BSEqualObjects()) {
    char v6 = BSEqualObjects();
  }
  else {
LABEL_6:
  }
    char v6 = 0;
LABEL_8:

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [UIMutableTransformer alloc];
  return [(UITransformer *)v4 _initWithTransformer:self];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UITransformer;
  uint64_t v4 = [(UITransform *)&v12 descriptionBuilderWithMultilinePrefix:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__UITransformer_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v5 = v4;
  id v10 = v5;
  objc_super v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

uint64_t __55__UITransformer_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 64) withName:@"transforms" skipIfEmpty:1];
}

- (NSArray)transforms
{
  return &self->_transforms->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformReasonAssociations, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
}

@end