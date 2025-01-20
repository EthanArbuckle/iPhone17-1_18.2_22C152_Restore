@interface RBSXPCCoder
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)coder;
+ (id)coderWithMessage:(id)a3;
+ (id)rbs_testEncode:(id)a3 andDecodeOfExpectedClass:(Class)a4;
+ (id)rbs_testNSEncode:(id)a3 andDecodeOfExpectedClass:(Class)a4;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (OS_xpc_object)XPCConnection;
- (OS_xpc_object)message;
- (RBSXPCCoder)init;
- (RBSXPCCoder)initWithMessage:(id)a3;
- (RBSXPCCoder)initWithRBSXPCCoder:(id)a3;
- (double)decodeDoubleForKey:(id)a3;
- (id)_finishCoding;
- (id)_implicitDecodeXPCObjectForKey:(id)a3;
- (id)decodeCollectionOfClass:(Class)a3 containingClass:(Class)a4 forKey:(id)a5;
- (id)decodeDictionaryOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeStringForKey:(id)a3;
- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4;
- (int64_t)decodeInt64ForKey:(id)a3;
- (unint64_t)decodeUInt64ForKey:(id)a3;
- (void)_removeValueForKey:(id)a3;
- (void)dealloc;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeCollection:(id)a3 forKey:(id)a4;
- (void)encodeDictionary:(id)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4;
@end

@implementation RBSXPCCoder

- (unint64_t)decodeUInt64ForKey:(id)a3
{
  unint64_t result = [a3 UTF8String];
  if (result)
  {
    v5 = (const char *)result;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    v7 = codingContext;
    uint64_t uint64 = xpc_dictionary_get_uint64(v7, v5);

    return uint64;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unarchiver, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_codingContext, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (RBSAtomicGetFlag(&self->_finalized))
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"RBSXPCCoder.m" lineNumber:139 description:@"cannot continue encoding after finalizing"];

    if (v7) {
      goto LABEL_3;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"RBSXPCCoder.m", 140, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

LABEL_3:
  if (v10) {
    _RBSXPCEncodeObjectForKey(self, v10, v7);
  }
}

+ (id)coderWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithMessage:v4];

  return v5;
}

- (RBSXPCCoder)initWithMessage:(id)a3
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && MEMORY[0x192FECA30](v6) != MEMORY[0x1E4F14590])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"RBSXPCCoder.m", 98, @"Invalid parameter not satisfying: %@", @"!message || (xpc_get_type(message) == XPC_TYPE_DICTIONARY)" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)RBSXPCCoder;
  v8 = [(RBSXPCCoder *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_finalized = 0;
    if (v7)
    {
      objc_storeStrong((id *)&v8->_message, a3);
      uint64_t v10 = xpc_dictionary_get_remote_connection(v7);
      xpcConnection = v9->_xpcConnection;
      v9->_xpcConnection = (OS_xpc_object *)v10;
    }
    else
    {
      v12 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
      xpcConnection = v9->_message;
      v9->_message = v12;
    }
  }
  return v9;
}

- (id)decodeStringForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  v5 = codingContext;
  id v6 = a3;
  id v7 = (const char *)[v6 UTF8String];

  v8 = RBSXPCDictionaryGetValue(v5, v7, MEMORY[0x1E4F145F0]);

  if (v8) {
    v9 = (void *)[[NSString alloc] initWithUTF8String:xpc_string_get_string_ptr(v8)];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (id)_finishCoding
{
  if (RBSAtomicSetFlag(1u, &self->_finalized))
  {
    archiver = self->_archiver;
    if (archiver)
    {
      id v4 = [(NSKeyedArchiver *)archiver encodedData];
      if ([v4 length])
      {
        message = self->_message;
        id v6 = v4;
        xpc_dictionary_set_data(message, "bsx_archive", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
      }
      id v7 = self->_archiver;
      self->_archiver = 0;
    }
  }
  v8 = self->_message;
  return v8;
}

- (id)decodeCollectionOfClass:(Class)a3 containingClass:(Class)a4 forKey:(id)a5
{
  return _BSXPCDecodeObjectForKey(self, a5, a3, (uint64_t *)a4);
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t result = [a3 UTF8String];
  if (result)
  {
    v5 = (const char *)result;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v7 = codingContext;
    int64_t int64 = xpc_dictionary_get_int64(v7, v5);

    return int64;
  }
  return result;
}

- (void)dealloc
{
  if (self->_codingContext)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"RBSXPCCoder.m" lineNumber:114 description:@"cannot dealloc while the coding context is in flight"];
  }
  archiver = self->_archiver;
  if (archiver)
  {
    [(NSKeyedArchiver *)archiver finishEncoding];
    id v4 = self->_archiver;
    self->_archiver = 0;
  }
  unarchiver = self->_unarchiver;
  if (unarchiver)
  {
    [(NSKeyedUnarchiver *)unarchiver finishDecoding];
    id v6 = self->_unarchiver;
    self->_unarchiver = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)RBSXPCCoder;
  [(RBSXPCCoder *)&v9 dealloc];
}

- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id class4NSXPC = (id)xpc_get_class4NSXPC();
  }
  else
  {
    NSClassFromString(&cfstr_OsXpcObject.isa);
    id class4NSXPC = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = [(RBSXPCCoder *)self decodeObjectOfClass:class4NSXPC forKey:v6];

  return v8;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  return _BSXPCDecodeObjectForKey(self, a4, a3, 0);
}

- (BOOL)containsValueForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  v5 = codingContext;
  id v6 = a3;
  id v7 = (const char *)[v6 UTF8String];

  v8 = RBSXPCDictionaryGetValue(v5, v7, 0);

  return v8 != 0;
}

- (void)encodeDictionary:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  id v8 = v12;
  id v9 = v7;
  if (v12)
  {
    char v10 = _NSIsNSDictionary();
    id v8 = v12;
    if ((v10 & 1) == 0)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"RBSXPCCoder.m" lineNumber:153 description:@"Object is not an NSDictionary"];

      id v8 = v12;
    }
  }
  [(RBSXPCCoder *)self encodeObject:v8 forKey:v9];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6 = [a4 UTF8String];
  if (v6)
  {
    id v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v9 = codingContext;
    xpc_dictionary_set_int64(v9, v7, a3);
  }
}

- (RBSXPCCoder)init
{
  return [(RBSXPCCoder *)self initWithMessage:0];
}

- (id)decodeDictionaryOfClass:(Class)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = _BSXPCDecodeObjectForKey(self, v6, v7, (uint64_t *)a3);

  return v8;
}

- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4
{
  uint64_t v6 = [a4 UTF8String];
  if (v6)
  {
    id v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v9 = codingContext;
    xpc_dictionary_set_uint64(v9, v7, a3);
  }
}

- (void)encodeCollection:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (v9 && (_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"RBSXPCCoder.m", 148, @"Collection class %@ not supported", objc_msgSend(v9, "classForCoder") object file lineNumber description];
  }
  [(RBSXPCCoder *)self encodeObject:v9 forKey:v7];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  id v9 = codingContext;
  id v7 = a4;
  id v8 = (const char *)[v7 UTF8String];

  RBSSerializeDoubleToXPCDictionaryWithKey(v9, v8, a3);
}

- (double)decodeDoubleForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  v5 = codingContext;
  id v6 = a3;
  id v7 = (const char *)[v6 UTF8String];

  double v8 = RBSDeserializeDoubleFromXPCDictionaryWithKey(v5, v7);
  return v8;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  uint64_t v4 = [a3 UTF8String];
  if (v4)
  {
    v5 = (const char *)v4;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v7 = codingContext;
    BOOL v8 = xpc_dictionary_get_BOOL(v7, v5);

    LOBYTE(v4) = v8;
  }
  return v4;
}

+ (id)coder
{
  v2 = (void *)[objc_alloc((Class)a1) initWithMessage:0];
  return v2;
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  uint64_t v6 = [a4 UTF8String];
  if (v6)
  {
    id v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v9 = codingContext;
    xpc_dictionary_set_BOOL(v9, v7, a3);
  }
}

- (void)_removeValueForKey:(id)a3
{
  if (a3)
  {
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    v5 = codingContext;
    id v6 = a3;
    id v7 = (const char *)[v6 UTF8String];

    BOOL v8 = v5;
    xdict = v8;
    if (v7)
    {
      if (v8)
      {
        id v9 = xpc_dictionary_get_value(v8, v7);

        if (v9) {
          xpc_dictionary_set_value(xdict, v7, 0);
        }
      }
    }
    else
    {
      char v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void RBSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
      [v10 handleFailureInFunction:v11 file:@"RBSXPCUtilities_Project.h" lineNumber:123 description:@"key must not be nil"];
    }
  }
}

- (id)_implicitDecodeXPCObjectForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  v5 = codingContext;
  id v6 = a3;
  id v7 = (const char *)[v6 UTF8String];

  BOOL v8 = RBSXPCDictionaryGetValue(v5, v7, 0);

  if (v8
    && (NSClassFromString(&cfstr_OsXpcObject.isa),
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSXPCCoder)initWithRBSXPCCoder:(id)a3
{
  uint64_t v4 = [a3 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"message"];
  v5 = [(RBSXPCCoder *)self initWithMessage:v4];

  return v5;
}

- (OS_xpc_object)message
{
  return self->_message;
}

- (OS_xpc_object)XPCConnection
{
  return self->_xpcConnection;
}

+ (id)rbs_testEncode:(id)a3 andDecodeOfExpectedClass:(Class)a4
{
  id v5 = a3;
  id v6 = +[RBSXPCCoder coder];
  [v6 encodeObject:v5 forKey:@"RBSUnitTesting"];

  id v7 = [v6 createMessage];
  BOOL v8 = +[RBSXPCCoder coderWithMessage:v7];

  id v9 = [v8 decodeObjectOfClass:a4 forKey:@"RBSUnitTesting"];

  return v9;
}

+ (id)rbs_testNSEncode:(id)a3 andDecodeOfExpectedClass:(Class)a4
{
  return (id)[MEMORY[0x1E4F29258] _testEncodeAndDecodeObject:a3 allowedClass:a4];
}

@end