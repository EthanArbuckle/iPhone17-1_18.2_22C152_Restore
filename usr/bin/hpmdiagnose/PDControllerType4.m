@interface PDControllerType4
+ (id)createForDecode;
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
- (BOOL)isSPIMaster;
- (BOOL)supportsRemote;
- (NSDictionary)dpmrConfigs;
- (PDControllerType4)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (id)dpmrSubCommandFormatterHexDumpWithBuffer:(void *)a3 length:(unint64_t)a4 inputBuffer:(void *)a5 andInputLength:(unint64_t)a6;
- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3;
- (id)readFullVersion;
- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5;
- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5 prefixString:(id)a6;
- (id)stringForTitle:(id)a3 valueString:(id)a4;
- (id)stringForValue:(unsigned int)a3 table:(id)a4;
- (id)stringForValue:(unsigned int)a3 table:(id)a4 prefixString:(id)a5;
- (int)dataBuffer:(char *)a3 fromHexString:(id)a4 ofLengthString:(id)a5;
- (int)printAll;
- (int)printAllDPMrSubcommands;
- (int)printDBStateHistory;
- (int)printDPMrSubCommand:(id)a3 withDeviceConfig:(id)a4;
- (int)printDPMrSubCommand:(id)a3 withDeviceConfig:(id)a4 writeBuffer:(void *)a5 writeLength:(unint64_t)a6 readBuffer:(void *)a7 readLength:(unint64_t)a8;
- (int)printDPMrSubCommand:(id)a3 withTitle:(id)a4 andDescription:(id)a5;
- (int)printIECSAceSpecificInfo;
- (int)printIECSStandardInfo;
- (int)printInfo;
- (int)printPDStateHistory;
- (int)printStateHistory;
- (int)printTBRrIfIntelRetimerPresent;
- (int)printTitle;
- (unsigned)chrisTracy:(id)a3;
- (unsigned)majorVersionNumber;
- (void)setDPMrConfigs;
- (void)setDpmrConfigs:(id)a3;
@end

@implementation PDControllerType4

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithAddress:v4 userClient:v6];

  return v7;
}

- (BOOL)supportsRemote
{
  return 1;
}

+ (id)createForDecode
{
  return 0;
}

- (PDControllerType4)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PDControllerType4;
  uint64_t v4 = [(PDControllerType2 *)&v6 initWithAddress:a3 userClient:a4];
  [(PDControllerType4 *)v4 setDPMrConfigs];
  return v4;
}

- (int)printIECSStandardInfo
{
  puts("Reg Name                   Value");
  puts("--------------------------------------");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [&off_10001CD88 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(&off_10001CD88);
      }
      unsigned int v7 = -[PDController printRegister:](self, "printRegister:", [*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedCharValue]);
    }
    int v8 = v7;
    id v4 = [&off_10001CD88 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v8;
}

- (int)printIECSAceSpecificInfo
{
  puts("Device Specific Registers");
  puts("-------------------------");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [&off_10001CDA0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(&off_10001CDA0);
      }
      unsigned int v7 = -[PDController printRegister:](self, "printRegister:", [*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedCharValue]);
    }
    int v8 = v7;
    id v4 = [&off_10001CDA0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v8;
}

- (int)printTitle
{
  id v3 = [(PDController *)self userClient];
  unsigned int v4 = [v3 routerID];
  uint64_t v5 = [(PDController *)self userClient];
  printf("HPM at RID 0x%x Route 0x%llx Address 0x%02x :\n", v4, [v5 routeString], -[PDController address](self, "address"));

  return 0;
}

- (int)printInfo
{
  int result = [(PDControllerType4 *)self printTitle];
  if (!result)
  {
    putchar(10);
    int result = [(PDControllerType4 *)self printIECSStandardInfo];
    if (!result)
    {
      id v4 = [(PDControllerType2 *)self readFullVersionWithConfig];
      printf("0x0f %-22s %s\n", "FW Versions", (const char *)[v4 UTF8String]);

      putchar(10);
      return [(PDControllerType4 *)self printIECSAceSpecificInfo];
    }
  }
  return result;
}

