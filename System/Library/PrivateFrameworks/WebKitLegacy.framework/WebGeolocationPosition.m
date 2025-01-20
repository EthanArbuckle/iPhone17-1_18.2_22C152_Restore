@interface WebGeolocationPosition
- (WebGeolocationPosition)initWithGeolocationPosition:(void *)a3;
- (WebGeolocationPosition)initWithTimestamp:(double)a3 latitude:(double)a4 longitude:(double)a5 accuracy:(double)a6;
- (void)dealloc;
@end

@implementation WebGeolocationPosition

- (WebGeolocationPosition)initWithTimestamp:(double)a3 latitude:(double)a4 longitude:(double)a5 accuracy:(double)a6
{
  v23.receiver = self;
  v23.super_class = (Class)WebGeolocationPosition;
  v10 = [(WebGeolocationPosition *)&v23 init];
  if (v10)
  {
    *(double *)v12 = a3;
    *(double *)&v12[1] = a4;
    *(double *)&v12[2] = a5;
    *(double *)&v12[3] = a6;
    char v13 = 0;
    char v14 = 0;
    char v15 = 0;
    char v16 = 0;
    char v17 = 0;
    char v18 = 0;
    char v19 = 0;
    char v20 = 0;
    char v21 = 0;
    char v22 = 0;
    v10->_internal = [[WebGeolocationPositionInternal alloc] initWithCoreGeolocationPosition:v12];
  }
  return v10;
}

- (WebGeolocationPosition)initWithGeolocationPosition:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WebGeolocationPosition;
  v4 = [(WebGeolocationPosition *)&v6 init];
  if (v4) {
    v4->_internal = [[WebGeolocationPositionInternal alloc] initWithCoreGeolocationPosition:a3];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebGeolocationPosition;
  [(WebGeolocationPosition *)&v3 dealloc];
}

@end