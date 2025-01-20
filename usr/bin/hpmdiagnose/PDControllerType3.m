@interface PDControllerType3
+ (id)PDControllerType3MicroWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
- (AppleHPMUserClient)userClient;
- (BOOL)remote;
- (NSDictionary)registerMap;
- (PDControllerType3)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (int)executeIECSCommand:(unsigned int)a3;
- (int)getVDM:(unsigned int *)a3 ofLength:(unint64_t *)a4;
- (int)isPDControllerType3HPM:(BOOL *)a3;
- (int)readIECSRegister:(void *)a3 ofLength:(unint64_t)a4 atRegister:(unsigned int)a5 andOutReadLength:(unint64_t *)a6;
- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4;
- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4;
- (int)sendVDM:(unsigned int *)a3 ofLength:(unint64_t)a4;
- (int)writeIECSRegister:(void *)a3 ofLength:(unint64_t)a4 atRegister:(unsigned int)a5;
- (unsigned)address;
- (unsigned)burstLimit;
- (unsigned)cached_sequence_num;
- (unsigned)streamSequenceNumber;
- (void)dealloc;
- (void)setAddress:(unsigned __int8)a3;
- (void)setBurstLimit:(unsigned __int8)a3;
- (void)setCached_sequence_num:(unsigned __int8)a3;
- (void)setRegisterMap:(id)a3;
- (void)setRemote:(BOOL)a3;
- (void)setStreamSequenceNumber:(unsigned __int8)a3;
- (void)setUserClient:(id)a3;
@end

@implementation PDControllerType3

+ (id)PDControllerType3MicroWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithAddress:v4 userClient:v6];

  return v7;
}

- (PDControllerType3)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  id v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PDControllerType3;
  id v6 = [(PDControllerType3 *)&v10 init];
  id v7 = v6;
  if (!v6
    || ([(PDControllerType3 *)v6 setUserClient:v5],
        [(PDControllerType3 *)v7 userClient],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {

    id v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PDControllerType3;
  [(PDControllerType3 *)&v2 dealloc];
}

- (int)sendVDM:(unsigned int *)a3 ofLength:(unint64_t)a4
{
  uint64_t v12 = 0;
  uint64_t v11 = 0;
  int v14 = 0;
  uint64_t v13 = 0;
  if (a4 >= 7) {
    unint64_t v5 = 7;
  }
  else {
    unint64_t v5 = a4;
  }
  char v10 = v5;
  __memcpy_chk();
  id v6 = [(PDControllerType3 *)self userClient];
  int v7 = [v6 iecsWriteCommandForDevice:-[PDControllerType3 address](self, "address") withAddress:9 buffer:&v10 length:(4 * v5) | 1 flags:0];

  if (!v7)
  {
    v8 = [(PDControllerType3 *)self userClient];
    int v7 = [v8 iecsCommand:1447316851 forDevice:[self address] flags:0];
  }
  return v7;
}

- (int)getVDM:(unsigned int *)a3 ofLength:(unint64_t *)a4
{
  uint64_t v12 = 65;
  if (*a4 >= 8) {
    *a4 = 7;
  }
  int v7 = [(PDControllerType3 *)self userClient];
  int v8 = [v7 iecsReadCommandForDevice:-[PDControllerType3 address](self, "address") withAddress:79 buffer:&v13 length:4 * *a4 flags:0 andOutReadLength:&v12];

  if (!v8)
  {
    uint64_t v9 = v13 >> 5;
    if (v9 == [(PDControllerType3 *)self cached_sequence_num])
    {
      bzero(a3, 4 * *a4);
      *a4 = 0;
    }
    else
    {
      [(PDControllerType3 *)self setCached_sequence_num:v9];
      unint64_t v10 = v13 & 7;
      *a4 = v10;
      memcpy(a3, &v14, 4 * v10);
    }
  }
  return v8;
}

- (int)readIECSRegister:(void *)a3 ofLength:(unint64_t)a4 atRegister:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  uint64_t v26 = 0;
  if (a4 >= 0x40) {
    unint64_t v10 = 64;
  }
  else {
    unint64_t v10 = a4;
  }
LABEL_4:
  unsigned int v27 = 95158787;
  v28[0] = v10 | (([(PDControllerType3 *)self burstLimit] & 0xF) << 16) | 0x1000000;
  v28[1] = a5;
  unsigned int v11 = [(PDControllerType3 *)self sendVDM:&v27 ofLength:3];
  if (v11)
  {
    int v13 = v11;
  }
  else
  {
    while (1)
    {
      do
      {
        uint64_t v26 = 7;
        unsigned int v12 = [(PDControllerType3 *)self getVDM:&v27 ofLength:&v26];
        int v13 = v12;
      }
      while (!v12 && !v26);
      if (v12) {
        break;
      }
      if (v27 >> 15 == 2904)
      {
        int v14 = (v27 >> 4) & 3;
        if (v14 == 2)
        {
          int v13 = -536870212;
        }
        else
        {
          if (v14 != 1) {
            goto LABEL_4;
          }
          int v13 = 0;
        }
        break;
      }
    }
  }
  BOOL v15 = v10 != 0;
  if (!v13 && v10)
  {
    v25 = (char *)a3;
    unint64_t v16 = 0;
    do
    {
      if ((v10 - v16) <= 0x18uLL) {
        int v17 = (((v10 - v16) & 0x1F) << 6) | 0x5AC0001;
      }
      else {
        int v17 = 95159809;
      }
      while (1)
      {
        unsigned int v27 = v17;
        -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v27, 1, v25);
        do
        {
          uint64_t v26 = 7;
          unsigned int v18 = [(PDControllerType3 *)self getVDM:&v27 ofLength:&v26];
          int v13 = v18;
        }
        while (!v18 && !v26);
        if (v18 || v27 >> 15 != 2904) {
          break;
        }
        int v19 = (v27 >> 4) & 3;
        if (v19 == 2)
        {
          int v13 = 0;
          goto LABEL_34;
        }
        if (v19 == 1)
        {
          size_t v20 = ((unint64_t)v27 >> 6) & 0x1F;
          memcpy(&v25[v16], v28, v20);
          v16 += v20;
          *a6 = v16;
          break;
        }
        BOOL v15 = v10 > v16;
        if (v10 <= v16)
        {
          int v13 = 0;
          BOOL v15 = v10 > v16;
          goto LABEL_34;
        }
      }
      BOOL v15 = v16 < v10;
    }
    while (!v13 && v16 < v10);
  }
LABEL_34:
  int v21 = v13;
LABEL_35:
  if (!v15) {
    return v13;
  }
  if (v21) {
    return v21;
  }
  unsigned int v27 = 95158276;
  int v22 = [(PDControllerType3 *)self sendVDM:&v27 ofLength:1];
  if (v22) {
    return v22;
  }
  while (1)
  {
    do
    {
      uint64_t v26 = 7;
      int result = [(PDControllerType3 *)self getVDM:&v27 ofLength:&v26];
    }
    while (!result && !v26);
    if (result) {
      return result;
    }
    if (v27 >> 15 == 2904)
    {
      int v24 = (v27 >> 4) & 3;
      int result = 0;
      if (v24 == 1) {
        return result;
      }
      int v21 = 0;
      if (v24 == 2) {
        return -536870212;
      }
      goto LABEL_35;
    }
  }
}

