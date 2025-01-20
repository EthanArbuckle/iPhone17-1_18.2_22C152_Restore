@interface DetectedROI
- ($90F8316DFF8C7E624C13ADF498D66361)des;
- (BOOL)isPredictedFromPast;
- (BOOL)isReflectedLS;
- (BOOL)isTracked;
- (BOOL)isTrajectoryPruningPassed;
- (CGRect)LSRoi;
- (CGRect)roi;
- (DetectedROI)initWithTrackingSessionId:(unint64_t)a3 roiId:(int64_t)a4 andRoi:(CGRect)a5;
- (DetectedROI)initWithTrackingSessionId:(unint64_t)a3 roiId:(int64_t)a4 roi:(CGRect)a5 LSRoi:(CGRect)a6 confidence:(float)a7;
- (DetectedROI)initWithTrackingSessionId:(unint64_t)a3 roiId:(int64_t)a4 roi:(CGRect)a5 LSRoi:(CGRect)a6 descriptor:(id *)a7 propertiesForPostProcPipeVisualization:(id *)a8;
- (double)trajectoryFromPast;
- (float)ROIWOriginal;
- (float)ROIWSpatial;
- (float)ROIWStrongRepairInSpatial;
- (float)confidence;
- (int)lowSaliencyCnt;
- (int)predictedFromPastCnt;
- (int)trackID;
- (int)trackedCnt;
- (int64_t)roiId;
- (unint64_t)trackSessionId;
- (void)setConfidence:(float)a3;
- (void)setIsPredictedFromPast:(BOOL)a3;
- (void)setIsReflectedLS:(BOOL)a3;
- (void)setIsTracked:(BOOL)a3;
- (void)setIsTrajectoryPruningPassed:(BOOL)a3;
- (void)setLowSaliencyCnt:(int)a3;
- (void)setPredictedFromPastCnt:(int)a3;
- (void)setROIWOriginal:(float)a3;
- (void)setROIWSpatial:(float)a3;
- (void)setROIWStrongRepairInSpatial:(float)a3;
- (void)setRoi:(CGRect)a3;
- (void)setTrackID:(int)a3;
- (void)setTrackedCnt:(int)a3;
- (void)setTrajectoryFromPast:(DetectedROI *)self;
@end

@implementation DetectedROI

