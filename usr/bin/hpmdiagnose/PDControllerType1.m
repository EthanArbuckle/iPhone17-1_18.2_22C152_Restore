@interface PDControllerType1
+ (id)PDControllerType1WithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
- (BOOL)supportsRemote;
- (NSDictionary)expanderGpioMap;
- (NSDictionary)gpioMap;
- (PDControllerType1)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (PDControllerType3)micro_user_client;
- (id)registerFormatterBusPowerWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterPDControllerType1StateWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)stateStringForExpanderGPIO:(unsigned int)a3;
- (id)stateStringForGPIO:(unsigned int)a3;
- (id)stateStringForGPIOFromFile:(id)a3;
- (id)stringForTitle:(id)a3 valueString:(id)a4;
- (int)executeIECSCommand:(unsigned int)a3;
- (int)expanderRegisterRead16:(unsigned __int16 *)a3 atOffset:(unsigned __int8)a4;
- (int)getCCRole:(int *)a3;
- (int)getPDMode:(int *)a3;
- (int)getPinOutRevision:(unsigned int *)a3;
- (int)i2cRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)i2cRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6;
- (int)i2cWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)i2cWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andRead:(void *)a6 ofLength:(unint64_t)a7 andOutReadLength:(unint64_t *)a8;
- (int)isPDControllerType1:(BOOL *)a3;
- (int)isPDControllerType3HPM:(BOOL *)a3;
- (int)isVCONNOn:(BOOL *)a3;
- (int)memRead:(unsigned int *)a3 atAddress:(unsigned int)a4;
- (int)memWrite:(unsigned int)a3 atAddress:(unsigned int)a4;
- (int)printAll;
- (int)printCCRole;
- (int)printCCState;
- (int)printDXState;
- (int)printExpanderGPIOState;
- (int)printGPIOState;
- (int)printIECSPDControllerType1SpecificInfo;
- (int)printIECSPDControllerType3SpecificInfo;
- (int)printIECSStandardInfo;
- (int)printInfo;
- (int)printRFUState;
- (int)printROMInfo;
- (int)printSSState;
- (int)printUSBCInfo;
- (int)printVBUSState;
- (int)printVCONNState;
- (int)printVDETState;
- (int)readDirection:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4;
- (int)readDirection:(BOOL *)a3 forGPIO:(unsigned int)a4;
- (int)readInputLevel:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4;
- (int)readLevel:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4;
- (int)readLevel:(BOOL *)a3 forGPIO:(unsigned int)a4;
- (int)readOutputLevel:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4;
- (int)receiveVDM:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7;
- (int)receiveVDMAttention:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7;
- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6;
- (int)registerWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)sendVDM:(void *)a3 length:(unint64_t)a4 sop:(int)a5;
- (void)dealloc;
- (void)printGPIOWithPort:(id)a3 pin:(id)a4 title:(id)a5 andState:(id)a6;
- (void)printStateWithTitle:(id)a3 andDescription:(id)a4;
- (void)setExpanderGpioMap:(id)a3;
- (void)setGpioMap:(id)a3;
- (void)setMicro_user_client:(id)a3;
@end

@implementation PDControllerType1

+ (id)PDControllerType1WithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithAddress:v4 userClient:v6];

  return v7;
}

- (PDControllerType1)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PDControllerType1;
  id v7 = [(PDController *)&v10 initWithAddress:v4 userClient:v6];
  if (v7)
  {
    v8 = +[PDControllerType3 PDControllerType3MicroWithDeviceAddress:v4 userClient:v6];
    [(PDControllerType1 *)v7 setMicro_user_client:v8];
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PDControllerType1;
  [(PDControllerType1 *)&v2 dealloc];
}

- (BOOL)supportsRemote
{
  return 1;
}

- (int)isPDControllerType1:(BOOL *)a3
{
  *a3 = 0;
  uint64_t v7 = 0;
  int result = [(PDController *)self registerRead32:(char *)&v7 + 4 atAddress:0];
  if (!result)
  {
    int result = [(PDController *)self registerRead32:&v7 atAddress:1];
    if (!result)
    {
      int result = 0;
      if (HIDWORD(v7) == 2599 && v7 == 24) {
        *a3 = 1;
      }
    }
  }
  return result;
}

- (int)isPDControllerType3HPM:(BOOL *)a3
{
  *a3 = 0;
  uint64_t v7 = 0;
  int result = [(PDController *)self registerRead32:(char *)&v7 + 4 atAddress:0];
  if (!result)
  {
    int result = [(PDController *)self registerRead32:&v7 atAddress:1];
    if (!result)
    {
      int result = 0;
      if (HIDWORD(v7) == 2599 && v7 == 25) {
        *a3 = 1;
      }
    }
  }
  return result;
}

- (int)getPinOutRevision:(unsigned int *)a3
{
  *a3 = 3;
  char v9 = 0;
  int result = [(PDControllerType1 *)self isPDControllerType1:&v9];
  if (!result)
  {
    if (v9)
    {
      char v8 = 0;
      int result = [(PDController *)self registerRead8:&v8 atAddress:91];
      if (!result)
      {
        int v6 = v8 & 0x3E;
        if ((v6 | 2) == 0xA)
        {
          int result = 0;
          if (v6 == 10) {
            unsigned int v7 = 2;
          }
          else {
            unsigned int v7 = 1;
          }
          *a3 = v7;
        }
        else
        {
          return 0;
        }
      }
    }
    else
    {
      printf("WARNING: Unrecognized VID/DID, not valid PDControllerType1!");
      return -536870201;
    }
  }
  return result;
}

- (int)getCCRole:(int *)a3
{
  __int16 v7 = 0;
  int result = [(PDControllerType1 *)self readLevel:(char *)&v7 + 1 forGPIO:53];
  if (!result)
  {
    int result = [(PDControllerType1 *)self readLevel:&v7 forGPIO:54];
    if (!result)
    {
      if (HIBYTE(v7)) {
        int v6 = 1;
      }
      else {
        int v6 = 2;
      }
      *a3 = v6;
    }
  }
  return result;
}