- (int)writeIECSRegister:(void *)a3 ofLength:(unint64_t)a4 atRegister:(unsigned int)a5
{
  if (a4 >= 0x40) {
    unint64_t v7 = 64;
  }
  else {
    unint64_t v7 = a4;
  }
  uint64_t v27 = 0;
LABEL_5:
  v28[0] = 95158787;
  v28[1] = v7 | (([(PDControllerType3 *)self burstLimit] & 0xF) << 16) | 0x1800000;
  v28[2] = a5;
  unsigned int v8 = [(PDControllerType3 *)self sendVDM:v28 ofLength:3];
  if (v8)
  {
    int v10 = v8;
  }
  else
  {
    while (1)
    {
      do
      {
        uint64_t v27 = 7;
        unsigned int v9 = [(PDControllerType3 *)self getVDM:v28 ofLength:&v27];
        int v10 = v9;
      }
      while (!v9 && !v27);
      if (v9) {
        break;
      }
      if (v28[0] >> 15 == 2904)
      {
        int v11 = (v28[0] >> 4) & 3;
        if (v11 == 2) {
          return -536870212;
        }
        if (v11 != 1) {
          goto LABEL_5;
        }
        int v10 = 0;
        break;
      }
    }
  }
  BOOL v12 = v7 != 0;
  if (!v10 && v7)
  {
    unint64_t v13 = 0;
    unint64_t v26 = v7;
    do
    {
      unsigned __int8 v14 = v7 - v13;
      unint64_t v15 = (v7 - v13);
      BOOL v16 = v7 > v13;
      if (v15 > 0x18) {
        unsigned __int8 v14 = 24;
      }
      uint64_t v17 = v14;
      int v18 = ((v14 & 0x1F) << 6) | 0x5AC0002;
      uint64_t v19 = ((v14 + 3) >> 2) + 1;
      while (1)
      {
        __memcpy_chk();
        v28[0] = v18;
        [(PDControllerType3 *)self sendVDM:v28 ofLength:v19];
        do
        {
          uint64_t v27 = 7;
          unsigned int v20 = [(PDControllerType3 *)self getVDM:v28 ofLength:&v27];
          int v10 = v20;
        }
        while (!v20 && !v27);
        if (v20 || v28[0] >> 15 != 2904) {
          break;
        }
        int v21 = (v28[0] >> 4) & 3;
        if (v21 == 2)
        {
          int v10 = 0;
          goto LABEL_34;
        }
        if (v21 == 1)
        {
          v13 += v17;
          break;
        }
        BOOL v12 = v16;
        if (v26 <= v13)
        {
          int v10 = 0;
          BOOL v12 = v16;
          goto LABEL_34;
        }
      }
      unint64_t v7 = v26;
      BOOL v12 = v13 < v26;
    }
    while (!v20 && v13 < v26);
  }
LABEL_34:
  int v22 = v10;
LABEL_35:
  if (!v12) {
    return v10;
  }
  if (v22) {
    return v22;
  }
  v28[0] = 95158276;
  int v23 = [(PDControllerType3 *)self sendVDM:v28 ofLength:1];
  if (v23) {
    return v23;
  }
  while (1)
  {
    do
    {
      uint64_t v27 = 7;
      int result = [(PDControllerType3 *)self getVDM:v28 ofLength:&v27];
    }
    while (!result && !v27);
    if (result) {
      return result;
    }
    if (v28[0] >> 15 == 2904)
    {
      int v25 = (v28[0] >> 4) & 3;
      int result = 0;
      if (v25 == 1) {
        return result;
      }
      int v22 = 0;
      if (v25 == 2) {
        return -536870212;
      }
      goto LABEL_35;
    }
  }
}