- (DetectedROI)initWithTrackingSessionId:(unint64_t)a3 roiId:(int64_t)a4 andRoi:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)DetectedROI;
  v11 = [(DetectedROI *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_trackSessionId = a3;
    v11->_roiId = a4;
    v11->_roi.origin.CGFloat x = x;
    v11->_roi.origin.CGFloat y = y;
    v11->_roi.size.CGFloat width = width;
    v11->_roi.size.CGFloat height = height;
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGFloat MidX = CGRectGetMidX(v19);
    CGFloat MidY = CGRectGetMidY(v12->_roi);
    v12->_centerPoint.CGFloat x = MidX;
    v12->_centerPoint.CGFloat y = MidY;
    CGSize size = CGRectNull.size;
    v12->_LSRoi.origin = CGRectNull.origin;
    v12->_LSRoi.CGSize size = size;
    v16 = v12;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v12;
}

- (DetectedROI)initWithTrackingSessionId:(unint64_t)a3 roiId:(int64_t)a4 roi:(CGRect)a5 LSRoi:(CGRect)a6 descriptor:(id *)a7 propertiesForPostProcPipeVisualization:(id *)a8
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  v14 = -[DetectedROI initWithTrackingSessionId:roiId:andRoi:](self, "initWithTrackingSessionId:roiId:andRoi:", a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v15 = v14;
  if (v14)
  {
    v14->_LSRoi.origin.CGFloat x = x;
    v14->_LSRoi.origin.CGFloat y = y;
    v14->_LSRoi.size.CGFloat width = width;
    v14->_LSRoi.size.CGFloat height = height;
    long long v16 = *(_OWORD *)&a7->var4;
    *(_OWORD *)&v14[1].super.isa = *(_OWORD *)&a7->var0;
    *(_OWORD *)&v14[1]._centerPoint.CGFloat y = v16;
    long long v17 = *(_OWORD *)&a7[1].var2;
    long long v18 = *(_OWORD *)&a7[2].var0;
    long long v19 = *(_OWORD *)&a7[3].var2;
    *(_OWORD *)&v14[1]._trackSessionId = *(_OWORD *)&a7[2].var4;
    *(_OWORD *)v14[1]._trajectoryFromPast = v19;
    *(_OWORD *)&v14[1]._trackID = v17;
    *(_OWORD *)&v14[1]._ROIWSpatial = v18;
    long long v20 = *(_OWORD *)&a7[4].var0;
    long long v21 = *(_OWORD *)&a7[4].var4;
    long long v22 = *(_OWORD *)&a7[6].var0;
    *(_OWORD *)&v14[1]._LSRoi.origin.CGFloat y = *(_OWORD *)&a7[5].var2;
    *(_OWORD *)&v14[1]._LSRoi.size.CGFloat height = v22;
    *(_OWORD *)&v14[1]._roi.origin.CGFloat y = v20;
    *(_OWORD *)&v14[1]._roi.size.CGFloat height = v21;
    v14->_trackID = a8->var0;
    v14->_isTracked = a8->var1;
    v14->_trackedCnt = a8->var3;
    v14->_isPredictedFromPast = a8->var2;
    *(void *)v14->_trajectoryFromPast = *(void *)&a8[1].var0;
    v14->_predictedFromPastCnt = a8->var4;
    v14->_lowSaliencyCnt = a8->var5;
    v14->_isTrajectoryPruningPassed = a8[1].var3;
    v14->_isReflectedLS = BYTE1(a8[1].var3);
    v23 = v14;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v15;
}

- (DetectedROI)initWithTrackingSessionId:(unint64_t)a3 roiId:(int64_t)a4 roi:(CGRect)a5 LSRoi:(CGRect)a6 confidence:(float)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  v11 = -[DetectedROI initWithTrackingSessionId:roiId:andRoi:](self, "initWithTrackingSessionId:roiId:andRoi:", a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v12 = v11;
  if (v11)
  {
    v11->_LSRoi.origin.CGFloat x = x;
    v11->_LSRoi.origin.CGFloat y = y;
    v11->_LSRoi.size.CGFloat width = width;
    v11->_LSRoi.size.CGFloat height = height;
    v11->_confidence = a7;
    v13 = v11;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v12;
}

- (unint64_t)trackSessionId
{
  return self->_trackSessionId;
}

- (int64_t)roiId
{
  return self->_roiId;
}

- (CGRect)roi
{
  double x = self->_roi.origin.x;
  double y = self->_roi.origin.y;
  double width = self->_roi.size.width;
  double height = self->_roi.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRoi:(CGRect)a3
{
  self->_roi = a3;
}

- (CGRect)LSRoi
{
  double x = self->_LSRoi.origin.x;
  double y = self->_LSRoi.origin.y;
  double width = self->_LSRoi.size.width;
  double height = self->_LSRoi.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- ($90F8316DFF8C7E624C13ADF498D66361)des
{
  long long v3 = *(_OWORD *)&self[11].var2;
  *(_OWORD *)&retstr[4].var0 = *(_OWORD *)&self[10].var4;
  *(_OWORD *)&retstr[4].var4 = v3;
  long long v4 = *(_OWORD *)&self[12].var4;
  *(_OWORD *)&retstr[5].var2 = *(_OWORD *)&self[12].var0;
  *(_OWORD *)&retstr[6].var0 = v4;
  long long v5 = *(_OWORD *)&self[8].var4;
  *(_OWORD *)&retstr[1].var2 = *(_OWORD *)&self[8].var0;
  *(_OWORD *)&retstr[2].var0 = v5;
  long long v6 = *(_OWORD *)&self[10].var0;
  *(_OWORD *)&retstr[2].var4 = *(_OWORD *)&self[9].var2;
  *(_OWORD *)&retstr[3].var2 = v6;
  long long v7 = *(_OWORD *)&self[7].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[6].var4;
  *(_OWORD *)&retstr->var4 = v7;
  return self;
}

- (int)trackID
{
  return self->_trackID;
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  self->_isTracked = a3;
}

- (BOOL)isPredictedFromPast
{
  return self->_isPredictedFromPast;
}

- (void)setIsPredictedFromPast:(BOOL)a3
{
  self->_isPredictedFromPast = a3;
}

- (int)predictedFromPastCnt
{
  return self->_predictedFromPastCnt;
}

- (void)setPredictedFromPastCnt:(int)a3
{
  self->_predictedFromPastCnt = a3;
}

- (int)trackedCnt
{
  return self->_trackedCnt;
}

- (void)setTrackedCnt:(int)a3
{
  self->_trackedCnt = a3;
}

- (int)lowSaliencyCnt
{
  return self->_lowSaliencyCnt;
}

- (void)setLowSaliencyCnt:(int)a3
{
  self->_lowSaliencyCnt = a3;
}

- (double)trajectoryFromPast
{
  return *(double *)(a1 + 80);
}

- (void)setTrajectoryFromPast:(DetectedROI *)self
{
  *(void *)self->_trajectoryFromPast = v2;
}

- (BOOL)isTrajectoryPruningPassed
{
  return self->_isTrajectoryPruningPassed;
}

- (void)setIsTrajectoryPruningPassed:(BOOL)a3
{
  self->_isTrajectoryPruningPassed = a3;
}

- (BOOL)isReflectedLS
{
  return self->_isReflectedLS;
}

- (void)setIsReflectedLS:(BOOL)a3
{
  self->_isReflectedLS = a3;
}

- (float)ROIWSpatial
{
  return self->_ROIWSpatial;
}

- (void)setROIWSpatial:(float)a3
{
  self->_ROIWSpatial = a3;
}

- (float)ROIWStrongRepairInSpatial
{
  return self->_ROIWStrongRepairInSpatial;
}

- (void)setROIWStrongRepairInSpatial:(float)a3
{
  self->_ROIWStrongRepairInSpatial = a3;
}

- (float)ROIWOriginal
{
  return self->_ROIWOriginal;
}

- (void)setROIWOriginal:(float)a3
{
  self->_ROIWOriginal = a3;
}

@end