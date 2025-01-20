@interface PCMapRoute
+ (BOOL)supportsSecureCoding;
+ (id)decodeFromBlindChannelData:(id)a3;
- (BOOL)hasEndLocation;
- (PCMapLocation)endLocation;
- (PCMapLocation)startLocation;
- (PCMapRoute)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsBlindChannelData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEndLocation:(id)a3;
- (void)setHasEndLocation:(BOOL)a3;
- (void)setStartLocation:(id)a3;
@end

@implementation PCMapRoute

- (PCMapRoute)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PCMapRoute;
  v4 = [(PCMapRoute *)&v6 init];
  if (v4)
  {
    -[PCMapRoute setStartLocation:](v4, "setStartLocation:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"startLocation"]);
    -[PCMapRoute setEndLocation:](v4, "setEndLocation:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"endLocation"]);
    -[PCMapRoute setHasEndLocation:](v4, "setHasEndLocation:", [a3 decodeBoolForKey:@"hasEndLocation"]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PCMapRoute;
  [(PCMapRoute *)&v3 dealloc];
}

+ (id)decodeFromBlindChannelData:(id)a3
{
  uint64_t v6 = 0;
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a3 error:&v6];
  v4 = (void *)[v3 decodeObjectOfClass:objc_opt_class() forKey:@"Custom Data"];
  if (!v4) {
    v4 = (void *)[v3 decodeObjectOfClass:objc_opt_class() forKey:@"Custom Data"];
  }
  [v3 finishDecoding];

  return v4;
}

- (id)encodeAsBlindChannelData
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeObject:self forKey:@"Custom Data"];
  v4 = (void *)[v3 encodedData];
  [v3 finishEncoding];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStartLocation:", (id)-[PCMapLocation copy](self->_startLocation, "copy"));
  objc_msgSend(v4, "setEndLocation:", (id)-[PCMapLocation copy](self->_endLocation, "copy"));
  [v4 setHasEndLocation:self->_hasEndLocation];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_startLocation forKey:@"startLocation"];
  [a3 encodeObject:self->_endLocation forKey:@"endLocation"];
  if (self->_hasEndLocation)
  {
    [a3 encodeBool:1 forKey:@"hasEndLocation"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCMapLocation)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(id)a3
{
}

- (PCMapLocation)endLocation
{
  return self->_endLocation;
}

- (void)setEndLocation:(id)a3
{
}

- (BOOL)hasEndLocation
{
  return self->_hasEndLocation;
}

- (void)setHasEndLocation:(BOOL)a3
{
  self->_hasEndLocation = a3;
}

@end