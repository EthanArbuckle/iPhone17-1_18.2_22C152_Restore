@interface RCMultipleWaveformsViewController
+ (id)viewControllerWithWaveformContainers:(id)a3 trackInfoRepository:(id)a4;
- (_TtC10VoiceMemos33RCMultipleWaveformsViewController)init;
@end

@implementation RCMultipleWaveformsViewController

+ (id)viewControllerWithWaveformContainers:(id)a3 trackInfoRepository:(id)a4
{
  id v6 = objc_allocWithZone((Class)type metadata accessor for _RCMultipleWaveformsViewController(0));
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = v8;
  v11 = (void *)sub_100110420(v9, v10);

  return v11;
}

- (_TtC10VoiceMemos33RCMultipleWaveformsViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RCMultipleWaveformsViewController();
  return [(RCMultipleWaveformsViewController *)&v3 init];
}

@end