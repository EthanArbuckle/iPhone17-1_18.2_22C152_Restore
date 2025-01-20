@interface PXStoryPlayButtonConfiguration
- (BOOL)isEqual:(id)a3;
- (PXStoryPlayButtonConfiguration)initWithViewModel:(id)a3;
- (PXStoryPlayButtonSpec)spec;
- (PXStoryViewModel)viewModel;
- (SEL)action;
- (id)copyWithZone:(_NSZone *)a3;
- (id)target;
- (unint64_t)hash;
- (void)setAction:(SEL)a3;
- (void)setSpec:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation PXStoryPlayButtonConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (SEL)action
{
  return self->_action;
}

- (void)setTarget:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setSpec:(id)a3
{
}

- (PXStoryPlayButtonSpec)spec
{
  return self->_spec;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXStoryPlayButtonConfiguration *)a3;
  if (self == v4)
  {
    char v9 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v9 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  v6 = [(PXStoryPlayButtonConfiguration *)self target];
  v7 = [(PXStoryPlayButtonConfiguration *)v5 target];
  if (v6 == v7)
  {
    v8 = [(PXStoryPlayButtonConfiguration *)self action];
    if (v8 == [(PXStoryPlayButtonConfiguration *)v5 action])
    {
      id v11 = [(PXStoryPlayButtonConfiguration *)self spec];
      id v12 = [(PXStoryPlayButtonConfiguration *)v5 spec];
      if (v11 == v12)
      {
      }
      else
      {
        int v13 = [v11 isEqual:v12];

        if (!v13)
        {
          char v9 = 0;
LABEL_18:

          goto LABEL_6;
        }
      }
      v14 = [(PXStoryPlayButtonConfiguration *)self viewModel];
      v15 = [(PXStoryPlayButtonConfiguration *)v5 viewModel];
      if (v14 == v15) {
        char v9 = 1;
      }
      else {
        char v9 = [v14 isEqual:v15];
      }

      goto LABEL_18;
    }
  }
  char v9 = 0;
LABEL_6:

LABEL_9:
  return v9;
}

- (unint64_t)hash
{
  v2 = [(PXStoryPlayButtonConfiguration *)self viewModel];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithViewModel:self->_viewModel];
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_storeWeak((id *)(v4 + 24), WeakRetained);

  *(void *)(v4 + 32) = self->_action;
  objc_storeStrong((id *)(v4 + 16), self->_spec);
  return (id)v4;
}

- (PXStoryPlayButtonConfiguration)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPlayButtonConfiguration;
  v6 = [(PXStoryPlayButtonConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewModel, a3);
  }

  return v7;
}

@end