- (int)isVCONNOn:(BOOL *)a3
{
  __int16 v10 = 0;
  char v9 = 0;
  int result = [(PDControllerType1 *)self readLevel:(char *)&v10 + 1 forExpanderGPIO:22];
  if (!result)
  {
    int result = [(PDControllerType1 *)self readLevel:&v10 forGPIO:47];
    if (!result)
    {
      int result = [(PDControllerType1 *)self readLevel:&v9 forGPIO:52];
      if (!result)
      {
        if ((_BYTE)v10) {
          BOOL v6 = HIBYTE(v10) == 0;
        }
        else {
          BOOL v6 = 0;
        }
        BOOL v8 = v6 && v9 == 0;
        *a3 = v8;
      }
    }
  }
  return result;
}

- (int)getPDMode:(int *)a3
{
  __int16 v8 = 0;
  int result = [(PDControllerType1 *)self readLevel:(char *)&v8 + 1 forExpanderGPIO:21];
  if (!result)
  {
    int result = [(PDControllerType1 *)self readLevel:&v8 forGPIO:17];
    if (!result)
    {
      if (HIBYTE(v8)) {
        int v6 = 2;
      }
      else {
        int v6 = 1;
      }
      if ((_BYTE)v8) {
        int v7 = v6;
      }
      else {
        int v7 = 0;
      }
      *a3 = v7;
    }
  }
  return result;
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  uint64_t v7 = *(void *)&a5;
  if ([(PDController *)self remote])
  {
    v11 = [(PDControllerType1 *)self micro_user_client];
    unsigned int v12 = [v11 readIECSRegister:a3 ofLength:a4 atRegister:v7 andOutReadLength:a6];
  }
  else
  {
    v11 = [(PDController *)self userClient];
    unsigned int v12 = [v11 iecsReadCommandForDevice:-[PDController address](self, "address") withAddress:v7 buffer:a3 length:a4 flags:0 andOutReadLength:a6];
  }
  int v13 = v12;

  return v13;
}

- (int)registerWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if ([(PDController *)self remote])
  {
    char v9 = [(PDControllerType1 *)self micro_user_client];
    unsigned int v10 = [v9 writeIECSRegister:a3 ofLength:a4 atRegister:v5];
  }
  else
  {
    char v9 = [(PDController *)self userClient];
    unsigned int v10 = [v9 iecsWriteCommandForDevice:-[PDController address](self, "address") withAddress:v5 buffer:a3 length:a4 flags:0];
  }
  int v11 = v10;

  return v11;
}

- (int)sendVDM:(void *)a3 length:(unint64_t)a4 sop:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  char v9 = [(PDController *)self userClient];
  LODWORD(v5) = [v9 sendVDMForDevice:-[PDController address](self, "address") sop:v5 buffer:a3 length:a4 flags:0];

  return v5;
}

- (int)receiveVDM:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7
{
  int v13 = [(PDController *)self userClient];
  LODWORD(a7) = [v13 receiveVDMForDevice:-[PDController address](self, "address") buffer:a3 length:a4 flags:0 outSOP:a5 outSequence:a6 outLength:a7];

  return (int)a7;
}

- (int)receiveVDMAttention:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7
{
  int v13 = [(PDController *)self userClient];
  LODWORD(a7) = [v13 receiveVDMAttentionForDevice:-[PDController address](self, "address") buffer:a3 length:a4 flags:0 outSOP:a5 outSequence:a6 outLength:a7];

  return (int)a7;
}

- (int)executeIECSCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(PDController *)self remote])
  {
    uint64_t v5 = [(PDControllerType1 *)self micro_user_client];
    unsigned int v6 = [v5 executeIECSCommand:v3];
  }
  else
  {
    uint64_t v5 = [(PDController *)self userClient];
    unsigned int v6 = [v5 iecsCommand:v3 forDevice:-[PDController address](self, "address") flags:0];
  }
  int v7 = v6;

  return v7;
}

- (int)memRead:(unsigned int *)a3 atAddress:(unsigned int)a4
{
  if ((a4 & 3) != 0)
  {
    printf("Error: Memory address not a multiple of 4");
    return -536870201;
  }
  else
  {
    int result = [(PDController *)self registerWrite32:*(void *)&a4 atAddress:9];
    if (!result)
    {
      int result = [(PDControllerType1 *)self executeIECSCommand:1296387442];
      unsigned int v7 = 0;
      if (!result)
      {
        int result = [(PDController *)self registerRead32:&v7 atAddress:9];
        if (!result) {
          *a3 = v7;
        }
      }
    }
  }
  return result;
}

- (int)memWrite:(unsigned int)a3 atAddress:(unsigned int)a4
{
  if ((a4 & 3) != 0)
  {
    printf("Error: Memory address not a multiple of 4");
    return -536870201;
  }
  else
  {
    v6[0] = a4;
    v6[1] = a3;
    int result = [(PDControllerType1 *)self registerWrite:v6 ofLength:8 atAddress:9];
    if (!result) {
      return [(PDControllerType1 *)self executeIECSCommand:1296387447];
    }
  }
  return result;
}

- (int)i2cRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  int result = [(PDController *)self registerWrite32:a5 | (a4 << 16) atAddress:18];
  if (!result)
  {
    int result = [(PDControllerType1 *)self executeIECSCommand:1296642627];
    int v13 = 0;
    if (!result)
    {
      int v10 = 1000;
      while (1)
      {
        int result = [(PDController *)self registerRead32:&v13 atAddress:18];
        int v11 = result;
        unsigned __int8 v12 = BYTE2(v13);
        if (result || v13 < 0) {
          break;
        }
        usleep(0x64u);
        if (!--v10)
        {
          unsigned __int8 v12 = BYTE2(v13);
          if ((v13 & 0x80000000) == 0) {
            return -536870186;
          }
          goto LABEL_13;
        }
      }
      if (v13 >= 0) {
        int result = -536870186;
      }
      if (v13 < 0 && !v11)
      {
LABEL_13:
        if (a6) {
          *a6 = v12;
        }
        return [(PDController *)self registerRead:a3 ofLength:v12 atAddress:9];
      }
    }
  }
  return result;
}

