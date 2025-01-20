@interface PTPointSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)settingsControllerModule;
- (CGPoint)pointValue;
- (double)x;
- (double)y;
- (id)drillDownSummary;
- (void)setPointValue:(CGPoint)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
@end

@implementation PTPointSettings

+ (id)settingsControllerModule
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = +[PTRow rowWithTitle:@"X" valueKeyPath:@"x"];
  v3 = [v2 precision:3];
  v12[0] = v3;
  v4 = +[PTRow rowWithTitle:@"Y" valueKeyPath:@"y"];
  v5 = [v4 precision:3];
  v12[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  v7 = +[PTModule sectionWithRows:v6];
  v11 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v9 = +[PTModule moduleWithTitle:@"Point" contents:v8];

  return v9;
}

+ (BOOL)ignoresKey:(id)a3
{
  return [a3 isEqualToString:@"pointValue"];
}

- (id)drillDownSummary
{
  v3 = NSString;
  [(PTPointSettings *)self x];
  uint64_t v5 = v4;
  [(PTPointSettings *)self y];
  return (id)[v3 stringWithFormat:@"(%.3g, %.3g)", v5, v6];
}

- (void)setPointValue:(CGPoint)a3
{
  double y = a3.y;
  [(PTPointSettings *)self setX:a3.x];
  [(PTPointSettings *)self setY:y];
}

- (CGPoint)pointValue
{
  [(PTPointSettings *)self x];
  double v4 = v3;
  [(PTPointSettings *)self y];
  double v6 = v5;
  double v7 = v4;
  result.double y = v6;
  result.x = v7;
  return result;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_double y = a3;
}

@end