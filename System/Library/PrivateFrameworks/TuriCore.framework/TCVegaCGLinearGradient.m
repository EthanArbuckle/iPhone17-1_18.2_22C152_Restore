@interface TCVegaCGLinearGradient
- (TCVegaCGLinearGradient)initWithDictionary:(id)a3;
- (TCVegaCGLinearGradient)initWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6;
- (void)addColorStopWithOffset:(double)a3 color:(id)a4;
- (void)fillWithContext:(CGContext *)a3;
@end

@implementation TCVegaCGLinearGradient

- (TCVegaCGLinearGradient)initWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6
{
  v14.receiver = self;
  v14.super_class = (Class)TCVegaCGLinearGradient;
  v10 = [(TCVegaCGLinearGradient *)&v14 init];
  v10->_x0 = a3;
  v10->_y0 = a4;
  v10->_x1 = a5;
  v10->_y1 = a6;
  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  colorStops = v10->_colorStops;
  v10->_colorStops = v11;

  return v10;
}

- (TCVegaCGLinearGradient)initWithDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"x1"];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"y1"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v4 objectForKeyedSubscript:@"x2"];
  [v11 doubleValue];
  double v13 = v12;

  objc_super v14 = [v4 objectForKeyedSubscript:@"y2"];
  [v14 doubleValue];
  double v16 = v15;

  v17 = [(TCVegaCGLinearGradient *)self initWithX0:v7 y0:v10 x1:v13 y1:v16];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"stops", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v24 = [v23 objectForKeyedSubscript:@"offset"];
        [v24 doubleValue];
        double v26 = v25;

        v27 = [v23 objectForKeyedSubscript:@"color"];
        [(TCVegaCGLinearGradient *)v17 addColorStopWithOffset:v27 color:v26];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v20);
  }

  return v17;
}

- (void)addColorStopWithOffset:(double)a3 color:(id)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  double v6 = +[TCVegaCGContext newColorFromString:a4];
  colorStops = self->_colorStops;
  v8 = [NSNumber numberWithDouble:a3];
  v10[0] = v8;
  v10[1] = v6;
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  [(NSMutableArray *)colorStops addObject:v9];
}

- (void)fillWithContext:(CGContext *)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  CGContextSaveGState(a3);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  Mutable = CFArrayCreateMutable(0, [(NSMutableArray *)self->_colorStops count], 0);
  [(NSMutableArray *)self->_colorStops count];
  MEMORY[0x270FA5388]();
  v8 = (const CGFloat *)((char *)v19 - v7);
  if ([(NSMutableArray *)self->_colorStops count])
  {
    unint64_t v9 = 0;
    do
    {
      double v10 = [(NSMutableArray *)self->_colorStops objectAtIndexedSubscript:v9];
      v11 = [v10 objectAtIndexedSubscript:0];
      [v11 doubleValue];
      v8[v9] = v12;
      double v13 = [v10 objectAtIndexedSubscript:1];

      CFArrayAppendValue(Mutable, v13);
      ++v9;
    }
    while (v9 < [(NSMutableArray *)self->_colorStops count]);
  }
  objc_super v14 = CGGradientCreateWithColors(DeviceRGB, Mutable, v8);
  double x0 = self->_x0;
  double y0 = self->_y0;
  double x1 = self->_x1;
  double y1 = self->_y1;
  CGContextClip(a3);
  v20.x = x0;
  v20.y = y0;
  v21.x = x1;
  v21.y = y1;
  CGContextDrawLinearGradient(a3, v14, v20, v21, 0);
  CGContextRestoreGState(a3);
  CGGradientRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  CFRelease(Mutable);
}

- (void).cxx_destruct
{
}

@end