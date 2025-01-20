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
  io_iterator_t existing = 0;
  id v4 = a3;
  CFDictionaryRef v5 = IOServiceMatching((const char *)[v4 UTF8String]);
  if (IOServiceGetMatchingServices(kIOMainPortDefault, v5, &existing)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = existing == 0;
  }
  if (v6)
  {
    v7 = sub_10000DD48();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", buf, 0xCu);
    }

    v8 = 0;
  }
  else
  {
    self = -[SKIOObject initWithIOObject:](self, "initWithIOObject:");
    v8 = self;
  }

  return v8;
}

- (unsigned)copyNextObject
{
  [(SKIOIterator *)self setAttempt:0];
  if ([(SKIOIterator *)self attempt] > 0x3E7)
  {
LABEL_5:
    id v4 = sub_10000DD48();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = 1000;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "IOKit iterator invalidated %d time(s)", (uint8_t *)v5, 8u);
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
      [(SKIOIterator *)self setAttempt:(char *)[(SKIOIterator *)self attempt] + 1];
      IOIteratorReset([(SKIOObject *)self ioObj]);
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