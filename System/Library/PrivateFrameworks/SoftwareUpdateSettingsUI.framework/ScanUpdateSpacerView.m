@interface ScanUpdateSpacerView
- (ScanUpdateSpacerView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (void)refreshContentsWithSpecifier:(id)a3;
@end

@implementation ScanUpdateSpacerView

- (ScanUpdateSpacerView)initWithSpecifier:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)ScanUpdateSpacerView;
  v8 = [(PSFooterHyperlinkView *)&v9 initWithSpecifier:location[0]];
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    v4 = (NSNumber *)(id)[location[0] propertyForKey:@"SUHeight"];
    height = v11->_height;
    v11->_height = v4;
  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (NSNumber *)(id)[location[0] propertyForKey:@"SUHeight"];
  height = v7->_height;
  v7->_height = v3;

  v5.receiver = v7;
  v5.super_class = (Class)ScanUpdateSpacerView;
  [(PSFooterHyperlinkView *)&v5 refreshContentsWithSpecifier:location[0]];
  objc_storeStrong(location, 0);
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  v8 = self;
  id location[2] = (id)a2;
  location[1] = *(id *)&a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (!v8->_height || ([(NSNumber *)v8->_height floatValue], v4 == 0.0))
  {
    double v9 = 0.0;
  }
  else
  {
    [(NSNumber *)v8->_height floatValue];
    double v9 = v5;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (void).cxx_destruct
{
}

@end