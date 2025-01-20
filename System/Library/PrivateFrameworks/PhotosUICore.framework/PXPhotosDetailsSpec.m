@interface PXPhotosDetailsSpec
- (BOOL)enableActionsWidget;
- (BOOL)shouldInitializeBarsController;
- (PXPhotosDetailsBarSpec)barSpec;
- (PXPhotosDetailsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXPhotosDetailsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5;
- (PXWidgetCompositionSpec)compositionSpec;
- (PXWidgetSpec)widgetSpec;
- (UIColor)backgroundColor;
- (UIColor)dimmingColor;
- (double)dimmingAlpha;
- (unint64_t)detailsOptions;
@end

@implementation PXPhotosDetailsSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingColor, 0);
  objc_storeStrong((id *)&self->_barSpec, 0);
  objc_storeStrong((id *)&self->_widgetSpec, 0);
  objc_storeStrong((id *)&self->_compositionSpec, 0);
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (UIColor)dimmingColor
{
  return self->_dimmingColor;
}

- (PXPhotosDetailsBarSpec)barSpec
{
  return self->_barSpec;
}

- (PXWidgetSpec)widgetSpec
{
  return self->_widgetSpec;
}

- (PXWidgetCompositionSpec)compositionSpec
{
  return self->_compositionSpec;
}

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

- (UIColor)backgroundColor
{
  if ([(PXFeatureSpec *)self userInterfaceIdiom] == 3
    || [(PXFeatureSpec *)self userInterfaceIdiom] == 5)
  {
    v3 = (void *)MEMORY[0x1E4FB1618];
LABEL_4:
    v4 = [v3 clearColor];
    goto LABEL_5;
  }
  v6 = [(PXPhotosDetailsSpec *)self widgetSpec];
  uint64_t v7 = [v6 sizeClass];

  char v8 = [(PXPhotosDetailsSpec *)self detailsOptions];
  v3 = (void *)MEMORY[0x1E4FB1618];
  if ((v8 & 2) != 0 && v7 == 2) {
    goto LABEL_4;
  }
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
LABEL_5:
  return (UIColor *)v4;
}

- (BOOL)enableActionsWidget
{
  return 1;
}

- (BOOL)shouldInitializeBarsController
{
  return [(PXFeatureSpec *)self userInterfaceIdiom] != 3;
}

- (PXPhotosDetailsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXPhotosDetailsSpec *)self initWithExtendedTraitCollection:a3 options:a4 detailsOptions:0];
}

- (PXPhotosDetailsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5
{
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosDetailsSpec;
  v9 = [(PXFeatureSpec *)&v20 initWithExtendedTraitCollection:v8 options:a4];
  v10 = v9;
  if (v9)
  {
    v9->_detailsOptions = a5;
    v11 = [[PXWidgetSpec alloc] initWithExtendedTraitCollection:v8 options:a4 detailsOptions:a5];
    widgetSpec = v10->_widgetSpec;
    v10->_widgetSpec = v11;

    v13 = [[PXWidgetCompositionSpec alloc] initWithExtendedTraitCollection:v8 widgetSpec:v10->_widgetSpec];
    compositionSpec = v10->_compositionSpec;
    v10->_compositionSpec = v13;

    v15 = [[PXPhotosDetailsBarSpec alloc] initWithExtendedTraitCollection:v8];
    barSpec = v10->_barSpec;
    v10->_barSpec = v15;

    [(PXPhotosDetailsBarSpec *)v10->_barSpec setDetailsOptions:a5];
    uint64_t v17 = [(PXPhotosDetailsSpec *)v10 backgroundColor];
    dimmingColor = v10->_dimmingColor;
    v10->_dimmingColor = (UIColor *)v17;

    v10->_dimmingAlpha = 0.75;
  }

  return v10;
}

@end