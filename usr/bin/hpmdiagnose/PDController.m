@interface PDController
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4 VID:(unsigned int)a5 DID:(unsigned int)a6;
+ (id)knownPDControllers:(int64_t)a3;
+ (id)pdControllerForAddress:(unsigned int)a3 userClient:(id)a4;
+ (id)pdControllerForVID:(unsigned int)a3 DID:(unsigned int)a4 address:(unsigned int)a5 userClient:(id)a6;
- (AppleHPMUserClient)userClient;
- (BOOL)isSPIMaster;
- (BOOL)remote;
- (BOOL)supportsRemote;
- (NSDictionary)commandMap;
- (NSDictionary)registerMap;
- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4 VID:(unsigned int)a5 DID:(unsigned int)a6;
- (id)commandFormatterHexDumpWithBuffer:(void *)a3 length:(unint64_t)a4 inputBuffer:(void *)a5 andInputLength:(unint64_t)a6;
- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3;
- (id)readFullVersion;
- (id)registerFormatter4CCWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterBCDVersionWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDIDWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDecimal16WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDecimal32MillisecondsWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDecimal32WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDecimal64WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterDecimal8WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterHex16WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterHex32WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterHexDumpNarrowWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterHexDumpWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterRxVDMWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterStringWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterUUIDWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterVIDWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (int)disc:(unsigned __int8)a3;
- (int)executeIECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11;
- (int)executeIECSCommand:(unsigned int)a3;
- (int)executeIECSCommand:(unsigned int)a3 withData:(void *)a4 ofLength:(unint64_t)a5;
- (int)forceMode:(unsigned __int8)a3 withDataStatus:(unsigned int)a4 andStatus:(unsigned int)a5;
- (int)forceUpdateMode:(unsigned __int8)a3;
- (int)printAll;
- (int)printAll:(id)a3;
- (int)printCommand:(unsigned int)a3;
- (int)printCommand:(unsigned int)a3 dataBuffer:(void *)a4 andLength:(unint64_t)a5;
- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5;
- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andData:(void *)a6 andLength:(unint64_t)a7;
- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andWriteData:(void *)a6 andWriteDataLength:(unint64_t)a7;
- (int)printCommand:(unsigned int)a3 withWriteData:(void *)a4 withWriteLength:(unint64_t)a5;
- (int)printInfo;
- (int)printRegister:(unsigned __int8)a3;
- (int)printRegister:(unsigned __int8)a3 dataBuffer:(void *)a4 andLength:(unint64_t)a5;
- (int)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andFormatter:(SEL)a5;
- (int)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andData:(void *)a6 andLength:(unint64_t)a7;
- (int)printStateHistory;
- (int)printTriage:(id)a3;
- (int)receiveVDM:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7;
- (int)receiveVDMAttention:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7;
- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4;
- (int)registerRead8:(char *)a3 atAddress:(unsigned int)a4;
- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6;
- (int)registerReadRemote:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6;
- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4;
- (int)registerWrite8:(unsigned __int8)a3 atAddress:(unsigned int)a4;
- (int)registerWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)registerWriteRemote:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)runLivePDLog;
- (int)sendVDM:(void *)a3 length:(unint64_t)a4 sop:(int)a5;
- (int)setupForLivePDLog;
- (int)stress:(unsigned int)a3;
- (int64_t)compare:(id)a3;
- (unsigned)address;
- (unsigned)did;
- (unsigned)readUUIDIntoBuffer:(char *)a3 ofLength:(unsigned __int8)a4;
- (unsigned)vid;
- (void)printCommand:(unsigned int)a3 withTitle:(id)a4 andDescription:(id)a5;
- (void)printCommandDescription:(id)a3;
- (void)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andDescription:(id)a5;
- (void)printRegisterDescription:(id)a3;
- (void)printRegisterDescription:(id)a3 withIndex:(int)a4;
- (void)printRegisterTitle:(id)a3 andDescription:(id)a4;
- (void)setAddress:(unsigned __int8)a3;
- (void)setCommandMap:(id)a3;
- (void)setDid:(unsigned int)a3;
- (void)setRegisterMap:(id)a3;
- (void)setRemote:(BOOL)a3;
- (void)setUserClient:(id)a3;
- (void)setVid:(unsigned int)a3;
@end

@implementation PDController

