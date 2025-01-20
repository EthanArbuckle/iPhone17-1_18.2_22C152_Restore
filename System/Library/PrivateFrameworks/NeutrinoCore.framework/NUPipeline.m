@interface NUPipeline
@end

@implementation NUPipeline

__CFString *__34___NUPipeline__compactDescription__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 type];
  if ((unint64_t)(v2 - 1) > 2) {
    return @"?";
  }
  else {
    return off_1E5D94250[v2 - 1];
  }
}

__CFString *__34___NUPipeline__compactDescription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 type];
  if ((unint64_t)(v2 - 1) > 2) {
    return @"?";
  }
  else {
    return off_1E5D94250[v2 - 1];
  }
}

id __33___NUPipeline_compactDescription__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 inputPortForChannel:v3];
  v5 = NSString;
  uint64_t v6 = [v3 type];

  if ((unint64_t)(v6 - 1) > 2) {
    v7 = @"?";
  }
  else {
    v7 = off_1E5D94250[v6 - 1];
  }
  v8 = v7;
  v9 = [v4 outputPorts];
  v10 = [v5 stringWithFormat:@"%@%lu", v8, objc_msgSend(v9, "count")];

  return v10;
}

id __33___NUPipeline_compactDescription__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 outputPortForChannel:v3];
  v5 = [v4 inputPort];
  uint64_t v6 = NSString;
  uint64_t v7 = [v3 type];

  if ((unint64_t)(v7 - 1) > 2) {
    v8 = @"?";
  }
  else {
    v8 = off_1E5D94250[v7 - 1];
  }
  v9 = v8;
  v10 = v9;
  if (v5)
  {
    v11 = [v5 compactDescription];
    v12 = [v6 stringWithFormat:@"%@%@", v10, v11];
  }
  else
  {
    v12 = [v6 stringWithFormat:@"%@%@", v9, @"-"];
  }

  return v12;
}

id __33___NUPipeline_compactDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 inputChannels];
  id v14 = v2;
  v4 = PFMap();

  v5 = [v14 outputChannels];
  id v6 = v14;
  uint64_t v7 = PFMap();

  v8 = NSString;
  v9 = [v6 alias];
  v10 = [v4 componentsJoinedByString:@","];
  v11 = [v7 componentsJoinedByString:@","];
  v12 = [v8 stringWithFormat:@"%@(%@|%@)", v9, v10, v11];

  return v12;
}

__CFString *__33___NUPipeline_compactDescription__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) inputPortForChannel:a2];
  id v3 = [v2 inputPort];

  if (v3)
  {
    v4 = [v3 compactDescription];
  }
  else
  {
    v4 = @"-";
  }

  return v4;
}

id __33___NUPipeline_compactDescription__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 outputPortForChannel:v3];
  v5 = NSString;
  uint64_t v6 = [v3 type];

  if ((unint64_t)(v6 - 1) > 2) {
    uint64_t v7 = @"?";
  }
  else {
    uint64_t v7 = off_1E5D94250[v6 - 1];
  }
  v8 = v7;
  v9 = [v4 outputPorts];
  v10 = [v5 stringWithFormat:@"%@%lu", v8, objc_msgSend(v9, "count")];

  return v10;
}

uint64_t __37___NUPipeline_outputChannelMatching___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) match:a2];
}

uint64_t __36___NUPipeline_inputChannelMatching___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) match:a2];
}

@end