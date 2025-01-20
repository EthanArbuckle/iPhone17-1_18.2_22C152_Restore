@interface SKIOIterator
- (BOOL)invalidated;
- (SKIOIterator)initWithClassName:(id)a3;
- (unint64_t)attempt;
- (unsigned)copyNextObject;
- (void)setAttempt:(unint64_t)a3;
@end

@implementation SKIOIterator

- (SKIOIterator)initWithClassName:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  io_iterator_t existing = 0;
  mach_port_t v5 = *MEMORY[0x263F0EC88];
  id v6 = v4;
  CFDictionaryRef v7 = IOServiceMatching((const char *)[v6 UTF8String]);
  if (IOServiceGetMatchingServices(v5, v7, &existing)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = existing == 0;
  }
  if (v8)
  {
    v9 = SKGetOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_23F40C000, v9, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", buf, 0xCu);
    }

    v10 = 0;
  }
  else
  {
    self = -[SKIOObject initWithIOObject:](self, "initWithIOObject:");
    v10 = self;
  }

  return v10;
}

- (unsigned)copyNextObject
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [(SKIOIterator *)self setAttempt:0];
  if ([(SKIOIterator *)self attempt] > 0x3E7)
  {
LABEL_5:
    id v4 = SKGetOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = 1000;
      _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_ERROR, "IOKit iterator invalidated %d time(s)", (uint8_t *)v5, 8u);
    }

    return 0;
  }
  else
  {
    while (1)
    {
      unsigned int result = IOIteratorNext([(SKIOObject *)self ioObj]);
      if (result) {
        break;
      }
      if (IOIteratorIsValid([(SKIOObject *)self ioObj])) {
        return 0;
      }
      [(SKIOIterator *)self setAttempt:[(SKIOIterator *)self attempt] + 1];
      MEMORY[0x2455CA970]([(SKIOObject *)self ioObj]);
      if ([(SKIOIterator *)self attempt] >= 0x3E8) {
        goto LABEL_5;
      }
    }
  }
  return result;
}

- (BOOL)invalidated
{
  return [(SKIOIterator *)self attempt] != 0;
}

- (unint64_t)attempt
{
  return self->_attempt;
}

- (void)setAttempt:(unint64_t)a3
{
  self->_attempt = a3;
}

@end