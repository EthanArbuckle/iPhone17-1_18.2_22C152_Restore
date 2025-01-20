@interface SXQuickLookComponentSizer
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
@end

@implementation SXQuickLookComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  id v6 = a4;
  v7 = [(SXComponentSizer *)self componentLayout];
  [v7 minimumHeight];
  uint64_t v9 = v8;

  v10 = [v6 unitConverter];

  if (v9)
  {
    v11 = [(SXComponentSizer *)self componentLayout];
    uint64_t v12 = [v11 minimumHeight];
    objc_msgSend(v10, "convertValueToPoints:", v12, v13);
    double v15 = v14;

    return v15;
  }
  else
  {
    objc_msgSend(v10, "convertValueToPoints:", 0x4049000000000000, 2);
    double v18 = v17;

    if (v18 <= a3) {
      return v18;
    }
    else {
      return a3;
    }
  }
}

@end