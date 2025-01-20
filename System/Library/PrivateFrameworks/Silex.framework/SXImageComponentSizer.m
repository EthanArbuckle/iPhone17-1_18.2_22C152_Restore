@interface SXImageComponentSizer
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
@end

@implementation SXImageComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  id v6 = a4;
  v7 = [(SXComponentSizer *)self DOMObjectProvider];
  v8 = [(SXComponentSizer *)self component];
  v9 = [v8 imageIdentifier];
  v10 = [v7 imageResourceForIdentifier:v9];

  v11 = [(SXComponentSizer *)self componentLayout];
  [v11 maximumContentWidth];
  uint64_t v13 = v12;

  double v14 = a3;
  if (v13)
  {
    v15 = [v6 unitConverter];
    v16 = [(SXComponentSizer *)self componentLayout];
    uint64_t v17 = [v16 maximumContentWidth];
    objc_msgSend(v15, "convertValueToPoints:", v17, v18);
    double v14 = v19;
  }
  if (v14 >= a3) {
    double v20 = a3;
  }
  else {
    double v20 = v14;
  }
  [v10 heightForImageWidth:v20];
  double v22 = v21;

  return v22;
}

@end