- (int)i2cRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v6 = 0;
  [(PDControllerType1 *)self i2cRead:a3 ofLength:a4 atAddress:*(void *)&a5 andOutReadLength:&v6];
  return 0;
}

- (int)i2cWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  int v6 = a4;
  int result = [(PDControllerType1 *)self registerWrite:a3 ofLength:a4 atAddress:9];
  if (!result)
  {
    int result = [(PDController *)self registerWrite32:a5 | (v6 << 8) atAddress:18];
    if (!result)
    {
      int result = [(PDControllerType1 *)self executeIECSCommand:1296642627];
      int v12 = 0;
      if (!result)
      {
        int v9 = 1000;
        while (1)
        {
          int v10 = [(PDController *)self registerRead32:&v12 atAddress:18];
          int v11 = v12;
          if (v10 || v12 < 0) {
            break;
          }
          usleep(0x64u);
          if (!--v9)
          {
            int v11 = v12;
            break;
          }
        }
        if (v11 < 0) {
          return v10;
        }
        else {
          return -536870186;
        }
      }
    }
  }
  return result;
}

- (int)i2cWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andRead:(void *)a6 ofLength:(unint64_t)a7 andOutReadLength:(unint64_t *)a8
{
  int v9 = a7;
  int v12 = a4;
  int result = [(PDControllerType1 *)self registerWrite:a3 ofLength:a4 atAddress:9];
  if (!result)
  {
    unsigned int v15 = a5 & 0x7F | 0x80;
    if (a5 <= 0xFF) {
      unsigned int v15 = a5;
    }
    int result = [(PDController *)self registerWrite32:v15 | (v12 << 8) | (v9 << 16) atAddress:18];
    if (!result)
    {
      int result = [(PDControllerType1 *)self executeIECSCommand:1296642627];
      int v19 = 0;
      if (!result)
      {
        int v16 = 1000;
        while (1)
        {
          int result = [(PDController *)self registerRead32:&v19 atAddress:18];
          int v17 = result;
          unsigned __int8 v18 = BYTE2(v19);
          if (result || v19 < 0) {
            break;
          }
          usleep(0x64u);
          if (!--v16)
          {
            unsigned __int8 v18 = BYTE2(v19);
            if ((v19 & 0x80000000) == 0) {
              return -536870186;
            }
            goto LABEL_16;
          }
        }
        if (v19 >= 0) {
          int result = -536870186;
        }
        if (v19 < 0 && !v17)
        {
LABEL_16:
          if (a8) {
            *a8 = v18;
          }
          return [(PDController *)self registerRead:a6 ofLength:v18 atAddress:9];
        }
      }
    }
  }
  return result;
}

- (int)readDirection:(BOOL *)a3 forGPIO:(unsigned int)a4
{
  uint64_t v9 = 0;
  int result = [(PDControllerType1 *)self registerWrite:&v9 ofLength:8 atAddress:9];
  if (!result)
  {
    int result = [(PDControllerType1 *)self executeIECSCommand:1196443983];
    if (!result)
    {
      int result = [(PDController *)self registerRead:&v9 ofLength:28 atAddress:9];
      if (!result)
      {
        __int16 v8 = &v10;
        if (a4 >= 0x20) {
          __int16 v8 = (uint64_t *)((char *)&v10 + 4);
        }
        *a3 = (*(_DWORD *)v8 >> (a4 & 0x1F)) & 1;
      }
    }
  }
  return result;
}

- (int)readLevel:(BOOL *)a3 forGPIO:(unsigned int)a4
{
  v9[0] = 0;
  int result = [(PDControllerType1 *)self registerWrite:v9 ofLength:8 atAddress:9];
  if (!result)
  {
    int result = [(PDControllerType1 *)self executeIECSCommand:1196443983];
    if (!result)
    {
      int result = [(PDController *)self registerRead:v9 ofLength:28 atAddress:9];
      if (!result)
      {
        __int16 v8 = &v10;
        if (a4 >= 0x20) {
          __int16 v8 = (uint64_t *)((char *)&v10 + 4);
        }
        *a3 = (*(_DWORD *)v8 >> (a4 & 0x1F)) & 1;
      }
    }
  }
  return result;
}

- (id)stateStringForGPIOFromFile:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 characterAtIndex:0];
  unsigned __int8 v5 = [v3 characterAtIndex:1];

  BOOL v6 = v5 != 49;
  BOOL v7 = v4 != 49;
  if (v4 == 49 && v5 == 49) {
    return @"Drive High";
  }
  if (v5 == 49) {
    BOOL v7 = 1;
  }
  if (v4 == 49) {
    BOOL v6 = 1;
  }
  if (v5 == 49 || v4 == 49) {
    CFStringRef v10 = @"GPIO STATE ERROR";
  }
  else {
    CFStringRef v10 = @"Input Low";
  }
  if (!v6) {
    CFStringRef v10 = @"Input High";
  }
  if (v7) {
    return (id)v10;
  }
  else {
    return @"Drive Low";
  }
}

- (id)stateStringForGPIO:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  __int16 v9 = 0;
  if ([(PDControllerType1 *)self readDirection:(char *)&v9 + 1 forGPIO:*(void *)&a3]
    || [(PDControllerType1 *)self readLevel:&v9 forGPIO:v3])
  {
    unsigned __int8 v5 = @"GPIO STATE ERROR";
  }
  else
  {
    if (HIBYTE(v9)) {
      BOOL v7 = @"1";
    }
    else {
      BOOL v7 = @"0";
    }
    if ((_BYTE)v9) {
      CFStringRef v8 = @"1";
    }
    else {
      CFStringRef v8 = @"0";
    }
    unsigned __int8 v5 = [(__CFString *)v7 stringByAppendingString:v8];
  }

  return v5;
}

- (int)expanderRegisterRead16:(unsigned __int16 *)a3 atOffset:(unsigned __int8)a4
{
  unsigned __int8 v7 = a4;
  uint64_t v6 = 0;
  int result = [(PDControllerType1 *)self i2cWrite:&v7 ofLength:1 atAddress:32 andRead:a3 ofLength:2 andOutReadLength:&v6];
  if (v6 != 2 && result == 0) {
    return -536870169;
  }
  return result;
}

