@interface PDController
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
+ (id)knownPDControllers;
+ (id)pdControllerForAddress:(unsigned int)a3 userClient:(id)a4;
+ (id)pdControllerForVID:(unsigned int)a3 DID:(unsigned int)a4 address:(unsigned int)a5 userClient:(id)a6;
- (AppleHPMUserClient)userClient;
- (BOOL)remote;
- (BOOL)supportsRemote;
- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (int)executeIECSCommand:(unsigned int)a3;
- (int)receiveVDM:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7;
- (int)receiveVDMAttention:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7;
- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4;
- (int)registerRead8:(char *)a3 atAddress:(unsigned int)a4;
- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6;
- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4;
- (int)registerWrite8:(unsigned __int8)a3 atAddress:(unsigned int)a4;
- (int)registerWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5;
- (int)sendVDM:(void *)a3 length:(unint64_t)a4 sop:(int)a5;
- (unsigned)address;
- (void)setAddress:(unsigned __int8)a3;
- (void)setRemote:(BOOL)a3;
- (void)setUserClient:(id)a3;
@end

@implementation PDController

+ (id)knownPDControllers
{
  kern_return_t ChildIterator;
  const char *v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  unsigned int v23;
  io_iterator_t iterator;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  unsigned char v29[128];
  uint64_t vars8;

  v20 = +[NSMutableArray array];
  v2 = +[AppleHPMUserClientManager sharedInstance];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 userClientSet];
    id v5 = [v4 copy];

    if (v5)
    {
      v19 = v3;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      id v6 = v5;
      id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7)
      {
        id v8 = v7;
        ChildIterator = 0;
        v10 = "IOService";
        v11 = *(void *)v26;
        v21 = v6;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v6);
            }
            v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            iterator = 0;
            if (!ChildIterator)
            {
              ChildIterator = IORegistryEntryGetChildIterator((io_registry_entry_t)[v13 service], v10, &iterator);
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
                      v23 = 0;
                      v22 = 0;
                      if (!+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:](IOKitUtilities, "uint32ForRegistryEntry:andKey:outValue:", v15, @"Address", &v23)&& !+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:](IOKitUtilities, "uint32ForRegistryEntry:andKey:outValue:", v15, @"Vendor ID", (char *)&v22 + 4)&& !+[IOKitUtilities uint32ForRegistryEntry:v15 andKey:@"Device ID" outValue:&v22])
                      {
                        v16 = v10;
                        v17 = +[PDController pdControllerForVID:HIDWORD(v22) DID:v22 address:v23 userClient:v13];
                        if (v17) {
                          [v20 addObject:v17];
                        }

                        v10 = v16;
                        id v6 = v21;
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
          id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v8);
      }

      v3 = v19;
    }
  }

  return v20;
}

+ (id)pdControllerForAddress:(unsigned int)a3 userClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  id v6 = 0;
  if (![v5 iecsReadCommandForDevice:v4 withAddress:0 buffer:(char *)&v9 + 4 length:4 flags:0 andOutReadLength:&v8])
  {
    uint64_t v8 = 0;
    id v6 = 0;
    if (![v5 iecsReadCommandForDevice:v4 withAddress:1 buffer:&v9 length:4 flags:0 andOutReadLength:&v8])
    {
      id v6 = +[PDController pdControllerForVID:HIDWORD(v9) DID:v9 address:v4 userClient:v5];
    }
  }

  return v6;
}

+ (id)pdControllerForVID:(unsigned int)a3 DID:(unsigned int)a4 address:(unsigned int)a5 userClient:(id)a6
{
  id v6 = &off_1000242E8;
  if (a3 != 40) {
    id v6 = off_100024398;
  }
  id v7 = [(__objc2_class *)*v6 createWithDeviceAddress:a5 userClient:a6];
  return v7;
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
  v11.receiver = self;
  v11.super_class = (Class)PDController;
  id v7 = [(PDController *)&v11 init];
  uint64_t v8 = v7;
  if (!v7
    || ([(PDController *)v7 setAddress:v4],
        [(PDController *)v8 setUserClient:v6],
        [(PDController *)v8 userClient],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {

    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)supportsRemote
{
  return 0;
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
  unsigned __int8 v7 = a5;
  objc_super v11 = [(PDController *)self userClient];
  LODWORD(a6) = objc_msgSend(v11, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:", -[PDController address](self, "address"), v7, a3, a4, 0, a6);

  return (int)a6;
}

- (int)registerWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  unsigned __int8 v5 = a5;
  uint64_t v9 = [(PDController *)self userClient];
  int v10 = objc_msgSend(v9, "iecsWriteCommandForDevice:withAddress:buffer:length:flags:", -[PDController address](self, "address"), v5, a3, a4, 0);

  return v10;
}

- (int)executeIECSCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = [(PDController *)self userClient];
  LODWORD(v3) = objc_msgSend(v5, "iecsCommand:forDevice:flags:", v3, -[PDController address](self, "address"), 0);

  return v3;
}

- (int)sendVDM:(void *)a3 length:(unint64_t)a4 sop:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v9 = [(PDController *)self userClient];
  LODWORD(v5) = objc_msgSend(v9, "sendVDMForDevice:sop:buffer:length:flags:", -[PDController address](self, "address"), v5, a3, a4, 0);

  return v5;
}

- (int)receiveVDM:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7
{
  v13 = [(PDController *)self userClient];
  LODWORD(a7) = objc_msgSend(v13, "receiveVDMForDevice:buffer:length:flags:outSOP:outSequence:outLength:", -[PDController address](self, "address"), a3, a4, 0, a5, a6, a7);

  return (int)a7;
}

- (int)receiveVDMAttention:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7
{
  v13 = [(PDController *)self userClient];
  LODWORD(a7) = objc_msgSend(v13, "receiveVDMAttentionForDevice:buffer:length:flags:outSOP:outSequence:outLength:", -[PDController address](self, "address"), a3, a4, 0, a5, a6, a7);

  return (int)a7;
}

- (unsigned)address
{
  return self->_address;
}

- (void)setAddress:(unsigned __int8)a3
{
  self->_address = a3;
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
}

@end