+ (id)knownPDControllers:(int64_t)a3
{
  kern_return_t ChildIterator;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  unsigned int v24;
  io_iterator_t iterator;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  unsigned char v30[128];
  uint64_t vars8;

  v21 = +[NSMutableArray array];
  v4 = +[AppleHPMUserClientManager sharedInstance];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 userClientSet];
    if (v6)
    {
      v7 = v6;
      v20 = v5;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8)
      {
        id v9 = v8;
        ChildIterator = 0;
        v11 = *(void *)v27;
        v22 = a3;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v7);
            }
            v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            iterator = 0;
            if (!ChildIterator)
            {
              ChildIterator = IORegistryEntryGetChildIterator((io_registry_entry_t)[v13 service], "IOService", &iterator);
              if (!ChildIterator)
              {
                v14 = IOIteratorNext(iterator);
                if (v14)
                {
                  v15 = v14;
                  do
                  {
                    if (IOObjectConformsTo(v15, "AppleHPMDevice"))
                    {
                      v24 = 0;
                      v23 = 0;
                      if (!+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:](IOKitUtilities, "uint32ForRegistryEntry:andKey:outValue:", v15, @"Address", &v24)&& !+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:](IOKitUtilities, "uint32ForRegistryEntry:andKey:outValue:", v15, @"Vendor ID", (char *)&v23 + 4)&& !+[IOKitUtilities uint32ForRegistryEntry:v15 andKey:@"Device ID" outValue:&v23])
                      {
                        if (a3 < 0)
                        {
                          v16 = HIDWORD(v23);
                        }
                        else
                        {
                          HIDWORD(v23) = a3;
                          v16 = a3;
                        }
                        v17 = +[PDController pdControllerForVID:v16 DID:v23 address:v24 userClient:v13];
                        if (v17) {
                          [v21 addObject:v17];
                        }

                        a3 = v22;
                      }
                    }
                    IOObjectRelease(v15);
                    v15 = IOIteratorNext(iterator);
                  }
                  while (v15);
                }
                if (iterator) {
                  IOObjectRelease(iterator);
                }
                ChildIterator = 0;
              }
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v9);
      }

      v5 = v20;
    }
  }
  v18 = [v21 sortedArrayUsingSelector:"compare:"];

  return v18;
}

+ (id)pdControllerForAddress:(unsigned int)a3 userClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  v6 = 0;
  if (![v5 iecsReadCommandForDevice:v4 withAddress:0 buffer:(char *)&v9 + 4 length:4 flags:0 andOutReadLength:&v8])
  {
    uint64_t v8 = 0;
    v6 = 0;
    if (![v5 iecsReadCommandForDevice:v4 withAddress:1 buffer:&v9 length:4 flags:0 andOutReadLength:&v8])
    {
      v6 = +[PDController pdControllerForVID:HIDWORD(v9) DID:v9 address:v4 userClient:v5];
    }
  }

  return v6;
}

+ (id)pdControllerForVID:(unsigned int)a3 DID:(unsigned int)a4 address:(unsigned int)a5 userClient:(id)a6
{
  unsigned __int8 v6 = a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  if (v8 != 40)
  {
    if (v8 == 2599) {
      +[PDControllerType1 PDControllerType1WithDeviceAddress:v6 userClient:v9];
    }
    else {
    uint64_t v10 = +[PDController createWithDeviceAddress:v6 userClient:v9 VID:v8 DID:v7];
    }
    goto LABEL_13;
  }
  if ((int)v7 > 389205247)
  {
    if (v7 == 826622785)
    {
      v11 = PDControllerType2;
      goto LABEL_12;
    }
LABEL_11:
    v11 = PDControllerType4;
    goto LABEL_12;
  }
  if ((v7 - 33628196) >= 4) {
    goto LABEL_11;
  }
  v11 = PDControllerType5;
LABEL_12:
  uint64_t v10 = [(__objc2_class *)v11 createWithDeviceAddress:v6 userClient:v9];
LABEL_13:
  v12 = (void *)v10;

  return v12;
}

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4 VID:(unsigned int)a5 DID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = [objc_alloc((Class)a1) initWithAddress:v8 userClient:v10 VID:v7 DID:v6];

  return v11;
}

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithAddress:v4 userClient:v6];

  return v7;
}

- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDController;
  id v7 = [(PDController *)&v12 init];
  uint64_t v8 = v7;
  if (v7
    && ([(PDController *)v7 setAddress:v4],
        [(PDController *)v8 setUserClient:v6],
        [(PDController *)v8 userClient],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    unsigned int v11 = 0;
    [(PDController *)v8 registerRead32:&v11 atAddress:1];
    [(PDController *)v8 setDid:v11];
  }
  else
  {

    uint64_t v8 = 0;
  }

  return v8;
}

- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4 VID:(unsigned int)a5 DID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PDController;
  unsigned int v11 = [(PDController *)&v15 init];
  objc_super v12 = v11;
  if (!v11
    || ([(PDController *)v11 setAddress:v8],
        [(PDController *)v12 setVid:v7],
        [(PDController *)v12 setDid:v6],
        [(PDController *)v12 setUserClient:v10],
        [(PDController *)v12 userClient],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {

    objc_super v12 = 0;
  }

  return v12;
}

- (BOOL)supportsRemote
{
  return 0;
}

- (int)printInfo
{
  return 0;
}

- (int)printAll:(id)a3
{
  return 0;
}

- (int)printAll
{
  return 0;
}

- (int)printTriage:(id)a3
{
  return 0;
}

- (int)printStateHistory
{
  return 0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(PDController *)self userClient];
      unsigned int v7 = [v6 routerID];
      uint64_t v8 = [v5 userClient];
      unsigned int v9 = [v8 routerID];

      if (v7 > v9)
      {
LABEL_4:
        int64_t v10 = 1;
LABEL_9:

        goto LABEL_10;
      }
      unsigned int v11 = [(PDController *)self userClient];
      unsigned int v12 = [v11 routerID];
      v13 = [v5 userClient];
      unsigned int v14 = [v13 routerID];

      if (v12 >= v14)
      {
        v16 = [(PDController *)self userClient];
        id v17 = [v16 routeString];
        v18 = [v5 userClient];
        id v19 = [v18 routeString];

        if (v17 > v19) {
          goto LABEL_4;
        }
        v20 = [(PDController *)self userClient];
        id v21 = [v20 routeString];
        v22 = [v5 userClient];
        id v23 = [v22 routeString];

        if (v21 >= v23)
        {
          unsigned int v24 = [(PDController *)self address];
          if (v24 <= [v5 address])
          {
            unsigned int v25 = [(PDController *)self address];
            if (v25 >= [v5 address]) {
              int64_t v10 = 0;
            }
            else {
              int64_t v10 = -1;
            }
            goto LABEL_9;
          }
          goto LABEL_4;
        }
      }
      int64_t v10 = -1;
      goto LABEL_9;
    }
    int64_t v10 = (int64_t)[v4 compare:self];
  }
  else
  {
    int64_t v10 = 1;
  }
LABEL_10:

  return v10;
}

- (int)registerRead8:(char *)a3 atAddress:(unsigned int)a4
{
  uint64_t v5 = 0;
  return [(PDController *)self registerRead:a3 ofLength:1 atAddress:*(void *)&a4 andOutReadLength:&v5];
}

- (int)registerWrite8:(unsigned __int8)a3 atAddress:(unsigned int)a4
{
  unsigned __int8 v5 = a3;
  return [(PDController *)self registerWrite:&v5 ofLength:1 atAddress:*(void *)&a4];
}

- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4
{
  uint64_t v5 = 0;
  return [(PDController *)self registerRead:a3 ofLength:4 atAddress:*(void *)&a4 andOutReadLength:&v5];
}

- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4
{
  unsigned int v5 = a3;
  return [(PDController *)self registerWrite:&v5 ofLength:4 atAddress:*(void *)&a4];
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v6 = 0;
  return [(PDController *)self registerRead:a3 ofLength:a4 atAddress:*(void *)&a5 andOutReadLength:&v6];
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  uint64_t v7 = *(void *)&a5;
  if ([(PDController *)self remote])
  {
    return [(PDController *)self registerReadRemote:a3 ofLength:a4 atAddress:v7 andOutReadLength:a6];
  }
  else
  {
    unsigned int v12 = [(PDController *)self userClient];
    int v13 = [v12 iecsReadCommandForDevice:-[PDController address](self, "address") withAddress:v7 buffer:a3 length:a4 flags:0 andOutReadLength:a6];

    return v13;
  }
}

- (int)registerReadRemote:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  HIDWORD(v22) = 0;
  LODWORD(v22) = 1396917577;
  unsigned int v11 = malloc_type_malloc(0x40uLL, 0x1FF77245uLL);
  *(void *)((char *)&v22 + 4) = (a4 << 24) | (a5 << 8) | 0x10000;
  if (!v11) {
    return -536870211;
  }
  unsigned int v12 = v11;
  int v13 = [(PDController *)self userClient];
  int v14 = [v13 iecsWriteCommandForDevice:-[PDController address](self, "address") withAddress:19 buffer:(char *)&v22 + 4 length:4 flags:0];

  if (!v14)
  {
    objc_super v15 = [(PDController *)self userClient];
    [v15 iecsWriteCommandForDevice:-[PDController address](self, "address") withAddress:8 buffer:&v22 length:4 flags:0];

    int v16 = 99;
    do
    {
      usleep(0x64u);
      id v17 = [(PDController *)self userClient];
      int v14 = [v17 iecsReadCommandForDevice:-[PDController address](self, "address") withAddress:8 buffer:v12 length:a4 flags:0 andOutReadLength:a6];
    }
    while (*v12 == 73 && v16-- != 0);
    if (!v14)
    {
      id v19 = [(PDController *)self userClient];
      int v14 = [v19 iecsReadCommandForDevice:-[PDController address](self, "address") withAddress:19 buffer:v12 length:a4 flags:0 andOutReadLength:0];

      if (!v14)
      {
        if ((v12[2] & 0x7C) != 0)
        {
          puts("remote read failed");
          [(PDController *)self setRemote:0];
          int v14 = -536870165;
        }
        else
        {
          *a6 = v12[3] & 0x7F;
          v20 = [(PDController *)self userClient];
          int v14 = [v20 iecsReadCommandForDevice:-[PDController address](self, "address") withAddress:9 buffer:a3 length:a4 flags:0 andOutReadLength:(char *)&v22 + 8];
        }
      }
    }
  }
  free(v12);
  return v14;
}

