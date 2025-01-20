@interface NSDictionary(TRICloudKit)
- (id)triArrayValueForField:()TRICloudKit isNestedValue:;
- (id)triDataForField:()TRICloudKit;
- (id)triDataValueFromBase64StringForField:()TRICloudKit;
- (id)triDateForField:()TRICloudKit;
- (id)triNumberValueForField:()TRICloudKit isNestedValue:;
- (id)triStringValueForField:()TRICloudKit isNestedValue:;
- (id)triValueFromNestedField:()TRICloudKit;
@end

@implementation NSDictionary(TRICloudKit)

- (id)triValueFromNestedField:()TRICloudKit
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  v2 = [v1 objectForKeyedSubscript:@"value"];

  return v2;
}

- (id)triNumberValueForField:()TRICloudKit isNestedValue:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4) {
    [a1 triValueFromNestedField:v6];
  }
  else {
  v7 = [a1 objectForKeyedSubscript:v6];
  }
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = (id)objc_opt_class();
      id v11 = v13;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "expected type NSNumber in dictionary field but got %@", (uint8_t *)&v12, 0xCu);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

- (id)triStringValueForField:()TRICloudKit isNestedValue:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4) {
    [a1 triValueFromNestedField:v6];
  }
  else {
  v7 = [a1 objectForKeyedSubscript:v6];
  }
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = (id)objc_opt_class();
      id v11 = v13;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "expected type NSString in dictionary field but got %@", (uint8_t *)&v12, 0xCu);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

- (id)triArrayValueForField:()TRICloudKit isNestedValue:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4) {
    [a1 triValueFromNestedField:v6];
  }
  else {
  v7 = [a1 objectForKeyedSubscript:v6];
  }
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "expected type NSArray in dictionary field %@ but got %@", (uint8_t *)&v12, 0x16u);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

- (id)triDataForField:()TRICloudKit
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = TRILogCategory_Server();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = (id)objc_opt_class();
      id v5 = v7;
      _os_log_error_impl(&dword_1DA291000, v3, OS_LOG_TYPE_ERROR, "expected type NSData in dictionary field but got %@", (uint8_t *)&v6, 0xCu);
    }
    id v2 = 0;
  }
  else
  {
    id v2 = v1;
  }

  return v2;
}

- (id)triDateForField:()TRICloudKit
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = TRILogCategory_Server();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = (id)objc_opt_class();
      id v5 = v7;
      _os_log_error_impl(&dword_1DA291000, v3, OS_LOG_TYPE_ERROR, "expected type NSDate in dictionary field but got %@", (uint8_t *)&v6, 0xCu);
    }
    id v2 = 0;
  }
  else
  {
    id v2 = v1;
  }

  return v2;
}

- (id)triDataValueFromBase64StringForField:()TRICloudKit
{
  v1 = objc_msgSend(a1, "triValueFromNestedField:");
  if (v1) {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v1 options:0];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end