@interface PXWidgetCompositionSpec
- (PXWidgetBarSpec)_defaultHeaderSpec;
- (PXWidgetBarSpec)_headerSpecForFlushedContent;
- (PXWidgetBarSpec)footerSpec;
- (PXWidgetCompositionSpec)init;
- (PXWidgetCompositionSpec)initWithExtendedTraitCollection:(id)a3 widgetSpec:(id)a4;
- (PXWidgetSpec)widgetSpec;
- (id)headerSpecForWidgetContentLayoutStyle:(int64_t)a3;
- (int64_t)disclosureLocation;
- (int64_t)maximumNumberOfColumns;
@end

@implementation PXWidgetCompositionSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__headerSpecForFlushedContent, 0);
  objc_storeStrong((id *)&self->__defaultHeaderSpec, 0);
  objc_storeStrong((id *)&self->_footerSpec, 0);
  objc_storeStrong((id *)&self->_widgetSpec, 0);
}

- (PXWidgetBarSpec)_headerSpecForFlushedContent
{
  return self->__headerSpecForFlushedContent;
}

- (PXWidgetBarSpec)_defaultHeaderSpec
{
  return self->__defaultHeaderSpec;
}

- (int64_t)disclosureLocation
{
  return self->_disclosureLocation;
}

- (PXWidgetBarSpec)footerSpec
{
  return self->_footerSpec;
}

- (int64_t)maximumNumberOfColumns
{
  return self->_maximumNumberOfColumns;
}

- (PXWidgetSpec)widgetSpec
{
  return self->_widgetSpec;
}

- (id)headerSpecForWidgetContentLayoutStyle:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      goto LABEL_4;
    case 1:
      v3 = [(PXWidgetCompositionSpec *)self _headerSpecForFlushedContent];
      break;
    case 0:
LABEL_4:
      v3 = [(PXWidgetCompositionSpec *)self _defaultHeaderSpec];
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (PXWidgetCompositionSpec)initWithExtendedTraitCollection:(id)a3 widgetSpec:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXWidgetCompositionSpec;
  v8 = [(PXWidgetCompositionSpec *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_widgetSpec, a4);
    if ([v6 layoutSizeClass] == 2)
    {
      v10 = +[PXPhotosDetailsSettings sharedInstance];
      int v11 = [v10 allowMultiColumnLayout];
      uint64_t v12 = 1;
      if (v11) {
        uint64_t v12 = 2;
      }
      v9->_maximumNumberOfColumns = v12;
    }
    else
    {
      v9->_maximumNumberOfColumns = 1;
    }
    [v7 contentGuideInsets];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__PXWidgetCompositionSpec_initWithExtendedTraitCollection_widgetSpec___block_invoke;
    v16[3] = &__block_descriptor_64_e22___PXWidgetBarSpec_8__0l;
    v16[4] = 0;
    v16[5] = v13;
    v16[6] = 0;
    v16[7] = v14;
    _Block_copy(v16);
    [MEMORY[0x1E4FB1618] labelColor];
    objc_claimAutoreleasedReturnValue();
    PXFontWithTextStyleSymbolicTraits();
  }

  return 0;
}

PXWidgetBarSpec *__70__PXWidgetCompositionSpec_initWithExtendedTraitCollection_widgetSpec___block_invoke(double *a1)
{
  v2 = objc_alloc_init(PXWidgetBarSpec);
  -[PXWidgetBarSpec setContentInsets:](v2, "setContentInsets:", a1[4], a1[5], a1[6], a1[7]);
  [(PXWidgetBarSpec *)v2 setMinimumDistanceBetweenTopAndFirstAscender:5.0];
  [(PXWidgetBarSpec *)v2 setMinimumDistanceBetweenLastDescenderAndBottom:5.0];
  return v2;
}

- (PXWidgetCompositionSpec)init
{
  return [(PXWidgetCompositionSpec *)self initWithExtendedTraitCollection:0 widgetSpec:0];
}

@end