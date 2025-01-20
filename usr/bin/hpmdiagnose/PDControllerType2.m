@interface PDControllerType2
+ (id)createForDecode;
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
- (BOOL)isSPIMaster;
- (BOOL)supportsRemote;
- (PDControllerType2)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3;
- (id)readFullVersion;
- (id)readFullVersionWithConfig;
- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5;
- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5 prefixString:(id)a6;
- (id)stringForTitle:(id)a3 valueString:(id)a4;
- (id)stringForValue:(unsigned int)a3 table:(id)a4;
- (id)stringForValue:(unsigned int)a3 table:(id)a4 prefixString:(id)a5;
- (int)disc:(unsigned __int8)a3;
- (int)executeIECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11;
- (int)printAll;
- (int)printDBStateHistory;
- (int)printIECSAceSpecificInfo;
- (int)printIECSStandardInfo;
- (int)printInfo;
- (int)printPDStateHistory;
- (int)printStateHistory;
- (int)printTitle;
- (unsigned)chrisTracy:(id)a3;
- (unsigned)majorVersionNumber;
- (unsigned)readUUIDIntoBuffer:(char *)a3 ofLength:(unsigned __int8)a4;
@end

@implementation PDControllerType2

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

- (PDControllerType2)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PDControllerType2;
  return [(PDController *)&v5 initWithAddress:a3 userClient:a4];
}

- (int)printIECSStandardInfo
{
  puts("Reg Name                   Value");
  puts("--------------------------------------");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [&off_10001CCC8 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_enumerationMutation(&off_10001CCC8);
      }
      unsigned int v7 = -[PDController printRegister:](self, "printRegister:", [*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedCharValue]);
    }
    int v8 = v7;
    id v4 = [&off_10001CCC8 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
  id v3 = [&off_10001CCE0 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_enumerationMutation(&off_10001CCE0);
      }
      unsigned int v7 = -[PDController printRegister:](self, "printRegister:", [*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedCharValue]);
    }
    int v8 = v7;
    id v4 = [&off_10001CCE0 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
  int result = [(PDControllerType2 *)self printTitle];
  if (!result)
  {
    putchar(10);
    int result = [(PDControllerType2 *)self printIECSStandardInfo];
    if (!result)
    {
      id v4 = [(PDControllerType2 *)self readFullVersionWithConfig];
      printf("0x0f %-22s %s\n", "FW Versions", (const char *)[v4 UTF8String]);

      putchar(10);
      return [(PDControllerType2 *)self printIECSAceSpecificInfo];
    }
  }
  return result;
}

- (int)printAll
{
  if (![(PDControllerType2 *)self printTitle])
  {
    putchar(10);
    LOBYTE(v3) = 0;
    do
    {
      if ([(PDController *)self printRegister:v3]) {
        break;
      }
      int v3 = (char)(v3 + 1);
    }
    while ((v3 & 0x80000000) == 0);
  }
  [(PDController *)self printCommand:1212377195 withWriteData:0 withWriteLength:0];
  int v10 = 0;
  [(PDController *)self printCommand:1094992754 withWriteData:&v10 withWriteLength:4];
  id v4 = +[NSMutableArray array];
  *(void *)&long long v11 = 0;
  uint64_t v5 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0x6C35967CuLL);
  int v6 = 0;
  if (!v5)
  {
    unsigned int v7 = +[NSString stringWithFormat:@"Malloc failed for rdo object pull"];
    [v4 addObject:v7];

    int v6 = -536870211;
  }
  [(PDController *)self registerRead:v5 ofLength:64 atAddress:41 andOutReadLength:&v11];
  unsigned int v8 = v5[55];
  self->mux_type = v8 & 7;
  self->debug_mux = (v8 >> 4) & 3;

  if (self->mux_type == 2)
  {
    long long v11 = xmmword_100015290;
    *(_OWORD *)long long v12 = unk_1000152A0;
    *(void *)&v12[13] = 0xF3F2F1F04D4A4948;
    [(PDController *)self printCommand:1146113394 withWriteData:&v11 withWriteLength:37];
  }
  return v6;
}

- (unsigned)majorVersionNumber
{
  int v3 = (unsigned __int8 *)malloc_type_malloc(4uLL, 0x90DC54E7uLL);
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  [(PDController *)self registerRead:v3 ofLength:4 atAddress:15];
  unsigned __int16 v5 = v4[2];
  free(v4);
  return v5;
}

