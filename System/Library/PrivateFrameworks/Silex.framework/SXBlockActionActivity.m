@interface SXBlockActionActivity
- (NSString)label;
- (SXBlockActionActivity)initWithLabel:(id)a3 image:(id)a4 type:(unint64_t)a5 block:(id)a6;
- (SXBlockActionActivity)initWithLabel:(id)a3 type:(unint64_t)a4 block:(id)a5;
- (SXBlockActionActivity)initWithLabel:(id)a3 type:(unint64_t)a4 immediateBlock:(id)a5 userSelectedBlock:(id)a6;
- (UIImage)image;
- (id)genericBlock;
- (id)immediateBlock;
- (id)userSelectedBlock;
- (unint64_t)type;
- (void)invokeWithAction:(id)a3 invocationMethod:(unint64_t)a4;
@end

@implementation SXBlockActionActivity

- (SXBlockActionActivity)initWithLabel:(id)a3 type:(unint64_t)a4 block:(id)a5
{
  return [(SXBlockActionActivity *)self initWithLabel:a3 image:0 type:a4 block:a5];
}

- (SXBlockActionActivity)initWithLabel:(id)a3 image:(id)a4 type:(unint64_t)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SXBlockActionActivity;
  v13 = [(SXBlockActionActivity *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    label = v13->_label;
    v13->_label = (NSString *)v14;

    objc_storeStrong((id *)&v13->_image, a4);
    v13->_type = a5;
    uint64_t v16 = [v12 copy];
    id genericBlock = v13->_genericBlock;
    v13->_id genericBlock = (id)v16;
  }
  return v13;
}

- (SXBlockActionActivity)initWithLabel:(id)a3 type:(unint64_t)a4 immediateBlock:(id)a5 userSelectedBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SXBlockActionActivity;
  v13 = [(SXBlockActionActivity *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    label = v13->_label;
    v13->_label = (NSString *)v14;

    v13->_type = a4;
    uint64_t v16 = MEMORY[0x223CA5030](v11);
    id immediateBlock = v13->_immediateBlock;
    v13->_id immediateBlock = (id)v16;

    uint64_t v18 = MEMORY[0x223CA5030](v12);
    id userSelectedBlock = v13->_userSelectedBlock;
    v13->_id userSelectedBlock = (id)v18;
  }
  return v13;
}

- (void)invokeWithAction:(id)a3 invocationMethod:(unint64_t)a4
{
  id v12 = a3;
  v6 = [(SXBlockActionActivity *)self genericBlock];

  if (v6)
  {
    uint64_t v7 = [(SXBlockActionActivity *)self genericBlock];
LABEL_3:
    v8 = (void *)v7;
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v12);

    goto LABEL_4;
  }
  uint64_t v9 = [(SXBlockActionActivity *)self userSelectedBlock];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [(SXBlockActionActivity *)self immediateBlock];

    if (v11)
    {
      if (a4 == 1)
      {
        uint64_t v7 = [(SXBlockActionActivity *)self userSelectedBlock];
        goto LABEL_3;
      }
      if (!a4)
      {
        uint64_t v7 = [(SXBlockActionActivity *)self immediateBlock];
        goto LABEL_3;
      }
    }
  }
LABEL_4:
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)type
{
  return self->_type;
}

- (UIImage)image
{
  return self->_image;
}

- (id)genericBlock
{
  return self->_genericBlock;
}

- (id)immediateBlock
{
  return self->_immediateBlock;
}

- (id)userSelectedBlock
{
  return self->_userSelectedBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userSelectedBlock, 0);
  objc_storeStrong(&self->_immediateBlock, 0);
  objc_storeStrong(&self->_genericBlock, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end