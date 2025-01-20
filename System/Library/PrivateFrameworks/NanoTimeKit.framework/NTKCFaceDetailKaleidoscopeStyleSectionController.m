@interface NTKCFaceDetailKaleidoscopeStyleSectionController
+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4;
- (void)faceDidChangeResourceDirectory;
@end

@implementation NTKCFaceDetailKaleidoscopeStyleSectionController

+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 faceStyle] == 23 || objc_msgSend(v5, "faceStyle") == 223;
  BOOL v7 = a4 == 15 && v6;

  return v7;
}

- (void)faceDidChangeResourceDirectory
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCFaceDetailKaleidoscopeStyleSectionController;
  [(NTKCFaceDetailSectionController *)&v6 faceDidChangeResourceDirectory];
  v3 = [(NTKCFaceDetailEditOptionSectionController *)self selectedOptions];
  v4 = [v3 objectForKeyedSubscript:&unk_1F16E1B60];

  if ([v4 asset] == 1000)
  {
    id v5 = [(NTKCFaceDetailSectionController *)self cell];
    [v5 reloadVisibleCells];
  }
}

@end