- (int)readDirection:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4
{
  unint64_t v4 = *(void *)&a4;
  __int16 v7 = 0;
  int result = [(PDControllerType1 *)self expanderRegisterRead16:&v7 atOffset:6];
  if (!result) {
    *a3 = ((*(unsigned __int8 *)((unint64_t)&v7 | (v4 >> 4) & 1) >> (v4 & 0xF)) & 1) == 0;
  }
  return result;
}

- (int)readOutputLevel:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4
{
  unint64_t v4 = *(void *)&a4;
  __int16 v7 = 0;
  int result = [(PDControllerType1 *)self expanderRegisterRead16:&v7 atOffset:2];
  if (!result) {
    *a3 = (*(unsigned __int8 *)((unint64_t)&v7 | (v4 >> 4) & 1) >> (v4 & 0xF)) & 1;
  }
  return result;
}

- (int)readInputLevel:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4
{
  unint64_t v4 = *(void *)&a4;
  __int16 v7 = 0;
  int result = [(PDControllerType1 *)self expanderRegisterRead16:&v7 atOffset:0];
  if (!result) {
    *a3 = (*(unsigned __int8 *)((unint64_t)&v7 | (v4 >> 4) & 1) >> (v4 & 0xF)) & 1;
  }
  return result;
}

- (int)readLevel:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  char v8 = 0;
  int result = -[PDControllerType1 readDirection:forExpanderGPIO:](self, "readDirection:forExpanderGPIO:", &v8);
  if (!result)
  {
    if (v8) {
      return [(PDControllerType1 *)self readOutputLevel:a3 forExpanderGPIO:v4];
    }
    else {
      return [(PDControllerType1 *)self readInputLevel:a3 forExpanderGPIO:v4];
    }
  }
  return result;
}

- (id)stateStringForExpanderGPIO:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  __int16 v9 = 0;
  if ([(PDControllerType1 *)self readDirection:(char *)&v9 + 1 forExpanderGPIO:*(void *)&a3])
  {
    goto LABEL_4;
  }
  if (!HIBYTE(v9))
  {
    if ([(PDControllerType1 *)self readInputLevel:&v9 forExpanderGPIO:v3]) {
      goto LABEL_4;
    }
LABEL_9:
    if (HIBYTE(v9)) {
      __int16 v7 = @"1";
    }
    else {
      __int16 v7 = @"0";
    }
    if ((_BYTE)v9) {
      CFStringRef v8 = @"1";
    }
    else {
      CFStringRef v8 = @"0";
    }
    unsigned __int8 v5 = [(__CFString *)v7 stringByAppendingString:v8];
    goto LABEL_5;
  }
  if (![(PDControllerType1 *)self readOutputLevel:&v9 forExpanderGPIO:v3]) {
    goto LABEL_9;
  }
LABEL_4:
  unsigned __int8 v5 = @"GPIO STATE ERROR";
LABEL_5:

  return v5;
}

- (id)registerFormatterBusPowerWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 1)
  {
    if (*(unsigned __int8 *)a3 - 1 <= 0xFD)
    {
      +[NSString stringWithFormat:@"0x%02X", *(unsigned __int8 *)a3];
      goto LABEL_10;
    }
  }
  else
  {
    if (a4 != 2)
    {
      unint64_t v7 = a4;
      CFStringRef v4 = @"ERROR: length %lld != 2 or 1";
      goto LABEL_9;
    }
    if (*(unsigned __int16 *)a3 - 1 <= 0xFFFD)
    {
      +[NSString stringWithFormat:@"0x%04X", *(unsigned __int16 *)a3];
      goto LABEL_10;
    }
  }
  CFStringRef v4 = @"No";
LABEL_9:
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v7);
  unsigned __int8 v5 = LABEL_10:;

  return v5;
}

- (id)registerFormatterPDControllerType1StateWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  char v13 = 0;
  [(PDControllerType1 *)self isPDControllerType1:&v13];
  if (a4 == 4)
  {
    uint64_t v6 = *(unsigned int *)a3;
    v14[0] = &off_10001B048;
    v14[1] = &off_10001B060;
    v15[0] = @"Disabled";
    v15[1] = @"Unattached UFP";
    v15[2] = @"Unattached DFP";
    v14[2] = &off_10001B078;
    v14[3] = &off_10001B090;
    v15[3] = @"Audio Accessory";
    v15[4] = @"Debug Accessory";
    v14[4] = &off_10001B0A8;
    v14[5] = &off_10001B0C0;
    v15[5] = @"Attached UFP";
    v15[6] = @"Lock UFP";
    v14[6] = &off_10001B0D8;
    v14[7] = &off_10001B0F0;
    v15[7] = @"Attached DFP / DRP Wait";
    v15[8] = @"Attached DFP";
    v14[8] = &off_10001B108;
    v14[9] = &off_10001B120;
    v15[9] = @"Accessory Present";
    v15[10] = @"Powered Accessory";
    v14[10] = &off_10001B138;
    v14[11] = &off_10001B150;
    v14[12] = &off_10001B168;
    v15[11] = @"Unsupported Accessory";
    v15[12] = @"Reorient";
    unint64_t v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:13];
    if (v13)
    {
      CFStringRef v8 = +[NSNumber numberWithUnsignedInt:v6];
      __int16 v9 = [v7 objectForKeyedSubscript:v8];

      if (v9) {
        CFStringRef v10 = v9;
      }
      else {
        CFStringRef v10 = @"Unknown";
      }
    }
    else
    {
      CFStringRef v10 = @"Unknown";
    }
    int v11 = +[NSString stringWithFormat:@"(%d) %@", v6, v10];
  }
  else
  {
    int v11 = +[NSString stringWithFormat:@"ERROR: length %lld != 4", a4];
  }

  return v11;
}

- (id)stringForTitle:(id)a3 valueString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%-22s %@", [v5 UTF8String], v6);

  return v7;
}

