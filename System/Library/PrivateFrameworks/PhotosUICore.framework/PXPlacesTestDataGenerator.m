@interface PXPlacesTestDataGenerator
- (PXPlacesTestDataGenerator)init;
- (id)generateOffsetArray:(double)a3 insert:(BOOL)a4;
- (unint64_t)generateDataPointsFromLocation:(CLLocationCoordinate2D)a3 toLocation:(CLLocationCoordinate2D)a4 longDir:(int64_t)a5 currentCount:(unint64_t)a6;
- (void)generateTestImages:(unint64_t)a3 fromLocation:(CLLocationCoordinate2D)a4 toLocation:(CLLocationCoordinate2D)a5 atEnd:(id)a6;
@end

@implementation PXPlacesTestDataGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPoints, 0);
  objc_storeStrong((id *)&self->_longOffsets, 0);
  objc_storeStrong((id *)&self->_latOffsets, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
}

- (void)generateTestImages:(unint64_t)a3 fromLocation:(CLLocationCoordinate2D)a4 toLocation:(CLLocationCoordinate2D)a5 atEnd:(id)a6
{
  CLLocationDegrees longitude = a5.longitude;
  CLLocationDegrees latitude = a5.latitude;
  CLLocationDegrees v8 = a4.longitude;
  CLLocationDegrees v9 = a4.latitude;
  id v12 = a6;
  if (a3) {
    self->_max = a3;
  }
  self->_from.CLLocationDegrees latitude = v9;
  self->_from.CLLocationDegrees longitude = v8;
  self->_to.CLLocationDegrees latitude = latitude;
  self->_to.CLLocationDegrees longitude = longitude;
  generationQueue = self->_generationQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PXPlacesTestDataGenerator_generateTestImages_fromLocation_toLocation_atEnd___block_invoke;
  v15[3] = &unk_1E5DD12A8;
  v15[4] = self;
  id v16 = v12;
  CLLocationDegrees v17 = v9;
  CLLocationDegrees v18 = v8;
  CLLocationDegrees v19 = latitude;
  CLLocationDegrees v20 = longitude;
  id v14 = v12;
  dispatch_async(generationQueue, v15);
}

uint64_t __78__PXPlacesTestDataGenerator_generateTestImages_fromLocation_toLocation_atEnd___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 72) count])
  {
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
    goto LABEL_16;
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "generateOffsetArray:insert:", 1, vabdd_f64(*(double *)(a1 + 48), *(double *)(a1 + 64)));
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  double v6 = vabdd_f64(*(double *)(a1 + 56), *(double *)(a1 + 72));
  if (v6 > 180.0) {
    double v6 = 360.0 - v6;
  }
  uint64_t v7 = [*(id *)(a1 + 32) generateOffsetArray:0 insert:v6];
  uint64_t v8 = *(void *)(a1 + 32);
  CLLocationDegrees v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = v7;

  v10 = *(void **)(a1 + 32);
  if (v10[4])
  {
    unint64_t v11 = 0;
    do
    {
      unint64_t v11 = objc_msgSend(v10, "generateDataPointsFromLocation:toLocation:longDir:currentCount:", 1, v11, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
      v10 = *(void **)(a1 + 32);
      unint64_t v12 = v10[4];
      if (v11 < v12)
      {
        unint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "generateDataPointsFromLocation:toLocation:longDir:currentCount:", -1, v11, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 48), *(double *)(a1 + 56));
        v10 = *(void **)(a1 + 32);
        unint64_t v12 = v10[4];
      }
      if (v11 < v12)
      {
        CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(a1 + 64), *(CLLocationDegrees *)(a1 + 56));
        CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(a1 + 48), *(CLLocationDegrees *)(a1 + 72));
        unint64_t v11 = objc_msgSend(v10, "generateDataPointsFromLocation:toLocation:longDir:currentCount:", 1, v11, v13.latitude, v13.longitude, v14.latitude, v14.longitude);
        v10 = *(void **)(a1 + 32);
        unint64_t v12 = v10[4];
      }
      if (v11 < v12)
      {
        CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(a1 + 48), *(CLLocationDegrees *)(a1 + 72));
        CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(a1 + 64), *(CLLocationDegrees *)(a1 + 56));
        unint64_t v11 = objc_msgSend(v10, "generateDataPointsFromLocation:toLocation:longDir:currentCount:", -1, v11, v15.latitude, v15.longitude, v16.latitude, v16.longitude);
        v10 = *(void **)(a1 + 32);
        unint64_t v12 = v10[4];
      }
    }
    while (v11 < v12);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
