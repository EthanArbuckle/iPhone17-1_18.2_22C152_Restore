@interface SXComponentInsertionLayoutProvider
- (CGRect)frameForComponent:(id)a3;
- (CGSize)documentSize;
- (CGSize)viewportSize;
- (SXColumnLayout)columnLayout;
- (SXComponentInsertionLayoutProvider)initWithBlueprint:(id)a3 DOMObjectProvider:(id)a4 unitConverterFactory:(id)a5;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXLayoutBlueprint)layoutBlueprint;
- (SXUnitConverterFactory)unitConverterFactory;
- (id)layoutBlueprintForMarker:(id)a3;
- (id)suggestedMarginForMarker:(id)a3;
- (id)unitConverterForMarker:(id)a3;
@end

@implementation SXComponentInsertionLayoutProvider

- (SXComponentInsertionLayoutProvider)initWithBlueprint:(id)a3 DOMObjectProvider:(id)a4 unitConverterFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXComponentInsertionLayoutProvider;
  v12 = [(SXComponentInsertionLayoutProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layoutBlueprint, a3);
    objc_storeStrong((id *)&v13->_DOMObjectProvider, a4);
    objc_storeStrong((id *)&v13->_unitConverterFactory, a5);
  }

  return v13;
}

- (CGSize)viewportSize
{
  v2 = [(SXComponentInsertionLayoutProvider *)self layoutBlueprint];
  v3 = [v2 layoutOptions];
  [v3 viewportSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)documentSize
{
  v2 = [(SXComponentInsertionLayoutProvider *)self layoutBlueprint];
  [v2 blueprintSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (SXColumnLayout)columnLayout
{
  v2 = [(SXComponentInsertionLayoutProvider *)self layoutBlueprint];
  double v3 = [v2 layoutOptions];
  double v4 = [v3 columnLayout];

  return (SXColumnLayout *)v4;
}

- (CGRect)frameForComponent:(id)a3
{
  id v4 = a3;
  double v5 = [(SXComponentInsertionLayoutProvider *)self layoutBlueprint];
  double v6 = [v4 identifier];

  double v7 = [v5 componentBlueprintForComponentIdentifier:v6 includeChildren:1];
  [v7 absoluteFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)suggestedMarginForMarker:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(SXComponentInsertionLayoutProvider *)self layoutBlueprintForMarker:v4];
  double v6 = [v4 componentAnchor];

  if (!v6)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    double v10 = [v5 componentIdentifiers];
    double v11 = (void *)[v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (!v11)
    {
      double v8 = 0;
      double v9 = 0;
      v29 = 0;
      goto LABEL_20;
    }
    v40 = self;
    double v8 = 0;
    double v9 = 0;
    uint64_t v12 = *(void *)v43;
    double v13 = 1.79769313e308;
    double v14 = 1.79769313e308;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v10);
        }
        double v16 = [v5 componentBlueprintForComponentIdentifier:*(void *)(*((void *)&v42 + 1) + 8 * i)];
        [v4 approximateLocation];
        double v18 = v17;
        [v16 absoluteFrame];
        double v19 = v18 - CGRectGetMaxY(v48);
        if (v19 < v14 && v19 >= 0.0)
        {
          uint64_t v20 = [v16 component];

          double v9 = (void *)v20;
          double v14 = v19;
        }
        [v16 absoluteFrame];
        double MinY = CGRectGetMinY(v49);
        [v4 approximateLocation];
        double v23 = MinY - v22;
        if (v23 < v13 && v23 >= 0.0)
        {
          uint64_t v24 = [v16 component];

          double v8 = (void *)v24;
          double v13 = v23;
        }
      }
      double v11 = (void *)[v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v11);

    if (v9)
    {
      v25 = v40;
      v26 = [(SXComponentInsertionLayoutProvider *)v40 DOMObjectProvider];
      v27 = [v9 layout];
      double v11 = [v26 componentLayoutForIdentifier:v27];

      if (v8)
      {
LABEL_18:
        double v10 = [(SXComponentInsertionLayoutProvider *)v25 DOMObjectProvider];
        v28 = [v8 layout];
        v29 = [v10 componentLayoutForIdentifier:v28];

LABEL_20:
LABEL_23:
        v41 = v11;
        v30 = [SXInsertEdgeSpacing alloc];
        v31 = [v29 margin];
        uint64_t v32 = [v31 top];
        uint64_t v34 = v33;
        v35 = [v11 margin];
        uint64_t v36 = [v35 bottom];
        double v7 = -[SXInsertEdgeSpacing initWithTop:bottom:](v30, v32, v34, v36, v37);

        goto LABEL_24;
      }
    }
    else
    {
      double v11 = 0;
      v25 = v40;
      if (v8) {
        goto LABEL_18;
      }
    }
    v29 = 0;
    goto LABEL_23;
  }
  double v7 = -[SXInsertEdgeSpacing initWithTop:bottom:]([SXInsertEdgeSpacing alloc], 0, 1, 0, 1);
  double v8 = 0;
  double v9 = 0;
LABEL_24:
  v38 = v7;

  return v38;
}

- (id)unitConverterForMarker:(id)a3
{
  id v4 = [(SXComponentInsertionLayoutProvider *)self layoutBlueprintForMarker:a3];
  double v5 = [(SXComponentInsertionLayoutProvider *)self unitConverterFactory];
  [v4 blueprintSize];
  double v7 = v6;
  double v8 = [(SXComponentInsertionLayoutProvider *)self layoutBlueprint];
  double v9 = [v8 layoutOptions];
  double v10 = [v5 createUnitConverterWithComponentWidth:v9 parentWidth:0.0 layoutOptions:v7];

  return v10;
}

- (id)layoutBlueprintForMarker:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(SXComponentInsertionLayoutProvider *)self layoutBlueprint];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = objc_msgSend(v4, "path", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      double v11 = v5;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) identifier];
        double v13 = [v11 componentBlueprintForComponentIdentifier:v12];

        double v5 = [v13 layoutBlueprint];

        ++v10;
        double v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (SXLayoutBlueprint)layoutBlueprint
{
  return self->_layoutBlueprint;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_layoutBlueprint, 0);
}

@end