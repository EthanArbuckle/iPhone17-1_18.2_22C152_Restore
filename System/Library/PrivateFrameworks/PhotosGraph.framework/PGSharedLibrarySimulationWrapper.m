@interface PGSharedLibrarySimulationWrapper
+ (BOOL)runSharedLibrarySimulationWrapperUsingCameraMetadataDirectoryPath:(id)a3 withProgressReporter:(id)a4 error:(id *)a5;
@end

@implementation PGSharedLibrarySimulationWrapper

+ (BOOL)runSharedLibrarySimulationWrapperUsingCameraMetadataDirectoryPath:(id)a3 withProgressReporter:(id)a4 error:(id *)a5
{
  return +[PGSharedLibrarySimulation runSharedLibrarySimulationUsingCameraMetadataDirectoryPath:a3 withProgressReporter:a4 error:a5];
}

@end