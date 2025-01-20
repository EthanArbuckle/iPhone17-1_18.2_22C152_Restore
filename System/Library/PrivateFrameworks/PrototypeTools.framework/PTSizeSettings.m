@interface PTSizeSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)settingsControllerModule;
- (CGSize)sizeValue;
- (double)height;
- (double)width;
- (id)drillDownSummary;
- (void)setHeight:(double)a3;
- (void)setSizeValue:(CGSize)a3;
- (void)setWidth:(double)a3;
@end

@implementation PTSizeSettings

+ (id)settingsControllerModule
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = +[PTRow rowWithTitle:@"Width" valueKeyPath:@"width"];
  v3 = [v2 precision:1];
  v12[0] = v3;
  v4 = +[PTRow rowWithTitle:@"Height" valueKeyPath:@"height"];
  v5 = [v4 precision:1];
  v12[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  v7 = +[PTModule sectionWithRows:v6];
  v11 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v9 = +[PTModule moduleWithTitle:@"Size" contents:v8];

  return v9;
}

+ (BOOL)ignoresKey:(id)a3
{
  return [a3 isEqualToString:@"sizeValue"];
}

- (id)drillDownSummary
{
  v3 = NSString;
  [(PTSizeSettings *)self width];
  uint64_t v5 = v4;
  [(PTSizeSettings *)self height];
  return (id)[v3 stringWithFormat:@"(%.1g, %.1g)", v5, v6];
}

- (void)setSizeValue:(CGSize)a3
{
  double height = a3.height;
  [(PTSizeSettings *)self setWidth:a3.width];
  [(PTSizeSettings *)self setHeight:height];
}

- (CGSize)sizeValue
{
  [(PTSizeSettings *)self width];
  double v4 = v3;
  [(PTSizeSettings *)self height];
  double v6 = v5;
  double v7 = v4;
  result.double height = v6;
  result.width = v7;
  return result;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_double height = a3;
}

@end