- (int)registerWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if ([(PDController *)self remote])
  {
    return [(PDController *)self registerWriteRemote:a3 ofLength:a4 atAddress:v5];
  }
  else
  {
    int64_t v10 = [(PDController *)self userClient];
    int v11 = [v10 iecsWriteCommandForDevice:-[PDController address](self, "address") withAddress:v5 buffer:a3 length:a4 flags:0];

    return v11;
  }
}

- (int)registerWriteRemote:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  unsigned __int8 v5 = a5;
  int v19 = 1396917577;
  unsigned int v9 = malloc_type_malloc(0x40uLL, 0xB0A83142uLL);
  int v20 = (a4 << 24) | (v5 << 8);
  if (!v9) {
    return -536870211;
  }
  int64_t v10 = v9;
  int v11 = [(PDController *)self userClient];
  int v12 = [v11 iecsWriteCommandForDevice:-[PDController address](self, "address") withAddress:19 buffer:&v20 length:a4 flags:0];

  if (!v12)
  {
    int v13 = [(PDController *)self userClient];
    int v12 = [v13 iecsWriteCommandForDevice:-[PDController address](self, "address") withAddress:9 buffer:a3 length:a4 flags:0];

    if (!v12)
    {
      int v14 = [(PDController *)self userClient];
      [v14 iecsWriteCommandForDevice:-[PDController address](self, "address") withAddress:8 buffer:&v19 length:4 flags:0];

      int v15 = 99;
      do
      {
        usleep(0x64u);
        int v16 = [(PDController *)self userClient];
        int v12 = [v16 iecsReadCommandForDevice:-[PDController address](self, "address") withAddress:8 buffer:v10 length:a4 flags:0 andOutReadLength:0];
      }
      while (*v10 == 73 && v15-- != 0);
    }
  }
  free(v10);
  return v12;
}

- (int)executeIECSCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = 0;
  unsigned __int8 v5 = malloc_type_malloc(0x40uLL, 0x1BA249DBuLL);
  if ([(PDController *)self remote])
  {
    unsigned int v12 = bswap32(v3);
    int v6 = [(PDController *)self registerWriteRemote:&v12 ofLength:4 atAddress:8];
    if (!v6)
    {
      int v7 = 99;
      do
      {
        usleep(0x64u);
        unsigned int v8 = [(PDController *)self registerReadRemote:v5 ofLength:4 atAddress:8 andOutReadLength:&v13];
      }
      while (*v5 == v12 && v7-- != 0);
      int v6 = v8;
    }
  }
  else
  {
    int64_t v10 = [(PDController *)self userClient];
    int v6 = [v10 iecsCommand:v3 forDevice:-[PDController address](self, "address") flags:0];
  }
  if (v5) {
    free(v5);
  }
  return v6;
}

- (int)executeIECSCommand:(unsigned int)a3 withData:(void *)a4 ofLength:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if ([(PDController *)self remote])
  {
    [(PDController *)self registerWriteRemote:&v10 ofLength:64 atAddress:9];
    int result = [(PDController *)self registerWriteRemote:a4 ofLength:a5 atAddress:9];
    if (result) {
      return result;
    }
  }
  else
  {
    [(PDController *)self registerWrite:&v10 ofLength:64 atAddress:9];
    int result = [(PDController *)self registerWrite:a4 ofLength:a5 atAddress:9];
    if (result) {
      return result;
    }
  }
  return [(PDController *)self executeIECSCommand:v7];
}

- (int)sendVDM:(void *)a3 length:(unint64_t)a4 sop:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  unsigned int v9 = [(PDController *)self userClient];
  LODWORD(v5) = [v9 sendVDMForDevice:-[PDController address](self, "address") sop:v5 buffer:a3 length:a4 flags:0];

  return v5;
}

- (int)receiveVDM:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7
{
  uint64_t v13 = [(PDController *)self userClient];
  LODWORD(a7) = [v13 receiveVDMForDevice:-[PDController address](self, "address") buffer:a3 length:a4 flags:0 outSOP:a5 outSequence:a6 outLength:a7];

  return (int)a7;
}

- (int)receiveVDMAttention:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7
{
  uint64_t v13 = [(PDController *)self userClient];
  LODWORD(a7) = [v13 receiveVDMAttentionForDevice:-[PDController address](self, "address") buffer:a3 length:a4 flags:0 outSOP:a5 outSequence:a6 outLength:a7];

  return (int)a7;
}

