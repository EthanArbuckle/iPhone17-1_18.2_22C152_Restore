@interface _NTKKeylineImageView
- (NTKKeylineTouchable)touchable;
- (id)colorizationBlock;
- (void)setColor:(id)a3;
- (void)setColorizationBlock:(id)a3;
- (void)setTouchable:(id)a3;
@end

@implementation _NTKKeylineImageView

- (void)setColor:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_NTKKeylineImageView;
  [(CLKUIColoringImageView *)&v6 setColor:v4];
  colorizationBlock = (void (**)(id, id))self->_colorizationBlock;
  if (colorizationBlock) {
    colorizationBlock[2](colorizationBlock, v4);
  }
}

- (NTKKeylineTouchable)touchable
{
  return self->touchable;
}

- (void)setTouchable:(id)a3
{
}

- (id)colorizationBlock
{
  return self->_colorizationBlock;
}

- (void)setColorizationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_colorizationBlock, 0);

  objc_storeStrong((id *)&self->touchable, 0);
}

@end