@interface TRIPBCodedInputStream
+ (id)streamWithData:(id)a3;
- (BOOL)isAtEnd;
- (BOOL)readBool;
- (BOOL)skipField:(int)a3;
- (TRIPBCodedInputStream)initWithData:(id)a3;
- (double)readDouble;
- (float)readFloat;
- (id)readBytes;
- (id)readString;
- (int)readEnum;
- (int)readInt32;
- (int)readSFixed32;
- (int)readSInt32;
- (int)readTag;
- (int64_t)readInt64;
- (int64_t)readSFixed64;
- (int64_t)readSInt64;
- (unint64_t)position;
- (unint64_t)pushLimit:(unint64_t)a3;
- (unint64_t)readFixed64;
- (unint64_t)readUInt64;
- (unsigned)readFixed32;
- (unsigned)readUInt32;
- (void)checkLastTagWas:(int)a3;
- (void)dealloc;
- (void)popLimit:(unint64_t)a3;
- (void)readGroup:(int)a3 message:(id)a4 extensionRegistry:(id)a5;
- (void)readMapEntry:(id)a3 extensionRegistry:(id)a4 field:(id)a5 parentMessage:(id)a6;
- (void)readMessage:(id)a3 extensionRegistry:(id)a4;
- (void)readUnknownGroup:(int)a3 message:(id)a4;
- (void)skipMessage;
@end

@implementation TRIPBCodedInputStream

- (void)readMessage:(id)a3 extensionRegistry:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  if (self->state_.recursionDepth >= 0x64) {
    RaiseException(-106, 0);
  }
  int RawVarint64 = ReadRawVarint64(p_state);
  unint64_t currentLimit = self->state_.currentLimit;
  unint64_t v10 = self->state_.bufferPos + RawVarint64;
  if (v10 > currentLimit) {
    RaiseException(-102, 0);
  }
  self->state_.unint64_t currentLimit = v10;
  ++self->state_.recursionDepth;
  [a3 mergeFromCodedInputStream:self extensionRegistry:a4];
  if (self->state_.lastTag) {
    RaiseException(-103, @"Unexpected tag read");
  }
  --self->state_.recursionDepth;
  self->state_.unint64_t currentLimit = currentLimit;
}

- (TRIPBCodedInputStream)initWithData:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TRIPBCodedInputStream;
  v4 = [(TRIPBCodedInputStream *)&v9 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "-[TRIPBCodedInputStream initWithData:]"), @"TRIPBCodedInputStream.m", 331, @"Subclassing of TRIPBCodedInputStream is not allowed.");
    }
    v4->buffer_ = (NSData *)a3;
    v4->state_.bytes = (char *)[a3 bytes];
    uint64_t v6 = [a3 length];
    v4->state_.bufferSize = v6;
    v4->state_.unint64_t currentLimit = v6;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TRIPBCodedInputStream;
  [(TRIPBCodedInputStream *)&v3 dealloc];
}

- (void)checkLastTagWas:(int)a3
{
  if (self->state_.lastTag != a3) {
    RaiseException(-103, @"Unexpected tag read");
  }
}

+ (id)streamWithData:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithData:a3];
  return v3;
}

- (int)readTag
{
  return TRIPBCodedInputStreamReadTag((uint64_t)&self->state_);
}

- (BOOL)skipField:(int)a3
{
  if ((~a3 & 6) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBCodedInputStream.m", 361, @"Invalid tag");
  }
  BOOL result = 0;
  switch(a3 & 7)
  {
    case 0:
      ReadRawVarint64((uint64_t *)&self->state_);
      goto LABEL_13;
    case 1:
      CheckSize((uint64_t)&self->state_, 8);
      unint64_t v6 = self->state_.bufferPos + 8;
      goto LABEL_12;
    case 2:
      int RawVarint64 = ReadRawVarint64((uint64_t *)&self->state_);
      if (RawVarint64 < 0) {
        RaiseException(-100, @"Field delimited with negative length");
      }
      CheckSize((uint64_t)&self->state_, RawVarint64);
      unint64_t v6 = self->state_.bufferPos + RawVarint64;
      goto LABEL_12;
    case 3:
      [(TRIPBCodedInputStream *)self skipMessage];
      if (self->state_.lastTag != (a3 & 0xFFFFFFF8 | 4)) {
        RaiseException(-103, @"Unexpected tag read");
      }
      goto LABEL_13;
    case 5:
      CheckSize((uint64_t)&self->state_, 4);
      unint64_t v6 = self->state_.bufferPos + 4;
LABEL_12:
      self->state_.bufferPos = v6;
LABEL_13:
      BOOL result = 1;
      break;
    default:
      return result;
  }
  return result;
}

- (void)skipMessage
{
  p_state = &self->state_;
  do
    uint64_t Tag = TRIPBCodedInputStreamReadTag((uint64_t)p_state);
  while (Tag && [(TRIPBCodedInputStream *)self skipField:Tag]);
}

- (BOOL)isAtEnd
{
  unint64_t bufferPos = self->state_.bufferPos;
  return bufferPos == self->state_.bufferSize || bufferPos == self->state_.currentLimit;
}

- (unint64_t)position
{
  return self->state_.bufferPos;
}

