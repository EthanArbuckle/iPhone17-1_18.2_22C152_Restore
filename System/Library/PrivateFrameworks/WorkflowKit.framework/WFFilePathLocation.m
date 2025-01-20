@interface WFFilePathLocation
+ (Class)supportedClassForURL:(id)a3;
+ (id)locationWithSerializedRepresentation:(id)a3;
@end

@implementation WFFilePathLocation

+ (id)locationWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [v4 objectForKey:@"relativeSubpath"];
    v6 = (void *)[objc_alloc((Class)a1) initWithRelativeSubpath:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (Class)supportedClassForURL:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__WFFilePathLocation_supportedClassForURL___block_invoke;
  v8[3] = &unk_1E6557260;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "if_firstObjectPassingTest:", v8);

  return (Class)v6;
}

uint64_t __43__WFFilePathLocation_supportedClassForURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canRepresentURL:*(void *)(a1 + 32)];
}

@end