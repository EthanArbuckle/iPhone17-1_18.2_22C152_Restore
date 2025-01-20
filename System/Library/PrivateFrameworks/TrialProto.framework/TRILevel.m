@interface TRILevel
+ (id)descriptor;
- (BOOL)isFactorOnDemand;
- (id)fileOrDirectoryLevelWithIsDir:(BOOL *)a3;
- (id)object;
@end

@implementation TRILevel

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_50;
  if (!descriptor_descriptor_50)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITrifactorRoot_FileDescriptor() fields:&off_1EB3EDFA8 fieldCount:11 storageSize:80 flags:v8];
    [v2 setupOneofs:_MergedGlobals_0 count:1 firstHasIndex:0xFFFFFFFFLL];
    if (descriptor_descriptor_50) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"Trifactor.pbobjc.m", 409, @"Startup recursed!");
    }
    descriptor_descriptor_50 = (uint64_t)v2;
  }
  return v2;
}

- (id)fileOrDirectoryLevelWithIsDir:(BOOL *)a3
{
  int v5 = [(TRILevel *)self levelOneOfCase];
  if (v5 != 101)
  {
    if (v5 == 100)
    {
      uint64_t v6 = [(TRILevel *)self fileValue];
    }
    else
    {
      uint64_t v6 = 0;
    }
    BOOL v7 = 0;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v6 = [(TRILevel *)self directoryValue];
  BOOL v7 = 1;
  if (a3) {
LABEL_8:
  }
    *a3 = v7;
LABEL_9:
  return v6;
}

- (id)object
{
  int v3 = [(TRILevel *)self levelOneOfCase];
  switch(v3)
  {
    case 10:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[TRILevel BOOLeanValue](self, "BOOLeanValue"));
      goto LABEL_12;
    case 11:
      uint64_t v4 = [(TRILevel *)self stringValue];
      goto LABEL_12;
    case 12:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[TRILevel intValue](self, "intValue"));
      goto LABEL_12;
    case 13:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[TRILevel longValue](self, "longValue"));
      goto LABEL_12;
    case 14:
      uint64_t v6 = NSNumber;
      [(TRILevel *)self floatValue];
      uint64_t v4 = objc_msgSend(v6, "numberWithFloat:");
      goto LABEL_12;
    case 15:
      BOOL v7 = NSNumber;
      [(TRILevel *)self doubleValue];
      uint64_t v4 = objc_msgSend(v7, "numberWithDouble:");
      goto LABEL_12;
    case 16:
      uint64_t v4 = [(TRILevel *)self binaryValue];
LABEL_12:
      uint64_t v8 = (void *)v4;
      goto LABEL_16;
    default:
      if (v3 == 100)
      {
        int v5 = [(TRILevel *)self fileValue];
        goto LABEL_14;
      }
      if (v3 == 101)
      {
        int v5 = [(TRILevel *)self directoryValue];
LABEL_14:
        v9 = v5;
        uint64_t v8 = [v5 path];

        goto LABEL_16;
      }
      uint64_t v8 = 0;
LABEL_16:
      return v8;
  }
}

- (BOOL)isFactorOnDemand
{
  int v3 = [(TRILevel *)self fileOrDirectoryLevelWithIsDir:0];
  uint64_t v4 = v3;
  if (v3 && [v3 hasIsOnDemand] && (objc_msgSend(v4, "isOnDemand") & 1) != 0)
  {
    char v5 = 1;
  }
  else if ([(TRILevel *)self levelOneOfCase] == 104)
  {
    uint64_t v6 = [(TRILevel *)self mobileAssetReferenceValue];
    if ([v6 hasIsOnDemand]) {
      char v5 = [v6 isOnDemand];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

@end