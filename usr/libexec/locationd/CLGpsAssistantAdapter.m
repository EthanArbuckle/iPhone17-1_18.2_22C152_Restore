@interface CLGpsAssistantAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLGpsAssistantAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)setDirectionOfTravelAssistance:(DirectionOfTravelAssistance *)a3;
- (void)setMapMatchedPositionAssistance:(MapMatchedPositionAssistance *)a3;
- (void)setTunnelBridgeAssistance:(TunnelBridgeAssistance *)a3;
- (void)setTunnelEndPointPositionAssistance:(TunnelEndPositionAssistance *)a3;
- (void)setVehicleGyroAssistance:(double)a3 vehicleGyro:(id *)a4;
- (void)setVehicleSpeedAssistance:(double)a3 vehicleSpeed:(id *)a4;
@end

@implementation CLGpsAssistantAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102487568 != -1) {
    dispatch_once(&qword_102487568, &stru_102321AB0);
  }
  return (id)qword_102487560;
}

- (CLGpsAssistantAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLGpsAssistantAdapter;
  return [(CLGpsAssistantAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLGpsAssistantProtocol outboundProtocol:&OBJC_PROTOCOL___CLGpsAssistantClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AB0DCC();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)doAsync:(id)a3
{
  v4 = [(CLGpsAssistantAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLGpsAssistantAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)setVehicleSpeedAssistance:(double)a3 vehicleSpeed:(id *)a4
{
  double v4 = a3;
  sub_101376360((unsigned __int8 *)[(CLGpsAssistantAdapter *)self adaptee], &v4, (uint64_t)a4);
}

- (void)setVehicleGyroAssistance:(double)a3 vehicleGyro:(id *)a4
{
  double v4 = a3;
  sub_1013766B0((uint64_t)[(CLGpsAssistantAdapter *)self adaptee], &v4, &a4->var0);
}

- (void)setDirectionOfTravelAssistance:(DirectionOfTravelAssistance *)a3
{
  double v4 = [(CLGpsAssistantAdapter *)self adaptee];

  sub_1013769D8((uint64_t)v4, (uint64_t)a3);
}

- (void)setMapMatchedPositionAssistance:(MapMatchedPositionAssistance *)a3
{
  double v4 = [(CLGpsAssistantAdapter *)self adaptee];

  sub_101376AB8((uint64_t)v4, a3);
}

- (void)setTunnelBridgeAssistance:(TunnelBridgeAssistance *)a3
{
  double v4 = [(CLGpsAssistantAdapter *)self adaptee];

  sub_101376B8C((uint64_t)v4, a3);
}

- (void)setTunnelEndPointPositionAssistance:(TunnelEndPositionAssistance *)a3
{
  double v4 = [(CLGpsAssistantAdapter *)self adaptee];

  sub_101376C60((uint64_t)v4, (uint64_t)a3);
}

@end