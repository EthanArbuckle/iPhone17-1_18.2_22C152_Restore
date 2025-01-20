@interface VKImageAnalysisBarButtonItem
+ (id)analysisButtonWithTarget:(id)a3 action:(SEL)a4 mode:(unint64_t)a5;
+ (id)imageForMode:(unint64_t)a3;
- (unint64_t)mode;
- (void)setMode:(unint64_t)a3;
@end

@implementation VKImageAnalysisBarButtonItem

+ (id)analysisButtonWithTarget:(id)a3 action:(SEL)a4 mode:(unint64_t)a5
{
  id v7 = a3;
  v8 = objc_alloc_init(VKImageAnalysisBarButtonItem);
  [(VKSelectableBarButtonItem *)v8 setTarget:v7];

  [(VKSelectableBarButtonItem *)v8 setAction:a4];
  v9 = [(id)objc_opt_class() imageForMode:a5];
  [(VKSelectableBarButtonItem *)v8 setImage:v9];

  v8->_mode = a5;
  [(VKSelectableBarButtonItem *)v8 setCornerRadiusRatio:0.25];
  return v8;
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    id v4 = [(id)objc_opt_class() imageForMode:a3];
    [(VKSelectableBarButtonItem *)self setImage:v4];
  }
}

+ (id)imageForMode:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      v3 = (void *)MEMORY[0x1E4F42A80];
      id v4 = [MEMORY[0x1E4F42A98] configurationWithScale:0];
      v5 = @"appclip";
      goto LABEL_7;
    case 1uLL:
      v3 = (void *)MEMORY[0x1E4F42A80];
      id v4 = [MEMORY[0x1E4F42A98] configurationWithScale:0];
      v5 = @"qrcode.viewfinder";
      goto LABEL_7;
    case 0uLL:
      v3 = (void *)MEMORY[0x1E4F42A80];
      id v4 = objc_msgSend(MEMORY[0x1E4F42A98], "configurationWithScale:");
      v5 = @"text.viewfinder";
LABEL_7:
      v6 = [v3 systemImageNamed:v5 withConfiguration:v4];

      goto LABEL_9;
  }
  v6 = 0;
LABEL_9:
  return v6;
}

- (unint64_t)mode
{
  return self->_mode;
}

@end