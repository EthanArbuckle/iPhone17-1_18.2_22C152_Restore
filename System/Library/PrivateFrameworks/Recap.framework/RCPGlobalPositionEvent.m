@interface RCPGlobalPositionEvent
- (CGPoint)location;
- (RCPEventSenderProperties)senderProperties;
- (RCPGlobalPositionEvent)initWithLocation:(CGFloat)a3 zPosition:(double)a4 orientation:(__n128)a5 timestamp:(uint64_t)a6 senderProperties:(unint64_t)a7;
- (double)orientation;
- (double)zPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)timestamp;
@end

@implementation RCPGlobalPositionEvent

- (RCPGlobalPositionEvent)initWithLocation:(CGFloat)a3 zPosition:(double)a4 orientation:(__n128)a5 timestamp:(uint64_t)a6 senderProperties:(unint64_t)a7
{
  v13 = a8;
  v18.receiver = a1;
  v18.super_class = (Class)RCPGlobalPositionEvent;
  v14 = [(RCPGlobalPositionEvent *)&v18 init];
  v14->_location.x = a2;
  v14->_location.y = a3;
  v14->_zPosition = a4;
  *(__n128 *)&v14[1].super.isa = a5;
  senderProperties = v14->_senderProperties;
  v14->_timestamp = a7;
  v14->_senderProperties = v13;

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(RCPGlobalPositionEvent *)self location];
  uint64_t v6 = v5;
  [(RCPGlobalPositionEvent *)self location];
  uint64_t v8 = v7;
  [(RCPGlobalPositionEvent *)self zPosition];
  uint64_t v10 = v9;
  [(RCPGlobalPositionEvent *)self orientation];
  double v12 = v11;
  [(RCPGlobalPositionEvent *)self orientation];
  double v14 = v13;
  [(RCPGlobalPositionEvent *)self orientation];
  double v16 = v15;
  [(RCPGlobalPositionEvent *)self orientation];
  double v18 = v17;
  unint64_t v19 = [(RCPGlobalPositionEvent *)self timestamp];
  v20 = [(RCPGlobalPositionEvent *)self senderProperties];
  v21 = [v3 stringWithFormat:@"<%@: { Location: (%f, %f), zPosition: %f, Orientation: (%f, %f, %f, %f), Timestamp: %llu, Sender Properties: %@ }>", v4, v6, v8, v10, *(void *)&v12, *(void *)&v14, *(void *)&v16, *(void *)&v18, v19, v20];

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double zPosition = self->_zPosition;
  unint64_t timestamp = self->_timestamp;
  senderProperties = self->_senderProperties;
  double x = self->_location.x;
  double y = self->_location.y;
  long long v10 = *(_OWORD *)&self[1].super.isa;
  return (id)objc_msgSend(v4, "initWithLocation:zPosition:orientation:timestamp:senderProperties:", timestamp, senderProperties, x, y, zPosition, *(double *)&v10);
}

- (CGPoint)location
{
  objc_copyStruct(v4, &self->_location, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (double)orientation
{
  objc_copyStruct(&v2, (const void *)(a1 + 48), 16, 1, 0);
  return *(double *)&v2;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (RCPEventSenderProperties)senderProperties
{
  return (RCPEventSenderProperties *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

@end