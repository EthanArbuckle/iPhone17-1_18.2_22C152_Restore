@interface NTKDualTimeAnalogHandsView
- (id)createHourHandView;
- (id)createMinuteHandView;
- (id)hourHandConfiguration;
- (id)minuteHandConfiguration;
- (id)secondHandConfiguration;
@end

@implementation NTKDualTimeAnalogHandsView

- (id)hourHandConfiguration
{
  v2 = [(CLKUIAnalogHandsView *)self device];
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  _LayoutConstants_47(v2, &v5);
  v3 = [off_1E62BDB38 defaultHourConfigurationForDevice:v2];
  [v3 setHandWidth:*(double *)&v5];
  [v3 setHandLength:*((double *)&v5 + 1)];
  [v3 setPegRadius:*(double *)&v6];
  [v3 setPegStrokeWidth:*((double *)&v6 + 1)];
  [v3 setArmWidth:*(double *)&v7];
  [v3 setArmLength:*((double *)&v7 + 1)];
  [v3 setDropShadowRadius:*(double *)&v8];
  [v3 setDropShadowOpacity:*((double *)&v8 + 1)];
  [v3 setRadialShadowRadius:*(double *)&v9];
  [v3 setRadialShadowOpacity:*((double *)&v9 + 1)];
  [v3 setDirectionalShadowOffset:v10];

  return v3;
}

- (id)createHourHandView
{
  v4.receiver = self;
  v4.super_class = (Class)NTKDualTimeAnalogHandsView;
  v2 = [(CLKUIAnalogHandsView *)&v4 createHourHandView];
  return v2;
}

- (id)minuteHandConfiguration
{
  v3 = [(CLKUIAnalogHandsView *)self device];
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  memset(v7, 0, sizeof(v7));
  _LayoutConstants_47(v3, v7);
  objc_super v4 = [(CLKUIAnalogHandsView *)self device];
  long long v5 = [off_1E62BDB38 defaultMinuteConfigurationForDevice:v4];

  [v5 setHandWidth:*(double *)&v8];
  [v5 setHandLength:*((double *)&v8 + 1)];
  [v5 setPegRadius:*(double *)&v9];
  [v5 setPegStrokeWidth:*((double *)&v9 + 1)];
  [v5 setArmWidth:*(double *)&v10];
  [v5 setArmLength:*((double *)&v10 + 1)];
  [v5 setDropShadowRadius:*(double *)&v11];
  [v5 setDropShadowOpacity:*((double *)&v11 + 1)];
  [v5 setRadialShadowRadius:*(double *)&v12];
  [v5 setRadialShadowOpacity:*((double *)&v12 + 1)];
  [v5 setDirectionalShadowOffset:v13];

  return v5;
}

- (id)createMinuteHandView
{
  v4.receiver = self;
  v4.super_class = (Class)NTKDualTimeAnalogHandsView;
  v2 = [(CLKUIAnalogHandsView *)&v4 createMinuteHandView];
  return v2;
}

- (id)secondHandConfiguration
{
  v3 = [(CLKUIAnalogHandsView *)self device];
  double v13 = 0.0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  memset(v7, 0, sizeof(v7));
  _LayoutConstants_47(v3, v7);
  objc_super v4 = [(CLKUIAnalogHandsView *)self device];
  long long v5 = [off_1E62BDB38 defaultSecondConfigurationForDevice:v4];

  [v5 setHandWidth:*(double *)&v8];
  [v5 setHandLength:*((double *)&v8 + 1)];
  [v5 setPegRadius:*(double *)&v9];
  [v5 setPegStrokeWidth:*((double *)&v9 + 1)];
  [v5 setTailLength:*(double *)&v10];
  [v5 setDropShadowRadius:*((double *)&v10 + 1)];
  [v5 setDropShadowOpacity:*(double *)&v11];
  [v5 setRadialShadowRadius:*((double *)&v11 + 1)];
  [v5 setRadialShadowOpacity:*(double *)&v12];
  objc_msgSend(v5, "setDirectionalShadowOffset:", *((double *)&v12 + 1), v13);

  return v5;
}

@end