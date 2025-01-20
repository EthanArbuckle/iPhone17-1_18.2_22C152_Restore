@interface NSData(NSData_SNN)
+ (id)dataWithScalar:()NSData_SNN dataType:;
@end

@implementation NSData(NSData_SNN)

+ (id)dataWithScalar:()NSData_SNN dataType:
{
  id v5 = a3;
  v6 = v5;
  v7 = 0;
  switch(a4)
  {
    case 0:
      LOBYTE(v17) = [v5 BOOLValue];
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:1];
      goto LABEL_14;
    case 2:
      [v5 floatValue];
      __asm { FCVT            H0, S0 }
      LOWORD(v17) = _S0;
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:2];
      goto LABEL_14;
    case 3:
      [v5 floatValue];
      LODWORD(v17) = v14;
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:4];
      goto LABEL_14;
    case 4:
      [v5 doubleValue];
      uint64_t v17 = v15;
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:8];
      goto LABEL_14;
    case 5:
      LOBYTE(v17) = [v5 charValue];
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:1];
      goto LABEL_14;
    case 6:
      LOWORD(v17) = [v5 shortValue];
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:2];
      goto LABEL_14;
    case 7:
      LODWORD(v17) = [v5 intValue];
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:4];
      goto LABEL_14;
    case 8:
      uint64_t v17 = [v5 longValue];
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:8];
      goto LABEL_14;
    case 9:
      LOBYTE(v17) = [v5 unsignedCharValue];
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:1];
      goto LABEL_14;
    case 10:
      LOWORD(v17) = [v5 unsignedShortValue];
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:2];
      goto LABEL_14;
    case 11:
      LODWORD(v17) = [v5 unsignedIntValue];
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:4];
      goto LABEL_14;
    case 12:
      uint64_t v17 = [v5 unsignedLongValue];
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:8];
LABEL_14:
      v7 = (void *)v8;
      break;
    default:
      break;
  }

  return v7;
}

@end