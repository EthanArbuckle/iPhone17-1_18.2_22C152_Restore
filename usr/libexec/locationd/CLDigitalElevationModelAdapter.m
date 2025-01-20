@interface CLDigitalElevationModelAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAltitude:(void *)a3 rel:(int *)a4 undulation:(double *)a5;
- (BOOL)syncgetAltitude:(void *)a3 rel:(int *)a4 undulation:(double *)a5 feedToAltFilter:(BOOL)a6;
- (CLDigitalElevationModelAdapter)init;
- (void)beginService;
- (void)cldem;
- (void)clear;
- (void)downloadAvailabilityFile:(double)a3;
- (void)downloadIfNeeded:(id)a3 signalQuality:(BOOL)a4 allowCenterOverCellular:(BOOL)a5;
- (void)downloadIfNeeded:(id)a3 signalQuality:(BOOL)a4 allowCenterOverCellular:(BOOL)a5 ringsToDownloadOverCellular:(int)a6;
- (void)endService;
- (void)setCldem:(void *)a3;
- (void)updateAirborneActivity:(BOOL)a3;
- (void)updateComputeDemFlatnessMetric:(BOOL)a3;
- (void)updateMotion:(int)a3 conf:(int)a4;
- (void)updateTunnelBridgeAssistance:(TunnelBridgeAssistance *)a3;
@end

@implementation CLDigitalElevationModelAdapter

- (BOOL)syncgetAltitude:(void *)a3 rel:(int *)a4 undulation:(double *)a5 feedToAltFilter:(BOOL)a6
{
  return sub_100057FFC((uint64_t)self->_cldem, (uint64_t)a3, a4, a5, a6);
}

- (BOOL)syncgetAltitude:(void *)a3 rel:(int *)a4 undulation:(double *)a5
{
  return [(CLDigitalElevationModelAdapter *)self syncgetAltitude:a3 rel:a4 undulation:a5 feedToAltFilter:0];
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (id)getSilo
{
  if (qword_102485A60 != -1) {
    dispatch_once(&qword_102485A60, &stru_102314460);
  }
  return (id)qword_102485A58;
}

- (CLDigitalElevationModelAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDigitalElevationModelAdapter;
  return [(CLDigitalElevationModelAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLDigitalElevationModelPublicProtocol outboundProtocol:&OBJC_PROTOCOL___CLDigitalElevationModelClientProtocol];
}

- (void)beginService
{
  self->_cldem = (void *)sub_10115657C((uint64_t)[(CLDigitalElevationModelAdapter *)self universe]);
}

- (void)endService
{
  sub_10115666C((uint64_t)self->_cldem);
  cldem = self->_cldem;
  if (cldem) {
    (*(void (**)(void *))(*(void *)cldem + 8))(cldem);
  }
  self->_cldem = 0;
}

- (void)clear
{
}

- (void)updateMotion:(int)a3 conf:(int)a4
{
}

- (void)updateAirborneActivity:(BOOL)a3
{
}

- (void)updateTunnelBridgeAssistance:(TunnelBridgeAssistance *)a3
{
  cldem = self->_cldem;
  long long v5 = *(_OWORD *)&a3->var2;
  long long v4 = *(_OWORD *)&a3->var4;
  cldem[31] = *(_OWORD *)&a3->var0;
  cldem[32] = v5;
  cldem[33] = v4;
}

- (void)downloadIfNeeded:(id)a3 signalQuality:(BOOL)a4 allowCenterOverCellular:(BOOL)a5
{
  BOOL v5 = a5;
  cldem = self->_cldem;
  (*((void (**)(void *__return_ptr, id, SEL))a3 + 2))(v8, a3, a2);
  sub_101156CB4((uint64_t)cldem, (uint64_t)v8, a4, v5, 0);
}

- (void)downloadIfNeeded:(id)a3 signalQuality:(BOOL)a4 allowCenterOverCellular:(BOOL)a5 ringsToDownloadOverCellular:(int)a6
{
  BOOL v7 = a5;
  cldem = self->_cldem;
  (*((void (**)(void *__return_ptr, id, SEL))a3 + 2))(v10, a3, a2);
  sub_101156CB4((uint64_t)cldem, (uint64_t)v10, a4, v7, a6);
}

- (void)downloadAvailabilityFile:(double)a3
{
  double v3 = a3;
  sub_101157538((uint64_t)self->_cldem, &v3);
}

- (void)updateComputeDemFlatnessMetric:(BOOL)a3
{
}

- (void)cldem
{
  return self->_cldem;
}

- (void)setCldem:(void *)a3
{
  self->_cldem = a3;
}

@end