- (void)printStateWithTitle:(id)a3 andDescription:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 count])
    {
      unint64_t v8 = 0;
      do
      {
        __int16 v9 = [v7 objectAtIndexedSubscript:v8];
        if (v8)
        {
          [(PDController *)self printRegisterDescription:v9];
          printf("%-27s %s\n", "", (const char *)[v9 UTF8String]);
        }
        else
        {
          printf("%-27s %s\n", (const char *)[v15 UTF8String], (const char *)[v9 UTF8String]);
        }

        ++v8;
      }
      while ((unint64_t)[v7 count] > v8);
    }
  }
  else
  {
    id v10 = v15;
    id v11 = v6;
    int v12 = (const char *)[v10 UTF8String];
    id v13 = v11;
    v14 = (const char *)[v13 UTF8String];

    printf("%-27s %s\n", v12, v14);
  }
}

- (int)printCCRole
{
  __int16 v9 = 0;
  unsigned int v3 = [(PDControllerType1 *)self readLevel:(char *)&v9 + 1 forGPIO:53];
  if (v3)
  {
    int v4 = v3;
LABEL_4:
    id v5 = &stru_1000186C8;
    goto LABEL_5;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v9 forGPIO:54];
  if (v4) {
    goto LABEL_4;
  }
  if (HIBYTE(v9)) {
    id v7 = @"1";
  }
  else {
    id v7 = @"0";
  }
  if ((_BYTE)v9) {
    CFStringRef v8 = @"1";
  }
  else {
    CFStringRef v8 = @"0";
  }
  id v5 = [(__CFString *)v7 stringByAppendingString:v8];
  printf("%s\t%s\t%s\n", "0xff01", "0x01", (const char *)[(__CFString *)v5 UTF8String]);
LABEL_5:

  return v4;
}

- (int)printCCState
{
  __int16 v26 = 0;
  __int16 v25 = 0;
  int v3 = [(PDControllerType1 *)self readLevel:(char *)&v26 + 1 forGPIO:20];
  if (v3
    || (int v3 = [(PDControllerType1 *)self readLevel:&v26 forGPIO:21]) != 0
    || (int v3 = [(PDControllerType1 *)self readLevel:(char *)&v25 + 1 forGPIO:22]) != 0)
  {
    __int16 v24 = 0;
    unsigned int v23 = 0;
LABEL_5:
    char v22 = 0;
LABEL_6:
    unsigned int v21 = 0;
    goto LABEL_7;
  }
  int v3 = [(PDControllerType1 *)self readLevel:&v25 forGPIO:23];
  __int16 v24 = 0;
  unsigned int v23 = 0;
  if (v3) {
    goto LABEL_5;
  }
  int v3 = [(PDControllerType1 *)self readLevel:(char *)&v24 + 1 forExpanderGPIO:21];
  if (v3) {
    goto LABEL_5;
  }
  int v3 = [(PDControllerType1 *)self readLevel:&v24 forGPIO:17];
  if (v3) {
    goto LABEL_5;
  }
  int v3 = [(PDControllerType1 *)self getPDMode:&v23];
  char v22 = 0;
  if (v3) {
    goto LABEL_6;
  }
  int v3 = [(PDControllerType1 *)self isVCONNOn:&v22];
  unsigned int v21 = 0;
  if (!v3) {
    int v3 = [(PDControllerType1 *)self getCCRole:&v21];
  }
LABEL_7:
  if (HIBYTE(v26)) {
    int v4 = @"1";
  }
  else {
    int v4 = @"0";
  }
  if ((_BYTE)v26) {
    CFStringRef v5 = @"1";
  }
  else {
    CFStringRef v5 = @"0";
  }
  id v6 = [(__CFString *)v4 stringByAppendingString:v5];
  id v7 = v6;
  if (HIBYTE(v25)) {
    CFStringRef v8 = @"1";
  }
  else {
    CFStringRef v8 = @"0";
  }
  __int16 v9 = [v6 stringByAppendingString:v8];

  if ((_BYTE)v25) {
    CFStringRef v10 = @"1";
  }
  else {
    CFStringRef v10 = @"0";
  }
  id v11 = [v9 stringByAppendingString:v10];

  if (HIBYTE(v24)) {
    CFStringRef v12 = @"1";
  }
  else {
    CFStringRef v12 = @"0";
  }
  id v13 = [v11 stringByAppendingString:v12];

  if ((_BYTE)v24) {
    CFStringRef v14 = @"1";
  }
  else {
    CFStringRef v14 = @"0";
  }
  id v15 = [v13 stringByAppendingString:v14];

  int v16 = [v15 stringByAppendingFormat:@"%i", v23];

  if (v22) {
    CFStringRef v17 = @"1";
  }
  else {
    CFStringRef v17 = @"0";
  }
  unsigned __int8 v18 = [v16 stringByAppendingString:v17];

  int v19 = [v18 stringByAppendingFormat:@"%i", v21];

  if (!v3) {
    printf("%s\t%s\t%s\n", "0xff02", "0x01", (const char *)[v19 UTF8String]);
  }

  return v3;
}

- (int)printVBUSState
{
  __int16 v14 = 0;
  char v13 = 0;
  unsigned int v3 = [(PDControllerType1 *)self readLevel:(char *)&v14 + 1 forExpanderGPIO:22];
  if (v3
    || (unsigned int v3 = [(PDControllerType1 *)self readLevel:&v14 forGPIO:46]) != 0
    || (unsigned int v3 = [(PDControllerType1 *)self readLevel:&v13 forGPIO:52]) != 0)
  {
    int v4 = v3;
    CFStringRef v5 = &stru_1000186C8;
  }
  else
  {
    if (HIBYTE(v14)) {
      id v7 = @"1";
    }
    else {
      id v7 = @"0";
    }
    if ((_BYTE)v14) {
      CFStringRef v8 = @"1";
    }
    else {
      CFStringRef v8 = @"0";
    }
    __int16 v9 = [(__CFString *)v7 stringByAppendingString:v8];
    CFStringRef v10 = v9;
    if (v13) {
      CFStringRef v11 = @"1";
    }
    else {
      CFStringRef v11 = @"0";
    }
    CFStringRef v12 = [v9 stringByAppendingString:v11];

    CFStringRef v5 = v12;
    printf("%s\t%s\t%s\n", "0xff03", "0x01", (const char *)[(__CFString *)v5 UTF8String]);
    int v4 = 0;
  }

  return v4;
}

