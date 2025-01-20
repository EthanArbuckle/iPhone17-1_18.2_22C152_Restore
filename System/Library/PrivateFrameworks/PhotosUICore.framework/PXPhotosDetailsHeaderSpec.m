@interface PXPhotosDetailsHeaderSpec
- (CGSize)playButtonSize;
- (PXPhotosDetailsHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (double)defaultCornerRadius;
- (id)createViewSpecWithDescriptor:(PXViewSpecDescriptor *)a3;
- (unint64_t)contentInsetEdges;
@end

@implementation PXPhotosDetailsHeaderSpec

- (unint64_t)contentInsetEdges
{
  return self->_contentInsetEdges;
}

- (double)defaultCornerRadius
{
  return self->_defaultCornerRadius;
}

- (CGSize)playButtonSize
{
  objc_msgSend(MEMORY[0x1E4FB1EB0], "px_videoOverlayButtonSize");
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(PXFeatureSpec *)self userInterfaceIdiom];
  double v8 = 28.0;
  if (v7 == 3) {
    double v9 = v4;
  }
  else {
    double v9 = 28.0;
  }
  if (v7 == 3) {
    double v8 = v6;
  }
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)createViewSpecWithDescriptor:(PXViewSpecDescriptor *)a3
{
  switch(a3->var0)
  {
    case 0xFA0:
      a3->var0 = 1964;
      v23.receiver = self;
      v23.super_class = (Class)PXPhotosDetailsHeaderSpec;
      CGSize var2 = a3->var2;
      long long v21 = *(_OWORD *)&a3->var0;
      CGSize v22 = var2;
      double v5 = [(PXFeatureSpec *)&v23 createViewSpecWithDescriptor:&v21];
      if ([(PXFeatureSpec *)self userInterfaceIdiom] == 5)
      {
        id v6 = v5;
        int64_t v7 = [v6 titleLabelSpec];
        double v8 = [v6 subtitleLabelSpec];
        double v9 = [v7 textAttributes];
        v10 = (void *)[v9 mutableCopy];

        [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28E8] addingSymbolicTraits:66 options:0];
        [MEMORY[0x1E4FB08E0] fontWithDescriptor:objc_claimAutoreleasedReturnValue() size:36.0];
        [v10 setObject:objc_claimAutoreleasedReturnValue() forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
        [v7 setTextAttributes:v10];
        id v11 = objc_alloc_init(MEMORY[0x1E4FB0848]);
        [v11 setMinimumLineHeight:0.0];
        [v11 setMaximumLineHeight:0.0];
        [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
        [v7 setTextAttributes:v10];
        v12 = [v8 textAttributes];
        [v12 mutableCopy];

        PXFontWithTextStyleAndWeight();
      }
      goto LABEL_10;
    case 0xFA1:
      a3->var0 = 1919;
      v20.receiver = self;
      v20.super_class = (Class)PXPhotosDetailsHeaderSpec;
      CGSize v16 = a3->var2;
      long long v21 = *(_OWORD *)&a3->var0;
      CGSize v22 = v16;
      v14 = [(PXFeatureSpec *)&v20 createViewSpecWithDescriptor:&v21];
      goto LABEL_9;
    case 0xFA2:
      a3->var0 = 1000;
      v19.receiver = self;
      v19.super_class = (Class)PXPhotosDetailsHeaderSpec;
      CGSize v13 = a3->var2;
      long long v21 = *(_OWORD *)&a3->var0;
      CGSize v22 = v13;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v19, sel_createViewSpecWithDescriptor_, &v21, v18.receiver, v18.super_class, self, PXPhotosDetailsHeaderSpec);
      goto LABEL_7;
    case 0xFA3:
      v14 = objc_alloc_init(PXImageViewSpec);
LABEL_9:
      double v5 = v14;
      [(PXFeatureSpec *)self configureViewSpec:v14];
      goto LABEL_10;
    default:
      v18.receiver = self;
      v18.super_class = (Class)PXPhotosDetailsHeaderSpec;
      CGSize v15 = a3->var2;
      long long v21 = *(_OWORD *)&a3->var0;
      CGSize v22 = v15;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v18, sel_createViewSpecWithDescriptor_, &v21, self, PXPhotosDetailsHeaderSpec, v19.receiver, v19.super_class);
      double v5 = LABEL_7:;
LABEL_10:
      return v5;
  }
}

- (PXPhotosDetailsHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosDetailsHeaderSpec;
  double v4 = [(PXFeatureSpec *)&v9 initWithExtendedTraitCollection:a3 options:a4];
  double v5 = v4;
  if (v4)
  {
    if ([(PXFeatureSpec *)v4 shouldInsetAllPhotoDetailsContent])
    {
      v5->_contentInsetEdges = 15;
      v8.receiver = v5;
      v8.super_class = (Class)PXPhotosDetailsHeaderSpec;
      [(PXFeatureSpec *)&v8 defaultCornerRadius];
      v5->_defaultCornerRadius = v6;
      if ([(PXFeatureSpec *)v5 userInterfaceIdiom] == 5) {
        v5->_defaultCornerRadius = 24.0;
      }
    }
    else
    {
      v5->_contentInsetEdges = 4;
      v5->_defaultCornerRadius = 0.0;
    }
  }
  return v5;
}

@end