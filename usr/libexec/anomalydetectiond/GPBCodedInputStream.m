@interface GPBCodedInputStream
+ (id)streamWithData:(id)a3;
- (BOOL)isAtEnd;
- (BOOL)readBool;
- (BOOL)skipField:(int)a3;
- (GPBCodedInputStream)initWithData:(id)a3;
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

@implementation GPBCodedInputStream

+ (id)streamWithData:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithData:a3];

  return v3;
}

- (GPBCodedInputStream)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GPBCodedInputStream;
  v4 = [(GPBCodedInputStream *)&v7 init];
  if (v4)
  {
    v4->buffer_ = (NSData *)a3;
    v4->state_.bytes = (char *)[a3 bytes];
    id v5 = [a3 length];
    v4->state_.bufferSize = (unint64_t)v5;
    v4->state_.currentLimit = (unint64_t)v5;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GPBCodedInputStream;
  [(GPBCodedInputStream *)&v3 dealloc];
}

- (int)readTag
{
  return GPBCodedInputStreamReadTag((uint64_t)&self->state_);
}

- (void)checkLastTagWas:(int)a3
{
  if (self->state_.lastTag != a3) {
    sub_1002D9464(-103, @"Unexpected tag read");
  }
}

- (BOOL)skipField:(int)a3
{
  if (!GPBWireFormatIsValidTag(a3)) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"GPBCodedInputStream.m" lineNumber:349 description:@"Invalid tag"];
  }
  int TagWireType = GPBWireFormatGetTagWireType(a3);
  BOOL result = 0;
  switch(TagWireType)
  {
    case 0:
      GPBCodedInputStreamReadInt64_0((uint64_t *)&self->state_);
      goto LABEL_11;
    case 1:
      sub_1002D95F0(&self->state_.bytes, 8);
      unint64_t v8 = self->state_.bufferPos + 8;
      goto LABEL_10;
    case 2:
      int Int64_0 = GPBCodedInputStreamReadInt64_0((uint64_t *)&self->state_);
      sub_1002D95F0(&self->state_.bytes, Int64_0);
      unint64_t v8 = self->state_.bufferPos + Int64_0;
      goto LABEL_10;
    case 3:
      [(GPBCodedInputStream *)self skipMessage];
      int TagFieldNumber = GPBWireFormatGetTagFieldNumber(a3);
      if (self->state_.lastTag != GPBWireFormatMakeTag(TagFieldNumber, 4)) {
        sub_1002D9464(-103, @"Unexpected tag read");
      }
      goto LABEL_11;
    case 5:
      sub_1002D95F0(&self->state_.bytes, 4);
      unint64_t v8 = self->state_.bufferPos + 4;
LABEL_10:
      self->state_.bufferPos = v8;
LABEL_11:
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
    uint64_t Tag = GPBCodedInputStreamReadTag((uint64_t)p_state);
  while (Tag && [(GPBCodedInputStream *)self skipField:Tag]);
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
    sub_1002D9464(-102, 0);
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
  sub_1002D95F0(&self->state_.bytes, 8);
  unint64_t bufferPos = self->state_.bufferPos;
  double result = *(double *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 8;
  return result;
}

- (float)readFloat
{
  sub_1002D95F0(&self->state_.bytes, 4);
  unint64_t bufferPos = self->state_.bufferPos;
  float result = *(float *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 4;
  return result;
}

- (unint64_t)readUInt64
{
  return GPBCodedInputStreamReadInt64_0((uint64_t *)&self->state_);
}

- (int64_t)readInt64
{
  return GPBCodedInputStreamReadInt64_0((uint64_t *)&self->state_);
}

- (int)readInt32
{
  return GPBCodedInputStreamReadInt64_0((uint64_t *)&self->state_);
}

- (unint64_t)readFixed64
{
  sub_1002D95F0(&self->state_.bytes, 8);
  unint64_t bufferPos = self->state_.bufferPos;
  unint64_t result = *(void *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 8;
  return result;
}

- (unsigned)readFixed32
{
  sub_1002D95F0(&self->state_.bytes, 4);
  unint64_t bufferPos = self->state_.bufferPos;
  unsigned int result = *(_DWORD *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 4;
  return result;
}

- (BOOL)readBool
{
  return GPBCodedInputStreamReadInt64_0((uint64_t *)&self->state_) != 0;
}

- (id)readString
{
  RetainedString = (__CFString *)GPBCodedInputStreamReadRetainedString((uint64_t *)&self->state_);

  return RetainedString;
}

- (void)readGroup:(int)a3 message:(id)a4 extensionRegistry:(id)a5
{
  unint64_t recursionDepth = self->state_.recursionDepth;
  if (recursionDepth >= 0x64)
  {
    sub_1002D9464(-106, 0);
    unint64_t recursionDepth = self->state_.recursionDepth;
  }
  self->state_.unint64_t recursionDepth = recursionDepth + 1;
  [a4 mergeFromCodedInputStream:self extensionRegistry:a5];
  if (self->state_.lastTag != GPBWireFormatMakeTag(a3, 4)) {
    sub_1002D9464(-103, @"Unexpected tag read");
  }
  --self->state_.recursionDepth;
}

- (void)readUnknownGroup:(int)a3 message:(id)a4
{
  unint64_t recursionDepth = self->state_.recursionDepth;
  if (recursionDepth >= 0x64)
  {
    sub_1002D9464(-106, 0);
    unint64_t recursionDepth = self->state_.recursionDepth;
  }
  self->state_.unint64_t recursionDepth = recursionDepth + 1;
  [a4 mergeFromCodedInputStream:self];
  if (self->state_.lastTag != GPBWireFormatMakeTag(a3, 4)) {
    sub_1002D9464(-103, @"Unexpected tag read");
  }
  --self->state_.recursionDepth;
}

- (void)readMessage:(id)a3 extensionRegistry:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  if (self->state_.recursionDepth >= 0x64) {
    sub_1002D9464(-106, 0);
  }
  int Int64_0 = GPBCodedInputStreamReadInt64_0(p_state);
  unint64_t currentLimit = self->state_.currentLimit;
  unint64_t v10 = self->state_.bufferPos + Int64_0;
  if (v10 > currentLimit) {
    sub_1002D9464(-102, 0);
  }
  self->state_.unint64_t currentLimit = v10;
  ++self->state_.recursionDepth;
  [a3 mergeFromCodedInputStream:self extensionRegistry:a4];
  if (self->state_.lastTag) {
    sub_1002D9464(-103, @"Unexpected tag read");
  }
  --self->state_.recursionDepth;
  self->state_.unint64_t currentLimit = currentLimit;
}

- (void)readMapEntry:(id)a3 extensionRegistry:(id)a4 field:(id)a5 parentMessage:(id)a6
{
  p_state = (uint64_t *)&self->state_;
  if (self->state_.recursionDepth >= 0x64) {
    sub_1002D9464(-106, 0);
  }
  int Int64_0 = GPBCodedInputStreamReadInt64_0(p_state);
  unint64_t currentLimit = self->state_.currentLimit;
  unint64_t v14 = self->state_.bufferPos + Int64_0;
  if (v14 > currentLimit) {
    sub_1002D9464(-102, 0);
  }
  self->state_.unint64_t currentLimit = v14;
  ++self->state_.recursionDepth;
  GPBDictionaryReadEntry(a3, (uint64_t *)self, (uint64_t)a4, a5, a6);
  if (self->state_.lastTag) {
    sub_1002D9464(-103, @"Unexpected tag read");
  }
  --self->state_.recursionDepth;
  self->state_.unint64_t currentLimit = currentLimit;
}

- (id)readBytes
{
  id RetainedBytes = GPBCodedInputStreamReadRetainedBytes((uint64_t *)&self->state_);

  return RetainedBytes;
}

- (unsigned)readUInt32
{
  return GPBCodedInputStreamReadInt64_0((uint64_t *)&self->state_);
}

- (int)readEnum
{
  return GPBCodedInputStreamReadInt64_0((uint64_t *)&self->state_);
}

- (int)readSFixed32
{
  sub_1002D95F0(&self->state_.bytes, 4);
  unint64_t bufferPos = self->state_.bufferPos;
  int result = *(_DWORD *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 4;
  return result;
}

- (int64_t)readSFixed64
{
  sub_1002D95F0(&self->state_.bytes, 8);
  unint64_t bufferPos = self->state_.bufferPos;
  int64_t result = *(void *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 8;
  return result;
}

- (int)readSInt32
{
  unsigned int Int64_0 = GPBCodedInputStreamReadInt64_0((uint64_t *)&self->state_);
  return -(Int64_0 & 1) ^ (Int64_0 >> 1);
}

- (int64_t)readSInt64
{
  unint64_t Int64_0 = GPBCodedInputStreamReadInt64_0((uint64_t *)&self->state_);
  return -(uint64_t)(Int64_0 & 1) ^ (Int64_0 >> 1);
}

@end