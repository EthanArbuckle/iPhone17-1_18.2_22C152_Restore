@interface NTKSimpleTextFaceViewComplicationFactory
- (CGRect)_referenceFrame;
- (CLKDevice)device;
- (NTKFaceView)faceView;
- (NTKSimpleTextFaceViewComplicationFactory)init;
- (double)verticalCenterOffset;
- (id)keylineViewForComplicationSlot:(id)a3;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (int64_t)complicationPickerStyleForSlot:(id)a3;
- (void)loadLayoutRules;
- (void)setDevice:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setVerticalCenterOffset:(double)a3;
@end

@implementation NTKSimpleTextFaceViewComplicationFactory

- (NTKSimpleTextFaceViewComplicationFactory)init
{
  v16.receiver = self;
  v16.super_class = (Class)NTKSimpleTextFaceViewComplicationFactory;
  v2 = [(NTKSimpleTextFaceViewComplicationFactory *)&v16 init];
  if (v2)
  {
    v3 = +[CLKRenderingContext sharedRenderingContext];
    uint64_t v4 = [v3 device];
    device = v2->_device;
    v2->_device = (CLKDevice *)v4;

    v6 = v2->_device;
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_19);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_19);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v9 = (CLKDevice *)objc_loadWeakRetained(&_LayoutConstants___cachedDevice_19);
      if (v9 == v6)
      {
        uint64_t v10 = [(CLKDevice *)v6 version];
        uint64_t v11 = _LayoutConstants___previousCLKDeviceVersion_19;

        if (v10 == v11)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_19);
          uint64_t v14 = _LayoutConstants__constants_0_0;

          *(void *)&v2->_verticalCenterOffset = v14;
          return v2;
        }
      }
      else
      {
      }
    }
    id v12 = objc_storeWeak(&_LayoutConstants___cachedDevice_19, v6);
    _LayoutConstants___previousCLKDeviceVersion_19 = [(CLKDevice *)v6 version];

    ___LayoutConstants_block_invoke_16(v13, (uint64_t)v6);
    goto LABEL_7;
  }
  return v2;
}

- (void)loadLayoutRules
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__NTKSimpleTextFaceViewComplicationFactory_loadLayoutRules__block_invoke;
  v2[3] = &unk_1E62C3620;
  v2[4] = self;
  NTKEnumerateComplicationStates(v2);
}

void __59__NTKSimpleTextFaceViewComplicationFactory_loadLayoutRules__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _referenceFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v20 = +[NTKRichComplicationCircularBaseView keylineImageWithFilled:0 wide:1 expanded:1 forDevice:*(void *)(*(void *)(a1 + 32) + 24)];
  [v20 size];
  double v13 = (v12 - v9) * 0.5;
  [v20 size];
  double v15 = (v14 - v11) * 0.5;
  objc_super v16 = [*(id *)(a1 + 32) device];
  v17 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v16, 3, 3, 0, v5, v7, v9, v11, v15, v13, v15, v13);

  v18 = [*(id *)(a1 + 32) faceView];
  v19 = [v18 complicationLayoutforSlot:@"subdial-top"];
  [v19 setDefaultLayoutRule:v17 forState:a2];
}

- (CGRect)_referenceFrame
{
  NTKWhistlerSubdialComplicationDiameter(self->_device);
  v3 = [(NTKSimpleTextFaceViewComplicationFactory *)self device];
  [v3 screenBounds];

  double v4 = [(NTKSimpleTextFaceViewComplicationFactory *)self faceView];
  [v4 bounds];
  double v5 = [(NTKSimpleTextFaceViewComplicationFactory *)self device];
  CLKRectCenteredXInRectForDevice();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  double v5 = [[NTKRichComplicationCircularBaseView alloc] initWithFamily:10];
  [(NTKRichComplicationCircularBaseView *)v5 setHidden:1];
  return v5;
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKSimpleTextFaceViewComplicationFactory *)self faceView];
  double v6 = [v5 _defaultKeylineViewForComplicationSlot:v4];

  return v6;
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (NTKFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  return (NTKFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (double)verticalCenterOffset
{
  return self->_verticalCenterOffset;
}

- (void)setVerticalCenterOffset:(double)a3
{
  self->_verticalCenterOffset = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_faceView);
}

@end