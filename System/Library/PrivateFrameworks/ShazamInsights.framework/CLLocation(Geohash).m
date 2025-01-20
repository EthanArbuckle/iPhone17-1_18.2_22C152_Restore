@interface CLLocation(Geohash)
- (double)sh_geoHashToCoordinates:()Geohash;
- (double)sh_roundCoordinateValuesToGeohashOfLength:()Geohash;
- (id)sh_geohashOfLength:()Geohash;
- (uint64_t)sh_toGeohash;
@end

@implementation CLLocation(Geohash)

- (uint64_t)sh_toGeohash
{
  return objc_msgSend(a1, "sh_geohashOfLength:", 12);
}

- (double)sh_roundCoordinateValuesToGeohashOfLength:()Geohash
{
  v2 = objc_msgSend(a1, "sh_geohashOfLength:");
  objc_msgSend(a1, "sh_geoHashToCoordinates:", v2);
  double v4 = v3;

  return v4;
}

- (id)sh_geohashOfLength:()Geohash
{
  uint64_t v3 = a3;
  unint64_t v5 = 0;
  unint64_t v6 = 1 << (5 * a3 - 1);
  double v7 = 180.0;
  double v8 = -180.0;
  double v9 = 90.0;
  double v10 = -90.0;
  do
  {
    double v11 = v8 + (v7 - v8) * 0.5;
    [a1 coordinate];
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
    [a1 coordinate];
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
  v17 = malloc_type_malloc(v3 + 1, 0xEF328385uLL);
  bzero(v17, v3 + 1);
  if (v3)
  {
    uint64_t v18 = 5 * v3 - 5;
    v19 = v17;
    do
    {
      *v19++ = a0123456789bcde[(v5 >> v18) & 0x1F];
      v18 -= 5;
      --v3;
    }
    while (v3);
  }
  v20 = (void *)[[NSString alloc] initWithCString:v17 encoding:4];
  if (v17) {
    free(v17);
  }
  return v20;
}

- (double)sh_geoHashToCoordinates:()Geohash
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = (const char *)[v3 UTF8String];
  size_t v5 = 5 * strlen(v4);
  *(void *)&double v6 = *(_OWORD *)&CLLocationCoordinate2DMake(0.0, 0.0);
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
    uint64_t v18 = shcore_log_object();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = *v4;
      int v21 = 138412546;
      id v22 = v3;
      __int16 v23 = 1024;
      int v24 = v19;
      _os_log_impl(&dword_2266BF000, v18, OS_LOG_TYPE_ERROR, "Invalid character in geohash %@: %c", (uint8_t *)&v21, 0x12u);
    }
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
    *(void *)&double v6 = *(_OWORD *)&CLLocationCoordinate2DMake(v13 + (v13 - v14) * 0.5, v15 + (v15 - v16) * 0.5);
  }

  return v6;
}

@end