LABEL_16:
    CLLocationDegrees v17 = *(uint64_t (**)(void))(result + 16);
    return v17();
  }
  return result;
}

- (unint64_t)generateDataPointsFromLocation:(CLLocationCoordinate2D)a3 toLocation:(CLLocationCoordinate2D)a4 longDir:(int64_t)a5 currentCount:(unint64_t)a6
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v11 = a3.latitude <= a4.latitude;
  double v12 = 1.0;
  if (!v11) {
    double v12 = -1.0;
  }
  double v35 = v12;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obj = self->_latOffsets;
  uint64_t v37 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v44;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v44 != v36) {
        objc_enumerationMutation(obj);
      }
      uint64_t v38 = v13;
      [*(id *)(*((void *)&v43 + 1) + 8 * v13) doubleValue];
      double v15 = v14;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      CLLocationCoordinate2D v16 = self->_longOffsets;
      uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        double v19 = latitude + v35 * v15;
        uint64_t v20 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v40 != v20) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v39 + 1) + 8 * i) doubleValue];
            double v23 = longitude + (double)a5 * v22;
            if (fabs(v23) > 180.0)
            {
              if (v23 <= 0.0) {
                double v23 = v23 + 360.0;
              }
              else {
                double v23 = v23 + -360.0;
              }
            }
            v24 = [PXPlacesTestDataPoint alloc];
            v25 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a6 + i);
            CLLocationCoordinate2D v26 = CLLocationCoordinate2DMake(v19, v23);
            v27 = -[PXPlacesTestDataPoint initWithName:location:](v24, "initWithName:location:", v25, v26.latitude, v26.longitude);

            [(NSMutableArray *)self->_dataPoints addObject:v27];
            unint64_t max = self->_max;

            if (a6 + i + 1 == max)
            {
              a6 += i + 1;
              goto LABEL_22;
            }
          }
          a6 += i;
          uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_22:

      if (a6 == self->_max) {
        break;
      }
      uint64_t v13 = v38 + 1;
      if (v38 + 1 == v37)
      {
        uint64_t v37 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v37) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (a6 < self->_max)
  {
    v29 = [PXPlacesTestDataPoint alloc];
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a6);
    CLLocationCoordinate2D v31 = CLLocationCoordinate2DMake(-9999.0, -9999.0);
    v32 = -[PXPlacesTestDataPoint initWithName:location:](v29, "initWithName:location:", v30, v31.latitude, v31.longitude);

    [(NSMutableArray *)self->_dataPoints addObject:v32];
    ++a6;
  }
  return a6;
}

- (id)generateOffsetArray:(double)a3 insert:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = objc_opt_new();
  double v7 = 0.0;
  do
  {
    uint64_t v8 = [NSNumber numberWithDouble:v7];
    if (v4) {
      [v6 insertObject:v8 atIndex:0];
    }
    else {
      [v6 addObject:v8];
    }

    double v9 = a3 * 0.5;
    if (a3 * 0.5 <= 0.0001) {
      break;
    }
    a3 = a3 - v9;
    double v7 = v7 + v9;
  }
  while (a3 > 0.0);
  return v6;
}

- (PXPlacesTestDataGenerator)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXPlacesTestDataGenerator;
  v2 = [(PXPlacesTestDataGenerator *)&v9 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_unint64_t max = 100;
    v2->_from = CLLocationCoordinate2DMake(47.608013, 122.335167);
    v3->_to = CLLocationCoordinate2DMake(28.538336, 81.379234);
    dispatch_queue_t v4 = dispatch_queue_create("serializer", 0);
    generationQueue = v3->_generationQueue;
    v3->_generationQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    dataPoints = v3->_dataPoints;
    v3->_dataPoints = (NSMutableArray *)v6;
  }
  return v3;
}

@end