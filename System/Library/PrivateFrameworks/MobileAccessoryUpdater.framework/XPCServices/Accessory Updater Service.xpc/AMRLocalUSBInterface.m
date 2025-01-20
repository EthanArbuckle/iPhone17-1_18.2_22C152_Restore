@interface AMRLocalUSBInterface
- (AMRLocalUSBInterface)initWithService:(unsigned int)a3;
- (void)closeInterface;
- (void)dealloc;
- (void)getDFUInformationWithReply:(id)a3;
- (void)getFileTransferPipeWithReply:(id)a3;
- (void)getPipesWithReply:(id)a3;
- (void)openInterfaceWithReply:(id)a3;
- (void)readPipe:(unsigned __int8)a3 length:(unsigned int)a4 withReply:(id)a5;
- (void)writePipe:(unsigned __int8)a3 data:(id)a4 length:(unint64_t)a5 withReply:(id)a6;
@end

@implementation AMRLocalUSBInterface

- (AMRLocalUSBInterface)initWithService:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMRLocalUSBInterface;
  v4 = [(AMRLocalUSBInterface *)&v7 init];
  if (v4)
  {
    uint64_t InterfaceInterfaceForService = _getInterfaceInterfaceForService(a3);
    v4->interfaceInterface = (IOUSBInterfaceStruct245 **)InterfaceInterfaceForService;
    if (!InterfaceInterfaceForService)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  interfaceInterface = self->interfaceInterface;
  if (interfaceInterface)
  {
    ((void (*)(IOUSBInterfaceStruct245 **, SEL))(*interfaceInterface)->Release)(interfaceInterface, a2);
    self->interfaceInterface = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AMRLocalUSBInterface;
  [(AMRLocalUSBInterface *)&v4 dealloc];
}

- (void)openInterfaceWithReply:(id)a3
{
  uint64_t v4 = ((uint64_t (*)(IOUSBInterfaceStruct245 **, SEL))(*self->interfaceInterface)->USBInterfaceOpen)(self->interfaceInterface, a2);
  uint64_t v11 = v4;
  if (v4) {
    v12 = createAndLogUSBError(v4, @"error opening USB interface: 0x%x", v5, v6, v7, v8, v9, v10, v4);
  }
  else {
    v12 = 0;
  }
  uint64_t v13 = _AMRestoreErrorForIOReturn(v11, 2002);
  v14 = (void (*)(id, uint64_t, NSError *))*((void *)a3 + 2);
  v14(a3, v13, v12);
}

- (void)getFileTransferPipeWithReply:(id)a3
{
  unsigned __int8 v33 = 0;
  uint64_t v5 = ((uint64_t (*)(IOUSBInterfaceStruct245 **, unsigned __int8 *))(*self->interfaceInterface)->GetNumEndpoints)(self->interfaceInterface, &v33);
  if (v5)
  {
    uint64_t v12 = v5;
    uint64_t v13 = createAndLogUSBError(v5, @"error getting number of endpoints: 0x%x", v6, v7, v8, v9, v10, v11, v5);
    uint64_t v14 = _AMRestoreErrorForIOReturn(v12, 2010);
    (*((void (**)(id, uint64_t, void, void, NSError *))a3 + 2))(a3, v14, 0, 0, v13);
  }
  else
  {
    if (v33)
    {
      uint64_t v15 = 1;
      while (1)
      {
        char v32 = 0;
        __int16 v31 = 0;
        char v30 = 0;
        unsigned __int16 v29 = 0;
        uint64_t v16 = ((uint64_t (*)(IOUSBInterfaceStruct245 **, void, char *, char *, __int16 *, unsigned __int16 *, char *))(*self->interfaceInterface)->GetPipeProperties)(self->interfaceInterface, v15, &v32, (char *)&v31 + 1, &v31, &v29, &v30);
        uint64_t v23 = v16;
        if (v16)
        {
          v26 = createAndLogUSBError(v16, @"error getting information for pipe %d: 0x%x", v17, v18, v19, v20, v21, v22, v15);
          uint64_t v27 = 0;
          goto LABEL_14;
        }
        if (v31 == 2 && v32 == 0) {
          break;
        }
        BOOL v25 = v15 >= v33;
        uint64_t v15 = (v15 + 1);
        if (v25) {
          goto LABEL_12;
        }
      }
      v26 = 0;
      uint64_t v27 = v29;
    }
    else
    {
LABEL_12:
      v26 = 0;
      uint64_t v27 = 0;
      uint64_t v23 = 0;
LABEL_14:
      LOBYTE(v15) = -1;
    }
    uint64_t v28 = _AMRestoreErrorForIOReturn(v23, 2010);
    (*((void (**)(id, uint64_t, void, uint64_t, NSError *))a3 + 2))(a3, v28, v15, v27, v26);
  }
}

- (void)getPipesWithReply:(id)a3
{
  unsigned __int8 v39 = 0;
  uint64_t v5 = ((uint64_t (*)(IOUSBInterfaceStruct245 **, unsigned __int8 *))(*self->interfaceInterface)->GetNumEndpoints)(self->interfaceInterface, &v39);
  if (v5)
  {
    uint64_t v12 = v5;
    uint64_t v13 = createAndLogUSBError(v5, @"error getting number of endpoints: 0x%x", v6, v7, v8, v9, v10, v11, v5);
    uint64_t v14 = _AMRestoreErrorForIOReturn(v12, 2010);
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, NSError *))a3 + 2))(a3, v14, 255, 255, 255, 255, 255, v13);
  }
  else
  {
    if (v39)
    {
      uint64_t v15 = 1;
      int v16 = 255;
      int v17 = 255;
      unsigned __int8 v18 = -1;
      int v19 = 255;
      unsigned __int8 v20 = -1;
      while (1)
      {
        unsigned __int8 v38 = 0;
        __int16 v37 = 0;
        char v36 = 0;
        __int16 v35 = 0;
        uint64_t v21 = ((uint64_t (*)(IOUSBInterfaceStruct245 **, void, unsigned __int8 *, char *, __int16 *, __int16 *, char *))(*self->interfaceInterface)->GetPipeProperties)(self->interfaceInterface, v15, &v38, (char *)&v37 + 1, &v37, &v35, &v36);
        if (v21) {
          break;
        }
        if (v37 == 3)
        {
          if (v38 | ~(_BYTE)v19) {
            int v28 = v19;
          }
          else {
            int v28 = v15;
          }
          if (v38 == 1 && ~v20 == 0) {
            unsigned __int8 v20 = v15;
          }
          else {
            int v19 = v28;
          }
        }
        else if (v37 == 2)
        {
          if (v38 == 1 && v18 == 0xFF)
          {
            unsigned __int8 v18 = v15;
          }
          else
          {
            if ((_BYTE)v16 == 0xFF) {
              int v30 = v15;
            }
            else {
              int v30 = v16;
            }
            if ((_BYTE)v17 == 0xFF) {
              int v31 = v15;
            }
            else {
              int v31 = v17;
            }
            if ((_BYTE)v17 == 0xFF) {
              int v30 = v16;
            }
            if (!v38)
            {
              int v17 = v31;
              int v16 = v30;
            }
          }
        }
        BOOL v32 = v15 >= v39;
        uint64_t v15 = (v15 + 1);
        if (v32)
        {
          uint64_t v33 = 0;
          goto LABEL_35;
        }
      }
      uint64_t v33 = v21;
      createAndLogUSBError(v21, @"error getting information for pipe %d: 0x%x", v22, v23, v24, v25, v26, v27, v15);
    }
    else
    {
      uint64_t v33 = 0;
      unsigned __int8 v20 = -1;
      LOBYTE(v19) = -1;
      unsigned __int8 v18 = -1;
      LOBYTE(v17) = -1;
      LOBYTE(v16) = -1;
    }
LABEL_35:
    uint64_t v34 = _AMRestoreErrorForIOReturn(v33, 2010);
    (*((void (**)(id, uint64_t, void, void, void, void, void, void))a3 + 2))(a3, v34, v20, v19, v18, v17, v16, 0);
  }
}

