@interface DroppedPinMapItemKey
- (BOOL)isEqual:(id)a3;
- (DroppedPinMapItemKey)initWithCoordinate:(CLLocationCoordinate2D)a3;
- (unint64_t)hash;
@end

@implementation DroppedPinMapItemKey

- (DroppedPinMapItemKey)initWithCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v11.receiver = self;
  v11.super_class = (Class)DroppedPinMapItemKey;
  v5 = [(DroppedPinMapItemKey *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_coordinate.double latitude = latitude;
    v5->_coordinate.double longitude = longitude;
    v7 = +[NSNumber numberWithInt:(int)latitude];
    unint64_t v8 = (unint64_t)[v7 hash];
    v9 = +[NSNumber numberWithInt:(int)longitude];
    v6->_hash = (unint64_t)[v9 hash] ^ v8;
  }
  return v6;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DroppedPinMapItemKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int32x2_t v6 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL), vabdq_f64((float64x2_t)self->_coordinate, (float64x2_t)v5->_coordinate)));
    char v7 = v6.i8[0] & v6.i8[4];
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

@end