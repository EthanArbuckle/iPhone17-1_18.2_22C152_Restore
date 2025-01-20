@interface VKBlockUIActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)title;
- (NSString)type;
- (UIImage)image;
- (VKBlockUIActivity)init;
- (VKBlockUIActivity)initWithBlock:(id)a3;
- (VKBlockUIActivity)initWithTitle:(id)a3 block:(id)a4;
- (VKBlockUIActivity)initWithTitle:(id)a3 image:(id)a4 activityType:(id)a5 block:(id)a6;
- (VKBlockUIActivity)initWithTitle:(id)a3 image:(id)a4 block:(id)a5;
- (VKBlockUIActivity)initWithTitle:(id)a3 systemImageName:(id)a4 activityType:(id)a5 block:(id)a6;
- (VKBlockUIActivity)initWithTitle:(id)a3 systemImageName:(id)a4 block:(id)a5;
- (id)activityType;
- (id)block;
- (int64_t)activityCategory;
- (void)performActivity;
- (void)setBlock:(id)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation VKBlockUIActivity

- (VKBlockUIActivity)init
{
  return [(VKBlockUIActivity *)self initWithBlock:&__block_literal_global_34];
}

- (VKBlockUIActivity)initWithBlock:(id)a3
{
  return [(VKBlockUIActivity *)self initWithTitle:0 block:a3];
}

- (VKBlockUIActivity)initWithTitle:(id)a3 block:(id)a4
{
  return [(VKBlockUIActivity *)self initWithTitle:a3 image:0 activityType:0 block:a4];
}

- (VKBlockUIActivity)initWithTitle:(id)a3 image:(id)a4 block:(id)a5
{
  return [(VKBlockUIActivity *)self initWithTitle:a3 image:a4 activityType:0 block:a5];
}

- (VKBlockUIActivity)initWithTitle:(id)a3 systemImageName:(id)a4 block:(id)a5
{
  return [(VKBlockUIActivity *)self initWithTitle:a3 systemImageName:a4 activityType:0 block:a5];
}

- (VKBlockUIActivity)initWithTitle:(id)a3 image:(id)a4 activityType:(id)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)VKBlockUIActivity;
  v15 = [(UIActivity *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    uint64_t v17 = MEMORY[0x1E018E600](v14);
    id block = v16->_block;
    v16->_id block = (id)v17;

    objc_storeStrong((id *)&v16->_type, a5);
    objc_storeStrong((id *)&v16->_image, a4);
  }

  return v16;
}

- (VKBlockUIActivity)initWithTitle:(id)a3 systemImageName:(id)a4 activityType:(id)a5 block:(id)a6
{
  v10 = (void *)MEMORY[0x1E4F42A80];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v10 systemImageNamed:a4];
  v15 = [(VKBlockUIActivity *)self initWithTitle:v13 image:v14 activityType:v12 block:v11];

  return v15;
}

- (id)activityType
{
  v3 = [(VKBlockUIActivity *)self type];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = NSString;
    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = [(VKBlockUIActivity *)self title];
    id v5 = [v6 stringWithFormat:@"%@.%@", v7, v8];
  }
  return v5;
}

- (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  v3 = [(VKBlockUIActivity *)self block];

  if (v3)
  {
    v4 = [(VKBlockUIActivity *)self block];
    v4[2]();
  }
  [(UIActivity *)self activityDidFinish:1];
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_block, 0);
}

@end