- (int)stress:(unsigned int)a3
{
  uint64_t v5 = malloc_type_malloc(0x40uLL, 0x7DB03540uLL);
  if (v5)
  {
    int v6 = v5;
    int v7 = -536870211;
    unsigned int v8 = malloc_type_malloc(0x40uLL, 0xE42C248FuLL);
    if (v8)
    {
      if (a3)
      {
        int v10 = 0;
        qmemcpy(v19, "/.-,+*)('&%$#\"! ?>=<;:9876543210", sizeof(v19));
        while (1)
        {
          printf("Stress cycle %d\n", v10);
          _OWORD *v6 = v19[1];
          v6[1] = v19[0];
          v6[2] = xmmword_100015270;
          v6[3] = xmmword_100015280;
          unsigned int v11 = [(PDController *)self registerWrite:v6 ofLength:64 atAddress:9];
          if (v11
            || (unsigned int v11 = [(PDController *)self registerRead:v8 ofLength:64 atAddress:9]) != 0)
          {
            int v7 = v11;
            goto LABEL_19;
          }
          if (bcmp(v6, v8, 0x40uLL)) {
            break;
          }
          if (a3 == ++v10) {
            goto LABEL_9;
          }
        }
        printf("Mismatch on cycle %d\n", v10);
        puts("Write buffer:");
        unsigned int v12 = [(PDController *)self registerFormatterHexDumpWithBuffer:v6 andLength:64];
        if ([v12 count])
        {
          unint64_t v13 = 0;
          do
          {
            id v14 = [v12 objectAtIndexedSubscript:v13];
            puts((const char *)[v14 UTF8String]);

            ++v13;
          }
          while ((unint64_t)[v12 count] > v13);
        }

        puts("Read buffer:");
        int v15 = [(PDController *)self registerFormatterHexDumpWithBuffer:v8 andLength:64];
        if ([v15 count])
        {
          unint64_t v16 = 0;
          do
          {
            id v17 = [v15 objectAtIndexedSubscript:v16];
            puts((const char *)[v17 UTF8String]);

            ++v16;
          }
          while ((unint64_t)[v15 count] > v16);
        }

        int v7 = -536870198;
      }
      else
      {
LABEL_9:
        int v7 = 0;
      }
    }
LABEL_19:
    free(v6);
    if (v8) {
      free(v8);
    }
  }
  else
  {
    int v7 = -536870211;
  }
  return v7;
}

- (int)printCommand:(unsigned int)a3
{
  return [(PDController *)self printCommand:*(void *)&a3 withTitle:&stru_1000186C8 andFormatter:"commandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:"];
}

- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  unsigned int v9 = malloc_type_malloc(0x40uLL, 0x3A27C1B9uLL);
  if (!v9)
  {
    int v10 = 0;
    uint64_t v12 = 3758097085;
    uint64_t v20 = 0;
    goto LABEL_7;
  }
  int v10 = malloc_type_malloc(0x40uLL, 0x2F5DE6ACuLL);
  uint64_t v20 = 0;
  if (!v10)
  {
    uint64_t v12 = 3758097085;
    goto LABEL_7;
  }
  uint64_t v11 = [(PDController *)self registerRead:v10 ofLength:64 atAddress:9 andOutReadLength:&v20];
  if (v11)
  {
    uint64_t v12 = v11;
LABEL_7:
    unint64_t v19 = 0;
LABEL_8:
    +[NSString stringWithFormat:@"Status = 0x%08x", v12];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [(PDController *)self printCommand:v6 withTitle:v8 andDescription:v13];
    goto LABEL_9;
  }
  uint64_t v15 = [(PDController *)self executeIECSCommand:v6];
  unint64_t v19 = 0;
  if (v15
    || (uint64_t v15 = [(PDController *)self registerRead:v9 ofLength:64 atAddress:9 andOutReadLength:&v19], v15))
  {
    uint64_t v12 = v15;
    goto LABEL_8;
  }
  uint64_t v16 = v19;
  if (v19 >= 0x40) {
    uint64_t v16 = 64;
  }
  unint64_t v19 = v16;
  off_1000217F8(self, a5, v9, 64, v10, 64);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v13;
    if ([v13 count])
    {
      if ([v13 count])
      {
        unint64_t v17 = 0;
        do
        {
          v18 = [v13 objectAtIndexedSubscript:v17];
          if (v17) {
            [(PDController *)self printCommandDescription:v18];
          }
          else {
            [(PDController *)self printCommand:v6 withTitle:v8 andDescription:v18];
          }

          ++v17;
        }
        while ((unint64_t)[v13 count] > v17);
      }
    }
    else
    {
      [(PDController *)self printCommand:v6 withTitle:v8 andDescription:&stru_1000186C8];
    }
  }
  else
  {
    [(PDController *)self printCommand:v6 withTitle:v8 andDescription:v13];
  }
  LODWORD(v12) = 0;
LABEL_9:

  if (v9) {
    free(v9);
  }
  if (v10) {
    free(v10);
  }

  return v12;
}

- (void)printCommand:(unsigned int)a3 withTitle:(id)a4 andDescription:(id)a5
{
}

- (int)printCommand:(unsigned int)a3 dataBuffer:(void *)a4 andLength:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  unsigned int v9 = [(PDController *)self commandMap];
  int v10 = +[NSNumber numberWithUnsignedInt:v7];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    uint64_t v12 = [v11 objectForKeyedSubscript:@"title"];
    id v13 = [v11 objectForKeyedSubscript:@"formatter"];
    SEL v14 = NSSelectorFromString(v13);
  }
  else
  {
    SEL v14 = "registerFormatterHexDumpWithBuffer:andLength:";
    uint64_t v12 = &stru_1000186C8;
  }
  uint64_t v15 = malloc_type_malloc(a5, 0x6EDCEB3DuLL);
  bzero(v15, a5);
  memcpy(v15, a4, a5);
  int v16 = [(PDController *)self printCommand:v7 withTitle:v12 andFormatter:v14 andData:v15 andLength:a5];
  free(v15);

  return v16;
}

- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andData:(void *)a6 andLength:(unint64_t)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  if (a7 >= 0x40) {
    unint64_t v13 = 64;
  }
  else {
    unint64_t v13 = a7;
  }
  SEL v14 = off_1000217F8(self, a5, a6, 64, a6, v13);
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
          unint64_t v17 = [v15 objectAtIndexedSubscript:v16];
          if (v16) {
            [(PDController *)self printCommandDescription:v17];
          }
          else {
            [(PDController *)self printCommand:v10 withTitle:v12 andDescription:v17];
          }

          ++v16;
        }
        while ((unint64_t)[v15 count] > v16);
      }
    }
    else
    {
      [(PDController *)self printCommand:v10 withTitle:v12 andDescription:&stru_1000186C8];
    }
  }
  else
  {
    [(PDController *)self printCommand:v10 withTitle:v12 andDescription:v14];
  }

  return 0;
}

- (int)printCommand:(unsigned int)a3 withWriteData:(void *)a4 withWriteLength:(unint64_t)a5
{
  return [(PDController *)self printCommand:*(void *)&a3 withTitle:&stru_1000186C8 andFormatter:"commandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:" andWriteData:a4 andWriteDataLength:a5];
}

- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andWriteData:(void *)a6 andWriteDataLength:(unint64_t)a7
{
  __int16 v7 = a7;
  unsigned int v19 = a3;
  id v11 = a4;
  id v12 = malloc_type_malloc(0x40uLL, 0x42A1BD1uLL);
  if (!v12)
  {
    uint64_t v13 = 3758097085;
    goto LABEL_13;
  }
  WORD1(v18) = 64;
  LOWORD(v18) = v7;
  uint64_t v13 = -[PDController executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v19, a6, 0, v12, 0, v18, 10);
  if (v13)
  {
LABEL_13:
    +[NSString stringWithFormat:@"Status = 0x%08x", v13];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  off_1000217F8(self, a5, v12, 64, a6, 64);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_14:
    [(PDController *)self printCommand:v19 withTitle:v11 andDescription:v14];
    goto LABEL_15;
  }
  id v14 = v14;
  if ([v14 count])
  {
    if ([v14 count])
    {
      unint64_t v15 = 0;
      do
      {
        unint64_t v16 = [v14 objectAtIndexedSubscript:v15];
        if (v15) {
          [(PDController *)self printCommandDescription:v16];
        }
        else {
          [(PDController *)self printCommand:v19 withTitle:v11 andDescription:v16];
        }

        ++v15;
      }
      while ((unint64_t)[v14 count] > v15);
    }
  }
  else
  {
    [(PDController *)self printCommand:v19 withTitle:v11 andDescription:&stru_1000186C8];
  }

LABEL_15:
  if (v12) {
    free(v12);
  }

  return v13;
}

- (void)printCommandDescription:(id)a3
{
}

- (int)printRegister:(unsigned __int8)a3 dataBuffer:(void *)a4 andLength:(unint64_t)a5
{
  uint64_t v7 = a3;
  unsigned int v9 = [(PDController *)self registerMap];
  uint64_t v10 = +[NSNumber numberWithUnsignedChar:v7];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    id v12 = [v11 objectForKeyedSubscript:@"title"];
    uint64_t v13 = [v11 objectForKeyedSubscript:@"formatter"];
    SEL v14 = NSSelectorFromString(v13);
  }
  else
  {
    SEL v14 = "registerFormatterHexDumpWithBuffer:andLength:";
    id v12 = &stru_1000186C8;
  }
  unint64_t v15 = malloc_type_malloc(a5, 0xE63D717DuLL);
  bzero(v15, a5);
  memcpy(v15, a4, a5);
  int v16 = [(PDController *)self printRegister:v7 withTitle:v12 andFormatter:v14 andData:v15 andLength:a5];
  free(v15);

  return v16;
}

- (int)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andData:(void *)a6 andLength:(unint64_t)a7
{
  uint64_t v10 = a3;
  id v12 = a4;
  if (a7 >= 0x40) {
    unint64_t v13 = 64;
  }
  else {
    unint64_t v13 = a7;
  }
  SEL v14 = off_1000217F0(self, a5, a6, v13);
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
          unint64_t v17 = [v15 objectAtIndexedSubscript:v16];
          if (v16) {
            [(PDController *)self printRegisterDescription:v17];
          }
          else {
            [(PDController *)self printRegister:v10 withTitle:v12 andDescription:v17];
          }

          ++v16;
        }
        while ((unint64_t)[v15 count] > v16);
      }
    }
    else
    {
      [(PDController *)self printRegister:v10 withTitle:v12 andDescription:&stru_1000186C8];
    }
  }
  else
  {
    [(PDController *)self printRegister:v10 withTitle:v12 andDescription:v14];
  }

  return 0;
}

