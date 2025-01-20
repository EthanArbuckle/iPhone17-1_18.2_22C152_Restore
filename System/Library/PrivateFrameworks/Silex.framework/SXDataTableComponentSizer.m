@interface SXDataTableComponentSizer
- (SXDataTableComponentController)dataTableComponentController;
- (SXDataTableComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 textComponentLayoutHosting:(id)a8 textSourceFactory:(id)a9 recordValueTransformerFactory:(id)a10;
- (SXDataTableLayouter)layouter;
- (SXLayoutContext)currentLayoutContext;
- (SXTextComponentLayoutHosting)textComponentLayoutHosting;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
- (id)contentSizeCategoryForDataTableComponentController:(id)a3;
- (id)documentColumnLayoutForDataTableComponentController:(id)a3;
- (id)tableStyleForComponent:(id)a3;
- (id)unitConverterForDataTableComponentController:(id)a3;
- (void)setCurrentLayoutContext:(id)a3;
- (void)setDataTableComponentController:(id)a3;
- (void)setLayouter:(id)a3;
@end

@implementation SXDataTableComponentSizer

- (SXDataTableComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 textComponentLayoutHosting:(id)a8 textSourceFactory:(id)a9 recordValueTransformerFactory:(id)a10
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v44 = a10;
  v45.receiver = self;
  v45.super_class = (Class)SXDataTableComponentSizer;
  id v20 = a4;
  v21 = v17;
  v22 = [(SXComponentSizer *)&v45 initWithComponent:v16 componentLayout:v20 componentStyle:a5 DOMObjectProvider:v17 layoutOptions:a7];
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_textComponentLayoutHosting, v18);
    id v24 = v16;
    v43 = [(SXDataTableComponentSizer *)v23 tableStyleForComponent:v24];
    id v41 = v18;
    v42 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:0];
    v25 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:0];
    v26 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:0];
    v40 = +[SXJSONObjectTransformer concatenatingTransformerWithKey:@"textStyles"];
    [(SXJSONObjectMerger *)v26 addTransformer:v40 keyPath:@"textStyle"];
    v27 = [SXDataTableComponentStyleFactory alloc];
    [v24 data];
    id v28 = v16;
    v30 = id v29 = v19;
    v31 = v21;
    uint64_t v32 = [v24 dataOrientation];

    uint64_t v33 = v32;
    v21 = v31;
    v34 = [(SXDataTableComponentStyleFactory *)v27 initWithRecordStore:v30 tableStyle:v43 dataOrientation:v33 rowStyleMerger:v42 columnStyleMerger:v25 cellStyleMerger:v26];

    id v19 = v29;
    id v16 = v28;
    v35 = [[SXDataTableComponentController alloc] initWithStyleFactory:v34 textSourceFactory:v19 dataSource:v23 recordValueTransformerFactory:v44 DOMObjectProvider:v31];
    dataTableComponentController = v23->_dataTableComponentController;
    v23->_dataTableComponentController = v35;

    v37 = [[SXDataTableLayouter alloc] initWithDataSource:v23->_dataTableComponentController];
    layouter = v23->_layouter;
    v23->_layouter = v37;

    id v18 = v41;
  }

  return v23;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  id v6 = a4;
  v7 = [(SXDataTableComponentSizer *)self dataTableComponentController];
  [v7 prepareForLayout];

  v8 = [(SXDataTableComponentSizer *)self layouter];
  [v8 reset];

  [(SXDataTableComponentSizer *)self setCurrentLayoutContext:v6];
  v9 = [(SXDataTableComponentSizer *)self layouter];
  v10 = [v9 blueprintForWidth:a3];

  if (v10)
  {
    [(SXComponentSizer *)self saveInfo:v10 forRenderingPhaseWithIdentifier:@"blueprint"];
    v11 = [(SXDataTableComponentSizer *)self dataTableComponentController];
    [(SXComponentSizer *)self saveInfo:v11 forRenderingPhaseWithIdentifier:@"component_controller"];
  }
  [v10 tableSize];
  double v13 = v12;

  return v13;
}

- (id)documentColumnLayoutForDataTableComponentController:(id)a3
{
  v3 = [(SXComponentSizer *)self layoutOptions];
  v4 = [v3 columnLayout];

  return v4;
}

- (id)contentSizeCategoryForDataTableComponentController:(id)a3
{
  v3 = [(SXComponentSizer *)self layoutOptions];
  v4 = [v3 contentSizeCategory];

  return v4;
}

- (id)unitConverterForDataTableComponentController:(id)a3
{
  v3 = [(SXDataTableComponentSizer *)self currentLayoutContext];
  v4 = [v3 unitConverter];

  return v4;
}

- (id)tableStyleForComponent:(id)a3
{
  id v4 = a3;
  v5 = [(SXComponentSizer *)self DOMObjectProvider];
  id v6 = [v5 componentStyleForComponent:v4];

  v7 = [v6 tableStyle];

  return v7;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textComponentLayoutHosting);
  return (SXTextComponentLayoutHosting *)WeakRetained;
}

- (SXDataTableLayouter)layouter
{
  return self->_layouter;
}

- (void)setLayouter:(id)a3
{
}

- (SXDataTableComponentController)dataTableComponentController
{
  return self->_dataTableComponentController;
}

- (void)setDataTableComponentController:(id)a3
{
}

- (SXLayoutContext)currentLayoutContext
{
  return self->_currentLayoutContext;
}

- (void)setCurrentLayoutContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayoutContext, 0);
  objc_storeStrong((id *)&self->_dataTableComponentController, 0);
  objc_storeStrong((id *)&self->_layouter, 0);
  objc_destroyWeak((id *)&self->_textComponentLayoutHosting);
}

@end