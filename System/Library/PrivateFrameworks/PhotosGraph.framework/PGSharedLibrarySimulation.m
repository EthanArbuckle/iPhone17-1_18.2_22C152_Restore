@interface PGSharedLibrarySimulation
+ (BOOL)runSharedLibrarySimulationUsingCameraMetadataDirectoryPath:(id)a3 withProgressReporter:(id)a4 error:(id *)a5;
- (PGSharedLibrarySimulation)init;
@end

@implementation PGSharedLibrarySimulation

+ (BOOL)runSharedLibrarySimulationUsingCameraMetadataDirectoryPath:(id)a3 withProgressReporter:(id)a4 error:(id *)a5
{
  unint64_t v6 = sub_1D1EBDE60();
  uint64_t v8 = v7;
  id v9 = a4;
  sub_1D1AEB98C(v6, v8);
  swift_bridgeObjectRelease();

  return 1;
}

- (PGSharedLibrarySimulation)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PGSharedLibrarySimulation();
  return [(PGSharedLibrarySimulation *)&v3 init];
}

@end