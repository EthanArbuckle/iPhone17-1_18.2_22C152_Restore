@interface CLLocation
- (CLLocationCoordinate2D)_geoHashToCoordinates:(id)a3;
- (CLLocationCoordinate2D)roundCoordinateValuesToGeohashOfLength:(unint64_t)a3;
@end

@implementation CLLocation

- (CLLocationCoordinate2D)roundCoordinateValuesToGeohashOfLength:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 > 0xB)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "Geohash length is too big (%lu), maximum is 12", v3);
    }
    goto LABEL_24;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 1 << (5 * a3 - 1);
  double v7 = 180.0;
  double v8 = -180.0;
  double v9 = 90.0;
  double v10 = -90.0;
  do
  {
    double v11 = v8 + (v7 - v8) * 0.5;
    [(CLLocation *)self coordinate];
    if (v12 >= v11) {
      unint64_t v13 = v6;
    }
    else {
      unint64_t v13 = 0;
    }
    v5 |= v13;
    if (v6 == 1) {
      break;
    }
    if (v12 < v11) {
      double v7 = v8 + (v7 - v8) * 0.5;
    }
    else {
      double v8 = v8 + (v7 - v8) * 0.5;
    }
    [(CLLocation *)self coordinate];
    if (v14 >= v10 + (v9 - v10) * 0.5)
    {
      double v10 = v10 + (v9 - v10) * 0.5;
      unint64_t v15 = v6 >> 1;
    }
    else
    {
      double v9 = v10 + (v9 - v10) * 0.5;
      unint64_t v15 = 0;
    }
    v5 |= v15;
    BOOL v16 = v6 > 3;
    v6 >>= 2;
  }
  while (v16);
  v17 = malloc_type_malloc(v3 + 1, 0x9F4DE9D5uLL);
  if (!v17)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "Failed to allocate %lu bytes for the geohash", v3 + 1);
    }
LABEL_24:
    id v21 = 0;
    double v23 = 0.0;
    double v25 = 0.0;
    goto LABEL_19;
  }
  v18 = v17;
  bzero(v17, v3 + 1);
  if (v3)
  {
    uint64_t v19 = 5 * v3 - 5;
    v20 = v18;
    do
    {
      *v20++ = a0123456789bcde[(v5 >> v19) & 0x1F];
      v19 -= 5;
      --v3;
    }
    while (v3);
  }
  id v21 = [objc_alloc((Class)NSString) initWithCString:v18 encoding:4];
  [(CLLocation *)self _geoHashToCoordinates:v21];
  double v23 = v22;
  double v25 = v24;
  free(v18);
LABEL_19:

  double v26 = v23;
  double v27 = v25;
  result.longitude = v27;
  result.latitude = v26;
  return result;
}

- (CLLocationCoordinate2D)_geoHashToCoordinates:(id)a3
{
  v4 = (const char *)[a3 UTF8String];
  size_t v5 = 5 * strlen(v4);
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(0.0, 0.0);
  size_t v7 = strlen(v4);
  if (v7)
  {
    size_t v8 = v7;
    uint64_t v9 = 0;
    size_t v10 = v5 - 5;
    while (1)
    {
      double v11 = memchr("0123456789bcdefghjkmnpqrstuvwxyz", *v4, 0x21uLL);
      if (!v11) {
        break;
      }
      v9 |= (v11 - "0123456789bcdefghjkmnpqrstuvwxyz") << v10;
      ++v4;
      v10 -= 5;
      if (!--v8) {
        goto LABEL_7;
      }
    }
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "Invalid character in geohash %@: %c", a3, *v4 message];
    }
    double latitude = v6.latitude;
    double longitude = v6.longitude;
  }
  else
  {
    uint64_t v9 = 0;
LABEL_7:
    unint64_t v12 = 1 << (v5 - 1);
    double v13 = -90.0;
    double v14 = 90.0;
    double v15 = -180.0;
    double v16 = 180.0;
    do
    {
      if ((v12 & v9) != 0) {
        double v15 = v15 + (v16 - v15) * 0.5;
      }
      else {
        double v16 = v15 + (v16 - v15) * 0.5;
      }
      if (v12 == 1) {
        break;
      }
      if ((v9 & (v12 >> 1)) != 0) {
        double v13 = v13 + (v14 - v13) * 0.5;
      }
      else {
        double v14 = v13 + (v14 - v13) * 0.5;
      }
      BOOL v17 = v12 > 3;
      v12 >>= 2;
    }
    while (v17);
    double v18 = v15 + (v15 - v16) * 0.5;
    double v19 = v13 + (v13 - v14) * 0.5;
    CLLocationCoordinate2D v22 = CLLocationCoordinate2DMake(v19, v18);
    double longitude = v22.longitude;
    double latitude = v22.latitude;
  }
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

@end