- (int)printAll
{
  int result = [(PDControllerType4 *)self printTitle];
  if (!result)
  {
    putchar(10);
    unsigned __int8 v4 = 0;
    while (1)
    {
      int result = [(PDController *)self printRegister:v4];
      if (result) {
        break;
      }
      if ((++v4 & 0x80) != 0)
      {
        *(void *)&long long v5 = 0xFEFEFEFEFEFEFEFELL;
        *((void *)&v5 + 1) = 0xFEFEFEFEFEFEFEFELL;
        v6[2] = v5;
        v6[3] = v5;
        v6[0] = v5;
        v6[1] = v5;
        [(PDController *)self printCommand:1212377195 withWriteData:v6 withWriteLength:64];
        LODWORD(v6[0]) = 0;
        [(PDController *)self printCommand:1094992754 withWriteData:v6 withWriteLength:4];
        [(PDControllerType4 *)self printAllDPMrSubcommands];
        [(PDControllerType4 *)self printTBRrIfIntelRetimerPresent];
        return 0;
      }
    }
  }
  return result;
}

- (int)printTBRrIfIntelRetimerPresent
{
  unint64_t v7 = 0;
  int result = [(PDController *)self registerRead:v8 ofLength:64 atAddress:41 andOutReadLength:&v7];
  if (!result)
  {
    int result = -536870160;
    if (v7 >= 0x3F)
    {
      if ((v9 & 0xF) != 0 && (v9 & 0xF) != 14)
      {
        char v6 = 4;
        __int16 v5 = 48;
        return [(PDController *)self printCommand:1413632626 withWriteData:&v5 withWriteLength:3];
      }
    }
    else
    {
      return -536870212;
    }
  }
  return result;
}

- (int)printAllDPMrSubcommands
{
  uint64_t v27 = 0;
  id v3 = (char *)malloc_type_malloc(0x40uLL, 0xCB0683FFuLL);
  if (v3)
  {
    unsigned __int8 v4 = v3;
    [(PDController *)self registerRead:v3 ofLength:64 atAddress:41 andOutReadLength:&v27];
    int v22 = *(unsigned __int16 *)(v4 + 61);
    free(v4);
  }
  else
  {
    int v22 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(PDControllerType4 *)self dpmrConfigs];
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      int v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v8);
        long long v10 = [(PDControllerType4 *)self dpmrConfigs];
        long long v11 = [v10 objectForKeyedSubscript:v9];
        long long v12 = [v11 objectForKeyedSubscript:@"mask"];
        unsigned int v13 = [v12 unsignedIntegerValue];

        v14 = [(PDControllerType4 *)self dpmrConfigs];
        v15 = [v14 objectForKeyedSubscript:v9];
        v16 = [v15 objectForKeyedSubscript:@"match"];
        unsigned __int16 v17 = (unsigned __int16)[v16 unsignedIntegerValue];

        if ((v22 & v13) == v17)
        {
          v18 = [(PDControllerType4 *)self dpmrConfigs];
          v19 = [v18 objectForKeyedSubscript:v9];
          [(PDControllerType4 *)self printDPMrSubCommand:v9 withDeviceConfig:v19];
        }
        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  return 0;
}

- (unsigned)majorVersionNumber
{
  id v3 = (unsigned __int8 *)malloc_type_malloc(4uLL, 0x4F43D98CuLL);
  if (!v3) {
    return 0;
  }
  unsigned __int8 v4 = v3;
  [(PDController *)self registerRead:v3 ofLength:4 atAddress:15];
  unsigned __int16 v5 = v4[2];
  free(v4);
  return v5;
}

