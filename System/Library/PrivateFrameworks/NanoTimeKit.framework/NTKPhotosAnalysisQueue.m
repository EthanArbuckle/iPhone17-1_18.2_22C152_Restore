@interface NTKPhotosAnalysisQueue
@end

@implementation NTKPhotosAnalysisQueue

void ___NTKPhotosAnalysisQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPhotosFaceView.analysisQ", v2);
  v1 = (void *)_NTKPhotosAnalysisQueue___analysisQueue;
  _NTKPhotosAnalysisQueue___analysisQueue = (uint64_t)v0;
}

@end