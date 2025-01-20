@interface _PASUTF8String
- (BOOL)canBeConvertedToEncoding:(unint64_t)a3;
- (_PASUTF8String)initWithUTF8Data:(id)a3 asciiPrefixLength:(unsigned int)a4 nullTerminated:(BOOL)a5;
- (const)UTF8String;
- (const)_pas_overrideFastUTF8StringPtrWithOptions:(unint64_t)a3 encodedLength:(unint64_t *)a4;
- (const)cStringUsingEncoding:(unint64_t)a3;
- (id)_pas_overrideStringBackedByUTF8CString;
- (id)dataUsingEncoding:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (uint64_t)_validateRange:(uint64_t)a3;
- (unint64_t)fastestEncoding;
- (unint64_t)length;
- (unint64_t)lengthOfBytesUsingEncoding:(unint64_t)a3;
- (unint64_t)maximumLengthOfBytesUsingEncoding:(unint64_t)a3;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation _PASUTF8String

- (void).cxx_destruct
{
}

- (const)_pas_overrideFastUTF8StringPtrWithOptions:(unint64_t)a3 encodedLength:(unint64_t *)a4
{
  if ((a3 & 1) != 0 && !self->_nullTerminated) {
    return 0;
  }
  if (a4) {
    *a4 = [(_PASUTF8String *)self lengthOfBytesUsingEncoding:4];
  }
  return self->_buffer;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int64_t v4 = self->_bufferEnd - self->_buffer;
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  buffer = self->_buffer;

  return (id)[v5 initWithBytes:buffer length:v4 encoding:4];
}

- (unint64_t)fastestEncoding
{
  return 4;
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  if (a3 == 1) {
    return 0;
  }
  if (a3 == 4)
  {
    v3 = self;
    return [(_PASUTF8String *)v3 UTF8String];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_PASUTF8String;
    return -[_PASUTF8String cStringUsingEncoding:](&v5, sel_cStringUsingEncoding_);
  }
}

- (id)_pas_overrideStringBackedByUTF8CString
{
  if (self->_nullTerminated)
  {
    v3 = self;
  }
  else
  {
    MutableCopy = CFDataCreateMutableCopy(0, [(NSData *)self->_backingData length] + 1, (CFDataRef)self->_backingData);
    CFDataAppendBytes(MutableCopy, (const UInt8 *)"", 1);
    v3 = [[_PASUTF8String alloc] initWithUTF8Data:MutableCopy asciiPrefixLength:self->_asciiPrefixLength nullTerminated:1];
  }

  return v3;
}

- (const)UTF8String
{
  if (self->_nullTerminated) {
    return self->_buffer;
  }
  MutableCopy = CFDataCreateMutableCopy(0, [(NSData *)self->_backingData length] + 1, (CFDataRef)self->_backingData);
  CFDataAppendBytes(MutableCopy, (const UInt8 *)"", 1);
  CFAutorelease(MutableCopy);

  return (const char *)CFDataGetMutableBytePtr(MutableCopy);
}

- (BOOL)canBeConvertedToEncoding:(unint64_t)a3
{
  if (a3 == 1) {
    return 0;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)_PASUTF8String;
  return -[_PASUTF8String canBeConvertedToEncoding:](&v6, sel_canBeConvertedToEncoding_);
}

- (unint64_t)maximumLengthOfBytesUsingEncoding:(unint64_t)a3
{
  if (a3 == 4)
  {
    return -[_PASUTF8String lengthOfBytesUsingEncoding:](self, "lengthOfBytesUsingEncoding:");
  }
  else
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)_PASUTF8String;
    return -[_PASUTF8String maximumLengthOfBytesUsingEncoding:](&v6, sel_maximumLengthOfBytesUsingEncoding_);
  }
}