- (int)executeIECSCommand:(unsigned int)a3
{
  int v10 = 0;
  uint64_t v9 = 4;
  int result = [(PDControllerType3 *)self readIECSRegister:&v10 ofLength:4 atRegister:8 andOutReadLength:&v9];
  if (!result && v10)
  {
    int v10 = 0;
    int result = [(PDControllerType3 *)self writeIECSRegister:&v10 ofLength:4 atRegister:8];
  }
  if (!result)
  {
    LODWORD(v9) = bswap32(a3);
    int result = [(PDControllerType3 *)self writeIECSRegister:&v9 ofLength:4 atRegister:8];
    if (!result)
    {
      int v6 = 100000;
      while (1)
      {
        uint64_t v9 = 4;
        int v7 = [(PDControllerType3 *)self readIECSRegister:&v10 ofLength:4 atRegister:8 andOutReadLength:&v9];
        int v8 = v10;
        if (v7 || !v10) {
          break;
        }
        +[NSThread sleepForTimeInterval:0.0000999999975];
        if (!--v6)
        {
          int v8 = v10;
          break;
        }
      }
      if (v8) {
        return -536870186;
      }
      else {
        return v7;
      }
    }
  }
  return result;
}

- (int)isPDControllerType3HPM:(BOOL *)a3
{
  *a3 = 0;
  uint64_t v7 = 0;
  int result = [(PDControllerType3 *)self registerRead32:(char *)&v7 + 4 atAddress:0];
  if (!result)
  {
    int result = [(PDControllerType3 *)self registerRead32:&v7 atAddress:1];
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

- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4
{
  uint64_t v5 = 0;
  return [(PDControllerType3 *)self readIECSRegister:a3 ofLength:4 atRegister:*(void *)&a4 andOutReadLength:&v5];
}

- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4
{
  unsigned int v5 = a3;
  return [(PDControllerType3 *)self writeIECSRegister:&v5 ofLength:4 atRegister:*(void *)&a4];
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v6 = 0;
  return [(PDControllerType3 *)self readIECSRegister:a3 ofLength:a4 atRegister:*(void *)&a5 andOutReadLength:&v6];
}

- (BOOL)remote
{
  return self->_remote;
}

- (void)setRemote:(BOOL)a3
{
  self->_remote = a3;
}

- (AppleHPMUserClient)userClient
{
  return self->_userClient;
}

- (void)setUserClient:(id)a3
{
}

- (NSDictionary)registerMap
{
  return self->_registerMap;
}

- (void)setRegisterMap:(id)a3
{
}

- (unsigned)address
{
  return self->_address;
}

- (void)setAddress:(unsigned __int8)a3
{
  self->_address = a3;
}

- (unsigned)cached_sequence_num
{
  return self->_cached_sequence_num;
}

- (void)setCached_sequence_num:(unsigned __int8)a3
{
  self->_cached_sequence_num = a3;
}

- (unsigned)streamSequenceNumber
{
  return self->_streamSequenceNumber;
}

- (void)setStreamSequenceNumber:(unsigned __int8)a3
{
  self->_streamSequenceNumber = a3;
}

- (unsigned)burstLimit
{
  return self->_burstLimit;
}

- (void)setBurstLimit:(unsigned __int8)a3
{
  self->_burstLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerMap, 0);

  objc_storeStrong((id *)&self->_userClient, 0);
}

@end