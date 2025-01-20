@interface CRLPdfHyperlinkController
- (BOOL)ignoreUrl:(id)a3;
- (CGRect)taggingRect;
- (CRLPdfHyperlinkController)init;
- (CRLPdfHyperlinkController)initWithTaggingRect:(CGRect)a3;
- (id)p_chopBezierIntoRects:(id)a3;
- (id)p_hyperlinkRegionsForRep:(id)a3;
- (id)p_taggingRectPath;
- (void)addHyperlinksForRep:(id)a3;
- (void)crl_commitHyperlinksToPDF:(CGContext *)a3 targetRect:(CGRect)a4;
- (void)p_combineSimilarElements:(id)a3;
@end

@implementation CRLPdfHyperlinkController

- (CRLPdfHyperlinkController)init
{
  return -[CRLPdfHyperlinkController initWithTaggingRect:](self, "initWithTaggingRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (CRLPdfHyperlinkController)initWithTaggingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CRLPdfHyperlinkController;
  v7 = [(CRLPdfHyperlinkController *)&v11 init];
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mHyperlinkRegions = v7->mHyperlinkRegions;
    v7->mHyperlinkRegions = v8;

    v7->mTaggingRect.origin.CGFloat x = x;
    v7->mTaggingRect.origin.CGFloat y = y;
    v7->mTaggingRect.size.CGFloat width = width;
    v7->mTaggingRect.size.CGFloat height = height;
  }
  return v7;
}

- (BOOL)ignoreUrl:(id)a3
{
  v3 = [a3 absoluteString];
  BOOL v4 = v3 == 0;

  return v4;
}

- (CGRect)taggingRect
{
  double x = self->mTaggingRect.origin.x;
  double y = self->mTaggingRect.origin.y;
  double width = self->mTaggingRect.size.width;
  double height = self->mTaggingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)p_taggingRectPath
{
  if (CGRectIsNull(self->mTaggingRect))
  {
    v3 = 0;
  }
  else
  {
    v3 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", self->mTaggingRect.origin.x, self->mTaggingRect.origin.y, self->mTaggingRect.size.width, self->mTaggingRect.size.height);
  }

  return v3;
}

- (void)addHyperlinksForRep:(id)a3
{
  id v4 = [(CRLPdfHyperlinkController *)self p_hyperlinkRegionsForRep:a3];
  if ([v4 count]) {
    [(NSMutableArray *)self->mHyperlinkRegions addObjectsFromArray:v4];
  }
}

- (void)crl_commitHyperlinksToPDF:(CGContext *)a3 targetRect:(CGRect)a4
{
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v8 = self;
  id v33 = [(CRLPdfHyperlinkController *)self p_taggingRectPath];
  v9 = (char *)[(NSMutableArray *)v8->mHyperlinkRegions count];
  if (v9)
  {
    v10 = v9;
    objc_super v11 = 0;
    v31 = v9;
    v32 = v8;
    do
    {
      v13 = [(NSMutableArray *)v8->mHyperlinkRegions objectAtIndexedSubscript:v11];
      CFURLRef v14 = [v13 URL];
      if (v14 && ![(CRLPdfHyperlinkController *)v8 ignoreUrl:v14])
      {
        v15 = [v13 bezierPath];
        v16 = v15;
        if (v33)
        {
          uint64_t v17 = [v15 intersectBezierPath:];

          v16 = (void *)v17;
        }
        v18 = [(CRLPdfHyperlinkController *)v8 p_chopBezierIntoRects:v16];
        [(CRLPdfHyperlinkController *)v8 p_combineSimilarElements:v18];
        v19 = (char *)[v18 count];
        if (v19)
        {
          v20 = v19;
          for (i = 0; i != v20; ++i)
          {
            v22 = [v18 objectAtIndex:i];
            [v22 CGRectValue];
            double v24 = v23;
            double v26 = v25;
            CGFloat v28 = v27;
            double v30 = v29;

            v35.origin.double x = v24 - x;
            v35.origin.double y = height - (v26 - y) - v30;
            v35.size.double width = v28;
            v35.size.double height = v30;
            CGPDFContextSetURLForRect(a3, v14, v35);
          }
        }

        v10 = v31;
        v8 = v32;
      }

      ++v11;
    }
    while (v11 != v10);
  }
  [(NSMutableArray *)v8->mHyperlinkRegions removeAllObjects];
}

- (id)p_hyperlinkRegionsForRep:(id)a3
{
  id v3 = a3;
  id v4 = [v3 hyperlinkRegions];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) bezierPath:v13, v14, v15];
        v10 = [v3 layout];
        objc_super v11 = v10;
        if (v10)
        {
          [v10 transformInRoot];
        }
        else
        {
          long long v14 = 0u;
          long long v15 = 0u;
          long long v13 = 0u;
        }
        [v9 transformUsingAffineTransform:&v13];
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)p_chopBezierIntoRects:(id)a3
{
  id v3 = a3;
  if ([v3 elementCount])
  {
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = +[NSMutableArray arrayWithCapacity:(v10 / 5.0)];
    float v13 = 0.0;
    do
    {
      long long v14 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v5, v7 + v13, v9, 5.0);
      long long v15 = [v3 intersectBezierPath:v14];
      if (([v15 isEmpty] & 1) == 0)
      {
        long long v16 = [v15 arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:1];
        if ([v16 count])
        {
          uint64_t v17 = 0;
          unsigned int v18 = 1;
          do
          {
            long long v19 = [v16 objectAtIndex:v17];
            if (([v19 isEmpty] & 1) == 0)
            {
              [v19 bounds];
              v20 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
              [v12 addObject:v20];
            }
            uint64_t v17 = v18;
          }
          while ((unint64_t)[v16 count] > v18++);
        }
      }
      float v13 = v13 + 5.0;
    }
    while (v11 >= v13);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)p_combineSimilarElements:(id)a3
{
  id v26 = a3;
  if (v26)
  {
    if ([v26 count])
    {
      id v3 = (char *)[v26 count];
      double v4 = v3 - 1;
      if (v3 != (char *)1)
      {
        double v25 = 0.000000999999997;
        do
        {
          double v5 = [v26 objectAtIndex:v4 - 1];
          [v5 CGRectValue];
          double v7 = v6;
          double v9 = v8;
          double v11 = v10;
          double v13 = v12;

          long long v14 = [v26 objectAtIndex:v4];
          [v14 CGRectValue];
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;

          if ((v7 == v16 || vabdd_f64(v7, v16) < fabs(v16 * v25))
            && (v11 == v20 || vabdd_f64(v11, v20) < fabs(v20 * v25)))
          {
            double v23 = v9 + v13;
            if (v9 + v13 == v18 || (double v23 = vabdd_f64(v23, v18), v23 < fabs(v18 * v25)))
            {
              [v26 removeObjectAtIndex:v4, v23];
              double v24 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v7, v9, v11, v13 + v22);
              [v26 replaceObjectAtIndex:v4 - 1 withObject:v24];
            }
          }
          --v4;
        }
        while (v4);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end