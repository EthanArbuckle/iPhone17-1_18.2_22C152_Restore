@interface ISRecordSPIClassUsage
@end

@implementation ISRecordSPIClassUsage

id ____ISRecordSPIClassUsage_block_invoke(uint64_t a1)
{
  v22[4] = *MEMORY[0x263EF8340];
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  v4 = (void *)v3;
  v5 = @"No Class";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v6 = v5;

  uint64_t v7 = __ISCurrentProcessName();
  v8 = (void *)v7;
  v9 = @"No Client";
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v10 = v9;

  uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v12 = (void *)v11;
  v13 = @"No Selector";
  if (v11) {
    v13 = (__CFString *)v11;
  }
  v14 = v13;

  if (*(void *)(a1 + 48))
  {
    v15 = NSString;
    v16 = objc_msgSend(NSString, "stringWithUTF8String:");
    v17 = [v16 lastPathComponent];
    v18 = [v15 stringWithFormat:@"%@:%i", v17, *(unsigned int *)(a1 + 56)];
  }
  else
  {
    v18 = @"No Location";
  }
  v21[0] = @"Client";
  v21[1] = @"Class";
  v22[0] = v10;
  v22[1] = v6;
  v21[2] = @"Selector";
  v21[3] = @"Location";
  v22[2] = v14;
  v22[3] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];

  return v19;
}

@end