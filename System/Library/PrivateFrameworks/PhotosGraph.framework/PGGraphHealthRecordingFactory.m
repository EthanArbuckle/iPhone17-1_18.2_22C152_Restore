@interface PGGraphHealthRecordingFactory
+ (id)graphUpdateHealthRecorderForChangeConsumer:(BOOL)a3 analytics:(id)a4;
@end

@implementation PGGraphHealthRecordingFactory

+ (id)graphUpdateHealthRecorderForChangeConsumer:(BOOL)a3 analytics:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [[PGGraphUpdateHealthRecorder alloc] initForChangeConsumer:v4 analytics:v5];

  return v6;
}

@end