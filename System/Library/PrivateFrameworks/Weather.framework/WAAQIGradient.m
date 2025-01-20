@interface WAAQIGradient
- (NSArray)stops;
- (NSMutableArray)internalStops;
- (NSMutableDictionary)colorsByLocation;
- (NSMutableIndexSet)locationStops;
- (WAAQIGradient)initWithRange:(_NSRange)a3;
- (_NSRange)range;
- (id)gradientStopForLocation:(unint64_t)a3;
- (void)addGradientStop:(id)a3;
- (void)setInternalStops:(id)a3;
@end

@implementation WAAQIGradient

- (WAAQIGradient)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v14.receiver = self;
  v14.super_class = (Class)WAAQIGradient;
  v5 = [(WAAQIGradient *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_range.NSUInteger location = location;
    v5->_range.NSUInteger length = length;
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    internalStops = v6->_internalStops;
    v6->_internalStops = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263F089C8] indexSet];
    locationStops = v6->_locationStops;
    v6->_locationStops = (NSMutableIndexSet *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    colorsByLocation = v6->_colorsByLocation;
    v6->_colorsByLocation = (NSMutableDictionary *)v11;
  }
  return v6;
}

- (void)addGradientStop:(id)a3
{
  if (a3)
  {
    internalStops = self->_internalStops;
    id v5 = a3;
    [(NSMutableArray *)internalStops addObject:v5];
    colorsByLocation = self->_colorsByLocation;
    uint64_t v7 = [v5 color];
    v8 = NSNumber;
    [v5 location];
    uint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
    [(NSMutableDictionary *)colorsByLocation setObject:v7 forKey:v9];

    locationStops = self->_locationStops;
    [v5 location];
    float v12 = v11;

    [(NSMutableIndexSet *)locationStops addIndex:(unint64_t)v12];
  }
}

- (NSArray)stops
{
  return (NSArray *)[(NSMutableArray *)self->_internalStops sortedArrayUsingComparator:&__block_literal_global_1];
}

uint64_t __22__WAAQIGradient_stops__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 location];
  v6 = objc_msgSend(v4, "numberWithFloat:");
  uint64_t v7 = NSNumber;
  [v5 location];
  int v9 = v8;

  LODWORD(v10) = v9;
  float v11 = [v7 numberWithFloat:v10];
  uint64_t v12 = [v6 compare:v11];

  return v12;
}

- (id)gradientStopForLocation:(unint64_t)a3
{
  colorsByLocation = self->_colorsByLocation;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v7 = [(NSMutableDictionary *)colorsByLocation objectForKey:v6];

  if (!v7)
  {
    unint64_t v9 = [(NSMutableIndexSet *)self->_locationStops indexLessThanOrEqualToIndex:a3];
    unint64_t v10 = [(NSMutableIndexSet *)self->_locationStops indexGreaterThanOrEqualToIndex:a3];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v9 = [(NSMutableIndexSet *)self->_locationStops firstIndex];
    }
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v10 = [(NSMutableIndexSet *)self->_locationStops lastIndex];
    }
    float v11 = self->_colorsByLocation;
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:v9];
    v13 = [(NSMutableDictionary *)v11 objectForKey:v12];

    objc_super v14 = self->_colorsByLocation;
    v15 = [NSNumber numberWithUnsignedInteger:v10];
    v16 = [(NSMutableDictionary *)v14 objectForKey:v15];

    double v24 = 0.0;
    double v25 = 0.0;
    double v23 = 0.0;
    [v13 getRed:&v25 green:&v24 blue:&v23 alpha:0];
    double v21 = 0.0;
    double v22 = 0.0;
    double v20 = 0.0;
    [v16 getRed:&v22 green:&v21 blue:&v20 alpha:0];
    double v17 = 0.0;
    if (v9 != v10) {
      double v17 = ((double)a3 - (double)v9) / ((double)v10 - (double)v9);
    }
    uint64_t v7 = [MEMORY[0x263F1C550] colorWithRed:v25 - (v25 - v22) * v17 green:v24 - (v24 - v21) * v17 blue:v23 - (v23 - v20) * v17 alpha:1.0];
  }
  *(float *)&double v8 = (float)a3;
  v18 = +[WAAQIGradientStop gradientStopWithColor:v7 location:v8];

  return v18;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSMutableArray)internalStops
{
  return self->_internalStops;
}

- (void)setInternalStops:(id)a3
{
}

- (NSMutableIndexSet)locationStops
{
  return self->_locationStops;
}

- (NSMutableDictionary)colorsByLocation
{
  return self->_colorsByLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorsByLocation, 0);
  objc_storeStrong((id *)&self->_locationStops, 0);
  objc_storeStrong((id *)&self->_internalStops, 0);
}

@end