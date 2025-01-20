@interface NTKAnalogUtilitarianFaceViewComplicationFactory
- (id)_utilityComplicationSlots;
- (id)initForDevice:(id)a3;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6;
- (int64_t)_utilitarianUtilitySlotForSlot:(id)a3;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5;
- (void)loadLayoutRulesForFaceView:(id)a3;
@end

@implementation NTKAnalogUtilitarianFaceViewComplicationFactory

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKAnalogUtilitarianFaceViewComplicationFactory;
  v5 = [(NTKFaceViewComplicationFactory *)&v13 initForDevice:v4];
  if (v5)
  {
    id v6 = [[NTKUtilityComplicationFactory alloc] initForDevice:v4];
    v7 = (void *)v5[9];
    v5[9] = v6;

    v8 = (void *)v5[9];
    v9 = [v5 device];
    [v8 setForegroundAlpha:NTKUtilityComplicationNormalForegroundAlpha()];

    v10 = (void *)v5[9];
    v11 = [v5 device];
    [v10 setForegroundImageAlpha:NTKUtilityComplicationNormalForegroundAlpha()];
  }
  return v5;
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [(NTKAnalogUtilitarianFaceViewComplicationFactory *)self _utilityComplicationSlots];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v19 = [v4 complicationLayoutforSlot:v18];
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v19, [(NTKAnalogUtilitarianFaceViewComplicationFactory *)self _utilitarianUtilitySlotForSlot:v18], v6, v8, v10, v12);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  complicationFactory = self->_complicationFactory;
  id v10 = a3;
  id v11 = [(NTKUtilityComplicationFactory *)complicationFactory newViewForComplication:v10 family:a4 forSlot:[(NTKAnalogUtilitarianFaceViewComplicationFactory *)self _utilitarianUtilitySlotForSlot:a5]];

  return v11;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  complicationFactory = self->_complicationFactory;
  id v9 = a5;
  id v10 = a4;
  id v14 = a3;
  -[NTKUtilityComplicationFactory foregroundAlphaForEditing:](complicationFactory, "foregroundAlphaForEditing:", [v9 editing]);
  objc_msgSend(v14, "setForegroundAlpha:");
  id v11 = self->_complicationFactory;
  uint64_t v12 = [v9 editing];

  [(NTKUtilityComplicationFactory *)v11 foregroundImageAlphaForEditing:v12];
  objc_msgSend(v14, "setForegroundImageAlpha:");
  int64_t v13 = [(NTKAnalogUtilitarianFaceViewComplicationFactory *)self _utilitarianUtilitySlotForSlot:v10];

  objc_msgSend(v14, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", v13));
}

- (id)_utilityComplicationSlots
{
  if (_utilityComplicationSlots_onceToken_0 != -1) {
    dispatch_once(&_utilityComplicationSlots_onceToken_0, &__block_literal_global_127);
  }
  v2 = (void *)_utilityComplicationSlots___slots;

  return v2;
}

void __76__NTKAnalogUtilitarianFaceViewComplicationFactory__utilityComplicationSlots__block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"top-left";
  v2[1] = @"top-right";
  v2[2] = @"bottom-center";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  v1 = (void *)_utilityComplicationSlots___slots;
  _utilityComplicationSlots___slots = v0;
}

- (int64_t)_utilitarianUtilitySlotForSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"top-left"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"top-right"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"bottom-left"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"bottom-right"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"bottom-center"])
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end