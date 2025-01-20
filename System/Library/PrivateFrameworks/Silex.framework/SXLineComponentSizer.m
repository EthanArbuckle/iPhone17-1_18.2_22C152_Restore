@interface SXLineComponentSizer
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
@end

@implementation SXLineComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  v5 = objc_msgSend(a4, "unitConverter", a3);
  v6 = [(SXComponentSizer *)self component];
  v7 = [v6 stroke];
  uint64_t v8 = [v7 width];
  objc_msgSend(v5, "convertValueToPoints:", v8, v9);
  double v11 = v10;

  double result = 1.0;
  if (v11 >= 1.0) {
    return v11;
  }
  return result;
}

@end