- (int)printRegister:(unsigned __int8)a3
{
  return [(PDController *)self printRegister:a3 withTitle:&stru_1000186C8 andFormatter:"registerFormatterHexDumpWithBuffer:andLength:"];
}

- (int)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andFormatter:(SEL)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  unsigned int v9 = malloc_type_malloc(0x40uLL, 0x3F6C0EA9uLL);
  unint64_t v16 = 0;
  if (!v9)
  {
    uint64_t v10 = 3758097085;
    goto LABEL_16;
  }
  uint64_t v10 = [(PDController *)self registerRead:v9 ofLength:64 atAddress:v6 andOutReadLength:&v16];
  if (v10)
  {
LABEL_16:
    +[NSString stringWithFormat:@"Status = 0x%08x\n", v10];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    [(PDController *)self printRegister:v6 withTitle:v8 andDescription:v12];
    goto LABEL_18;
  }
  if (v16 >= 0x40) {
    uint64_t v11 = 64;
  }
  else {
    uint64_t v11 = v16;
  }
  unint64_t v16 = v11;
  off_1000217F0(self, a5, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  id v12 = v12;
  if ([v12 count])
  {
    if ([v12 count])
    {
      unint64_t v13 = 0;
      do
      {
        SEL v14 = [v12 objectAtIndexedSubscript:v13];
        if (v13) {
          [(PDController *)self printRegisterDescription:v14];
        }
        else {
          [(PDController *)self printRegister:v6 withTitle:v8 andDescription:v14];
        }

        ++v13;
      }
      while ((unint64_t)[v12 count] > v13);
    }
  }
  else
  {
    [(PDController *)self printRegister:v6 withTitle:v8 andDescription:&stru_1000186C8];
  }

LABEL_18:
  if (v9) {
    free(v9);
  }

  return v10;
}

- (void)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andDescription:(id)a5
{
}

- (void)printRegisterTitle:(id)a3 andDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (const char *)[v5 UTF8String];
  id v8 = v6;
  unsigned int v9 = (const char *)[v8 UTF8String];

  printf("%s\t%s\n", v7, v9);
}

- (void)printRegisterDescription:(id)a3
{
}

- (void)printRegisterDescription:(id)a3 withIndex:(int)a4
{
}

- (id)registerFormatterDecimal8WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 1) {
    +[NSString stringWithFormat:@"%d", *(unsigned __int8 *)a3];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"ERROR: length %lld != 1", a4];
  }

  return v4;
}

- (id)registerFormatterDecimal16WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 2) {
    +[NSString stringWithFormat:@"%d", *(unsigned __int16 *)a3];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"ERROR: length %lld != 2", a4];
  }

  return v4;
}

- (id)registerFormatterDecimal32WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4) {
    +[NSString stringWithFormat:@"%d", *(unsigned int *)a3];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"ERROR: length %lld != 4", a4];
  }

  return v4;
}

- (id)registerFormatterDecimal64WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 8) {
    +[NSString stringWithFormat:@"%lld", *(void *)a3];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"ERROR: length %lld != 8", a4];
  }

  return v4;
}

- (id)registerFormatterHex16WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 2) {
    +[NSString stringWithFormat:@"0x%04x", *(unsigned int *)a3];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"ERROR: length %lld != 2", a4];
  }

  return v4;
}

- (id)registerFormatterHex32WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4) {
    +[NSString stringWithFormat:@"0x%08x", *(unsigned int *)a3];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"ERROR: length %lld != 4", a4];
  }

  return v4;
}

- (id)registerFormatter4CCWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4) {
    +[NSString stringWithFormat:@"%c%c%c%c", *(unsigned __int8 *)a3, *((unsigned __int8 *)a3 + 1), *((unsigned __int8 *)a3 + 2), *((unsigned __int8 *)a3 + 3)];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"ERROR: length %lld != 4", a4, v6, v7, v8];
  }

  return v4;
}

- (id)registerFormatterUUIDWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 16)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)a3, out);
    +[NSString stringWithFormat:@"%s", out];
  }
  else
  {
    +[NSString stringWithFormat:@"ERROR: length %lld != 4", a4];
  id v4 = };

  return v4;
}

- (id)registerFormatterStringWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  *((char *)a3 + a4 - 1) = 0;
  return +[NSString stringWithFormat:@"\"%s\"", a3];
}

- (id)registerFormatterHexDumpWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v6 = +[NSMutableArray array];
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  do
  {
    if (!v8)
    {
      uint64_t v8 = +[NSMutableString string];
      [(__CFString *)v8 appendFormat:@"0x%02llX\t", a4];
      [(__CFString *)v8 appendString:@"0x"];
    }
    [(__CFString *)v8 appendFormat:@"%02X", *((unsigned __int8 *)a3 + v7++)];
  }
  while (a4 != v7);
  unsigned int v9 = v8;
  if (!v8)
  {
LABEL_7:
    unsigned int v9 = 0;
    uint64_t v8 = @"0x00";
  }
  [v6 addObject:v8];

  return v6;
}