- (int)printVCONNState
{
  __int16 v14 = 0;
  char v13 = 0;
  unsigned int v3 = [(PDControllerType1 *)self readLevel:(char *)&v14 + 1 forExpanderGPIO:22];
  if (v3
    || (unsigned int v3 = [(PDControllerType1 *)self readLevel:&v14 forGPIO:47]) != 0
    || (unsigned int v3 = [(PDControllerType1 *)self readLevel:&v13 forGPIO:52]) != 0)
  {
    int v4 = v3;
    CFStringRef v5 = &stru_1000186C8;
  }
  else
  {
    if (HIBYTE(v14)) {
      id v7 = @"1";
    }
    else {
      id v7 = @"0";
    }
    if ((_BYTE)v14) {
      CFStringRef v8 = @"1";
    }
    else {
      CFStringRef v8 = @"0";
    }
    __int16 v9 = [(__CFString *)v7 stringByAppendingString:v8];
    CFStringRef v10 = v9;
    if (v13) {
      CFStringRef v11 = @"1";
    }
    else {
      CFStringRef v11 = @"0";
    }
    CFStringRef v12 = [v9 stringByAppendingString:v11];

    CFStringRef v5 = v12;
    printf("%s\t%s\t%s\n", "0xff04", "0x01", (const char *)[(__CFString *)v5 UTF8String]);
    int v4 = 0;
  }

  return v4;
}

- (int)printVDETState
{
  char v6 = 0;
  int v3 = [(PDControllerType1 *)self readLevel:&v6 forGPIO:16];
  if (!v3)
  {
    if (v6) {
      CFStringRef v4 = @"VBUS not present";
    }
    else {
      CFStringRef v4 = @"VBUS present";
    }
    [(PDControllerType1 *)self printStateWithTitle:@"VDET" andDescription:v4];
  }
  return v3;
}

- (int)printSSState
{
  char v18 = 0;
  unsigned int v3 = [(PDControllerType1 *)self readLevel:&v18 forExpanderGPIO:18];
  char v17 = 0;
  if (v3) {
    goto LABEL_2;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v17 forExpanderGPIO:19];
  char v16 = 0;
  if (v4) {
    goto LABEL_4;
  }
  unsigned int v3 = [(PDControllerType1 *)self readLevel:&v16 forGPIO:58];
  char v15 = 0;
  if (v3 || (unsigned int v3 = [(PDControllerType1 *)self readLevel:&v15 forExpanderGPIO:20]) != 0)
  {
LABEL_2:
    int v4 = v3;
LABEL_4:
    CFStringRef v5 = &stru_1000186C8;
    goto LABEL_5;
  }
  if (v18) {
    id v7 = @"1";
  }
  else {
    id v7 = @"0";
  }
  if (v17) {
    CFStringRef v8 = @"1";
  }
  else {
    CFStringRef v8 = @"0";
  }
  __int16 v9 = [(__CFString *)v7 stringByAppendingString:v8];
  CFStringRef v10 = v9;
  if (v16) {
    CFStringRef v11 = @"1";
  }
  else {
    CFStringRef v11 = @"0";
  }
  CFStringRef v12 = [v9 stringByAppendingString:v11];

  if (v15) {
    CFStringRef v13 = @"1";
  }
  else {
    CFStringRef v13 = @"0";
  }
  __int16 v14 = [v12 stringByAppendingString:v13];

  CFStringRef v5 = v14;
  printf("%s\t%s\t%s\n", "0xff06", "0x01", (const char *)[(__CFString *)v5 UTF8String]);
  int v4 = 0;
LABEL_5:

  return v4;
}

- (int)printDXState
{
  char v41 = 0;
  unsigned int v3 = [(PDControllerType1 *)self readLevel:&v41 forGPIO:59];
  char v40 = 0;
  if (v3)
  {
    int v4 = v3;
    char v39 = 0;
LABEL_4:
    char v38 = 0;
LABEL_5:
    char v37 = 0;
LABEL_6:
    char v36 = 0;
LABEL_7:
    char v35 = 0;
LABEL_8:
    char v34 = 0;
LABEL_9:
    CFStringRef v5 = &stru_1000186C8;
    goto LABEL_10;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v40 forExpanderGPIO:0];
  char v39 = 0;
  if (v4) {
    goto LABEL_4;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v39 forExpanderGPIO:1];
  char v38 = 0;
  if (v4) {
    goto LABEL_5;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v38 forExpanderGPIO:16];
  char v37 = 0;
  if (v4) {
    goto LABEL_6;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v37 forExpanderGPIO:2];
  char v36 = 0;
  if (v4) {
    goto LABEL_7;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v36 forExpanderGPIO:3];
  char v35 = 0;
  if (v4) {
    goto LABEL_8;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v35 forExpanderGPIO:4];
  char v34 = 0;
  if (v4) {
    goto LABEL_9;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v34 forExpanderGPIO:5];
  char v33 = 0;
  if (v4) {
    goto LABEL_9;
  }
  unsigned int v7 = [(PDControllerType1 *)self readLevel:&v33 forExpanderGPIO:17];
  char v32 = 0;
  if (v7 || (unsigned int v7 = [(PDControllerType1 *)self readLevel:&v32 forExpanderGPIO:6]) != 0)
  {
    int v4 = v7;
    goto LABEL_9;
  }
  CFStringRef v8 = &v33;
  if (!v36) {
    CFStringRef v8 = &v32;
  }
  int v9 = *v8;
  if (v41) {
    CFStringRef v10 = @"1";
  }
  else {
    CFStringRef v10 = @"0";
  }
  if (v40) {
    CFStringRef v11 = @"1";
  }
  else {
    CFStringRef v11 = @"0";
  }
  CFStringRef v12 = [(__CFString *)v10 stringByAppendingString:v11];
  CFStringRef v13 = v12;
  if (v39) {
    CFStringRef v14 = @"1";
  }
  else {
    CFStringRef v14 = @"0";
  }
  char v15 = [v12 stringByAppendingString:v14];

  if (v38) {
    CFStringRef v16 = @"1";
  }
  else {
    CFStringRef v16 = @"0";
  }
  char v17 = [v15 stringByAppendingString:v16];

  if (v37) {
    CFStringRef v18 = @"1";
  }
  else {
    CFStringRef v18 = @"0";
  }
  int v19 = [v17 stringByAppendingString:v18];

  if (v36) {
    CFStringRef v20 = @"1";
  }
  else {
    CFStringRef v20 = @"0";
  }
  unsigned int v21 = [v19 stringByAppendingString:v20];

  if (v35) {
    CFStringRef v22 = @"1";
  }
  else {
    CFStringRef v22 = @"0";
  }
  unsigned int v23 = [v21 stringByAppendingString:v22];

  if (v34) {
    CFStringRef v24 = @"1";
  }
  else {
    CFStringRef v24 = @"0";
  }
  __int16 v25 = [v23 stringByAppendingString:v24];

  if (v33) {
    CFStringRef v26 = @"1";
  }
  else {
    CFStringRef v26 = @"0";
  }
  v27 = [v25 stringByAppendingString:v26];

  if (v32) {
    CFStringRef v28 = @"1";
  }
  else {
    CFStringRef v28 = @"0";
  }
  v29 = [v27 stringByAppendingString:v28];

  if (v9) {
    CFStringRef v30 = @"1";
  }
  else {
    CFStringRef v30 = @"0";
  }
  v31 = [v29 stringByAppendingString:v30];

  CFStringRef v5 = v31;
  printf("%s\t%s\t%s\n", "0xff07", "0x01", (const char *)[(__CFString *)v5 UTF8String]);
  int v4 = 0;
LABEL_10:

  return v4;
}

