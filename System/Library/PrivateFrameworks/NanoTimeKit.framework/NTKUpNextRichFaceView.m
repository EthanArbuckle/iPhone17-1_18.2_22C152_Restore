@interface NTKUpNextRichFaceView
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
@end

@implementation NTKUpNextRichFaceView

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)NTKUpNextRichFaceView;
  v10 = [(NTKUpNextFaceView *)&v12 _newLegacyViewForComplication:v8 family:a4 slot:v9];
  if (!v10)
  {
    if ([v9 isEqualToString:@"top-left"])
    {
      v10 = +[NTKRichComplicationCircularBaseView viewWithLegacyComplicationType:](NTKRichComplicationCircularBaseView, "viewWithLegacyComplicationType:", [v8 complicationType]);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKUpNextRichFaceView;
  [(NTKUpNextFaceView *)&v10 _configureComplicationView:v6 forSlot:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 transitionToMonochromeWithFraction:0.0];
  }
  if ([v6 conformsToProtocol:&unk_1FCD6BD68])
  {
    v7 = (void *)MEMORY[0x1E4FB1618];
    id v8 = v6;
    id v9 = [v7 clearColor];
    [v8 setPlatterColor:v9];
  }
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"top-left"])
  {
    int64_t v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKUpNextRichFaceView;
    int64_t v5 = [(NTKFaceView *)&v7 _keylineStyleForComplicationSlot:v4];
  }

  return v5;
}

@end