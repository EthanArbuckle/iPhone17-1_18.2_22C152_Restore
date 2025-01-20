@interface SXMutableDOM
- (SXMutableDOM)initWithComponents:(id)a3 componentLayouts:(id)a4 componentStyles:(id)a5 componentTextStyles:(id)a6 textStyles:(id)a7 resources:(id)a8 autoPlacement:(id)a9 documentStyle:(id)a10 analysis:(id)a11 metadata:(id)a12;
- (void)setAnalysis:(id)a3;
- (void)setAutoPlacement:(id)a3;
- (void)setDocumentStyle:(id)a3;
@end

@implementation SXMutableDOM

- (SXMutableDOM)initWithComponents:(id)a3 componentLayouts:(id)a4 componentStyles:(id)a5 componentTextStyles:(id)a6 textStyles:(id)a7 resources:(id)a8 autoPlacement:(id)a9 documentStyle:(id)a10 analysis:(id)a11 metadata:(id)a12
{
  id v18 = a9;
  v40.receiver = self;
  v40.super_class = (Class)SXMutableDOM;
  id v19 = a10;
  v20 = [(SXDOM *)&v40 initWithComponents:a3 componentLayouts:a4 componentStyles:a5 componentTextStyles:a6 textStyles:a7 resources:a8 autoPlacement:v18 documentStyle:v19 analysis:a11 metadata:a12];
  v21 = v20;
  if (v20)
  {
    uint64_t v22 = [(SXComponents *)v20->super._components mutableCopy];
    components = v21->super._components;
    v21->super._components = (SXComponents *)v22;

    uint64_t v24 = [(NSDictionary *)v21->super._componentLayouts mutableCopy];
    componentLayouts = v21->super._componentLayouts;
    v21->super._componentLayouts = (NSDictionary *)v24;

    uint64_t v26 = [(NSDictionary *)v21->super._componentStyles mutableCopy];
    componentStyles = v21->super._componentStyles;
    v21->super._componentStyles = (NSDictionary *)v26;

    uint64_t v28 = [(NSDictionary *)v21->super._componentTextStyles mutableCopy];
    componentTextStyles = v21->super._componentTextStyles;
    v21->super._componentTextStyles = (NSDictionary *)v28;

    uint64_t v30 = [(NSDictionary *)v21->super._textStyles mutableCopy];
    textStyles = v21->super._textStyles;
    v21->super._textStyles = (NSDictionary *)v30;

    uint64_t v32 = [(NSDictionary *)v21->super._resources mutableCopy];
    resources = v21->super._resources;
    v21->super._resources = (NSDictionary *)v32;

    objc_storeStrong((id *)&v21->super._autoPlacement, a9);
    objc_storeStrong((id *)&v21->super._documentStyle, a10);
    uint64_t v34 = [(SXDOMAnalysis *)v21->super._analysis mutableCopy];
    analysis = v21->super._analysis;
    v21->super._analysis = (SXDOMAnalysis *)v34;

    uint64_t v36 = [(SXMetadata *)v21->super._metadata mutableCopy];
    metadata = v21->super._metadata;
    v21->super._metadata = (SXMetadata *)v36;
  }
  return v21;
}

- (void)setAutoPlacement:(id)a3
{
}

- (void)setDocumentStyle:(id)a3
{
}

- (void)setAnalysis:(id)a3
{
}

@end