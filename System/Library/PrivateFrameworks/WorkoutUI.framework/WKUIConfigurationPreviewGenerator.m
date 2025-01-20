@interface WKUIConfigurationPreviewGenerator
+ (id)uiImageRepresentationForBlastDoorDataSource:(id)a3 scale:(double)a4;
+ (id)uiImageRepresentationForWorkoutFileData:(id)a3;
@end

@implementation WKUIConfigurationPreviewGenerator

+ (id)uiImageRepresentationForWorkoutFileData:(id)a3
{
  return +[NLWorkoutConfigurationImageGenerator createImageFromData:a3];
}

+ (id)uiImageRepresentationForBlastDoorDataSource:(id)a3 scale:(double)a4
{
  return +[NLWorkoutConfigurationImageGenerator createImageFromBlastDoorDataSource:a3 scale:a4];
}

@end