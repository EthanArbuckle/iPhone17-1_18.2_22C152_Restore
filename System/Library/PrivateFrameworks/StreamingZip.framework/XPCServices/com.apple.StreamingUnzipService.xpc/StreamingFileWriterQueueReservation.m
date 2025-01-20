@interface StreamingFileWriterQueueReservation
- (BOOL)isValid;
- (StreamingFileWriterQueueReservation)initWithReservationSize:(int64_t)a3;
- (int64_t)reservedSize;
- (void)setValid:(BOOL)a3;
@end

@implementation StreamingFileWriterQueueReservation

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (int64_t)reservedSize
{
  return self->_reservedSize;
}

- (StreamingFileWriterQueueReservation)initWithReservationSize:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)StreamingFileWriterQueueReservation;
  result = [(StreamingFileWriterQueueReservation *)&v5 init];
  if (result)
  {
    result->_reservedSize = a3;
    result->_valid = 1;
  }
  return result;
}

@end