- (int)printPDStateHistory
{
  int v3 = +[NSMutableArray array];
  v23 = +[NSMutableArray array];
  id v4 = malloc_type_malloc(0x40uLL, 0xB85BCF6CuLL);
  [(PDControllerType2 *)self majorVersionNumber];
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
      LODWORD(v22) = 4194368;
      int v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v26, 0, v4, 0, v22, 10);
      if (!v7)
      {
        uint64_t v5 = *(unsigned __int16 *)v4;
        LOBYTE(v6) = v4[2];
      }
    }
    unsigned int v8 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:4];
    v9 = [v8 objectAtIndexedSubscript:0];
    [(PDController *)self printRegisterTitle:@"PDSt(0)" andDescription:v9];

    if (v6 <= 4u) {
      int v6 = 4;
    }
    else {
      int v6 = v6;
    }
    unsigned int v10 = v6 + 2;
    LOBYTE(v11) = 2;
    __int16 v25 = 2;
    do
    {
      while (1)
      {
        if (!v7)
        {
          int v7 = [(PDController *)self registerWrite8:v11 atAddress:9];
          if (!v7)
          {
            int v7 = [(PDController *)self executeIECSCommand:1346655092];
            if (!v7)
            {
              int v7 = [(PDController *)self registerRead:v4 ofLength:64 atAddress:9];
              if (!v7)
              {
                LODWORD(v22) = 4194306;
                int v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v25, 0, v4, 0, v22, 10);
                if (!v7) {
                  break;
                }
              }
            }
          }
        }
        unsigned __int16 v11 = v25 + 1;
        __int16 v25 = v11;
        if (v10 <= v11) {
          goto LABEL_24;
        }
      }
      long long v12 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:64];
      [v3 addObjectsFromArray:v12];

      int v7 = 0;
      unsigned __int16 v11 = v25 + 1;
      __int16 v25 = v11;
    }
    while (v10 > v11);
    LODWORD(v22) = 4194368;
    unsigned int v13 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v26, 0, v4, 0, v22, 10);
    if (v13)
    {
      int v7 = v13;
LABEL_24:
      if (v4) {
        free(v4);
      }
      goto LABEL_35;
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
      v16 = +[NSString stringWithFormat:@"PDSt mismatch %d", v24];
      v17 = +[NSString stringWithFormat:@"Start ptr = 0x%04x | End ptr = 0x%04x", v5, v15];
      v18 = [(PDControllerType2 *)self stringForTitle:v16 valueString:v17];
      [v23 addObject:v18];

      if (v24 < 5u)
      {

        int v7 = 0;
        int v3 = v14;
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
  int v3 = v14;
LABEL_35:

  return v7;
}

- (int)printDBStateHistory
{
  int v3 = +[NSMutableArray array];
  int v16 = 0;
  int v17 = 1145197428;
  id v4 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0xFC6B2E66uLL);
  [(PDControllerType2 *)self majorVersionNumber];
  if (v4)
  {
    LODWORD(v14) = 4194368;
    unsigned int v5 = 1;
    int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v17, &v16, 0, v4, 0, v14, 10);
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
    if (!v6)
    {
      LODWORD(v14) = 4194306;
      int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v17, &i, 0, v4, 0, v14, 10);
      if (!v6)
      {
        unsigned int v10 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:64];
        [v3 addObjectsFromArray:v10];

        int v6 = 0;
      }
    }
  }
  if (v4) {
    free(v4);
  }
  if (!v6 && [v3 count])
  {
    unint64_t v11 = 0;
    do
    {
      long long v12 = [v3 objectAtIndexedSubscript:v11];
      if (v11) {
        [(PDController *)self printRegisterDescription:v12];
      }
      else {
        [(PDController *)self printRegisterTitle:@"'DBSt'" andDescription:v12];
      }

      ++v11;
    }
    while ((unint64_t)[v3 count] > v11);
  }

  return v6;
}

- (int)printStateHistory
{
  if ([(PDControllerType2 *)self majorVersionNumber] == 6)
  {
    return [(PDControllerType2 *)self printDBStateHistory];
  }
  else
  {
    return [(PDControllerType2 *)self printPDStateHistory];
  }
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
  unsigned int v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    unint64_t v11 = +[NSString stringWithFormat:@"%@%@", v7, v10];
  }
  else
  {
    unint64_t v11 = +[NSString stringWithFormat:@"Unknown (0x%x)", v6];
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
  unsigned int v9 = [(PDControllerType2 *)self stringForValue:v6 table:a5];
  unsigned int v10 = [(PDControllerType2 *)self stringForTitle:v8 valueString:v9];

  return v10;
}

- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5 prefixString:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  unint64_t v11 = [(PDControllerType2 *)self stringForValue:v8 table:a5 prefixString:a6];
  long long v12 = [(PDControllerType2 *)self stringForTitle:v10 valueString:v11];

  return v12;
}

