@interface AHTDeviceMatchingNotification
- (AHTDeviceMatchingNotification)initWithMatchingDictionary:(id)a3 type:(char)a4[128];
- (AHTDeviceNotification)deviceNotification;
- (BOOL)startWithDispatchQueue:(id)a3 error:(id *)a4 action:(id)a5;
- (BOOL)startWithRunLoop:(id)a3 error:(id *)a4 action:(id)a5;
- (BOOL)stop:(id *)a3;
- (NSDictionary)matching;
- (NSString)type;
- (id)action;
- (unsigned)iterator;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setDeviceNotification:(id)a3;
- (void)setIterator:(unsigned int)a3;
- (void)setMatching:(id)a3;
- (void)setType:(id)a3;
@end

@implementation AHTDeviceMatchingNotification

- (AHTDeviceMatchingNotification)initWithMatchingDictionary:(id)a3 type:(char)a4[128]
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AHTDeviceMatchingNotification;
  v7 = [(AHTDeviceMatchingNotification *)&v14 init];
  if (!v7) {
    goto LABEL_5;
  }
  v8 = 0;
  if (v6 && a4)
  {
    uint64_t v9 = +[NSString stringWithUTF8String:a4];
    type = v7->_type;
    v7->_type = (NSString *)v9;

    v11 = (NSDictionary *)[v6 copy];
    matching = v7->_matching;
    v7->_matching = v11;

    v7->_iterator = 0;
LABEL_5:
    v8 = v7;
  }

  return v8;
}

- (void)dealloc
{
  [(AHTDeviceMatchingNotification *)self stop:0];
  v3.receiver = self;
  v3.super_class = (Class)AHTDeviceMatchingNotification;
  [(AHTDeviceMatchingNotification *)&v3 dealloc];
}

- (BOOL)startWithRunLoop:(id)a3 error:(id *)a4 action:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(AHTDeviceMatchingNotification *)self deviceNotification];

  if (!v10)
  {
    if (!v8 || !v9)
    {
      uint64_t v11 = 3758097090;
      goto LABEL_10;
    }
    v12 = objc_alloc_init(AHTDeviceNotification);
    v13 = v12;
    if (v12)
    {
      if (![(AHTDeviceNotification *)v12 startWithRunLoop:v8 error:a4])
      {
        BOOL v18 = 0;
        goto LABEL_16;
      }
      CFDictionaryRef v14 = [(AHTDeviceMatchingNotification *)self matching];
      io_iterator_t notification = 0;
      v15 = [(AHTDeviceNotification *)v13 port];
      id v16 = [(AHTDeviceMatchingNotification *)self type];
      LODWORD(v14) = IOServiceAddMatchingNotification(v15, (const char *)[v16 UTF8String], v14, (IOServiceMatchingCallback)sub_544C, self, &notification);

      if (!v14)
      {
        [(AHTDeviceMatchingNotification *)self setAction:v9];
        [(AHTDeviceMatchingNotification *)self setIterator:notification];
        [(AHTDeviceMatchingNotification *)self setDeviceNotification:v13];
        sub_544C(self, self->_iterator);
        BOOL v18 = 1;
        goto LABEL_16;
      }
      uint64_t v17 = 3758097097;
    }
    else
    {
      uint64_t v17 = 3758097086;
    }
    BOOL v18 = +[NSError ioErrorWithDomain:@"AHTHIDSupport" code:v17 error:a4];
LABEL_16:

    goto LABEL_11;
  }
  uint64_t v11 = 3758097109;
LABEL_10:
  BOOL v18 = +[NSError ioErrorWithDomain:@"AHTHIDSupport" code:v11 error:a4];
LABEL_11:

  return v18;
}

- (BOOL)startWithDispatchQueue:(id)a3 error:(id *)a4 action:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(AHTDeviceMatchingNotification *)self deviceNotification];

  if (!v10)
  {
    if (!v8 || !v9)
    {
      uint64_t v11 = 3758097090;
      goto LABEL_10;
    }
    v12 = objc_alloc_init(AHTDeviceNotification);
    v13 = v12;
    if (v12)
    {
      if (![(AHTDeviceNotification *)v12 startWithDispatchQueue:v8 error:a4])
      {
        BOOL v18 = 0;
        goto LABEL_16;
      }
      CFDictionaryRef v14 = [(AHTDeviceMatchingNotification *)self matching];
      io_iterator_t notification = 0;
      v15 = [(AHTDeviceNotification *)v13 port];
      id v16 = [(AHTDeviceMatchingNotification *)self type];
      LODWORD(v14) = IOServiceAddMatchingNotification(v15, (const char *)[v16 UTF8String], v14, (IOServiceMatchingCallback)sub_544C, self, &notification);

      if (!v14)
      {
        [(AHTDeviceMatchingNotification *)self setAction:v9];
        [(AHTDeviceMatchingNotification *)self setIterator:notification];
        [(AHTDeviceMatchingNotification *)self setDeviceNotification:v13];
        sub_544C(self, self->_iterator);
        BOOL v18 = 1;
        goto LABEL_16;
      }
      uint64_t v17 = 3758097097;
    }
    else
    {
      uint64_t v17 = 3758097086;
    }
    BOOL v18 = +[NSError ioErrorWithDomain:@"AHTHIDSupport" code:v17 error:a4];
LABEL_16:

    goto LABEL_11;
  }
  uint64_t v11 = 3758097109;
LABEL_10:
  BOOL v18 = +[NSError ioErrorWithDomain:@"AHTHIDSupport" code:v11 error:a4];
LABEL_11:

  return v18;
}

- (BOOL)stop:(id *)a3
{
  v5 = [(AHTDeviceMatchingNotification *)self deviceNotification];

  if (v5)
  {
    IOObjectRelease([(AHTDeviceMatchingNotification *)self iterator]);
    [(AHTDeviceMatchingNotification *)self setIterator:0];
    [(AHTDeviceMatchingNotification *)self setDeviceNotification:0];
    [(AHTDeviceMatchingNotification *)self setAction:0];
    return 1;
  }
  else
  {
    return +[NSError ioErrorWithDomain:@"AHTHIDSupport" code:3758097111 error:a3];
  }
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (AHTDeviceNotification)deviceNotification
{
  return self->_deviceNotification;
}

- (void)setDeviceNotification:(id)a3
{
}

- (NSDictionary)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (unsigned)iterator
{
  return self->_iterator;
}

- (void)setIterator:(unsigned int)a3
{
  self->_iterator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_matching, 0);
  objc_storeStrong((id *)&self->_deviceNotification, 0);

  objc_storeStrong(&self->_action, 0);
}

@end