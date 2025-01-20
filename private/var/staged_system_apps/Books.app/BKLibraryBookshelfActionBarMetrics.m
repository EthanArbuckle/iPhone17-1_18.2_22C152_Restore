@interface BKLibraryBookshelfActionBarMetrics
+ (id)sectionName;
- (UIColor)barTintColor;
- (UIColor)tintColor;
- (void)configureWithSection:(id)a3;
- (void)setBarTintColor:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation BKLibraryBookshelfActionBarMetrics

+ (id)sectionName
{
  return @"actionBar";
}

- (void)configureWithSection:(id)a3
{
  id v4 = a3;
  v5 = [v4 colorForKey:@"bar-tint-color"];
  [(BKLibraryBookshelfActionBarMetrics *)self setBarTintColor:v5];

  id v6 = [v4 colorForKey:@"tint-color"];

  [(BKLibraryBookshelfActionBarMetrics *)self setTintColor:v6];
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

- (void)setBarTintColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_barTintColor, 0);
}

@end