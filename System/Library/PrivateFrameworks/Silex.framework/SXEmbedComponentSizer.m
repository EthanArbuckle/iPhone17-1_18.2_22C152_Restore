@interface SXEmbedComponentSizer
- (SXEmbedComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 embedDataProvider:(id)a8;
- (SXEmbedDataProvider)embedDataProvider;
- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
@end

@implementation SXEmbedComponentSizer

- (SXEmbedComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7 embedDataProvider:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)SXEmbedComponentSizer;
  v16 = [(SXComponentSizer *)&v19 initWithComponent:a3 componentLayout:a4 componentStyle:a5 DOMObjectProvider:a6 layoutOptions:a7];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_embedDataProvider, a8);
  }

  return v17;
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  [(SXComponentSizer *)self suggestedSize];
  if (v5 <= 0.0) {
    return 100.0;
  }
  [(SXComponentSizer *)self suggestedSize];
  return v6;
}

- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4
{
  int64_t length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  v7 = [(SXEmbedComponentSizer *)self embedDataProvider];
  v8 = [(SXComponentSizer *)self component];
  v9 = [v8 embedType];
  v10 = [v7 embedForType:v9];

  [v10 minimumWidth];
  if (v11 <= 0.0)
  {
    unint64_t v13 = 1;
  }
  else
  {
    double v12 = v11;
    unint64_t v13 = 1;
    while (v13 <= [v6 numberOfColumns])
    {
      v14 = [(SXComponentSizer *)self componentLayout];
      uint64_t v15 = [v14 ignoreDocumentMargin];
      v16 = [(SXComponentSizer *)self componentLayout];
      uint64_t v17 = [v16 ignoreDocumentMargin];
      v18 = [(SXComponentSizer *)self componentLayout];
      objc_msgSend(v6, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", location, v13, v15, v17, objc_msgSend(v18, "ignoreViewportPadding"));
      double v20 = v19;

      ++v13;
      if (v20 >= v12)
      {
        --v13;
        break;
      }
    }
  }
  if ((uint64_t)v13 <= length) {
    NSUInteger v21 = length;
  }
  else {
    NSUInteger v21 = v13;
  }
  uint64_t v22 = [v6 numberOfColumns];
  uint64_t v23 = location - ((v21 - v22) & ~((uint64_t)(v21 - v22) >> 63));
  uint64_t v24 = v23 & ~(v23 >> 63);
  unint64_t v25 = [v6 numberOfColumns];
  if (v21 >= v25) {
    NSUInteger v21 = v25;
  }

  NSUInteger v26 = v24;
  NSUInteger v27 = v21;
  result.int64_t length = v27;
  result.NSUInteger location = v26;
  return result;
}

- (SXEmbedDataProvider)embedDataProvider
{
  return self->_embedDataProvider;
}

- (void).cxx_destruct
{
}

@end