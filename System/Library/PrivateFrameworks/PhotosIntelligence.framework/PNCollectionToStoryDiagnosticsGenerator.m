@interface PNCollectionToStoryDiagnosticsGenerator
+ (void)clearAllFilesWithPhotoLibrary:(PHPhotoLibrary *)a3 completionHandler:(id)a4;
- (PNCollectionToStoryDiagnosticsGenerator)initWithPhotoLibrary:(id)a3 error:(id *)a4;
@end

@implementation PNCollectionToStoryDiagnosticsGenerator

- (PNCollectionToStoryDiagnosticsGenerator)initWithPhotoLibrary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CollectionToStoryDiagnosticsGenerator.init(photoLibrary:)();
  return self;
}

+ (void)clearAllFilesWithPhotoLibrary:(PHPhotoLibrary *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;
  sub_2594A97B4((uint64_t)&unk_26A38C3E8, (uint64_t)v7);
}

@end