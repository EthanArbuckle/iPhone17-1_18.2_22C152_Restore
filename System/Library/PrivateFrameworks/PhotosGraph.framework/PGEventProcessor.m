@interface PGEventProcessor
+ (BOOL)processPGGraphForMomentNodes:(id)a3 graphBuilder:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (PGEventProcessor)init;
@end

@implementation PGEventProcessor

+ (BOOL)processPGGraphForMomentNodes:(id)a3 graphBuilder:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_1D1990938(v8, v9);

  return 1;
}

- (PGEventProcessor)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGEventProcessor *)&v3 init];
}

@end