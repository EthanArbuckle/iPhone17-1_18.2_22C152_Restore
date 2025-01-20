@interface IOServiceWriter
- (BOOL)finished;
- (BOOL)isAvailable;
- (BOOL)isErase;
- (BOOL)shouldCommit;
- (IOServiceWriter)initWithService:(unsigned int)a3;
- (id)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4;
- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4 withError:(id *)a5;
- (int)openService;
- (int)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4 intoBuffer:(void *)a5;
- (int)writeBytes:(char *)a3 ofLength:(unint64_t)a4 withError:(id *)a5;
- (int)writeData:(id)a3 withError:(id *)a4;
- (unsigned)service;
- (unsigned)serviceConnect;
- (void)dealloc;
- (void)setIsErase:(BOOL)a3;
- (void)setService:(unsigned int)a3;
- (void)setServiceConnect:(unsigned int)a3;
- (void)setShouldCommit:(BOOL)a3;
@end

@implementation IOServiceWriter

- (IOServiceWriter)initWithService:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IOServiceWriter;
  v4 = [(IOServiceWriter *)&v6 init];
  if (v4)
  {
    IOObjectRetain(a3);
    v4->_service = a3;
  }
  return v4;
}

- (BOOL)isAvailable
{
  return [(IOServiceWriter *)self openService] == 0;
}

- (int)writeBytes:(char *)a3 ofLength:(unint64_t)a4 withError:(id *)a5
{
  v7 = +[NSData dataWithBytes:a3 length:a4];

  return [(IOServiceWriter *)self writeData:v7 withError:a5];
}

- (int)writeData:(id)a3 withError:(id *)a4
{
  kern_return_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSError *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  objc_super v6 = IORegistryEntrySetCFProperty([(IOServiceWriter *)self service], @"FLASH", a3);
  if (v6)
  {
    v7 = [a3 length];
    v13 = MSUBootFirmwareError(v6, 0, @"writeData: Failed writing %d bytes with error %d", v8, v9, v10, v11, v12, (uint64_t)v7);
    if (a4) {
      *a4 = MSUBootFirmwareError(3, (uint64_t)v13, @"FLASH operation failed while writing to single SPI.", v14, v15, v16, v17, v18, v20);
    }
  }
  return v6;
}

- (int)openService
{
  io_service_t v3 = [(IOServiceWriter *)self service];
  task_port_t v4 = mach_task_self_;

  return IOServiceOpen(v3, v4, 0, &self->_serviceConnect);
}

- (id)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4
{
  return 0;
}

- (int)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4 intoBuffer:(void *)a5
{
  return -536870201;
}

- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4 withError:(id *)a5
{
  return -536870201;
}

- (BOOL)finished
{
  io_connect_t serviceConnect = self->_serviceConnect;
  if (serviceConnect)
  {
    IOServiceClose(serviceConnect);
    self->_io_connect_t serviceConnect = 0;
  }
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }
  return 1;
}

- (void)dealloc
{
  [(IOServiceWriter *)self finished];
  v3.receiver = self;
  v3.super_class = (Class)IOServiceWriter;
  [(IOServiceWriter *)&v3 dealloc];
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_io_object_t service = a3;
}

- (unsigned)serviceConnect
{
  return self->_serviceConnect;
}

- (void)setServiceConnect:(unsigned int)a3
{
  self->_io_connect_t serviceConnect = a3;
}

- (BOOL)isErase
{
  return self->_isErase;
}

- (void)setIsErase:(BOOL)a3
{
  self->_isErase = a3;
}

- (BOOL)shouldCommit
{
  return self->_shouldCommit;
}

- (void)setShouldCommit:(BOOL)a3
{
  self->_shouldCommit = a3;
}

@end