- (int)disc:(unsigned __int8)a3
{
  unsigned __int8 v14 = a3;
  if ([(PDController *)self remote] && ![(PDControllerType2 *)self supportsRemote])
  {
    printf("pd controller at 0x%02x does not support remote access\n", [(PDController *)self address]);
    return -536870170;
  }
  uint64_t v4 = [(PDControllerType2 *)self getDeviceInfoNameWithConfigOnly:1];
  unsigned int v5 = [(PDControllerType2 *)self chrisTracy:v4];

  int v12 = 1280262987;
  unsigned int v13 = v5;
  if (v5)
  {
    LODWORD(v10) = 4;
    int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v12, &v13, 0, 0, 0, v10, 10);
    int v11 = 1145656131;
    if (v6) {
      return v6;
    }
  }
  else
  {
    int v11 = 1145656131;
  }
  id v7 = malloc_type_malloc(0x40uLL, 0x834941B8uLL);
  if (!v7) {
    return -536870211;
  }
  uint64_t v8 = v7;
  LODWORD(v10) = 4194305;
  int v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v11, &v14, 0, v7, 0, v10, 10);
  free(v8);
  return v6;
}

- (id)readFullVersion
{
  unint64_t v13 = 0;
  int v3 = (unsigned int *)malloc_type_malloc(0x40uLL, 0x4CFCA601uLL);
  if (v3)
  {
    unsigned int v4 = [(PDController *)self registerRead:v3 ofLength:64 atAddress:15 andOutReadLength:&v13];
    int v5 = v13 > 4;
    BOOL v6 = v4 == 0;
  }
  else
  {
    int v5 = 0;
    BOOL v6 = 0;
  }
  if ((v6 & ~v5) == 0) {
    goto LABEL_8;
  }
  unsigned int v7 = *v3;
  unsigned int v8 = [(PDController *)self registerRead:v3 ofLength:64 atAddress:44 andOutReadLength:&v13];
  unsigned int v9 = &stru_1000186C8;
  if (!v8 && v13 <= 2)
  {
    unsigned __int8 v12 = 0;
    uint64_t v11 = 0;
    if ([(PDController *)self registerRead:&v12 ofLength:1 atAddress:44 andOutReadLength:&v11])
    {
LABEL_8:
      unsigned int v9 = &stru_1000186C8;
      goto LABEL_9;
    }
    unsigned int v9 = +[NSString stringWithFormat:@"%X.%X.%X.%d", HIWORD(v7), BYTE1(v7), v7, v12];
  }
LABEL_9:

  return v9;
}

- (id)readFullVersionWithConfig
{
  int v3 = [(PDControllerType2 *)self readFullVersion];
  id v4 = [(PDControllerType2 *)self getDeviceInfoNameWithConfigOnly:1];
  int v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (%s)", v3, [v4 UTF8String]);

  return v5;
}

- (unsigned)readUUIDIntoBuffer:(char *)a3 ofLength:(unsigned __int8)a4
{
  uint64_t v6 = 0;
  if (a4 >= 0x40u) {
    *(void *)&a4 = 64;
  }
  else {
    uint64_t v4 = a4;
  }
  [(PDController *)self registerRead:a3 ofLength:a4 atAddress:5 andOutReadLength:&v6];
  return v6;
}

- (BOOL)isSPIMaster
{
  uint64_t v7 = 0;
  int v3 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0x977BF70EuLL);
  if (v3)
  {
    uint64_t v4 = v3;
    [(PDController *)self registerRead:v3 ofLength:64 atAddress:45 andOutReadLength:&v7];
    return (*v4 >> 3) & 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = 0;
  BOOL v5 = malloc_type_malloc(0x40uLL, 0xB478897DuLL);
  if (v5)
  {
    uint64_t v6 = v5;
    [(PDController *)self registerRead:v5 ofLength:64 atAddress:47 andOutReadLength:&v13];
    if (v13)
    {
      uint64_t v7 = 0;
      int v8 = 0;
      while (1)
      {
        if (v6[v7] == 32) {
          ++v8;
        }
        if (v8 == 3) {
          break;
        }
        if (v13 == ++v7) {
          goto LABEL_8;
        }
      }
      if (v3) {
        uint64_t v10 = (v7 + 2);
      }
      else {
        uint64_t v10 = (v7 + 1);
      }
      unsigned int v9 = +[NSString stringWithUTF8String:&v6[v10]];
    }
    else
    {
LABEL_8:
      unsigned int v9 = 0;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PDControllerType2;
    unsigned int v9 = [(PDController *)&v12 getDeviceInfoNameWithConfigOnly:v3];
  }

  return v9;
}

- (unsigned)chrisTracy:(id)a3
{
  return 827609923;
}

- (int)executeIECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11
{
  uint64_t v16 = a3;
  if ([(PDController *)self remote]) {
    return -536870201;
  }
  unint64_t v19 = [(PDController *)self userClient];
  LODWORD(v22) = 0;
  LODWORD(v21) = __PAIR32__(a10, a9);
  int v20 = [v19 IECSAtomicCommand:v16 cmdBuffer:a4 dataBuffer:a5 extDataBuffer:a6 returnDataBuffer:a7 returnExtDataBuffer:a8 inputDataLength:v21 returnDataBufferLength:a11 timeoutInSeconds:-[PDController address](self forDevice:"address") flags:v22];

  return v20;
}

@end