- (id)commandFormatterHexDumpWithBuffer:(void *)a3 length:(unint64_t)a4 inputBuffer:(void *)a5 andInputLength:(unint64_t)a6
{
  return -[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", a3, 64, a5, a6);
}

- (id)registerFormatterHexDumpNarrowWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v6 = +[NSMutableArray array];
  if (a4)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      if (!v8)
      {
        uint64_t v8 = +[NSMutableString string];
      }
      [v8 appendFormat:@"0x%02X ", *((unsigned __int8 *)a3 + v7++)];
      if ((v7 & 7) == 0 || v7 >= a4)
      {
        [v6 addObject:v8];

        uint64_t v8 = 0;
      }
    }
    while (a4 != v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v6;
}

- (id)registerFormatterDecimal32MillisecondsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4) {
    +[NSString stringWithFormat:@"%d ms", *(unsigned int *)a3];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"ERROR: length %lld != 4", a4];
  }

  return v4;
}

- (id)registerFormatterBCDVersionWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4) {
    +[NSString stringWithFormat:@"%X.%X.%X", *((unsigned __int16 *)a3 + 1), *((unsigned __int8 *)a3 + 1), *(unsigned __int8 *)a3];
  }
  else {
  id v4 = +[NSString stringWithFormat:@"ERROR: length %lld != 4", a4, v6, v7];
  }

  return v4;
}

- (id)registerFormatterRxVDMWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v6 = +[NSMutableString string];
  uint64_t v7 = v6;
  if (a4 == 29)
  {
    unsigned int v9 = *(unsigned __int8 *)a3;
    uint64_t v8 = (unsigned int *)((char *)a3 + 1);
    uint64_t v10 = v9 & 7;
    [v6 appendFormat:@"seq=%d cnt=%d ", (v9 >> 5) & 3, v10];
    if (v10)
    {
      do
      {
        unsigned int v11 = *v8++;
        [v7 appendFormat:@"0x%08X ", v11];
        --v10;
      }
      while (v10);
    }
  }
  else
  {
    [v6 appendFormat:@"ERROR: length %lld != 29", a4];
  }

  return v7;
}

- (id)registerFormatterVIDWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4)
  {
    if (*(_DWORD *)a3 == 40)
    {
      +[NSString stringWithFormat:@"0x%08X (TI)", 40];
    }
    else if (*(_DWORD *)a3 == 2599)
    {
      +[NSString stringWithFormat:@"0x%08X (Apple Inc.)", 2599];
    }
    else
    {
      +[NSString stringWithFormat:@"0x%08X", *(unsigned int *)a3];
    }
  }
  else
  {
    +[NSString stringWithFormat:@"ERROR: length %lld != 4", a4];
  id v4 = };

  return v4;
}

- (id)registerFormatterDIDWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if (a4 == 4)
  {
    if (*(_DWORD *)a3 == 24) {
      +[NSString stringWithFormat:@"0x%08X (PDControllerType1[USB-C])", 24];
    }
    else {
      +[NSString stringWithFormat:@"0x%08X", *(unsigned int *)a3];
    }
  }
  else
  {
    +[NSString stringWithFormat:@"ERROR: length %lld != 4", a4];
  id v4 = };

  return v4;
}

- (id)readFullVersion
{
  return &stru_1000186C8;
}

- (unsigned)readUUIDIntoBuffer:(char *)a3 ofLength:(unsigned __int8)a4
{
  return 0;
}

- (BOOL)isSPIMaster
{
  return 1;
}

- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3
{
  return @"Unknown";
}

- (int)disc:(unsigned __int8)a3
{
  return -536870201;
}

- (int)forceMode:(unsigned __int8)a3 withDataStatus:(unsigned int)a4 andStatus:(unsigned int)a5
{
  return -536870201;
}

- (int)forceUpdateMode:(unsigned __int8)a3
{
  return -536870201;
}

- (int)executeIECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11
{
  return -536870201;
}

- (int)setupForLivePDLog
{
  return -536870201;
}

- (int)runLivePDLog
{
  return -536870201;
}

- (NSDictionary)registerMap
{
  return self->_registerMap;
}

- (void)setRegisterMap:(id)a3
{
}

- (NSDictionary)commandMap
{
  return self->_commandMap;
}

- (void)setCommandMap:(id)a3
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

- (unsigned)vid
{
  return self->_vid;
}

- (void)setVid:(unsigned int)a3
{
  self->_vid = a3;
}

- (unsigned)did
{
  return self->_did;
}

- (void)setDid:(unsigned int)a3
{
  self->_did = a3;
}

- (AppleHPMUserClient)userClient
{
  return self->_userClient;
}

- (void)setUserClient:(id)a3
{
}

- (BOOL)remote
{
  return self->_remote;
}

- (void)setRemote:(BOOL)a3
{
  self->_remote = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userClient, 0);
  objc_storeStrong((id *)&self->_commandMap, 0);

  objc_storeStrong((id *)&self->_registerMap, 0);
}

@end