- (int)printRFUState
{
  char v32 = 0;
  unsigned int v3 = [(PDControllerType1 *)self readLevel:&v32 forGPIO:60];
  char v31 = 0;
  if (v3)
  {
    int v4 = v3;
    char v30 = 0;
LABEL_4:
    char v29 = 0;
LABEL_5:
    char v28 = 0;
LABEL_6:
    CFStringRef v5 = &stru_1000186C8;
    goto LABEL_7;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v31 forExpanderGPIO:3];
  char v30 = 0;
  if (v4) {
    goto LABEL_4;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v30 forExpanderGPIO:4];
  char v29 = 0;
  if (v4) {
    goto LABEL_5;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v29 forExpanderGPIO:5];
  char v28 = 0;
  if (v4) {
    goto LABEL_6;
  }
  int v4 = [(PDControllerType1 *)self readLevel:&v28 forExpanderGPIO:17];
  char v27 = 0;
  if (v4) {
    goto LABEL_6;
  }
  unsigned int v7 = [(PDControllerType1 *)self readLevel:&v27 forExpanderGPIO:6];
  char v26 = 0;
  if (v7 || (unsigned int v7 = [(PDControllerType1 *)self readLevel:&v26 forExpanderGPIO:7]) != 0)
  {
    int v4 = v7;
    goto LABEL_6;
  }
  if (v32) {
    CFStringRef v8 = @"1";
  }
  else {
    CFStringRef v8 = @"0";
  }
  int v9 = &v27;
  if (!v31) {
    int v9 = &v28;
  }
  int v10 = *v9;
  if (v31) {
    CFStringRef v11 = @"1";
  }
  else {
    CFStringRef v11 = @"0";
  }
  CFStringRef v12 = [(__CFString *)v8 stringByAppendingString:v11];
  CFStringRef v13 = v12;
  if (v30) {
    CFStringRef v14 = @"1";
  }
  else {
    CFStringRef v14 = @"0";
  }
  char v15 = [v12 stringByAppendingString:v14];

  if (v29) {
    CFStringRef v16 = @"1";
  }
  else {
    CFStringRef v16 = @"0";
  }
  char v17 = [v15 stringByAppendingString:v16];

  if (v28) {
    CFStringRef v18 = @"1";
  }
  else {
    CFStringRef v18 = @"0";
  }
  int v19 = [v17 stringByAppendingString:v18];

  if (v27) {
    CFStringRef v20 = @"1";
  }
  else {
    CFStringRef v20 = @"0";
  }
  unsigned int v21 = [v19 stringByAppendingString:v20];

  if (v26) {
    CFStringRef v22 = @"1";
  }
  else {
    CFStringRef v22 = @"0";
  }
  unsigned int v23 = [v21 stringByAppendingString:v22];

  if (v10) {
    CFStringRef v24 = @"1";
  }
  else {
    CFStringRef v24 = @"0";
  }
  __int16 v25 = [v23 stringByAppendingString:v24];

  CFStringRef v5 = v25;
  printf("%s\t%s\t%s\n", "0xff08", "0x01", (const char *)[(__CFString *)v5 UTF8String]);
  int v4 = 0;
LABEL_7:

  return v4;
}

- (int)printROMInfo
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [&off_10001CCF8 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_enumerationMutation(&off_10001CCF8);
      }
      unsigned int v7 = -[PDController printCommand:](self, "printCommand:", [*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedIntValue]);
    }
    int v8 = v7;
    id v4 = [&off_10001CCF8 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v8;
}

- (void)printGPIOWithPort:(id)a3 pin:(id)a4 title:(id)a5 andState:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  id v10 = a4;
  long long v11 = (const char *)[v8 UTF8String];
  id v12 = v10;
  long long v13 = (const char *)[v12 UTF8String];

  id v14 = v9;
  char v15 = (const char *)[v14 UTF8String];

  printf("%s\t%s\t%s\n", v11, v13, v15);
}

- (int)printGPIOState
{
  id v3 = [(PDControllerType1 *)self gpioMap];
  id v4 = [v3 allKeys];
  uint64_t v5 = [v4 sortedArrayUsingSelector:"compare:"];

  puts("GPIOs");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [&off_10001CD10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v17 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v17) {
          objc_enumerationMutation(&off_10001CD10);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 unsignedCharValue];
        long long v11 = +[NSString stringWithFormat:@"%d", v10 >> 5];
        id v12 = +[NSString stringWithFormat:@"%d", v10 & 0x1F];
        long long v13 = [(PDControllerType1 *)self gpioMap];
        id v14 = [v13 objectForKeyedSubscript:v9];

        char v15 = [(PDControllerType1 *)self stateStringForGPIO:v10];
        [(PDControllerType1 *)self printGPIOWithPort:v11 pin:v12 title:v14 andState:v15];
      }
      id v7 = [&off_10001CD10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  return 0;
}

