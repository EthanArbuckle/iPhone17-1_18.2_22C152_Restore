@interface SBHCalendarApplicationIcon
+ (BOOL)canGenerateIconsInBackground;
- (BOOL)canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (SBCalendarIconImageProvider)imageProvider;
- (SBHCalendarApplicationIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4;
- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3;
- (id)makeIconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3;
- (void)dealloc;
- (void)localeChanged;
@end

@implementation SBHCalendarApplicationIcon

- (SBHCalendarApplicationIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBHCalendarApplicationIcon;
  v4 = [(SBLeafIcon *)&v9 initWithLeafIdentifier:a3 applicationBundleID:a4];
  if (v4)
  {
    v5 = objc_alloc_init(SBCalendarIconImageProvider);
    imageProvider = v4->_imageProvider;
    v4->_imageProvider = v5;

    [(SBCalendarIconImageProvider *)v4->_imageProvider setDelegate:v4];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v4 selector:sel__boldTextStatusDidChange_ name:*MEMORY[0x1E4FB2420] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBHCalendarApplicationIcon;
  [(SBLeafIcon *)&v4 dealloc];
}

- (void)localeChanged
{
  [(SBIcon *)self reloadIconImage];
  v3.receiver = self;
  v3.super_class = (Class)SBHCalendarApplicationIcon;
  [(SBIcon *)&v3 localeChanged];
}

+ (BOOL)canGenerateIconsInBackground
{
  return 0;
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  v11 = [(SBHCalendarApplicationIcon *)self imageProvider];
  v12 = objc_msgSend(v11, "iconImageWithInfo:", v10, v9, v8, v7);

  return v12;
}

- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  v11 = [(SBHCalendarApplicationIcon *)self imageProvider];
  v12 = objc_msgSend(v11, "unmaskedIconImageWithInfo:", v10, v9, v8, v7);

  return v12;
}

- (id)makeIconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  v15 = a3;
  v16 = [(SBHCalendarApplicationIcon *)self imageProvider];
  v17 = objc_msgSend(v16, "iconImageWithInfo:traitCollection:options:", v15, a4, v13, v12, v11, v10);

  return v17;
}

- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  v15 = a3;
  v16 = [(SBHCalendarApplicationIcon *)self imageProvider];
  v17 = objc_msgSend(v16, "iconImageWithInfo:traitCollection:options:", v15, a4, v13, v12, v11, v10);

  [v17 size];
  double v19 = v18;
  double v21 = v20;
  id v22 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  objc_msgSend(v22, "setBounds:", 0.0, 0.0, v19, v21);
  id v23 = v17;
  objc_msgSend(v22, "setContents:", objc_msgSend(v23, "CGImage"));

  return v22;
}

- (BOOL)canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  return 1;
}

- (SBCalendarIconImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void).cxx_destruct
{
}

@end