@interface RDDiskSpaceUtils
+ (void)requestFreeSpace:(unint64_t)a3 atPath:(id)a4 effortLevel:(unint64_t)a5 queue:(id)a6 completionBlock:(id)a7;
@end

@implementation RDDiskSpaceUtils

+ (void)requestFreeSpace:(unint64_t)a3 atPath:(id)a4 effortLevel:(unint64_t)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a7;
  v13 = &off_1008D7258;
  if (!a5) {
    v13 = &off_1008D7240;
  }
  uint64_t v20 = kCPFreeSpaceEffortLevelKey;
  v21 = v13;
  v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v18 = v10;
  v19 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  CPFreeSpaceRequestBytesAtPathWithCompletionBlock();
}

@end