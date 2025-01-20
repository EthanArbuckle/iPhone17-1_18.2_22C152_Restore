@interface PUILocationServicesAuthLevelCell
- (BOOL)canReload;
- (PUILocationServicesAuthLevelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (PUILocationUsageMixin)location;
- (id)getLazyIcon;
- (id)getLazyIconID;
- (unint64_t)authLevel;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PUILocationServicesAuthLevelCell

- (PUILocationServicesAuthLevelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)PUILocationServicesAuthLevelCell;
  v5 = [(PSTableCell *)&v14 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = objc_alloc_init(PUILocationUsageMixin);
    location = v5->_location;
    v5->_location = v6;

    v8 = [(PUILocationServicesAuthLevelCell *)v5 detailTextLabel];
    v9 = [MEMORY[0x1E4FB1618] lightGrayColor];
    [v8 setTextColor:v9];

    v10 = [(PUILocationUsageMixin *)v5->_location authLevelString];
    [v8 setText:v10];

    v11 = [(PUILocationServicesAuthLevelCell *)v5 contentView];
    v12 = [(PUILocationUsageMixin *)v5->_location usageIndicator];
    [v11 addSubview:v12];
  }
  return v5;
}

- (void)layoutSubviews
{
  v70.receiver = self;
  v70.super_class = (Class)PUILocationServicesAuthLevelCell;
  [(PSTableCell *)&v70 layoutSubviews];
  v3 = [(PUILocationServicesAuthLevelCell *)self detailTextLabel];
  v4 = [(PUILocationUsageMixin *)self->_location authLevelString];
  if (v4) {
    [v3 setText:v4];
  }
  v5 = [(PUILocationUsageMixin *)self->_location usageIndicator];
  if (([v5 isHidden] & 1) == 0)
  {
    [v3 frame];
    double v7 = v6;
    double v9 = v8;
    v10 = [(PUILocationServicesAuthLevelCell *)self traitCollection];
    v11 = [v10 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

    if (IsAccessibilityCategory)
    {
      [v3 frame];
      double v14 = v13;
      double v68 = v15;
      double v17 = v16;
      double v19 = v18;
      char v20 = [(PUILocationServicesAuthLevelCell *)self _shouldReverseLayoutDirection];
      [v5 frame];
      double v22 = v21;
      double v24 = v23;
      [v3 frame];
      double Height = CGRectGetHeight(v71);
      [v5 frame];
      double v26 = v9 + (Height - CGRectGetHeight(v72)) * 0.5;
      if (v20)
      {
        [v3 frame];
        double Width = CGRectGetWidth(v73);
        [v5 frame];
        objc_msgSend(v5, "setFrame:", v7 + Width - CGRectGetWidth(v74), v26, v22, v24);
        [v5 frame];
        double v28 = v14 - (CGRectGetWidth(v75) + 6.0);
      }
      else
      {
        objc_msgSend(v5, "setFrame:", v7, v26, v22, v24);
        [v5 frame];
        double v28 = v14 + CGRectGetWidth(v81) + 6.0;
      }
      objc_msgSend(v3, "setFrame:", v28, v68, v17, v19);
      v49 = [v3 text];
      uint64_t v50 = [v49 length];

      if (!v50)
      {
        double v51 = 6.0;
        if (([(PUILocationServicesAuthLevelCell *)self _shouldReverseLayoutDirection] & 1) == 0)
        {
          v52 = [(PUILocationServicesAuthLevelCell *)self contentView];
          [v52 bounds];
          CGFloat v53 = CGRectGetWidth(v82) + -6.0;
          [v5 frame];
          double v51 = v53 - CGRectGetWidth(v83);
        }
        objc_msgSend(v5, "setFrame:", v51, v26, v22, v24);
      }
      goto LABEL_19;
    }
    v29 = [(PUILocationServicesAuthLevelCell *)self textLabel];
    [v29 frame];
    double v69 = v30;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    char v37 = [(PUILocationServicesAuthLevelCell *)self _shouldReverseLayoutDirection];
    [v5 frame];
    double v39 = v38;
    double v41 = v40;
    [v3 frame];
    double v42 = CGRectGetHeight(v76);
    [v5 frame];
    double v43 = v9 + (v42 - CGRectGetHeight(v77)) * 0.5;
    if (v37)
    {
      [v3 frame];
      CGFloat v44 = v7 + CGRectGetWidth(v78) + 6.0;
      objc_msgSend(v5, "setFrame:", v44, v43, v39, v41);
      v79.origin.x = v44;
      v79.origin.y = v43;
      v79.size.width = v39;
      v79.size.height = v41;
      double MaxX = CGRectGetMaxX(v79);
      v80.origin.x = v69;
      v80.origin.y = v32;
      v80.size.width = v34;
      v80.size.height = v36;
      double MinX = CGRectGetMinX(v80);
      if (MinX + -6.0 < MaxX)
      {
        double v47 = MaxX - MinX + 6.0;
        double v48 = v69 + v47;
LABEL_17:
        objc_msgSend(v29, "setFrame:", v48, v32, v34 - v47, v36);
      }
    }
    else
    {
      [v5 frame];
      CGFloat v54 = v7 - (CGRectGetWidth(v84) + 6.0);
      objc_msgSend(v5, "setFrame:", v54, v43, v39, v41);
      v85.origin.x = v54;
      v85.origin.y = v43;
      v85.size.width = v39;
      v85.size.height = v41;
      double v55 = CGRectGetMinX(v85);
      double v48 = v69;
      v86.origin.x = v69;
      v86.origin.y = v32;
      v86.size.width = v34;
      v86.size.height = v36;
      double v56 = CGRectGetMaxX(v86);
      if (v56 + 6.0 > v55)
      {
        double v47 = v56 - v55 + 6.0;
        goto LABEL_17;
      }
    }

LABEL_19:
    v57 = [v3 text];
    uint64_t v58 = [v57 length];

    if (!v58)
    {
      [v5 frame];
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      v65 = [(PUILocationServicesAuthLevelCell *)self contentView];
      [v65 bounds];
      double v66 = CGRectGetHeight(v87);
      [v5 bounds];
      double v67 = (v66 - CGRectGetHeight(v88)) * 0.5;

      objc_msgSend(v5, "setFrame:", v60, v67, v62, v64);
    }
  }
}

- (BOOL)canReload
{
  return 1;
}

- (id)getLazyIconID
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F70];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    if (!self->_isWebApp) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  v4 = [(PSTableCell *)self specifier];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F931A0]];
  if (!v5)
  {

    goto LABEL_8;
  }
  BOOL isWebApp = self->_isWebApp;

  if (isWebApp)
  {
LABEL_8:
    if (self->_isWebApp) {
      [MEMORY[0x1E4FB1F10] webClipIdentifierFromBundleIdentifier:*(Class *)((char *)&self->super.super.super.super.super.isa + v3)];
    }
    else {
    double v7 = [(NSURL *)self->_bundleURL absoluteString];
    }
    goto LABEL_12;
  }