- (unint64_t)lengthOfBytesUsingEncoding:(unint64_t)a3
{
  if (a3 == 1) {
    return 0;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  if (a3 == 4) {
    return self->_bufferEnd - self->_buffer;
  }
  v6.receiver = self;
  v6.super_class = (Class)_PASUTF8String;
  return -[_PASUTF8String lengthOfBytesUsingEncoding:](&v6, sel_lengthOfBytesUsingEncoding_);
}

- (id)dataUsingEncoding:(unint64_t)a3
{
  if (a3 == 4)
  {
    objc_super v5 = self->_backingData;
    objc_super v6 = v5;
    if (self->_nullTerminated)
    {
      CFIndex v7 = self->_bufferEnd - self->_buffer;
      context.version = 0;
      context.info = v5;
      memset(&context.retain, 0, 24);
      context.allocate = (CFAllocatorAllocateCallBack)cfAllocateAlwaysFailing_1745;
      context.reallocate = 0;
      context.deallocate = (CFAllocatorDeallocateCallBack)cfDeallocateReleaseBackingObject;
      context.preferredSize = 0;
      CFAllocatorRef v8 = CFAllocatorCreate(0, &context);
      if (!v8)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"NSString+_PASAdditions.m", 440, @"Invalid parameter not satisfying: %@", @"deallocator" object file lineNumber description];
      }
      v9 = (NSData *)CFDataCreateWithBytesNoCopy(0, (const UInt8 *)self->_buffer, v7, v8);
      if (!v9)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2, self, @"NSString+_PASAdditions.m", 442, @"Invalid parameter not satisfying: %@", @"cfData" object file lineNumber description];
      }
      CFRelease(v8);
    }
    else
    {
      v9 = v5;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_PASUTF8String;
    -[_PASUTF8String dataUsingEncoding:](&v13, sel_dataUsingEncoding_);
    v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(_PASUTF8String *)(uint64_t)self _validateRange:a4.length];
  if (length)
  {
    if (a3)
    {
      NSUInteger v26 = length - 1;
      -[_PASUTF8String getCharacters:range:](self, "getCharacters:range:", (char *)a3 + 1, location, v26);
      memmove(a3, (char *)a3 + 1, 2 * v26);
      a3[v26] = [(_PASUTF8String *)self characterAtIndex:v26];
    }
    else
    {
      uint64_t asciiPrefixLength = self->_asciiPrefixLength;
      if (location >= asciiPrefixLength) {
        goto LABEL_10;
      }
      unsigned int v9 = location + length;
      if (asciiPrefixLength < (int)location + (int)length) {
        unsigned int v9 = self->_asciiPrefixLength;
      }
      uint64_t v10 = v9 - location;
      if (v9 <= location)
      {
LABEL_10:
        LODWORD(v10) = 0;
      }
      else
      {
        v11 = &self->_buffer[location];
        uint64_t v12 = v10;
        objc_super v13 = a3;
        do
        {
          unsigned __int16 v14 = *(unsigned __int8 *)v11++;
          *v13++ = v14;
          --v12;
        }
        while (v12);
      }
      if (length != v10 && length > v10)
      {
        v15 = &self->_buffer[asciiPrefixLength];
        unsigned int v16 = location - asciiPrefixLength + v10;
        unsigned int v17 = v16 & 0x3F;
        unsigned int v18 = v16 >> 6;
        do
        {
          unint64_t v19 = self->_chunks[v18];
          int v27 = v19;
          if ((v19 & 0x40) != 0)
          {
            NSUInteger i = v10;
            if (length > v10)
            {
              unint64_t v24 = v17;
              v25 = &v15[v19 >> 8];
              do
              {
                a3[i] = v25[v24];
                NSUInteger i = (v10 + 1);
                LODWORD(v10) = v10 + 1;
                if (v24 > 0x3E) {
                  break;
                }
                ++v24;
              }
              while (length > i);
            }
          }
          else
          {
            if (v17)
            {
              unsigned int v20 = v17;
              do
              {
                advanceCursor((uint64_t)v15, (char *)self->_bufferEnd, &v27);
                --v20;
              }
              while (v20);
            }
            for (NSUInteger i = v10; length > i; ++v17)
            {
              NSUInteger v22 = i;
              unsigned __int16 v23 = advanceCursor((uint64_t)v15, (char *)self->_bufferEnd, &v27);
              NSUInteger i = (v10 + 1);
              LODWORD(v10) = v10 + 1;
              a3[v22] = v23;
              if (v17 > 0x3E) {
                break;
              }
            }
          }
          unsigned int v17 = 0;
          ++v18;
        }
        while (length > i);
      }
    }
  }
}

- (uint64_t)_validateRange:(uint64_t)a3
{
  if (result)
  {
    if (a2 + a3 > (unint64_t)*(unsigned int *)(result + 48))
    {
      uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v4 = *MEMORY[0x1E4F1C4A8];
      objc_super v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Range {%tu, %tu} out of bounds; string length %u",
                     a2,
                     a3,
                     *(unsigned int *)(result + 48));
      id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

      objc_exception_throw(v6);
    }
  }
  return result;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  int v3 = a3;
  if (self->_asciiPrefixLength > a3) {
    return self->_buffer[a3];
  }
  [(_PASUTF8String *)(uint64_t)self _validateRange:1];
  uint64_t asciiPrefixLength = self->_asciiPrefixLength;
  unint64_t v7 = self->_chunks[(v3 - asciiPrefixLength) >> 6];
  int v10 = v7;
  unsigned int v8 = (v3 - asciiPrefixLength) & 0x3F;
  unsigned int v9 = &self->_buffer[asciiPrefixLength];
  if ((v7 & 0x40) != 0) {
    return v9[(v7 >> 8) + v8];
  }
  for (; v8; --v8)
    advanceCursor((uint64_t)v9, (char *)self->_bufferEnd, &v10);
  return advanceCursor((uint64_t)v9, (char *)self->_bufferEnd, &v10);
}

- (unint64_t)length
{
  return self->_length;
}

- (void)dealloc
{
  free(self->_chunks);
  v3.receiver = self;
  v3.super_class = (Class)_PASUTF8String;
  [(_PASUTF8String *)&v3 dealloc];
}