- (int)printExpanderGPIOState
{
  id v3 = [(PDControllerType1 *)self expanderGpioMap];
  id v4 = [v3 allKeys];
  uint64_t v5 = [v4 sortedArrayUsingSelector:"compare:"];

  puts("Expander GPIOs");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [&off_10001CD28 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v17 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v17) {
          objc_enumerationMutation(&off_10001CD28);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 unsignedCharValue];
        long long v11 = +[NSString stringWithFormat:@"%d", (v10 >> 4) & 1];
        id v12 = +[NSString stringWithFormat:@"%d", v10 & 0xF];
        long long v13 = [(PDControllerType1 *)self expanderGpioMap];
        id v14 = [v13 objectForKeyedSubscript:v9];

        char v15 = [(PDControllerType1 *)self stateStringForExpanderGPIO:v10];
        [(PDControllerType1 *)self printGPIOWithPort:v11 pin:v12 title:v14 andState:v15];
      }
      id v7 = [&off_10001CD28 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  return 0;
}

- (int)printIECSStandardInfo
{
  puts("Registers");
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [&off_10001CD40 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(&off_10001CD40);
      }
      LODWORD(v3) = -[PDController printRegister:](self, "printRegister:", [*(id *)(*((void *)&v8 + 1) + 8 * v6) unsignedCharValue]);
      if (v3) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v3 = [&off_10001CD40 countByEnumeratingWithState:&v8 objects:v12 count:16];
        id v4 = v3;
        if (v3) {
          goto LABEL_3;
        }
        return (int)v3;
      }
    }
  }
  return (int)v3;
}

- (int)printIECSPDControllerType1SpecificInfo
{
  puts("Device Registers");
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [&off_10001CD58 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(&off_10001CD58);
      }
      LODWORD(v3) = -[PDController printRegister:](self, "printRegister:", [*(id *)(*((void *)&v8 + 1) + 8 * v6) unsignedCharValue]);
      if (v3) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v3 = [&off_10001CD58 countByEnumeratingWithState:&v8 objects:v12 count:16];
        id v4 = v3;
        if (v3) {
          goto LABEL_3;
        }
        return (int)v3;
      }
    }
  }
  return (int)v3;
}

- (int)printIECSPDControllerType3SpecificInfo
{
  puts("Device Registers");
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [&off_10001CD70 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(&off_10001CD70);
      }
      LODWORD(v3) = -[PDController printRegister:](self, "printRegister:", [*(id *)(*((void *)&v8 + 1) + 8 * v6) unsignedCharValue]);
      if (v3) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v3 = [&off_10001CD70 countByEnumeratingWithState:&v8 objects:v12 count:16];
        id v4 = v3;
        if (v3) {
          goto LABEL_3;
        }
        return (int)v3;
      }
    }
  }
  return (int)v3;
}

- (int)printUSBCInfo
{
  puts("USBC Information");
  int result = [(PDControllerType1 *)self printCCRole];
  if (!result)
  {
    int result = [(PDControllerType1 *)self printCCState];
    if (!result)
    {
      int result = [(PDControllerType1 *)self printVBUSState];
      if (!result)
      {
        int result = [(PDControllerType1 *)self printVCONNState];
        if (!result)
        {
          int result = [(PDControllerType1 *)self printVDETState];
          if (!result)
          {
            int result = [(PDControllerType1 *)self printSSState];
            if (!result)
            {
              int result = [(PDControllerType1 *)self printDXState];
              if (!result)
              {
                return [(PDControllerType1 *)self printRFUState];
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (int)printInfo
{
  printf("Apple HPM at 0x%02x :\n\n", [(PDController *)self address]);
  int result = [(PDControllerType1 *)self printIECSStandardInfo];
  unsigned __int8 v6 = 0;
  if (result)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    int result = [(PDControllerType1 *)self isPDControllerType1:&v6];
    unsigned __int8 v5 = 0;
    if (!result) {
      int result = [(PDControllerType1 *)self isPDControllerType3HPM:&v5];
    }
    if (v6)
    {
      if (result) {
        goto LABEL_3;
      }
      putchar(10);
      int result = [(PDControllerType1 *)self printIECSPDControllerType1SpecificInfo];
      if (result) {
        goto LABEL_3;
      }
      putchar(10);
      int result = [(PDControllerType1 *)self printUSBCInfo];
    }
    if (v5 && !result)
    {
      putchar(10);
      int result = [(PDControllerType1 *)self printIECSPDControllerType3SpecificInfo];
    }
  }
LABEL_3:
  if (v6 | v5) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    putchar(10);
    return [(PDControllerType1 *)self printROMInfo];
  }
  return result;
}

- (int)printAll
{
  char v7 = 0;
  int v3 = [(PDControllerType1 *)self isPDControllerType1:&v7];
  char v6 = 0;
  if (!v3) {
    int v3 = [(PDControllerType1 *)self isPDControllerType3HPM:&v6];
  }
  [(PDControllerType1 *)self printInfo];
  if (v7) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    putchar(10);
    int v3 = [(PDControllerType1 *)self printGPIOState];
    if (!v3)
    {
      putchar(10);
      return [(PDControllerType1 *)self printExpanderGPIOState];
    }
  }
  return v3;
}

- (PDControllerType3)micro_user_client
{
  return self->_micro_user_client;
}

- (void)setMicro_user_client:(id)a3
{
}

- (NSDictionary)gpioMap
{
  return self->_gpioMap;
}

- (void)setGpioMap:(id)a3
{
}

- (NSDictionary)expanderGpioMap
{
  return self->_expanderGpioMap;
}

- (void)setExpanderGpioMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expanderGpioMap, 0);
  objc_storeStrong((id *)&self->_gpioMap, 0);

  objc_storeStrong((id *)&self->_micro_user_client, 0);
}

@end