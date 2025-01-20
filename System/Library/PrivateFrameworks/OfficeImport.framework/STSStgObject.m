@interface STSStgObject
+ (void)throwIfError:(int)a3;
- (STSStgObject)init;
@end

@implementation STSStgObject

- (STSStgObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)STSStgObject;
  v2 = [(STSStgObject *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (void)throwIfError:(int)a3
{
  switch(a3)
  {
    case 0:
      return;
    case 1:
      v3 = @"STFileNotFound";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a file not found exception.";
      goto LABEL_20;
    case 2:
      v3 = @"STIllegalAccess";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated an illegal access exception.";
      goto LABEL_20;
    case 3:
      v3 = @"STFileNotSStg";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a file not structured storage exception.";
      goto LABEL_20;
    case 4:
      v3 = @"STFileIO";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a file I/O exception.";
      goto LABEL_20;
    case 5:
      v3 = @"STMemory";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a memory exception.";
      goto LABEL_20;
    case 6:
      v3 = @"STIllegalCall";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated an illegal call exception.";
      goto LABEL_20;
    case 7:
      v3 = @"STStgLocked";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a storage locked exception.";
      goto LABEL_20;
    case 8:
      v3 = @"STCorruptedFAT";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a corrupted FAT exception.";
      goto LABEL_20;
    case 9:
      v3 = @"STNotStorage";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a not storage exception.";
      goto LABEL_20;
    case 10:
      v3 = @"STNotStream";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a not stream exception.";
      goto LABEL_20;
    case 11:
      v3 = @"STChildNotFound";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a child not found exception.";
      goto LABEL_20;
    case 12:
      v3 = @"STNotSupported";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a not supported excepiton.";
      goto LABEL_20;
    case 13:
      v3 = @"STPropertyNotFound";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a property not found exception.";
      goto LABEL_20;
    case 14:
      v3 = @"STPropertyFormat";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a property format exception.";
      goto LABEL_20;
    case 15:
      v3 = @"STEndOfStream";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated an end of stream exception.";
      goto LABEL_20;
    case 16:
      v3 = @"STCorruptedDirectory";
      v4 = (void *)MEMORY[0x263EFF940];
      v5 = @"Structured storage library generated a corrupted directory exception.";
      goto LABEL_20;
    case 17:
      [MEMORY[0x263EFF940] raise:@"STZeroLengthFile" format:@"Structured storage library generated a zero length file exception."];
      goto LABEL_19;
    default:
LABEL_19:
      v4 = (void *)MEMORY[0x263EFF940];
      v3 = (__CFString *)*MEMORY[0x263EFF488];
      v5 = @"Structured storage library generated a generic exception";
LABEL_20:
      [v4 raise:v3 format:v5];
      return;
  }
}

@end