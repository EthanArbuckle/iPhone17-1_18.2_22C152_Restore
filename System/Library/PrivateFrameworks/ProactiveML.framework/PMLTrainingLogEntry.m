@interface PMLTrainingLogEntry
- (PMLTrainingLogEntry)initWithTimestamp:(double)a3 serverIteration:(unint64_t)a4;
- (double)timestamp;
- (unint64_t)serverIteration;
@end

@implementation PMLTrainingLogEntry

- (unint64_t)serverIteration
{
  return self->_serverIteration;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (PMLTrainingLogEntry)initWithTimestamp:(double)a3 serverIteration:(unint64_t)a4
{
  return 0;
}

@end