- (int)dataBuffer:(char *)a3 fromHexString:(id)a4 ofLengthString:(id)a5
{
  id v7 = a4;
  int v8 = +[NSScanner scannerWithString:a5];
  unsigned int v17 = 0;
  [v8 scanHexInt:&v17];
  if (v7)
  {
    unint64_t v9 = (unint64_t)[v7 length];
    if (v17 == v9 >> 1 && v17 != 0)
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      do
      {
        unsigned int v13 = [v7 substringWithRange:v11];
        v14 = +[NSScanner scannerWithString:v13];
        int v16 = 0;
        [v14 scanHexInt:&v16];
        a3[v12] = v16;

        ++v12;
        v11 += 2;
      }
      while (v12 < v17);
    }
  }

  return 0;
}

- (int)printPDStateHistory
{
  id v3 = +[NSMutableArray array];
  long long v23 = +[NSMutableArray array];
  unsigned __int8 v4 = malloc_type_malloc(0x40uLL, 0x717C2283uLL);
  [(PDControllerType4 *)self majorVersionNumber];
  uint64_t v5 = 0;
  int v24 = 0;
  int v27 = 1346655092;
  LOBYTE(v6) = 1;
  int v26 = 1;
  if (v4) {
    int v7 = 0;
  }
  else {
    int v7 = -536870211;
  }
  while (2)
  {
    if (!v7)
    {
      unsigned int v8 = [(PDController *)self registerWrite32:1 atAddress:9];
      if (v8
        || (unsigned int v8 = [(PDController *)self executeIECSCommand:1346655092]) != 0
        || (unsigned int v8 = [(PDController *)self registerRead:v4 ofLength:64 atAddress:9]) != 0)
      {
        int v7 = v8;
      }
      else
      {
        LODWORD(v22) = 4194368;
        int v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v26, 0, v4, 0, v22, 10);
        if (!v7)
        {
          uint64_t v5 = *(unsigned __int16 *)v4;
          LOBYTE(v6) = v4[2];
        }
      }
    }
    unint64_t v9 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:4];
    long long v10 = [v9 objectAtIndexedSubscript:0];
    [(PDController *)self printRegisterTitle:@"PDSt(0)" andDescription:v10];

    if (v6 <= 4u) {
      int v6 = 4;
    }
    else {
      int v6 = v6;
    }
    unsigned int v11 = v6 + 2;
    unsigned __int16 v25 = 2;
    do
    {
      while (1)
      {
        if (!v7)
        {
          LODWORD(v22) = 4194368;
          int v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v25, 0, v4, 0, v22, 10);
          if (!v7) {
            break;
          }
        }
        if (v11 <= ++v25) {
          goto LABEL_25;
        }
      }
      unint64_t v12 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:64];
      [v3 addObjectsFromArray:v12];

      int v7 = 0;
      ++v25;
    }
    while (v11 > v25);
    LODWORD(v22) = 4194368;
    unsigned int v13 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v26, 0, v4, 0, v22, 10);
    if (v13)
    {
      int v7 = v13;
LABEL_25:
      if (v4) {
        free(v4);
      }
      goto LABEL_36;
    }
    if (*(unsigned __int16 *)v4 == v5)
    {
      v14 = v3;
    }
    else
    {
      [v23 addObjectsFromArray:v3];
      v14 = +[NSMutableArray array];

      ++v24;
      uint64_t v15 = *(unsigned __int16 *)v4;
      int v16 = +[NSString stringWithFormat:@"PDSt mismatch %d", v24];
      unsigned int v17 = +[NSString stringWithFormat:@"Start ptr = 0x%04x | End ptr = 0x%04x", v5, v15];
      v18 = [(PDControllerType4 *)self stringForTitle:v16 valueString:v17];
      [v23 addObject:v18];

      if (v24 < 5u)
      {

        int v7 = 0;
        id v3 = v14;
        continue;
      }
      [v14 addObjectsFromArray:v23];
    }
    break;
  }
  free(v4);
  if ([v14 count])
  {
    unint64_t v19 = 0;
    do
    {
      v20 = [v14 objectAtIndexedSubscript:v19];
      if (v19) {
        [(PDController *)self printRegisterDescription:v20];
      }
      else {
        [(PDController *)self printRegisterTitle:@"'PDSt'" andDescription:v20];
      }

      ++v19;
    }
    while ((unint64_t)[v14 count] > v19);
  }
  int v7 = 0;
  id v3 = v14;
