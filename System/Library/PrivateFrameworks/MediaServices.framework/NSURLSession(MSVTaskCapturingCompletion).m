@interface NSURLSession(MSVTaskCapturingCompletion)
- (id)msv_dataTaskWithRequest:()MSVTaskCapturingCompletion completionHandler:;
- (id)msv_downloadTaskWithRequest:()MSVTaskCapturingCompletion completionHandler:;
- (id)msv_uploadTaskWithRequest:()MSVTaskCapturingCompletion fromData:completionHandler:;
@end

@implementation NSURLSession(MSVTaskCapturingCompletion)

- (id)msv_downloadTaskWithRequest:()MSVTaskCapturingCompletion completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5239;
  v20 = __Block_byref_object_dispose__5240;
  id v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__NSURLSession_MSVTaskCapturingCompletion__msv_downloadTaskWithRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E5ADA830;
  v15 = &v16;
  id v8 = v7;
  id v14 = v8;
  uint64_t v9 = [a1 downloadTaskWithRequest:v6 completionHandler:v13];
  v10 = (void *)v17[5];
  v17[5] = v9;

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)msv_uploadTaskWithRequest:()MSVTaskCapturingCompletion fromData:completionHandler:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5239;
  v23 = __Block_byref_object_dispose__5240;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__NSURLSession_MSVTaskCapturingCompletion__msv_uploadTaskWithRequest_fromData_completionHandler___block_invoke;
  v16[3] = &unk_1E5ADA808;
  uint64_t v18 = &v19;
  id v11 = v10;
  id v17 = v11;
  uint64_t v12 = [a1 uploadTaskWithRequest:v8 fromData:v9 completionHandler:v16];
  v13 = (void *)v20[5];
  v20[5] = v12;

  id v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (id)msv_dataTaskWithRequest:()MSVTaskCapturingCompletion completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__5239;
  v20 = __Block_byref_object_dispose__5240;
  id v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__NSURLSession_MSVTaskCapturingCompletion__msv_dataTaskWithRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E5ADA808;
  v15 = &v16;
  id v8 = v7;
  id v14 = v8;
  uint64_t v9 = [a1 dataTaskWithRequest:v6 completionHandler:v13];
  id v10 = (void *)v17[5];
  v17[5] = v9;

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

@end