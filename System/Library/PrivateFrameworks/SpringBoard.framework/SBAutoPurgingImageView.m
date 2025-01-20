@interface SBAutoPurgingImageView
- (SBAutoPurgingImageView)initWithImageGenerationBlock:(id)a3;
- (void)didMoveToWindow;
@end

@implementation SBAutoPurgingImageView

- (SBAutoPurgingImageView)initWithImageGenerationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAutoPurgingImageView;
  v5 = -[SBAutoPurgingImageView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)didMoveToWindow
{
  v3 = [(SBAutoPurgingImageView *)self window];
  if (v3)
  {
    id v4 = (*((void (**)(void))self->_block + 2))();
  }
  else
  {
    id v4 = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)SBAutoPurgingImageView;
  [(SBAutoPurgingImageView *)&v5 setImage:v4];
}

- (void).cxx_destruct
{
}

@end