LABEL_6:
  v9.receiver = self;
  v9.super_class = (Class)PUILocationServicesAuthLevelCell;
  double v7 = [(PSTableCell *)&v9 getLazyIconID];
LABEL_12:
  return v7;
}

- (id)getLazyIcon
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F70];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    if (!self->_isWebApp) {
      goto LABEL_6;
    }
  }
  else
  {
    v4 = [(PSTableCell *)self specifier];
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F931A0]];
    if (v5)
    {
      BOOL isWebApp = self->_isWebApp;

      if (!isWebApp)
      {
LABEL_6:
        v20.receiver = self;
        v20.super_class = (Class)PUILocationServicesAuthLevelCell;
        double v7 = [(PSTableCell *)&v20 getLazyIcon];
        goto LABEL_25;
      }
    }
    else
    {
    }
  }
  if (getLazyIcon_onceToken != -1) {
    dispatch_once(&getLazyIcon_onceToken, &__block_literal_global_214);
  }
  if (self->_isWebApp)
  {
    double v8 = [MEMORY[0x1E4FB1F10] webClipIdentifierFromBundleIdentifier:*(Class *)((char *)&self->super.super.super.super.super.isa + v3)];
    objc_super v9 = [MEMORY[0x1E4FB1F10] webClipWithIdentifier:v8];
    double v7 = [v9 generateIconImageForFormat:0 scale:*(double *)&getLazyIcon_screenScale];

    if (!v7)
    {
      v19.receiver = self;
      v19.super_class = (Class)PUILocationServicesAuthLevelCell;
      double v7 = [(PSTableCell *)&v19 getLazyIcon];
    }
  }
  else
  {
    v10 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFURLRef)self->_bundleURL);
    if (v10)
    {
      v11 = v10;
      double v18 = *(double *)&getLazyIcon_screenScale;
      CFStringRef Identifier = CFBundleGetIdentifier(v10);
      if (CFEqual(Identifier, @"com.apple.weather-framework"))
      {
        double v13 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/Weather.framework"];
        double v7 = [MEMORY[0x1E4FB1818] imageNamed:@"IconMasked-table" inBundle:v13];
      }
      else
      {
        [MEMORY[0x1E4FB1818] _iconVariantForUIApplicationIconFormat:0 scale:&v18];
        uint64_t v14 = LICreateIconForBundle();
        if (v14)
        {
          double v15 = (const void *)v14;
          double v16 = CFBundleGetIdentifier(v11);
          if ([v16 isEqualToString:@"com.apple.AssistantServices"]) {
            PSSiriImage();
          }
          else {
          double v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:v15 scale:0 orientation:v18];
          }
          CFRelease(v15);
        }
        else
        {
          double v7 = 0;
        }
      }
      CFRelease(v11);
    }
    else
    {
      double v7 = 0;
    }
  }
LABEL_25:
  return v7;
}

void __47__PUILocationServicesAuthLevelCell_getLazyIcon__block_invoke()
{
  id v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v1 scale];
  getLazyIcon_screenScale = v0;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:@"_BundleUrl_"];
  bundleURL = self->_bundleURL;
  self->_bundleURL = v5;

  v7.receiver = self;
  v7.super_class = (Class)PUILocationServicesAuthLevelCell;
  [(PSTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
}

- (PUILocationUsageMixin)location
{
  return self->_location;
}

- (unint64_t)authLevel
{
  return self->_authLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end