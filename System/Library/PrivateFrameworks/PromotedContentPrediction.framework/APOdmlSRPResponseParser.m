@interface APOdmlSRPResponseParser
+ (BOOL)isValidResponse:(id)a3;
+ (id)parseResponseForFeatureValues:(id)a3;
@end

@implementation APOdmlSRPResponseParser

+ (BOOL)isValidResponse:(id)a3
{
  return objc_msgSend_odmlEnabled(a3, a2, (uint64_t)a3);
}

+ (id)parseResponseForFeatureValues:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_msgSend_featuresCount(v3, v5, v6))
  {
    unint64_t v9 = 0;
    do
    {
      v10 = objc_msgSend_featuresAtIndex_(v3, v7, v9);
      v12 = objc_msgSend_multiarrayFromFeature_(MEMORY[0x1E4F1E9A8], v11, (uint64_t)v10);
      v14 = objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E4F1E950], v13, (uint64_t)v12);
      v17 = objc_msgSend_name(v10, v15, v16);
      objc_msgSend_setValue_forKey_(v4, v18, (uint64_t)v14, v17);

      ++v9;
    }
    while (v9 < objc_msgSend_featuresCount(v3, v19, v20));
  }
  v21 = objc_msgSend_copy(v4, v7, v8);

  return v21;
}

@end