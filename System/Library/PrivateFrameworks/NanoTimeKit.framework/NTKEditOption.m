@interface NTKEditOption
+ (BOOL)supportsSecureCoding;
+ (CGSize)sizeForSwatchStyle:(int64_t)a3;
+ (id)optionsDescription;
- (BOOL)isPrideOption;
- (BOOL)isValidOption;
- (BOOL)optionExistsInDevice:(id)a3;
- (CLKDevice)device;
- (NSString)dailySnapshotKey;
- (NSString)localizedName;
- (NSString)localizedNameForAction;
- (NTKEditOption)initWithCoder:(id)a3;
- (NTKEditOption)initWithDevice:(id)a3;
- (NTKEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
- (id)JSONObjectRepresentation;
- (int64_t)swatchStyle;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKEditOption

- (void).cxx_destruct
{
}

- (int64_t)swatchStyle
{
  return -1;
}

+ (CGSize)sizeForSwatchStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      if (_smallCircleSwatchSize_onceToken != -1) {
        dispatch_once(&_smallCircleSwatchSize_onceToken, &__block_literal_global_119);
      }
      double v3 = *(double *)&_smallCircleSwatchSize_size_0;
      double v4 = *(double *)&_smallCircleSwatchSize_size_1;
      break;
    case 1:
      if (_largeCircleSwatchSize_onceToken != -1) {
        dispatch_once(&_largeCircleSwatchSize_onceToken, &__block_literal_global_11_0);
      }
      double v3 = *(double *)&_largeCircleSwatchSize_size_0;
      double v4 = *(double *)&_largeCircleSwatchSize_size_1;
      break;
    case 2:
      double v3 = _smallRectSwatchSize();
      break;
    case 3:
      double v3 = _largeRectSwatchSize();
      break;
    case 4:
      if (_shortLargeRectSwatchSize_onceToken != -1) {
        dispatch_once(&_shortLargeRectSwatchSize_onceToken, &__block_literal_global_17);
      }
      double v3 = *(double *)&_shortLargeRectSwatchSize_size_0;
      double v4 = *(double *)&_shortLargeRectSwatchSize_size_1;
      break;
    default:
      double v4 = 0.0;
      double v3 = 0.0;
      break;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)optionsDescription
{
  return 0;
}

- (NTKEditOption)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKEditOption;
  v6 = [(NTKEditOption *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (NSString)localizedNameForAction
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  device = self->_device;
  id v4 = a3;
  id v5 = [(CLKDevice *)device nrDeviceUUID];
  [v4 encodeObject:v5 forKey:@"DeviceUUIDKey"];
}

- (NTKEditOption)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceUUIDKey"];

  v6 = [MEMORY[0x1E4F19A30] deviceForNRDeviceUUID:v5];
  v7 = [(NTKEditOption *)self initWithDevice:v6];

  return v7;
}

- (BOOL)isPrideOption
{
  return 0;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  return 1;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NSString)dailySnapshotKey
{
  return 0;
}

- (NSString)localizedName
{
  return 0;
}

- (id)JSONObjectRepresentation
{
  return 0;
}

- (NTKEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_1();

  return 0;
}

- (BOOL)isValidOption
{
  return 0;
}

@end