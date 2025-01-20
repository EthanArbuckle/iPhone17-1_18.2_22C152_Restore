@interface CLLocation(PLLocationHash)
- (id)pl_newSurroundingLocationsHashes;
- (uint64_t)pl_locationHash;
@end

@implementation CLLocation(PLLocationHash)

- (id)pl_newSurroundingLocationsHashes
{
  v9[16] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend(a1, "pl_locationHash");
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [NSNumber numberWithInt:v1];
  [v2 addObject:v3];

  PLGetGeohashCoordinates(v1);
  uint64_t v4 = 0;
  *(double *)v9 = v5;
  *(double *)&v9[1] = v6 + 1.0;
  *(double *)&v9[2] = v5;
  *(double *)&v9[3] = v6 + -1.0;
  *(double *)&v9[4] = v5 + 1.0;
  *(double *)&v9[5] = v6;
  *(double *)&v9[6] = v5 + -1.0;
  *(double *)&v9[7] = v6;
  *(double *)&v9[8] = v5 + 1.0;
  *(double *)&v9[9] = v6 + 1.0;
  *(double *)&v9[10] = v5 + -1.0;
  *(double *)&v9[11] = v6 + 1.0;
  *(double *)&v9[12] = v5 + 1.0;
  *(double *)&v9[13] = v6 + -1.0;
  *(double *)&v9[14] = v5 + -1.0;
  *(double *)&v9[15] = v6 + -1.0;
  do
  {
    v7 = objc_msgSend(NSNumber, "numberWithInt:", PLGetCoordinatesGeohash(*(double *)&v9[v4], *(double *)&v9[v4 + 1]));
    [v2 addObject:v7];

    v4 += 2;
  }
  while (v4 != 16);
  return v2;
}

- (uint64_t)pl_locationHash
{
  [a1 coordinate];
  return PLCalculateAreaHashImpl(14, 0, 0, v1, v2, 90.0, -180.0, -90.0, 180.0);
}

@end