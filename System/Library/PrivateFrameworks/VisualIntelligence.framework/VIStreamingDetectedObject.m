@interface VIStreamingDetectedObject
- (CGRect)normalizedBoundingBox;
- (NSString)displayLabel;
- (NSString)domainKey;
- (NSString)glyphName;
- (NSUUID)objectUUID;
- (VIStreamingDetectedObject)initWithObjectUUID:(id)a3 normalizedBoundingBox:(CGRect)a4 domainKey:(id)a5 glyphName:(id)a6 displayLabel:(id)a7;
@end

@implementation VIStreamingDetectedObject

- (VIStreamingDetectedObject)initWithObjectUUID:(id)a3 normalizedBoundingBox:(CGRect)a4 domainKey:(id)a5 glyphName:(id)a6 displayLabel:(id)a7
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v29.receiver = self;
  v29.super_class = (Class)VIStreamingDetectedObject;
  v19 = [(VIStreamingDetectedObject *)&v29 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    objectUUID = v19->_objectUUID;
    v19->_objectUUID = (NSUUID *)v20;

    v19->_normalizedBoundingBox.origin.CGFloat x = x;
    v19->_normalizedBoundingBox.origin.CGFloat y = y;
    v19->_normalizedBoundingBox.size.CGFloat width = width;
    v19->_normalizedBoundingBox.size.CGFloat height = height;
    uint64_t v22 = [v16 copy];
    domainKeCGFloat y = v19->_domainKey;
    v19->_domainKeCGFloat y = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    glyphName = v19->_glyphName;
    v19->_glyphName = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    displayLabel = v19->_displayLabel;
    v19->_displayLabel = (NSString *)v26;
  }
  return v19;
}

- (NSUUID)objectUUID
{
  return self->_objectUUID;
}

- (CGRect)normalizedBoundingBox
{
  double x = self->_normalizedBoundingBox.origin.x;
  double y = self->_normalizedBoundingBox.origin.y;
  double width = self->_normalizedBoundingBox.size.width;
  double height = self->_normalizedBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)domainKey
{
  return self->_domainKey;
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_domainKey, 0);
  objc_storeStrong((id *)&self->_objectUUID, 0);
}

@end