@interface SXDOM
- (NSDictionary)componentLayouts;
- (NSDictionary)componentStyles;
- (NSDictionary)componentTextStyles;
- (NSDictionary)resources;
- (NSDictionary)textStyles;
- (SXAutoPlacement)autoPlacement;
- (SXComponents)components;
- (SXDOM)init;
- (SXDOM)initWithComponents:(id)a3 componentLayouts:(id)a4 componentStyles:(id)a5 componentTextStyles:(id)a6 textStyles:(id)a7 resources:(id)a8 autoPlacement:(id)a9 documentStyle:(id)a10 analysis:(id)a11 metadata:(id)a12;
- (SXDOMAnalysis)analysis;
- (SXDocumentStyle)documentStyle;
- (SXMetadata)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation SXDOM

- (SXDOM)init
{
  return [(SXDOM *)self initWithComponents:0 componentLayouts:0 componentStyles:0 componentTextStyles:0 textStyles:0 resources:0 autoPlacement:0 documentStyle:0 analysis:0 metadata:0];
}

- (SXDOM)initWithComponents:(id)a3 componentLayouts:(id)a4 componentStyles:(id)a5 componentTextStyles:(id)a6 textStyles:(id)a7 resources:(id)a8 autoPlacement:(id)a9 documentStyle:(id)a10 analysis:(id)a11 metadata:(id)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v52 = a9;
  id v51 = a10;
  id v24 = a11;
  v53.receiver = self;
  v53.super_class = (Class)SXDOM;
  v25 = [(SXDOM *)&v53 init];
  if (v25)
  {
    v50 = v20;
    if (v18) {
      v26 = (SXComponents *)v18;
    }
    else {
      v26 = (SXComponents *)objc_opt_new();
    }
    components = v25->_components;
    v25->_components = v26;

    id v49 = v19;
    uint64_t v28 = [v19 copy];
    v29 = (void *)v28;
    v30 = (void *)MEMORY[0x263EFFA78];
    if (v28) {
      v31 = (void *)v28;
    }
    else {
      v31 = (void *)MEMORY[0x263EFFA78];
    }
    objc_storeStrong((id *)&v25->_componentLayouts, v31);

    uint64_t v32 = [v50 copy];
    v33 = (void *)v32;
    if (v32) {
      v34 = (void *)v32;
    }
    else {
      v34 = v30;
    }
    objc_storeStrong((id *)&v25->_componentStyles, v34);

    uint64_t v35 = [v21 copy];
    v36 = (void *)v35;
    if (v35) {
      v37 = (void *)v35;
    }
    else {
      v37 = v30;
    }
    objc_storeStrong((id *)&v25->_componentTextStyles, v37);

    uint64_t v38 = [v22 copy];
    v39 = (void *)v38;
    if (v38) {
      v40 = (void *)v38;
    }
    else {
      v40 = v30;
    }
    objc_storeStrong((id *)&v25->_textStyles, v40);

    uint64_t v41 = [v23 copy];
    v42 = (void *)v41;
    if (v41) {
      v43 = (void *)v41;
    }
    else {
      v43 = v30;
    }
    objc_storeStrong((id *)&v25->_resources, v43);

    objc_storeStrong((id *)&v25->_autoPlacement, a9);
    objc_storeStrong((id *)&v25->_documentStyle, a10);
    v44 = (void *)[v24 copy];
    v45 = v44;
    if (v44) {
      v46 = v44;
    }
    else {
      v46 = (SXDOMAnalysis *)objc_opt_new();
    }
    analysis = v25->_analysis;
    v25->_analysis = v46;

    objc_storeStrong((id *)&v25->_metadata, v25->_metadata);
    id v19 = v49;
    id v20 = v50;
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [[SXDOM alloc] initWithComponents:self->_components componentLayouts:self->_componentLayouts componentStyles:self->_componentStyles componentTextStyles:self->_componentTextStyles textStyles:self->_textStyles resources:self->_resources autoPlacement:self->_autoPlacement documentStyle:self->_documentStyle analysis:self->_analysis metadata:self->_metadata];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return [[SXMutableDOM alloc] initWithComponents:self->_components componentLayouts:self->_componentLayouts componentStyles:self->_componentStyles componentTextStyles:self->_componentTextStyles textStyles:self->_textStyles resources:self->_resources autoPlacement:self->_autoPlacement documentStyle:self->_documentStyle analysis:self->_analysis metadata:self->_metadata];
}

- (id)debugDescription
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p;\n", objc_opt_class(), self];
  v4 = [(SXDOM *)self components];
  v5 = [v4 debugDescription];
  [v3 appendFormat:@"\ncomponents: %@", v5];

  v6 = [(SXDOM *)self componentLayouts];
  [v3 appendFormat:@"\ncomponentLayouts: %@", v6];

  v7 = [(SXDOM *)self componentStyles];
  [v3 appendFormat:@"\ncomponentStyles: %@", v7];

  v8 = [(SXDOM *)self componentTextStyles];
  [v3 appendFormat:@"\ncomponentTextStyles: %@", v8];

  v9 = [(SXDOM *)self textStyles];
  [v3 appendFormat:@"\ntextStyles: %@", v9];

  v10 = [(SXDOM *)self resources];
  [v3 appendFormat:@"\nresources: %@", v10];

  v11 = [(SXDOM *)self autoPlacement];
  [v3 appendFormat:@"\nautoPlacement: %@", v11];

  v12 = [(SXDOM *)self documentStyle];
  [v3 appendFormat:@"\ndocumentStyle: %@", v12];

  v13 = [(SXDOM *)self analysis];
  [v3 appendFormat:@"\nanalysis: %@", v13];

  v14 = [(SXDOM *)self metadata];
  [v3 appendFormat:@"\nmetadata: %@", v14];

  [v3 appendString:@">"];
  return v3;
}

- (SXComponents)components
{
  return self->_components;
}

- (NSDictionary)textStyles
{
  return self->_textStyles;
}

- (NSDictionary)componentStyles
{
  return self->_componentStyles;
}

- (NSDictionary)componentLayouts
{
  return self->_componentLayouts;
}

- (NSDictionary)componentTextStyles
{
  return self->_componentTextStyles;
}

- (NSDictionary)resources
{
  return self->_resources;
}

- (SXAutoPlacement)autoPlacement
{
  return self->_autoPlacement;
}

- (SXDocumentStyle)documentStyle
{
  return self->_documentStyle;
}

- (SXDOMAnalysis)analysis
{
  return self->_analysis;
}

- (SXMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_documentStyle, 0);
  objc_storeStrong((id *)&self->_autoPlacement, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_textStyles, 0);
  objc_storeStrong((id *)&self->_componentTextStyles, 0);
  objc_storeStrong((id *)&self->_componentStyles, 0);
  objc_storeStrong((id *)&self->_componentLayouts, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end