LABEL_36:

  return v7;
}

- (int)printDBStateHistory
{
  id v3 = +[NSMutableArray array];
  int v18 = 0;
  int v19 = 1145197428;
  unsigned __int8 v4 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0xC5E5A04FuLL);
  [(PDControllerType4 *)self majorVersionNumber];
  if (v4)
  {
    LODWORD(v16) = 4194368;
    unsigned int v5 = 1;
    int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v19, &v18, 0, v4, 0, v16, 10);
    if (!v6) {
      unsigned int v5 = v4[2];
    }
  }
  else
  {
    int v6 = -536870211;
    unsigned int v5 = 1;
  }
  int v7 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:8];
  unsigned int v8 = [v7 objectAtIndexedSubscript:0];
  [(PDController *)self printRegisterTitle:@"DBSt(0)" andDescription:v8];

  if (v5 <= 4) {
    unsigned int v9 = 4;
  }
  else {
    unsigned int v9 = v5;
  }
  for (unsigned __int16 i = 1; i <= v9; ++i)
  {
    while (1)
    {
      if (!v6)
      {
        LODWORD(v16) = 4194368;
        int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v19, &i, 0, v4, 0, v16, 10);
        if (!v6) {
          break;
        }
      }
      if (v9 < ++i) {
        goto LABEL_15;
      }
    }
    long long v10 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:64];
    [v3 addObjectsFromArray:v10];

    int v6 = 0;
  }
  LODWORD(v16) = 4194368;
  int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v19, &v18, 0, v4, 0, v16, 10);
  if (v6)
  {
LABEL_15:
    if (!v4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  unint64_t v12 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:2];
  unsigned int v13 = [v12 objectAtIndexedSubscript:0];
  [(PDController *)self printRegisterDescription:v13];

  if ([v3 count])
  {
    unint64_t v14 = 0;
    do
    {
      uint64_t v15 = [v3 objectAtIndexedSubscript:v14];
      if (v14) {
        [(PDController *)self printRegisterDescription:v15];
      }
      else {
        [(PDController *)self printRegisterTitle:@"'DBSt'" andDescription:v15];
      }

      ++v14;
    }
    while ((unint64_t)[v3 count] > v14);
  }
  int v6 = 0;
  if (v4) {
LABEL_16:
  }
    free(v4);
LABEL_17:

  return v6;
}

- (int)printStateHistory
{
  return [(PDControllerType4 *)self printDBStateHistory];
}

- (id)stringForValue:(unsigned int)a3 table:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  int v6 = +[NSNumber numberWithUnsignedInt:v4];
  int v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    int v7 = +[NSString stringWithFormat:@"Unknown (0x%x)", v4];
  }

  return v7;
}

- (id)stringForValue:(unsigned int)a3 table:(id)a4 prefixString:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  unsigned int v9 = +[NSNumber numberWithUnsignedInt:v6];
  long long v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    unsigned int v11 = +[NSString stringWithFormat:@"%@%@", v7, v10];
  }
  else
  {
    unsigned int v11 = +[NSString stringWithFormat:@"Unknown (0x%x)", v6];
  }

  return v11;
}

- (id)stringForTitle:(id)a3 valueString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%-22s %@", [v5 UTF8String], v6);

  return v7;
}

- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned int v9 = [(PDControllerType4 *)self stringForValue:v6 table:a5];
  long long v10 = [(PDControllerType4 *)self stringForTitle:v8 valueString:v9];

  return v10;
}

- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5 prefixString:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  unsigned int v11 = [(PDControllerType4 *)self stringForValue:v8 table:a5 prefixString:a6];
  unint64_t v12 = [(PDControllerType4 *)self stringForTitle:v10 valueString:v11];

  return v12;
}

