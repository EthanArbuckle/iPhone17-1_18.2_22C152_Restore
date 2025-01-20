@interface PTTapToTrack
+ (BOOL)isSupported;
- (BOOL)addDetectionAndStartTrackingRect:(CGRect)a3 time:(id *)a4 colorBuffer:(__CVBuffer *)a5 disparityBuffer:(__CVBuffer *)a6;
- (NSMutableArray)detections;
- (PTTapToTrack)initWithCommandQueue:(id)a3;
- (id)addDetectionForNextFrameAt:(id *)a3 colorBuffer:(__CVBuffer *)a4 disparityBuffer:(__CVBuffer *)a5;
- (id)finalizeTrack;
- (id)getRectForPoint:(CGPoint)a3 colorBuffer:(__CVBuffer *)a4;
- (void)addDetectionAtTime:(id *)a3 rect:(CGRect)a4 disparityBuffer:(__CVBuffer *)a5;
- (void)resetTrack;
- (void)setDetections:(id)a3;
@end

@implementation PTTapToTrack

+ (BOOL)isSupported
{
  return MGGetBoolAnswer();
}

- (PTTapToTrack)initWithCommandQueue:(id)a3
{
  if ([(id)objc_opt_class() isSupported])
  {
    v9.receiver = self;
    v9.super_class = (Class)PTTapToTrack;
    v4 = [(PTTapToTrack *)&v9 init];
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F62B98] tracker];
      tracker = v4->_tracker;
      v4->_tracker = (FTCinematicTapToTrack *)v5;

      [(PTTapToTrack *)v4 resetTrack];
    }
    self = v4;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getRectForPoint:(CGPoint)a3 colorBuffer:(__CVBuffer *)a4
{
  tracker = self->_tracker;
  if (tracker)
  {
    -[FTCinematicTapToTrack predictRectForPoint:inColorBuffer:](tracker, "predictRectForPoint:inColorBuffer:", a4, a3.x, a3.y);
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  if (CGRectIsEmpty(*(CGRect *)&v5))
  {
    objc_super v9 = 0;
  }
  else
  {
    v10 = [PTTapToTrackPrediction alloc];
    *(float *)&double v11 = 0.0;
    objc_super v9 = -[PTTapToTrackPrediction initWithRect:confidence:](v10, "initWithRect:confidence:", (unsigned __int128)0, (unsigned __int128)0, v11);
  }

  return v9;
}

- (BOOL)addDetectionAndStartTrackingRect:(CGRect)a3 time:(id *)a4 colorBuffer:(__CVBuffer *)a5 disparityBuffer:(__CVBuffer *)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v13 = -[FTCinematicTapToTrack startTrackingRect:colorBuffer:](self->_tracker, "startTrackingRect:colorBuffer:", a5);
  if (v13)
  {
    long long v15 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    -[PTTapToTrack addDetectionAtTime:rect:disparityBuffer:](self, "addDetectionAtTime:rect:disparityBuffer:", &v15, a6, x, y, width, height);
  }
  return v13;
}

- (id)addDetectionForNextFrameAt:(id *)a3 colorBuffer:(__CVBuffer *)a4 disparityBuffer:(__CVBuffer *)a5
{
  double v21 = 0.0;
  long long v19 = 0u;
  long long v20 = 0u;
  tracker = self->_tracker;
  if (tracker)
  {
    [(FTCinematicTapToTrack *)tracker stepTrackingWithFrame:a4];
    uint64_t v10 = *((void *)&v19 + 1);
    uint64_t v9 = v19;
    uint64_t v12 = *((void *)&v20 + 1);
    uint64_t v11 = v20;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
  }
  if (CGRectIsEmpty(*(CGRect *)&v9))
  {
    int v13 = 0;
  }
  else
  {
    long long v17 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    -[PTTapToTrack addDetectionAtTime:rect:disparityBuffer:](self, "addDetectionAtTime:rect:disparityBuffer:", &v17, a5, v19, v20);
    v14 = [PTTapToTrackPrediction alloc];
    *(float *)&double v15 = v21;
    int v13 = -[PTTapToTrackPrediction initWithRect:confidence:](v14, "initWithRect:confidence:", v19, v20, v15);
  }

  return v13;
}

- (id)finalizeTrack
{
  v3 = [PTCinematographyCustomTrack alloc];
  v4 = [(PTTapToTrack *)self detections];
  uint64_t v5 = [(PTCinematographyCustomTrack *)v3 initWithDetections:v4];

  [(PTCinematographyCustomTrack *)v5 applyDetectionSmoothing];
  [(PTTapToTrack *)self resetTrack];

  return v5;
}

- (void)resetTrack
{
  self->_detections = (NSMutableArray *)objc_opt_new();

  MEMORY[0x1F41817F8]();
}

- (void)addDetectionAtTime:(id *)a3 rect:(CGRect)a4 disparityBuffer:(__CVBuffer *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v12 = [(NSMutableArray *)self->_detections count];
  int v13 = [(NSMutableArray *)self->_detections lastObject];
  [v13 focusDistance];
  int v15 = v14;

  int v23 = v15;
  if (v12) {
    v16 = (float *)&v23;
  }
  else {
    v16 = 0;
  }
  float v17 = PTDisparityInNormalizedRectFromPixelBufferWithPrior(102, a5, v16, x, y, width, height);
  v18 = [PTCinematographyDetection alloc];
  long long v21 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  *(float *)&double v19 = v17;
  long long v20 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v18, "initWithTime:rect:focusDistance:", &v21, x, y, width, height, v19);
  [(PTCinematographyDetection *)v20 setDetectionType:102];
  [(NSMutableArray *)self->_detections addObject:v20];
}

- (NSMutableArray)detections
{
  return self->_detections;
}

- (void)setDetections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detections, 0);

  objc_storeStrong((id *)&self->_tracker, 0);
}

@end