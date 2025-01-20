@interface SXHorizontalStackLayout
- (NSMutableDictionary)positions;
- (NSMutableDictionary)widths;
- (NSString)description;
- (SXHorizontalStackLayout)init;
- (double)positionForIdentifier:(id)a3;
- (double)widthForIdentifier:(id)a3;
- (void)setPosition:(double)a3 forIdentifier:(id)a4;
- (void)setWidth:(double)a3 forIdentifier:(id)a4;
@end

@implementation SXHorizontalStackLayout

- (SXHorizontalStackLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)SXHorizontalStackLayout;
  v2 = [(SXHorizontalStackLayout *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    widths = v2->_widths;
    v2->_widths = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    positions = v2->_positions;
    v2->_positions = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (double)widthForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SXHorizontalStackLayout *)self widths];
  v6 = [v5 objectForKey:v4];

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (double)positionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SXHorizontalStackLayout *)self positions];
  v6 = [v5 objectForKey:v4];

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (void)setWidth:(double)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v8 = [(SXHorizontalStackLayout *)self widths];
  double v7 = [NSNumber numberWithDouble:a3];
  [v8 setObject:v7 forKey:v6];
}

- (void)setPosition:(double)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v8 = [(SXHorizontalStackLayout *)self positions];
  double v7 = [NSNumber numberWithDouble:a3];
  [v8 setObject:v7 forKey:v6];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(SXHorizontalStackLayout *)self positions];
  id v6 = [(SXHorizontalStackLayout *)self widths];
  double v7 = [v3 stringWithFormat:@"<%@: %p\nPositions: %@ \nWidths: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (NSMutableDictionary)widths
{
  return self->_widths;
}

- (NSMutableDictionary)positions
{
  return self->_positions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positions, 0);
  objc_storeStrong((id *)&self->_widths, 0);
}

@end