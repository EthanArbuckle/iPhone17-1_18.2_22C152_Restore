@interface PXMemoriesDebugFeature
+ (id)_tintColorForFeatureType:(unint64_t)a3;
- (NSString)featureLocalizedTitle;
- (NSString)localizedTitle;
- (NSString)localizedTypeStringValue;
- (PXMemoriesDebugFeature)initWithLocalizedTitle:(id)a3 type:(unint64_t)a4;
- (UIColor)featureTintColor;
- (int64_t)featureGroupIndex;
- (int64_t)featureKind;
- (unint64_t)type;
@end

@implementation PXMemoriesDebugFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_featureTintColor, 0);
  objc_storeStrong((id *)&self->_featureLocalizedTitle, 0);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)featureLocalizedTitle
{
  return self->_featureLocalizedTitle;
}

- (NSString)localizedTypeStringValue
{
  unint64_t type = self->_type;
  if (type > 5) {
    return (NSString *)&stru_1F00B0030;
  }
  else {
    return &off_1E5DCD590[type]->isa;
  }
}

- (UIColor)featureTintColor
{
  featureTintColor = self->_featureTintColor;
  if (!featureTintColor)
  {
    v4 = [(id)objc_opt_class() _tintColorForFeatureType:self->_type];
    v5 = self->_featureTintColor;
    self->_featureTintColor = v4;

    featureTintColor = self->_featureTintColor;
  }
  return featureTintColor;
}

- (int64_t)featureGroupIndex
{
  return 0;
}

- (int64_t)featureKind
{
  return 1;
}

- (PXMemoriesDebugFeature)initWithLocalizedTitle:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXMemoriesDebugFeature;
  v8 = [(PXMemoriesDebugFeature *)&v18 init];
  v9 = v8;
  if (v8)
  {
    v8->_unint64_t type = a4;
    objc_storeStrong((id *)&v8->_localizedTitle, a3);
    uint64_t v10 = [v7 length];
    v11 = NSString;
    uint64_t v12 = [(PXMemoriesDebugFeature *)v9 localizedTypeStringValue];
    v13 = (void *)v12;
    if (v10) {
      [v11 stringWithFormat:@"%@:%@", v12, v7];
    }
    else {
    uint64_t v14 = [v11 stringWithFormat:@"%@", v12, v17];
    }

    featureLocalizedTitle = v9->_featureLocalizedTitle;
    v9->_featureLocalizedTitle = (NSString *)v14;
  }
  return v9;
}

+ (id)_tintColorForFeatureType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v3 = (void *)MEMORY[0x1E4FB1618];
      double v5 = 0.591;
      double v6 = 0.409;
      double v4 = 1.0;
      goto LABEL_8;
    case 1uLL:
      v3 = (void *)MEMORY[0x1E4FB1618];
      double v4 = 0.44;
      double v5 = 0.683;
      double v6 = 0.519;
      goto LABEL_8;
    case 2uLL:
      v3 = (void *)MEMORY[0x1E4FB1618];
      double v4 = 0.56;
      double v5 = 0.699;
      double v6 = 0.771;
      goto LABEL_8;
    case 3uLL:
    case 4uLL:
      v3 = (void *)MEMORY[0x1E4FB1618];
      double v4 = 0.685;
      double v5 = 0.481;
      double v6 = 1.0;
      goto LABEL_8;
    case 5uLL:
      v3 = (void *)MEMORY[0x1E4FB1618];
      double v4 = 0.725;
      double v5 = 0.737;
      double v6 = 0.238;
LABEL_8:
      id v7 = [v3 colorWithRed:v4 green:v5 blue:v6 alpha:1.0];
      break;
    default:
      id v7 = [MEMORY[0x1E4FB1618] blackColor];
      break;
  }
  return v7;
}

@end