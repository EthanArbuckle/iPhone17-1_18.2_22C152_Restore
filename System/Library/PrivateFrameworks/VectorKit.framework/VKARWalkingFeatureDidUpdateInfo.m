@interface VKARWalkingFeatureDidUpdateInfo
- ($1AB5FA073B851C12C2339EC22442E995)labelPosition;
- (BOOL)isDirectlyBehind;
- (BOOL)isVisible;
- (VKARWalkingFeature)feature;
- (VKARWalkingFeatureDidUpdateInfo)initWithFeature:(id)a3 featureLabelIdentifier:(unint64_t)a4 featureSet:(id)a5 labelPosition:(const void *)a6 updateTypes:(int64_t)a7 isVisible:(BOOL)a8 isDirectlyBehind:(BOOL)a9 screenHeading:()Unit<geo:(double>)a10 :DegreeUnitDescription;
- (VKARWalkingFeatureSet)featureSet;
- (double)screenHeading;
- (id).cxx_construct;
- (id)description;
- (id)stringForUpdateTypes;
- (int64_t)updateTypes;
- (unint64_t)featureLabelIdentifier;
@end

@implementation VKARWalkingFeatureDidUpdateInfo

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_1EF5597D8;
  *((void *)self + 2) = 0;
  *((void *)self + 4) = &unk_1EF5599B8;
  *((void *)self + 5) = 0;
  return self;
}

- (void).cxx_destruct
{
  self->_featureSet._vptr$_retain_ptr = (void **)&unk_1EF5599B8;

  self->_feature._vptr$_retain_ptr = (void **)&unk_1EF5597D8;
  obj = self->_feature._obj;
}

- (unint64_t)featureLabelIdentifier
{
  return self->_featureLabelIdentifier;
}

- (BOOL)isDirectlyBehind
{
  return self->_isDirectlyBehind;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- ($1AB5FA073B851C12C2339EC22442E995)labelPosition
{
  double latitude = self->_labelPosition.latitude;
  double longitude = self->_labelPosition.longitude;
  double altitude = self->_labelPosition.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (int64_t)updateTypes
{
  return self->_updateTypes;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = self->_feature._obj;
  double latitude = self->_labelPosition.latitude;
  double longitude = self->_labelPosition.longitude;
  double altitude = self->_labelPosition.altitude;
  uint64_t v10 = [(VKARWalkingFeatureDidUpdateInfo *)self stringForUpdateTypes];
  v11 = (void *)v10;
  v12 = @"YES";
  if (self->_isVisible) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (!self->_isDirectlyBehind) {
    v12 = @"NO";
  }
  v14 = [v3 stringWithFormat:@"<%@: %p feature:%@ position:(%f,%f,%f) updateTypes:%@ isVisible:%@ isDirectlyBehind:%@ screenHeading:%.2f>", v5, self, v6, *(void *)&latitude, *(void *)&longitude, *(void *)&altitude, v10, v13, v12, *(void *)&self->_screenHeading._value];

  return v14;
}

- (id)stringForUpdateTypes
{
  if (self->_updateTypes)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = v3;
    int64_t updateTypes = self->_updateTypes;
    if (updateTypes)
    {
      [v3 addObject:@"Heading"];
      int64_t updateTypes = self->_updateTypes;
    }
    if ((updateTypes & 2) != 0)
    {
      [v4 addObject:@"Feature"];
      int64_t updateTypes = self->_updateTypes;
    }
    if ((updateTypes & 4) != 0)
    {
      [v4 addObject:@"Label"];
      int64_t updateTypes = self->_updateTypes;
    }
    if ((updateTypes & 8) != 0) {
      [v4 addObject:@"Visibility"];
    }
    v6 = [v4 componentsJoinedByString:@"|"];
  }
  else
  {
    v6 = &stru_1EF593218;
  }
  return v6;
}

- (double)screenHeading
{
  return self->_screenHeading._value;
}

- (VKARWalkingFeatureSet)featureSet
{
  return self->_featureSet._obj;
}

- (VKARWalkingFeature)feature
{
  return self->_feature._obj;
}

- (VKARWalkingFeatureDidUpdateInfo)initWithFeature:(id)a3 featureLabelIdentifier:(unint64_t)a4 featureSet:(id)a5 labelPosition:(const void *)a6 updateTypes:(int64_t)a7 isVisible:(BOOL)a8 isDirectlyBehind:(BOOL)a9 screenHeading:()Unit<geo:(double>)a10 :DegreeUnitDescription
{
  id v16 = a3;
  id v17 = a5;
  v31.receiver = self;
  v31.super_class = (Class)VKARWalkingFeatureDidUpdateInfo;
  v18 = [(VKARWalkingFeatureDidUpdateInfo *)&v31 init];
  v19 = v18;
  if (v18)
  {
    v18->_featureLabelIdentifier = a4;
    v20 = (VKARWalkingFeature *)v16;
    v21 = v20;
    if (v20) {
      v22 = v20;
    }
    obj = v19->_feature._obj;
    v19->_feature._obj = v21;

    v24 = (VKARWalkingFeatureSet *)v17;
    v25 = v24;
    if (v24) {
      v26 = v24;
    }
    v27 = v19->_featureSet._obj;
    v19->_featureSet._obj = v25;

    double v28 = *((double *)a6 + 2);
    *(_OWORD *)&v19->_labelPosition.double latitude = *(_OWORD *)a6;
    v19->_labelPosition.double altitude = v28;
    v19->_int64_t updateTypes = a7;
    v19->_isVisible = a8;
    v19->_isDirectlyBehind = a9;
    v19->_screenHeading._value = *v32;
    v29 = v19;
  }

  return v19;
}

@end