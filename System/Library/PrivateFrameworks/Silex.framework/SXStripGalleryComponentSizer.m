@interface SXStripGalleryComponentSizer
- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
- (double)contentWidthForColumnLayout:(id)a3;
- (double)rightContentInsetForColumnLayout:(id)a3;
- (double)xOffsetForColumnLayout:(id)a3;
- (id)imageResources;
- (unint64_t)shouldIgnoreMarginsForColumnLayout:(id)a3;
- (unint64_t)shouldIgnoreViewportPaddingForColumnLayout:(id)a3;
@end

@implementation SXStripGalleryComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [v5 columnLayout];
  [(SXStripGalleryComponentSizer *)self contentWidthForColumnLayout:v6];
  double v8 = v7;

  v9 = [v5 unitConverter];
  objc_msgSend(v9, "convertValueToPoints:", 0x404F000000000000, 2);
  double v11 = v10;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v12 = [(SXStripGalleryComponentSizer *)self imageResources];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v50;
    double v16 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        [v18 dimensions];
        double v20 = v19;
        [v18 dimensions];
        double v22 = v20 / v21;
        if (v20 / v21 < 2.0)
        {
          objc_msgSend(v18, "dimensions", v22);
          double v24 = v23;
          [v18 dimensions];
          double v22 = v24 / v25;
          if (v24 / v25 > v16)
          {
            objc_msgSend(v18, "dimensions", v22);
            double v27 = v26;
            [v18 dimensions];
            double v16 = v27 / v28;
          }
        }
      }
      uint64_t v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v53, 16, v22);
    }
    while (v14);
  }
  else
  {
    double v16 = 0.0;
  }

  if (v16 == 0.0) {
    double v29 = v11;
  }
  else {
    double v29 = v8 / v16;
  }
  v30 = [(SXStripGalleryComponentSizer *)self imageResources];
  uint64_t v31 = [v30 count];

  if (v31)
  {
    v32 = [(SXStripGalleryComponentSizer *)self imageResources];
    v33 = [v32 objectAtIndex:0];

    [v33 dimensions];
    double v35 = v34;
    [v33 dimensions];
    if (v35 / v36 < 2.0)
    {
      [v33 dimensions];
      double v38 = v29 / v37;
      [v33 dimensions];
      double v40 = v38 * v39;
      if (v40 > v8 + -20.0)
      {
        if (v40 >= v8 + -20.0) {
          double v40 = v8 + -20.0;
        }
        double v29 = v40 / v16;
      }
    }
  }
  v41 = [NSNumber numberWithDouble:v8];
  [(SXComponentSizer *)self saveInfo:v41 forRenderingPhaseWithIdentifier:@"ContentWidth"];

  v42 = NSNumber;
  v43 = [v5 columnLayout];
  [(SXStripGalleryComponentSizer *)self xOffsetForColumnLayout:v43];
  v44 = objc_msgSend(v42, "numberWithDouble:");
  [(SXComponentSizer *)self saveInfo:v44 forRenderingPhaseWithIdentifier:@"leftOffset"];

  v45 = NSNumber;
  v46 = [v5 columnLayout];
  [(SXStripGalleryComponentSizer *)self rightContentInsetForColumnLayout:v46];
  v47 = objc_msgSend(v45, "numberWithDouble:");
  [(SXComponentSizer *)self saveInfo:v47 forRenderingPhaseWithIdentifier:@"rightOffset"];

  if (v29 < v11) {
    double v11 = v29;
  }

  return v11;
}

- (id)imageResources
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(SXComponentSizer *)self component];
  id v5 = [v4 items];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v11 = [(SXComponentSizer *)self DOMObjectProvider];
        v12 = [v10 imageIdentifier];
        uint64_t v13 = [v11 imageResourceForIdentifier:v12];

        if (v13) {
          [v3 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v3;
}

- (double)contentWidthForColumnLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SXComponentSizer *)self componentLayout];
  uint64_t v6 = [v5 columnRange];
  uint64_t v8 = objc_msgSend(v4, "convertColumnRange:minimumColumnLength:", v6, v7, -[SXComponentSizer minimumColumnLength](self, "minimumColumnLength"));
  uint64_t v10 = v9;

  double v11 = [(SXComponentSizer *)self componentLayout];
  uint64_t v12 = [v11 ignoreDocumentMargin];
  uint64_t v13 = [(SXComponentSizer *)self componentLayout];
  uint64_t v14 = [v13 ignoreDocumentGutter];
  long long v15 = [(SXComponentSizer *)self componentLayout];
  objc_msgSend(v4, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v8, v10, v12, v14, objc_msgSend(v15, "ignoreViewportPadding"));
  double v17 = v16;

  return v17;
}

- (double)xOffsetForColumnLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SXComponentSizer *)self componentLayout];
  uint64_t v6 = [v5 columnRange];
  uint64_t v8 = objc_msgSend(v4, "convertColumnRange:minimumColumnLength:", v6, v7, -[SXComponentSizer minimumColumnLength](self, "minimumColumnLength"));

  uint64_t v9 = [(SXComponentSizer *)self componentLayout];
  uint64_t v10 = [v9 ignoreDocumentMargin];
  double v11 = [(SXComponentSizer *)self componentLayout];
  uint64_t v12 = [v11 ignoreDocumentGutter];
  uint64_t v13 = [(SXComponentSizer *)self componentLayout];
  objc_msgSend(v4, "xPositionForColumnIndex:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v8, v10, v12, objc_msgSend(v13, "ignoreViewportPadding"));
  double v15 = v14;

  return v15;
}

- (double)rightContentInsetForColumnLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SXComponentSizer *)self componentLayout];
  uint64_t v6 = [v5 columnRange];
  uint64_t v8 = objc_msgSend(v4, "convertColumnRange:minimumColumnLength:", v6, v7, -[SXComponentSizer minimumColumnLength](self, "minimumColumnLength"));
  uint64_t v10 = v9;

  double v11 = [(SXComponentSizer *)self componentLayout];
  uint64_t v12 = [v11 ignoreDocumentMargin];
  uint64_t v13 = [(SXComponentSizer *)self componentLayout];
  uint64_t v14 = [v13 ignoreDocumentGutter];
  double v15 = [(SXComponentSizer *)self componentLayout];
  objc_msgSend(v4, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v8, v10, v12, v14, objc_msgSend(v15, "ignoreViewportPadding"));
  double v17 = v16;

  [(SXStripGalleryComponentSizer *)self xOffsetForColumnLayout:v4];
  double v19 = v18;
  objc_msgSend(v4, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", 0, objc_msgSend(v4, "numberOfColumns"), 3, 3, 3);
  double v21 = v20;

  return v21 - v17 - v19;
}

- (_NSRange)overrideColumnLayoutForColumnRange:(_NSRange)a3 inColumnLayout:(id)a4
{
  NSUInteger v4 = objc_msgSend(a4, "numberOfColumns", a3.location, a3.length);
  NSUInteger v5 = 0;
  result.length = v4;
  result.location = v5;
  return result;
}

- (unint64_t)shouldIgnoreMarginsForColumnLayout:(id)a3
{
  return 3;
}

- (unint64_t)shouldIgnoreViewportPaddingForColumnLayout:(id)a3
{
  return 3;
}

@end