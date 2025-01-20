@interface SUUIBackgroundImageWrapperForHorizontalLockup
- (SUUIBackgroundImageWrapperForHorizontalLockup)initWithImage:(id)a3;
- (SUUIHorizontalLockupView)lockup;
- (SUUIImageView)imageView;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLockup:(id)a3;
@end

@implementation SUUIBackgroundImageWrapperForHorizontalLockup

- (SUUIBackgroundImageWrapperForHorizontalLockup)initWithImage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIBackgroundImageWrapperForHorizontalLockup;
  v5 = [(SUUIBackgroundImageWrapperForHorizontalLockup *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_imageView, v4);
  }

  return v6;
}

- (void)setImage:(id)a3
{
  id v8 = a3;
  id v4 = [(SUUIBackgroundImageWrapperForHorizontalLockup *)self imageView];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
    [WeakRetained setImage:v8];
  }
  v6 = [(SUUIBackgroundImageWrapperForHorizontalLockup *)self lockup];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_lockup);
    [v7 setContainerBackgroundImageForPlayButton:v8];
  }
}

- (void)setLockup:(id)a3
{
  id obj = a3;
  p_lockup = &self->_lockup;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockup);

  id v7 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_lockup, obj);
    p_imageView = &self->_imageView;
    id v6 = objc_loadWeakRetained((id *)p_imageView);
    id v7 = obj;
    if (v6)
    {
      v9 = v6;
      id v10 = objc_loadWeakRetained((id *)p_imageView);
      v11 = [v10 image];

      id v7 = obj;
      if (v11)
      {
        id v12 = objc_loadWeakRetained((id *)p_lockup);
        id v13 = objc_loadWeakRetained((id *)p_imageView);
        v14 = [v13 image];
        [v12 setContainerBackgroundImageForPlayButton:v14];

        id v7 = obj;
      }
    }
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (SUUIHorizontalLockupView)lockup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockup);
  return (SUUIHorizontalLockupView *)WeakRetained;
}

- (SUUIImageView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  return (SUUIImageView *)WeakRetained;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_lockup);
}

@end