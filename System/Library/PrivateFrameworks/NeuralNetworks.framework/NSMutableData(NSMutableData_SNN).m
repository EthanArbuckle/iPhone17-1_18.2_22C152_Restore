@interface NSMutableData(NSMutableData_SNN)
- (void)appendScalar:()NSMutableData_SNN dataType:;
- (void)appendScalars:()NSMutableData_SNN dataType:;
@end

@implementation NSMutableData(NSMutableData_SNN)

- (void)appendScalar:()NSMutableData_SNN dataType:
{
  id v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0:
      LOBYTE(v15) = [v6 BOOLValue];
      [a1 appendBytes:&v15 length:1];
      break;
    case 2:
      [v6 floatValue];
      __asm { FCVT            H0, S0 }
      LOWORD(v15) = _S0;
      [a1 appendBytes:&v15 length:2];
      break;
    case 3:
      [v6 floatValue];
      LODWORD(v15) = v13;
      [a1 appendBytes:&v15 length:4];
      break;
    case 4:
      [v6 doubleValue];
      uint64_t v15 = v14;
      [a1 appendBytes:&v15 length:8];
      break;
    case 5:
      LOBYTE(v15) = [v6 charValue];
      [a1 appendBytes:&v15 length:1];
      break;
    case 6:
      LOWORD(v15) = [v6 shortValue];
      [a1 appendBytes:&v15 length:2];
      break;
    case 7:
      LODWORD(v15) = [v6 intValue];
      [a1 appendBytes:&v15 length:4];
      break;
    case 8:
      uint64_t v15 = [v6 longValue];
      [a1 appendBytes:&v15 length:8];
      break;
    case 9:
      LOBYTE(v15) = [v6 unsignedCharValue];
      [a1 appendBytes:&v15 length:1];
      break;
    case 10:
      LOWORD(v15) = [v6 unsignedShortValue];
      [a1 appendBytes:&v15 length:2];
      break;
    case 11:
      LODWORD(v15) = [v6 unsignedIntValue];
      [a1 appendBytes:&v15 length:4];
      break;
    case 12:
      uint64_t v15 = [v6 unsignedLongValue];
      [a1 appendBytes:&v15 length:8];
      break;
    default:
      break;
  }
}

- (void)appendScalars:()NSMutableData_SNN dataType:
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(a1, "appendScalar:dataType:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), a4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end