- (_PASUTF8String)initWithUTF8Data:(id)a3 asciiPrefixLength:(unsigned int)a4 nullTerminated:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  if (v10)
  {
    v37.receiver = self;
    v37.super_class = (Class)_PASUTF8String;
    v11 = [(_PASUTF8String *)&v37 init];
    uint64_t v12 = v11;
    if (!v11)
    {
LABEL_33:
      self = v12;
      v30 = self;
      goto LABEL_34;
    }
    objc_storeStrong((id *)&v11->_backingData, a3);
    v12->_nullTerminated = v5;
    unint64_t v13 = [v10 length];
    if (HIDWORD(v13)) {
      __assert_rtn("-[_PASUTF8String initWithUTF8Data:asciiPrefixLength:nullTerminated:]", "NSString+_PASAdditions.m", 165, "asciiAndUtf8Length <= UINT32_MAX");
    }
    unint64_t v14 = v13 - v5;
    v12->_uint64_t asciiPrefixLength = a4;
    uint64_t v15 = [(NSData *)v12->_backingData bytes];
    v12->_buffer = (const char *)v15;
    if (v14 <= a4) {
      __assert_rtn("-[_PASUTF8String initWithUTF8Data:asciiPrefixLength:nullTerminated:]", "NSString+_PASAdditions.m", 169, "asciiPrefixLength < asciiAndUtf8Length");
    }
    if ((*(char *)(v15 + a4) & 0x80000000) == 0) {
      __assert_rtn("-[_PASUTF8String initWithUTF8Data:asciiPrefixLength:nullTerminated:]", "NSString+_PASAdditions.m", 170, "!isascii(_buffer[asciiPrefixLength])");
    }
    unsigned int v16 = (char *)(v15 + v14);
    v12->_bufferEnd = (const char *)(v15 + v14);
    size_t v17 = ((v14 - a4) >> 5) + 1;
    v12->_unint64_t nchunks = v17;
    unsigned int v18 = ($FFD6A2C194A3D238F07E602641A84D86 *)malloc_type_calloc(4uLL, v17, 0xFB3D29CBuLL);
    if (v18)
    {
      v12->_chunks = v18;
      if (!v12->_nchunks)
      {
        unsigned int v24 = a4;
        goto LABEL_32;
      }
      SEL v35 = a2;
      unint64_t v19 = 0;
      unsigned int v20 = 0;
      RuneUtf8 = (char *)&v12->_buffer[a4];
LABEL_9:
      unint64_t v22 = 0;
      v12->_chunks[v19] = ($FFD6A2C194A3D238F07E602641A84D86)v20;
      LOBYTE(v23) = (v20 & 0x80) == 0;
      unsigned int v24 = a4;
      v25 = RuneUtf8;
      while (1)
      {
        unsigned int v36 = 0;
        RuneUtf8 = getRuneUtf8(v25, v16, (int *)&v36);
        if (!RuneUtf8) {
          break;
        }
        int v23 = (v36 < 0x80) & v23;
        unint64_t v26 = v22 + 1;
        a4 = v24 + 1;
        if (v36 - 0x10000 >= 0x100000 || (v20 & 0x80) != 0)
        {
          int v27 = RuneUtf8 - v25;
        }
        else
        {
          if (v22 == 63)
          {
            v20 |= 0x80u;
            RuneUtf8 = v25;
LABEL_19:
            if (v23) {
              int v28 = 64;
            }
            else {
              int v28 = 0;
            }
            v12->_chunks[v19] = ($FFD6A2C194A3D238F07E602641A84D86)(*(_DWORD *)&v12->_chunks[v19] & 0xFFFFFFBF | v28);
            ++v19;
            unint64_t nchunks = v12->_nchunks;
            if (v19 >= nchunks)
            {
              unsigned int v24 = a4;
              goto LABEL_26;
            }
            goto LABEL_9;
          }
          int v27 = RuneUtf8 - v25;
          unint64_t v26 = v22 + 2;
          a4 = v24 + 2;
        }
        unsigned int v20 = (v20 + (v27 << 8)) & 0xFFFFFF7F;
        unint64_t v22 = v26;
        unsigned int v24 = a4;
        v25 = RuneUtf8;
        if (v26 >= 0x40) {
          goto LABEL_19;
        }
      }
      LODWORD(v19) = v19 + 1;
      LODWORD(nchunks) = v12->_nchunks;
LABEL_26:
      if (v19 >= nchunks) {
        goto LABEL_32;
      }
      if (!v19)
      {
        v33 = [MEMORY[0x1E4F28B00] currentHandler];
        [v33 handleFailureInMethod:v35, v12, @"NSString+_PASAdditions.m", 236, @"Invalid parameter not satisfying: %@", @"i > 0" object file lineNumber description];
      }
      v31 = ($FFD6A2C194A3D238F07E602641A84D86 *)reallocf(v12->_chunks, 4 * v19);
      if (v31)
      {
        v12->_chunks = v31;
        v12->_unint64_t nchunks = v19;
LABEL_32:
        v12->_NSUInteger length = v24;
        goto LABEL_33;
      }
    }
    id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v34);
  }
  v30 = 0;
LABEL_34:

  return v30;
}

@end