- (unsigned)chrisTracy:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v10[0] = &off_10001B618;
    v10[1] = &off_10001B720;
    v11[0] = &off_10001B618;
    v11[1] = &off_10001B618;
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v5 = v3;
    [v5 cStringUsingEncoding:1];
    if ((unint64_t)[v5 length] <= 8) {
      [v5 length];
    }
    __memcpy_chk();
    id v7 = +[NSNumber numberWithUnsignedLongLong:0];
    uint64_t v8 = [v4 objectForKey:v7];

    if (v8) {
      unsigned int v6 = [v8 unsignedLongValue];
    }
    else {
      unsigned int v6 = *(_DWORD *)[v5 cStringUsingEncoding:1];
    }
  }
  else
  {
    unsigned int v6 = 0;
  }

  return bswap32(v6);
}

- (id)readFullVersion
{
  unint64_t v13 = 0;
  id v3 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0x263B43DuLL);
  if (v3)
  {
    unsigned int v4 = [(PDController *)self registerRead:v3 ofLength:64 atAddress:15 andOutReadLength:&v13];
    BOOL v5 = v13 > 4;
  }
  else
  {
    BOOL v5 = 0;
    unsigned int v4 = -536870210;
  }
  if (v4 == 0 && v5) {
    int v6 = -536870169;
  }
  else {
    int v6 = v4;
  }
  if (v6)
  {
    unsigned int v7 = 0;
LABEL_11:
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  unsigned int v7 = *(_DWORD *)v3;
  unsigned int v8 = [(PDController *)self registerRead:v3 ofLength:64 atAddress:44 andOutReadLength:&v13];
  if (v8)
  {
    int v6 = v8;
    goto LABEL_11;
  }
  if (v13 <= 2)
  {
    int v6 = 0;
    uint64_t v9 = v3[1];
  }
  else
  {
    uint64_t v9 = 0;
    int v6 = -536870169;
  }
LABEL_12:
  id v10 = +[NSMutableString string];
  unsigned int v11 = v10;
  if (!v6) {
    [v10 appendFormat:@"%X.%X.%X.%d", v7 >> 20, (v7 >> 8) & 0xFFF, v7, v9];
  }

  return v11;
}

- (BOOL)isSPIMaster
{
  uint64_t v6 = 0;
  id v3 = (char *)malloc_type_malloc(0x40uLL, 0x8C5C3DEAuLL);
  if (!v3) {
    return 1;
  }
  unsigned int v4 = v3;
  [(PDController *)self registerRead:v3 ofLength:64 atAddress:45 andOutReadLength:&v6];
  return *v4 < 0;
}

- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v20 = 0;
  BOOL v5 = malloc_type_malloc(0x40uLL, 0x4D9C699CuLL);
  if (v5)
  {
    uint64_t v6 = v5;
    [(PDController *)self registerRead:v5 ofLength:64 atAddress:47 andOutReadLength:&v20];
    if (v20)
    {
      uint64_t v7 = 0;
      int v8 = 0;
      int v9 = 0;
      while (1)
      {
        if (v6[v7] == 32)
        {
          unint64_t v10 = v8;
          uint64_t v11 = ((uint64_t)v8 << 32) - 0x100000000;
          uint64_t v12 = ((uint64_t)v8 << 32) + 0x500000000;
          v8 -= 2;
          do
          {
            BOOL v13 = v6[v10] == 32 && v20 > v10;
            ++v10;
            v11 += (uint64_t)&_mh_execute_header;
            v12 += (uint64_t)&_mh_execute_header;
            ++v8;
          }
          while (v13);
          if (++v9 == 3) {
            break;
          }
        }
        uint64_t v7 = ++v8;
        if (v20 <= v8) {
          goto LABEL_12;
        }
      }
      if (v3) {
        uint64_t v15 = &v6[v12 >> 32];
      }
      else {
        uint64_t v15 = &v6[v11 >> 32];
      }
      uint64_t v16 = +[NSString stringWithUTF8String:v15];
      unsigned int v17 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      unint64_t v14 = [v16 stringByTrimmingCharactersInSet:v17];
    }
    else
    {
LABEL_12:
      unint64_t v14 = 0;
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PDControllerType4;
    unint64_t v14 = [(PDControllerType2 *)&v19 getDeviceInfoNameWithConfigOnly:v3];
  }

  return v14;
}

