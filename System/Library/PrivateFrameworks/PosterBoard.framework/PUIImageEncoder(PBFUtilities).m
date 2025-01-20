@interface PUIImageEncoder(PBFUtilities)
+ (id)pbf_imageEncoderForPath:()PBFUtilities definition:configuredProperties:context:;
@end

@implementation PUIImageEncoder(PBFUtilities)

+ (id)pbf_imageEncoderForPath:()PBFUtilities definition:configuredProperties:context:
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v9 = (void *)MEMORY[0x1E4F1CB10];
  id v10 = a6;
  v11 = objc_msgSend(v9, "pbf_snapshotURLForPath:definition:configuredProperties:context:", a3, a4, a5, v10);
  objc_msgSend(v10, "pbf_scale");
  double v13 = v12;
  objc_msgSend(v10, "pbf_referenceBounds");
  double v15 = v14;
  double v17 = v16;

  v18 = [MEMORY[0x1E4F927E0] defaultFormat];
  uint64_t v25 = *MEMORY[0x1E4F92850];
  v24[0] = v13 * v15;
  v24[1] = v13 * v17;
  v19 = [MEMORY[0x1E4F29238] valueWithBytes:v24 objCType:"{CGSize=dd}"];
  v26[0] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  v21 = [v18 formatByAppendingDestinationOptions:MEMORY[0x1E4F1CC08] addImageOptions:v20];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F927D8]) initWithURL:v11 format:v21];
  return v22;
}

@end