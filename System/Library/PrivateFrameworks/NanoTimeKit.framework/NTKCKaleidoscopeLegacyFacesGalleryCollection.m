@interface NTKCKaleidoscopeLegacyFacesGalleryCollection
+ (id)defaultFaceForDevice:(id)a3;
- (id)title;
@end

@implementation NTKCKaleidoscopeLegacyFacesGalleryCollection

- (id)title
{
  if (_os_feature_enabled_impl())
  {
    v3 = NSString;
    v7.receiver = self;
    v7.super_class = (Class)NTKCKaleidoscopeLegacyFacesGalleryCollection;
    v4 = [(NTKCKaleidoscopeFacesGalleryCollection *)&v7 title];
    v5 = [v3 stringWithFormat:@"%@ (Legacy)", v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)defaultFaceForDevice:(id)a3
{
  return +[NTKFace defaultFaceOfStyle:23 forDevice:a3];
}

@end