- (void)getDFUInformationWithReply:(id)a3
{
  unsigned __int8 v9 = 0;
  uint64_t v5 = ((uint64_t (*)(IOUSBInterfaceStruct245 **, void, uint64_t))(*self->interfaceInterface)->FindNextAssociatedDescriptor)(self->interfaceInterface, 0, 33);
  if (v5)
  {
    uint64_t v6 = *(unsigned __int16 *)(v5 + 5);
    uint64_t v7 = *(unsigned __int8 *)(v5 + 2);
    ((void (*)(IOUSBInterfaceStruct245 **, unsigned __int8 *))(*self->interfaceInterface)->GetInterfaceNumber)(self->interfaceInterface, &v9);
    (*((void (**)(id, void, uint64_t, uint64_t, void, void))a3 + 2))(a3, 0, v6, v7, v9, 0);
  }
  else
  {
    uint64_t v8 = (void (*)(id, uint64_t, void, void, void, void))*((void *)a3 + 2);
    v8(a3, 2010, 0, 0, 0, 0);
  }
}

- (void)writePipe:(unsigned __int8)a3 data:(id)a4 length:(unint64_t)a5 withReply:(id)a6
{
  uint64_t v9 = a3;
  uint64_t v11 = malloc_type_malloc(a5, 0x58A42B6EuLL);
  [a4 getBytes:v11 length:a5];
  uint64_t v12 = ((uint64_t (*)(IOUSBInterfaceStruct245 **, uint64_t, void *, unint64_t))(*self->interfaceInterface)->WritePipe)(self->interfaceInterface, v9, v11, a5);
  free(v11);
  uint64_t v13 = _AMRestoreErrorForIOReturn(v12, 2003);
  uint64_t v14 = (void (*)(id, uint64_t, void))*((void *)a6 + 2);
  v14(a6, v13, 0);
}

- (void)readPipe:(unsigned __int8)a3 length:(unsigned int)a4 withReply:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v8 = malloc_type_malloc(a4, 0xBD15FB58uLL);
  unsigned int v12 = 0;
  uint64_t v9 = ((uint64_t (*)(IOUSBInterfaceStruct245 **, uint64_t, void *, unsigned int *))(*self->interfaceInterface)->ReadPipe)(self->interfaceInterface, v6, v8, &v12);
  uint64_t v10 = +[NSData dataWithBytes:v8 length:v12];
  free(v8);
  uint64_t v11 = _AMRestoreErrorForIOReturn(v9, 2004);
  (*((void (**)(id, uint64_t, NSData *, void, void))a5 + 2))(a5, v11, v10, v12, 0);
}

- (void)closeInterface
{
}

@end