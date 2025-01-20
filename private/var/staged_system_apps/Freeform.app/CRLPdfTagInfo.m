@interface CRLPdfTagInfo
+ (id)tagPropertiesWithActualText:(id)a3 alternativeText:(id)a4 titleText:(id)a5;
- (CRLPdfTagInfo)initWithTagType:(int)a3 tagProperties:(id)a4;
- (NSDictionary)tagProperties;
- (int)tagType;
@end

@implementation CRLPdfTagInfo

- (CRLPdfTagInfo)initWithTagType:(int)a3 tagProperties:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLPdfTagInfo;
  v8 = [(CRLPdfTagInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_tagType = a3;
    objc_storeStrong((id *)&v8->_tagProperties, a4);
  }

  return v9;
}

+ (id)tagPropertiesWithActualText:(id)a3 alternativeText:(id)a4 titleText:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  objc_super v11 = v10;
  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:kCGPDFTagPropertyActualText];
  }
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:kCGPDFTagPropertyAlternativeText];
  }
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:kCGPDFTagPropertyTitleText];
  }

  return v11;
}

- (int)tagType
{
  return self->_tagType;
}

- (NSDictionary)tagProperties
{
  return self->_tagProperties;
}

- (void).cxx_destruct
{
}

@end