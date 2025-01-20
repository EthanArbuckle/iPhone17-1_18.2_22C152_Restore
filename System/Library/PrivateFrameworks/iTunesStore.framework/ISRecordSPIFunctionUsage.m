@interface ISRecordSPIFunctionUsage
@end

@implementation ISRecordSPIFunctionUsage

id ____ISRecordSPIFunctionUsage_block_invoke(uint64_t a1)
{
  v14[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = __ISCurrentProcessName();
  v3 = (void *)v2;
  v4 = @"No Client";
  if (v2) {
    v4 = (__CFString *)v2;
  }
  v5 = v4;

  if (*(void *)(a1 + 32))
  {
    objc_msgSend(NSString, "stringWithUTF8String:");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = @"No Selector";
  }
  if (*(void *)(a1 + 40))
  {
    v7 = NSString;
    v8 = objc_msgSend(NSString, "stringWithUTF8String:");
    v9 = [v8 lastPathComponent];
    v10 = [v7 stringWithFormat:@"%@:%i", v9, *(unsigned int *)(a1 + 48)];
  }
  else
  {
    v10 = @"No Location";
  }
  v13[0] = @"Client";
  v13[1] = @"Class";
  v14[0] = v5;
  v14[1] = @"No Class";
  v13[2] = @"Selector";
  v13[3] = @"Location";
  v14[2] = v6;
  v14[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

@end