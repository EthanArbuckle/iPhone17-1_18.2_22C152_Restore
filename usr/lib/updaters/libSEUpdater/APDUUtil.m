@interface APDUUtil
+ (CApdu)getCXXApduWithCla:(SEL)a3 ins:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 payload:(unsigned __int8)a7;
+ (id)getAPDUWithCla:(unsigned __int8)a3 ins:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 payload:(id)a7;
@end

@implementation APDUUtil

+ (id)getAPDUWithCla:(unsigned __int8)a3 ins:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 payload:(id)a7
{
  uint64_t v7 = a6;
  uint64_t v8 = a5;
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  id v11 = a7;
  v12 = [MEMORY[0x263EFF990] dataWithCapacity:objc_msgSend(v11, "length") + 5];
  [v12 appendU8:v10];
  [v12 appendU8:v9];
  [v12 appendU8:v8];
  [v12 appendU8:v7];
  [v12 appendU8:[v11 length]];
  if (v11) {
    [v12 appendData:v11];
  }

  return v12;
}

+ (CApdu)getCXXApduWithCla:(SEL)a3 ins:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 payload:(unsigned __int8)a7
{
  id v10 = [a2 getAPDUWithCla:a4 ins:a5 p1:a6 p2:a7 payload:a8];
  SERestoreInfo::CApdu::CApdu((SERestoreInfo::CApdu *)retstr, (const unsigned __int8 *)[v10 bytes], [v10 length]);
}

@end