- (int)printDPMrSubCommand:(id)a3 withDeviceConfig:(id)a4 writeBuffer:(void *)a5 writeLength:(unint64_t)a6 readBuffer:(void *)a7 readLength:(unint64_t)a8
{
  id v13 = a3;
  unint64_t v14 = [(PDControllerType4 *)self dpmrSubCommandFormatterHexDumpWithBuffer:a7 length:a8 inputBuffer:a5 andInputLength:a6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 count])
    {
      if ([v15 count])
      {
        unint64_t v16 = 0;
        do
        {
          unsigned int v17 = [v15 objectAtIndexedSubscript:v16];
          int v18 = v17;
          if (v16) {
            printf("\t%s\n", (const char *)[v17 UTF8String]);
          }
          else {
            [(PDControllerType4 *)self printDPMrSubCommand:v13 withTitle:v13 andDescription:v17];
          }

          ++v16;
        }
        while ((unint64_t)[v15 count] > v16);
      }
    }
    else
    {
      [(PDControllerType4 *)self printDPMrSubCommand:v13 withTitle:v13 andDescription:&stru_1000186C8];
    }
  }
  else
  {
    [(PDControllerType4 *)self printDPMrSubCommand:v13 withTitle:v13 andDescription:v14];
  }

  return 0;
}

