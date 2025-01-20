@interface _PSZkwUtils
+ (id)clientModelMismatchErrorResponseForRequest:(id)a3 requestedClientModelId:(id)a4 actualClientModelId:(id)a5;
@end

@implementation _PSZkwUtils

+ (id)clientModelMismatchErrorResponseForRequest:(id)a3 requestedClientModelId:(id)a4 actualClientModelId:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v7 = NSString;
  id v8 = a3;
  v9 = [v7 stringWithFormat:@"Wrong delegate for request. Expected %@ but found %@.", a4, a5];
  v10 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[_PSZkwUtils clientModelMismatchErrorResponseForRequest:requestedClientModelId:actualClientModelId:]((uint64_t)v9, v10);
  }

  id v11 = objc_alloc((Class)getATXSuggestionRequestResponseClass());
  v12 = (void *)MEMORY[0x1E4F28C58];
  getATXSuggestionRequestResponseClass();
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  uint64_t v19 = *MEMORY[0x1E4F28568];
  v20[0] = v9;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  v16 = [v12 errorWithDomain:v14 code:5 userInfo:v15];
  v17 = (void *)[v11 initWithSuggestions:0 feedbackMetadata:0 originalRequest:v8 responseCode:3 error:v16];

  return v17;
}

+ (void)clientModelMismatchErrorResponseForRequest:(uint64_t)a1 requestedClientModelId:(NSObject *)a2 actualClientModelId:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Client model mismatch when fetching ZKW suggestion: %@", (uint8_t *)&v2, 0xCu);
}

@end