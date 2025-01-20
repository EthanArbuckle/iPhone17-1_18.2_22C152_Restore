@interface STMapViewport
+ (BOOL)supportsSecureCoding;
- (NSArray)viewportVertices;
- (STMapViewport)initWithCoder:(id)a3;
- (double)eastLongitude;
- (double)northLatitude;
- (double)southLatitude;
- (double)timeSinceViewportChanged;
- (double)timeSinceViewportEnteredForeground;
- (double)westLongitude;
- (id)_aceContextObjectValue;
- (void)encodeWithCoder:(id)a3;
- (void)setEastLongitude:(double)a3;
- (void)setNorthLatitude:(double)a3;
- (void)setSouthLatitude:(double)a3;
- (void)setTimeSinceViewportChanged:(double)a3;
- (void)setTimeSinceViewportEnteredForeground:(double)a3;
- (void)setViewportVertices:(id)a3;
- (void)setWestLongitude:(double)a3;
@end

@implementation STMapViewport

- (void).cxx_destruct
{
}

- (void)setViewportVertices:(id)a3
{
}

- (NSArray)viewportVertices
{
  return self->_viewportVertices;
}

- (void)setTimeSinceViewportEnteredForeground:(double)a3
{
  self->_timeSinceViewportEnteredForeground = a3;
}

- (double)timeSinceViewportEnteredForeground
{
  return self->_timeSinceViewportEnteredForeground;
}

- (void)setTimeSinceViewportChanged:(double)a3
{
  self->_timeSinceViewportChanged = a3;
}

- (double)timeSinceViewportChanged
{
  return self->_timeSinceViewportChanged;
}

- (void)setWestLongitude:(double)a3
{
  self->_westLongitude = a3;
}

- (double)westLongitude
{
  return self->_westLongitude;
}

- (void)setEastLongitude:(double)a3
{
  self->_eastLongitude = a3;
}

- (double)eastLongitude
{
  return self->_eastLongitude;
}

- (void)setSouthLatitude:(double)a3
{
  self->_southLatitude = a3;
}

- (double)southLatitude
{
  return self->_southLatitude;
}

- (void)setNorthLatitude:(double)a3
{
  self->_northLatitude = a3;
}

- (double)northLatitude
{
  return self->_northLatitude;
}

- (STMapViewport)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STMapViewport;
  v5 = [(STSiriModelObject *)&v18 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_eastLongitude"];
    v5->_eastLongitude = v6;
    [v4 decodeDoubleForKey:@"_westLongitude"];
    v5->_westLongitude = v7;
    [v4 decodeDoubleForKey:@"_northLatitude"];
    v5->_northLatitude = v8;
    [v4 decodeDoubleForKey:@"_southLatitude"];
    v5->_southLatitude = v9;
    [v4 decodeDoubleForKey:@"_timeSinceViewportChanged"];
    v5->_timeSinceViewportChanged = v10;
    [v4 decodeDoubleForKey:@"_timeSinceViewportEnteredForeground"];
    v5->_timeSinceViewportEnteredForeground = v11;
    v12 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_viewportVertices"];
    viewportVertices = v5->_viewportVertices;
    v5->_viewportVertices = (NSArray *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STMapViewport;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_eastLongitude", self->_eastLongitude, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"_westLongitude" forKey:self->_westLongitude];
  [v4 encodeDouble:@"_northLatitude" forKey:self->_northLatitude];
  [v4 encodeDouble:@"_southLatitude" forKey:self->_southLatitude];
  [v4 encodeDouble:@"_timeSinceViewportChanged" forKey:self->_timeSinceViewportChanged];
  [v4 encodeDouble:@"_timeSinceViewportEnteredForeground" forKey:self->_timeSinceViewportEnteredForeground];
  [v4 encodeObject:self->_viewportVertices forKey:@"_viewportVertices"];
}

- (id)_aceContextObjectValue
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F64AA0]);
  [v3 setNorthLatitude:self->_northLatitude];
  [v3 setSouthLatitude:self->_southLatitude];
  [v3 setEastLongitude:self->_eastLongitude];
  [v3 setWestLongitude:self->_westLongitude];
  [v3 setTimeInSecondsSinceViewportChanged:self->_timeSinceViewportChanged];
  [v3 setTimeInSecondsSinceViewportEnteredForeground:self->_timeSinceViewportEnteredForeground];
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_viewportVertices, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v5 = self->_viewportVertices;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = objc_alloc_init(MEMORY[0x263F64AA8]);
        objc_msgSend(v10, "latitude", (void)v13);
        objc_msgSend(v11, "setLatitude:");
        [v10 longitude];
        objc_msgSend(v11, "setLongitude:");
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v3 setVertices:v4];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end