- (unint64_t)pushLimit:(unint64_t)a3
{
  unint64_t currentLimit = self->state_.currentLimit;
  unint64_t v5 = self->state_.bufferPos + a3;
  if (v5 > currentLimit) {
    RaiseException(-102, 0);
  }
  self->state_.unint64_t currentLimit = v5;
  return currentLimit;
}

- (void)popLimit:(unint64_t)a3
{
  self->state_.unint64_t currentLimit = a3;
}

- (double)readDouble
{
  CheckSize((uint64_t)&self->state_, 8);
  unint64_t bufferPos = self->state_.bufferPos;
  double result = *(double *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 8;
  return result;
}

- (float)readFloat
{
  CheckSize((uint64_t)&self->state_, 4);
  unint64_t bufferPos = self->state_.bufferPos;
  float result = *(float *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 4;
  return result;
}

- (unint64_t)readUInt64
{
  return ReadRawVarint64((uint64_t *)&self->state_);
}

- (int64_t)readInt64
{
  return ReadRawVarint64((uint64_t *)&self->state_);
}

- (int)readInt32
{
  return ReadRawVarint64((uint64_t *)&self->state_);
}

- (unint64_t)readFixed64
{
  CheckSize((uint64_t)&self->state_, 8);
  unint64_t bufferPos = self->state_.bufferPos;
  unint64_t result = *(void *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 8;
  return result;
}

- (unsigned)readFixed32
{
  CheckSize((uint64_t)&self->state_, 4);
  unint64_t bufferPos = self->state_.bufferPos;
  unsigned int result = *(_DWORD *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 4;
  return result;
}

- (BOOL)readBool
{
  return ReadRawVarint64((uint64_t *)&self->state_) != 0;
}

- (id)readString
{
  RetainedString = TRIPBCodedInputStreamReadRetainedString((uint64_t *)&self->state_);
  return RetainedString;
}

- (void)readGroup:(int)a3 message:(id)a4 extensionRegistry:(id)a5
{
  unint64_t recursionDepth = self->state_.recursionDepth;
  if (recursionDepth >= 0x64)
  {
    RaiseException(-106, 0);
    unint64_t recursionDepth = self->state_.recursionDepth;
  }
  self->state_.unint64_t recursionDepth = recursionDepth + 1;
  [a4 mergeFromCodedInputStream:self extensionRegistry:a5];
  if (self->state_.lastTag != ((8 * a3) | 4)) {
    RaiseException(-103, @"Unexpected tag read");
  }
  --self->state_.recursionDepth;
}

- (void)readUnknownGroup:(int)a3 message:(id)a4
{
  unint64_t recursionDepth = self->state_.recursionDepth;
  if (recursionDepth >= 0x64)
  {
    RaiseException(-106, 0);
    unint64_t recursionDepth = self->state_.recursionDepth;
  }
  self->state_.unint64_t recursionDepth = recursionDepth + 1;
  [a4 mergeFromCodedInputStream:self];
  if (self->state_.lastTag != ((8 * a3) | 4)) {
    RaiseException(-103, @"Unexpected tag read");
  }
  --self->state_.recursionDepth;
}

- (void)readMapEntry:(id)a3 extensionRegistry:(id)a4 field:(id)a5 parentMessage:(id)a6
{
  p_state = (uint64_t *)&self->state_;
  if (self->state_.recursionDepth >= 0x64) {
    RaiseException(-106, 0);
  }
  int RawVarint64 = ReadRawVarint64(p_state);
  unint64_t currentLimit = self->state_.currentLimit;
  unint64_t v14 = self->state_.bufferPos + RawVarint64;
  if (v14 > currentLimit) {
    RaiseException(-102, 0);
  }
  self->state_.unint64_t currentLimit = v14;
  ++self->state_.recursionDepth;
  TRIPBDictionaryReadEntry(a3, (uint64_t *)self, (uint64_t)a4, a5, a6);
  if (self->state_.lastTag) {
    RaiseException(-103, @"Unexpected tag read");
  }
  --self->state_.recursionDepth;
  self->state_.unint64_t currentLimit = currentLimit;
}

- (id)readBytes
{
  RetainedBytes = (void *)TRIPBCodedInputStreamReadRetainedBytes((uint64_t *)&self->state_);
  return RetainedBytes;
}

- (unsigned)readUInt32
{
  return ReadRawVarint64((uint64_t *)&self->state_);
}

- (int)readEnum
{
  return ReadRawVarint64((uint64_t *)&self->state_);
}

- (int)readSFixed32
{
  CheckSize((uint64_t)&self->state_, 4);
  unint64_t bufferPos = self->state_.bufferPos;
  int result = *(_DWORD *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 4;
  return result;
}

- (int64_t)readSFixed64
{
  CheckSize((uint64_t)&self->state_, 8);
  unint64_t bufferPos = self->state_.bufferPos;
  int64_t result = *(void *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 8;
  return result;
}

- (int)readSInt32
{
  unsigned int RawVarint64 = ReadRawVarint64((uint64_t *)&self->state_);
  return -(RawVarint64 & 1) ^ (RawVarint64 >> 1);
}

- (int64_t)readSInt64
{
  unint64_t RawVarint64 = ReadRawVarint64((uint64_t *)&self->state_);
  return -(uint64_t)(RawVarint64 & 1) ^ (RawVarint64 >> 1);
}

@end