- (int)printDPMrSubCommand:(id)a3 withDeviceConfig:(id)a4
{
  id v45 = a3;
  id v5 = a4;
  uint64_t v6 = malloc_type_malloc(0x40uLL, 0x29832565uLL);
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  v6[3] = 0u;
  v46 = v6;
  int v60 = 1146113394;
  uint64_t v7 = malloc_type_malloc(0x40uLL, 0x8843C320uLL);
  *uint64_t v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  int v8 = [v5 objectForKeyedSubscript:@"iecs_style"];
  unsigned int v9 = [v8 BOOLValue];

  unint64_t v10 = [v5 objectForKeyedSubscript:@"i2c_addr"];
  *(unsigned char *)uint64_t v7 = [v10 unsignedCharValue];

  uint64_t v11 = [v5 objectForKeyedSubscript:@"registers"];
  unsigned __int8 v12 = [v11 count];

  *((unsigned char *)v7 + 1) = v12 - 1;
  if (v9)
  {
    long long v58 = 0uLL;
    long long v59 = 0uLL;
    long long v56 = 0uLL;
    long long v57 = 0uLL;
    id v13 = [v5 objectForKeyedSubscript:@"registers"];
    id v14 = [v13 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (!v14) {
      goto LABEL_23;
    }
    id v15 = v14;
    id v44 = v5;
    uint64_t v16 = *(void *)v57;
    LODWORD(v17) = 2;
LABEL_4:
    uint64_t v18 = 0;
    uint64_t v17 = (int)v17;
    while (1)
    {
      if (*(void *)v57 != v16) {
        objc_enumerationMutation(v13);
      }
      objc_super v19 = *(void **)(*((void *)&v56 + 1) + 8 * v18);
      unint64_t v20 = [v19 objectForKeyedSubscript:@"address"];
      *((unsigned char *)v7 + v17) = [v20 unsignedCharValue];

      v21 = [v19 objectForKeyedSubscript:@"length"];
      *((unsigned char *)v7 + v17 + 1) = [v21 unsignedCharValue] | 0x80;

      if (v17 > 61) {
        break;
      }
      v17 += 2;
      if (v15 == (id)++v18)
      {
        id v15 = [v13 countByEnumeratingWithState:&v56 objects:v63 count:16];
        if (v15) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  else
  {
    long long v54 = 0uLL;
    long long v55 = 0uLL;
    long long v52 = 0uLL;
    long long v53 = 0uLL;
    id v13 = [v5 objectForKeyedSubscript:@"registers"];
    id v22 = [v13 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (!v22) {
      goto LABEL_23;
    }
    id v23 = v22;
    id v44 = v5;
    uint64_t v24 = *(void *)v53;
    int v25 = 2;
LABEL_13:
    uint64_t v26 = 0;
    if (v25 <= 63) {
      int v27 = 63;
    }
    else {
      int v27 = v25;
    }
    uint64_t v28 = (v27 - v25);
    while (1)
    {
      if (*(void *)v53 != v24) {
        objc_enumerationMutation(v13);
      }
      v29 = [*(id *)(*((void *)&v52 + 1) + 8 * v26) objectForKeyedSubscript:@"address"];
      *((unsigned char *)v7 + v25 + v26) = [v29 unsignedCharValue];

      if (v28 == v26) {
        break;
      }
      if (v23 == (id)++v26)
      {
        v25 += v26;
        id v23 = [v13 countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v23) {
          goto LABEL_13;
        }
        break;
      }
    }
  }
  id v5 = v44;
LABEL_23:

  LODWORD(v43) = 4194368;
  -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v60, v7, 0, v46, 0, v43, 10);
  *uint64_t v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v30 = v5;
  v31 = [v5 objectForKeyedSubscript:@"registers"];
  id v32 = [v31 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v32)
  {
    id v33 = v32;
    int v34 = 0;
    uint64_t v35 = *(void *)v49;
    do
    {
      v36 = 0;
      int v37 = v34;
      v38 = (char *)v7 + v34;
      do
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(v31);
        }
        v39 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)v36) objectForKeyedSubscript:@"address"];
        *((unsigned char *)v36 + (void)v38) = [v39 unsignedCharValue];

        v36 = (char *)v36 + 1;
      }
      while (v33 != v36);
      id v33 = [v31 countByEnumeratingWithState:&v48 objects:v61 count:16];
      int v34 = v37 + v36;
    }
    while (v33);
  }

  v40 = [v30 objectForKeyedSubscript:@"registers"];
  int v41 = -[PDControllerType4 printDPMrSubCommand:withDeviceConfig:writeBuffer:writeLength:readBuffer:readLength:](self, "printDPMrSubCommand:withDeviceConfig:writeBuffer:writeLength:readBuffer:readLength:", v45, v30, v7, [v40 count], v46, 64);

  free(v46);
  free(v7);

  return v41;
}

- (int)printDPMrSubCommand:(id)a3 withTitle:(id)a4 andDescription:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  int v8 = (const char *)[v6 UTF8String];
  id v9 = v7;
  unint64_t v10 = (const char *)[v9 UTF8String];

  printf("'%s'\t%s\n", v8, v10);
  return 0;
}

- (id)dpmrSubCommandFormatterHexDumpWithBuffer:(void *)a3 length:(unint64_t)a4 inputBuffer:(void *)a5 andInputLength:(unint64_t)a6
{
  unint64_t v10 = +[NSMutableArray array];
  uint64_t v11 = +[NSMutableString string];
  [v11 appendFormat:@"0x%02llX\t0x", a6];
  for (; a6; --a6)
  {
    unsigned int v12 = *(unsigned __int8 *)a5;
    a5 = (char *)a5 + 1;
    [v11 appendFormat:@"%02X", v12];
  }
  [v10 addObject:v11];
  id v13 = +[NSMutableString string];

  [v13 appendFormat:@"0x%02llX\t0x", a4];
  for (; a4; --a4)
  {
    unsigned int v14 = *(unsigned __int8 *)a3;
    a3 = (char *)a3 + 1;
    [v13 appendFormat:@"%02x", v14];
  }
  [v10 addObject:v13];

  return v10;
}

- (void)setDPMrConfigs
{
}

- (NSDictionary)dpmrConfigs
{
  return *(NSDictionary **)&self->PDOSourceType[9];
}

- (void)setDpmrConfigs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end