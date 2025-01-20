@interface TransparencyGPBCodedOutputStream
+ (id)streamWithData:(id)a3;
+ (id)streamWithOutputStream:(id)a3;
- (TransparencyGPBCodedOutputStream)initWithData:(id)a3;
- (TransparencyGPBCodedOutputStream)initWithOutputStream:(id)a3;
- (TransparencyGPBCodedOutputStream)initWithOutputStream:(id)a3 data:(id)a4;
- (void)dealloc;
- (void)flush;
- (void)writeBool:(int)a3 value:(BOOL)a4;
- (void)writeBoolArray:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeBoolNoTag:(BOOL)a3;
- (void)writeBytes:(int)a3 value:(id)a4;
- (void)writeBytesArray:(int)a3 values:(id)a4;
- (void)writeBytesNoTag:(id)a3;
- (void)writeDouble:(int)a3 value:(double)a4;
- (void)writeDoubleArray:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeDoubleNoTag:(double)a3;
- (void)writeEnum:(int)a3 value:(int)a4;
- (void)writeEnumArray:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeEnumNoTag:(int)a3;
- (void)writeFixed32:(int)a3 value:(unsigned int)a4;
- (void)writeFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeFixed32NoTag:(unsigned int)a3;
- (void)writeFixed64:(int)a3 value:(unint64_t)a4;
- (void)writeFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeFixed64NoTag:(unint64_t)a3;
- (void)writeFloat:(int)a3 value:(float)a4;
- (void)writeFloatArray:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeFloatNoTag:(float)a3;
- (void)writeGroup:(int)a3 value:(id)a4;
- (void)writeGroupArray:(int)a3 values:(id)a4;
- (void)writeGroupNoTag:(int)a3 value:(id)a4;
- (void)writeInt32:(int)a3 value:(int)a4;
- (void)writeInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeInt32NoTag:(int)a3;
- (void)writeInt64:(int)a3 value:(int64_t)a4;
- (void)writeInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeInt64NoTag:(int64_t)a3;
- (void)writeMessage:(int)a3 value:(id)a4;
- (void)writeMessageArray:(int)a3 values:(id)a4;
- (void)writeMessageNoTag:(id)a3;
- (void)writeMessageSetExtension:(int)a3 value:(id)a4;
- (void)writeRawByte:(unsigned __int8)a3;
- (void)writeRawData:(id)a3;
- (void)writeRawLittleEndian32:(int)a3;
- (void)writeRawLittleEndian64:(int64_t)a3;
- (void)writeRawMessageSetExtension:(int)a3 value:(id)a4;
- (void)writeRawPtr:(const void *)a3 offset:(unint64_t)a4 length:(unint64_t)a5;
- (void)writeRawVarint32:(int)a3;
- (void)writeRawVarint64:(int64_t)a3;
- (void)writeRawVarintSizeTAs32:(unint64_t)a3;
- (void)writeSFixed32:(int)a3 value:(int)a4;
- (void)writeSFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeSFixed32NoTag:(int)a3;
- (void)writeSFixed64:(int)a3 value:(int64_t)a4;
- (void)writeSFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeSFixed64NoTag:(int64_t)a3;
- (void)writeSInt32:(int)a3 value:(int)a4;
- (void)writeSInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeSInt32NoTag:(int)a3;
- (void)writeSInt64:(int)a3 value:(int64_t)a4;
- (void)writeSInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeSInt64NoTag:(int64_t)a3;
- (void)writeString:(int)a3 value:(id)a4;
- (void)writeStringArray:(int)a3 values:(id)a4;
- (void)writeStringNoTag:(id)a3;
- (void)writeTag:(unsigned int)a3 format:(int)a4;
- (void)writeUInt32:(int)a3 value:(unsigned int)a4;
- (void)writeUInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeUInt32NoTag:(unsigned int)a3;
- (void)writeUInt64:(int)a3 value:(unint64_t)a4;
- (void)writeUInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeUInt64NoTag:(unint64_t)a3;
- (void)writeUnknownGroup:(int)a3 value:(id)a4;
- (void)writeUnknownGroupArray:(int)a3 values:(id)a4;
- (void)writeUnknownGroupNoTag:(int)a3 value:(id)a4;
@end

@implementation TransparencyGPBCodedOutputStream

- (void)dealloc
{
  [(TransparencyGPBCodedOutputStream *)self flush];
  [(NSOutputStream *)self->state_.output close];

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBCodedOutputStream;
  [(TransparencyGPBCodedOutputStream *)&v3 dealloc];
}

- (TransparencyGPBCodedOutputStream)initWithOutputStream:(id)a3
{
  v5 = +[NSMutableData dataWithLength:vm_page_size];

  return [(TransparencyGPBCodedOutputStream *)self initWithOutputStream:a3 data:v5];
}

- (TransparencyGPBCodedOutputStream)initWithData:(id)a3
{
  return [(TransparencyGPBCodedOutputStream *)self initWithOutputStream:0 data:a3];
}

- (TransparencyGPBCodedOutputStream)initWithOutputStream:(id)a3 data:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TransparencyGPBCodedOutputStream;
  v6 = [(TransparencyGPBCodedOutputStream *)&v9 init];
  if (v6)
  {
    v6->buffer_ = (NSMutableData *)a4;
    v6->state_.bytes = (char *)[a4 mutableBytes];
    v6->state_.size = (unint64_t)[a4 length];
    v7 = (NSOutputStream *)a3;
    v6->state_.output = v7;
    [(NSOutputStream *)v7 open];
  }
  return v6;
}

+ (id)streamWithOutputStream:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithOutputStream:a3 data:[NSMutableData dataWithLength:vm_page_size]];

  return v3;
}

+ (id)streamWithData:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithData:a3];

  return v3;
}

- (void)writeDoubleNoTag:(double)a3
{
}

- (void)writeDouble:(int)a3 value:(double)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 1);
  sub_1001383E8(p_state, v6);

  sub_100137C2C(p_state, *(uint64_t *)&a4);
}

- (void)writeFloatNoTag:(float)a3
{
}

- (void)writeFloat:(int)a3 value:(float)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 5);
  sub_1001383E8(p_state, v6);

  sub_100137E14(p_state, SLODWORD(a4));
}

- (void)writeUInt64NoTag:(unint64_t)a3
{
}

- (void)writeUInt64:(int)a3 value:(unint64_t)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 0);
  sub_1001383E8(p_state, v6);

  sub_100137F4C(p_state, a4);
}

- (void)writeInt64NoTag:(int64_t)a3
{
}

- (void)writeInt64:(int)a3 value:(int64_t)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 0);
  sub_1001383E8(p_state, v6);

  sub_100137F4C(p_state, a4);
}

- (void)writeInt32NoTag:(int)a3
{
}

- (void)writeInt32:(int)a3 value:(int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 0);
  sub_1001383E8(p_state, v6);

  sub_1001380AC(p_state, a4);
}

- (void)writeFixed64NoTag:(unint64_t)a3
{
}

- (void)writeFixed64:(int)a3 value:(unint64_t)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 1);
  sub_1001383E8(p_state, v6);

  sub_100137C2C(p_state, a4);
}

- (void)writeFixed32NoTag:(unsigned int)a3
{
}

- (void)writeFixed32:(int)a3 value:(unsigned int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 5);
  sub_1001383E8(p_state, v6);

  sub_100137E14(p_state, a4);
}

- (void)writeBoolNoTag:(BOOL)a3
{
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_10013ACCC(&self->state_.bytes);
    unint64_t position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = a3;
}

- (void)writeBool:(int)a3 value:(BOOL)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v7 = sub_10016B9DC(a3, 0);
  sub_1001383E8(p_state, v7);
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_10013ACCC(p_state);
    unint64_t position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = a4;
}

- (void)writeStringNoTag:(id)a3
{
  size_t v5 = (size_t)[a3 lengthOfBytesUsingEncoding:4];
  sub_1001383E8((uint64_t *)&self->state_, v5);
  if (v5)
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x8000100u);
    unint64_t position = self->state_.position;
    size_t v8 = self->state_.size - position;
    if (v8 >= v5)
    {
      size_t v11 = 0;
      objc_super v9 = &self->state_.bytes[position];
      if (CStringPtr)
      {
        memcpy(v9, CStringPtr, v5);
      }
      else
      {
        if (![a3 getBytes:v9 maxLength:v8 usedLength:&v11 encoding:4 options:0 range:[a3 length] remainingRange:0])return; {
        size_t v5 = v11;
        }
      }
      self->state_.position += v5;
    }
    else if (CStringPtr)
    {
      -[TransparencyGPBCodedOutputStream writeRawPtr:offset:length:](self, "writeRawPtr:offset:length:", CStringPtr);
    }
    else
    {
      id v10 = [a3 dataUsingEncoding:4];
      [(TransparencyGPBCodedOutputStream *)self writeRawData:v10];
    }
  }
}

- (void)writeString:(int)a3 value:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v7 = sub_10016B9DC(a3, 2);
  sub_1001383E8(p_state, v7);

  [(TransparencyGPBCodedOutputStream *)self writeStringNoTag:a4];
}

- (void)writeGroupNoTag:(int)a3 value:(id)a4
{
  [a4 writeToCodedOutputStream:self];
  unsigned int v6 = sub_10016B9DC(a3, 4);

  sub_1001383E8((uint64_t *)&self->state_, v6);
}

- (void)writeGroup:(int)a3 value:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  p_state = (uint64_t *)&self->state_;
  unsigned int v8 = sub_10016B9DC(a3, 3);
  sub_1001383E8(p_state, v8);

  [(TransparencyGPBCodedOutputStream *)self writeGroupNoTag:v5 value:a4];
}

- (void)writeUnknownGroupNoTag:(int)a3 value:(id)a4
{
  [a4 writeToCodedOutputStream:self];
  unsigned int v6 = sub_10016B9DC(a3, 4);

  sub_1001383E8((uint64_t *)&self->state_, v6);
}

- (void)writeUnknownGroup:(int)a3 value:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  p_state = (uint64_t *)&self->state_;
  unsigned int v8 = sub_10016B9DC(a3, 3);
  sub_1001383E8(p_state, v8);

  [(TransparencyGPBCodedOutputStream *)self writeUnknownGroupNoTag:v5 value:a4];
}

- (void)writeMessageNoTag:(id)a3
{
  sub_1001383E8((uint64_t *)&self->state_, [a3 serializedSize]);

  [a3 writeToCodedOutputStream:self];
}

- (void)writeMessage:(int)a3 value:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v7 = sub_10016B9DC(a3, 2);
  sub_1001383E8(p_state, v7);

  [(TransparencyGPBCodedOutputStream *)self writeMessageNoTag:a4];
}

- (void)writeBytesNoTag:(id)a3
{
  sub_1001383E8((uint64_t *)&self->state_, [a3 length]);

  [(TransparencyGPBCodedOutputStream *)self writeRawData:a3];
}

- (void)writeBytes:(int)a3 value:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v7 = sub_10016B9DC(a3, 2);
  sub_1001383E8(p_state, v7);

  [(TransparencyGPBCodedOutputStream *)self writeBytesNoTag:a4];
}

- (void)writeUInt32NoTag:(unsigned int)a3
{
}

- (void)writeUInt32:(int)a3 value:(unsigned int)a4
{
}

- (void)writeEnumNoTag:(int)a3
{
}

- (void)writeEnum:(int)a3 value:(int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 0);
  sub_1001383E8(p_state, v6);

  sub_1001380AC(p_state, a4);
}

- (void)writeSFixed32NoTag:(int)a3
{
}

- (void)writeSFixed32:(int)a3 value:(int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 5);
  sub_1001383E8(p_state, v6);

  sub_100137E14(p_state, a4);
}

- (void)writeSFixed64NoTag:(int64_t)a3
{
}

- (void)writeSFixed64:(int)a3 value:(int64_t)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 1);
  sub_1001383E8(p_state, v6);

  sub_100137C2C(p_state, a4);
}

- (void)writeSInt32NoTag:(int)a3
{
}

- (void)writeSInt32:(int)a3 value:(int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 0);
  sub_1001383E8(p_state, v6);

  sub_1001383E8(p_state, (2 * a4) ^ (a4 >> 31));
}

- (void)writeSInt64NoTag:(int64_t)a3
{
}

- (void)writeSInt64:(int)a3 value:(int64_t)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10016B9DC(a3, 0);
  sub_1001383E8(p_state, v6);

  sub_100137F4C(p_state, (2 * a4) ^ (a4 >> 63));
}

- (void)writeDoubleArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100138BE8;
      v11[3] = &unk_1002C2240;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100138C08;
      v10[3] = &unk_1002C2268;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100138C10;
    v8[3] = &unk_1002C2290;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeFloatArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100138DC8;
      v11[3] = &unk_1002C22B8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100138DE8;
      v10[3] = &unk_1002C22E0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100138DF0;
    v8[3] = &unk_1002C2308;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeUInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100138FA8;
      v11[3] = &unk_1002C2330;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100138FE8;
      v10[3] = &unk_1002C2358;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100138FF4;
    v8[3] = &unk_1002C2380;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1001391B0;
      v11[3] = &unk_1002C23A8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1001391EC;
      v10[3] = &unk_1002C23D0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001391F8;
    v8[3] = &unk_1002C23F8;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1001393B4;
      v11[3] = &unk_1002C2420;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100139450;
      v10[3] = &unk_1002C2448;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10013945C;
    v8[3] = &unk_1002C2470;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeUInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100139618;
      v11[3] = &unk_1002C2498;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10013969C;
      v10[3] = &unk_1002C24C0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001396A8;
    v8[3] = &unk_1002C24E8;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100139864;
      v11[3] = &unk_1002C2330;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10013987C;
      v10[3] = &unk_1002C2358;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100139888;
    v8[3] = &unk_1002C2380;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100139A44;
      v11[3] = &unk_1002C2498;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100139A5C;
      v10[3] = &unk_1002C24C0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100139A68;
    v8[3] = &unk_1002C24E8;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeSInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100139C24;
      v11[3] = &unk_1002C2420;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100139CB8;
      v10[3] = &unk_1002C2448;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100139CC4;
    v8[3] = &unk_1002C2470;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeSInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100139E80;
      v11[3] = &unk_1002C23A8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100139ECC;
      v10[3] = &unk_1002C23D0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100139ED8;
    v8[3] = &unk_1002C23F8;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeSFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10013A094;
      v11[3] = &unk_1002C23A8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10013A0AC;
      v10[3] = &unk_1002C23D0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10013A0B8;
    v8[3] = &unk_1002C23F8;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeSFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10013A274;
      v11[3] = &unk_1002C2420;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10013A28C;
      v10[3] = &unk_1002C2448;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10013A298;
    v8[3] = &unk_1002C2470;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeBoolArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10013A454;
      v11[3] = &unk_1002C2510;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10013A46C;
      v10[3] = &unk_1002C2538;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10013A478;
    v8[3] = &unk_1002C2560;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

- (void)writeEnumArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10013A634;
      v11[3] = &unk_1002C2420;
      v11[4] = &v12;
      [a4 enumerateRawValuesWithBlock:v11];
      sub_1001383E8((uint64_t *)&self->state_, a5);
      sub_1001383E8((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10013A68C;
      v10[3] = &unk_1002C2448;
      v10[4] = self;
      [a4 enumerateRawValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10013A698;
    v8[3] = &unk_1002C2470;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateRawValuesWithBlock:v8];
  }
}

- (void)writeStringArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [(TransparencyGPBCodedOutputStream *)self writeString:v5 value:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)writeMessageArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [(TransparencyGPBCodedOutputStream *)self writeMessage:v5 value:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)writeBytesArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [(TransparencyGPBCodedOutputStream *)self writeBytes:v5 value:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)writeGroupArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [(TransparencyGPBCodedOutputStream *)self writeGroup:v5 value:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)writeUnknownGroupArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [(TransparencyGPBCodedOutputStream *)self writeUnknownGroup:v5 value:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)writeMessageSetExtension:(int)a3 value:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v8 = sub_10016B9DC(1, 3);
  sub_1001383E8(p_state, v8);
  sub_1001387FC(p_state, 2, a3);
  [(TransparencyGPBCodedOutputStream *)self writeMessage:3 value:a4];
  unsigned int v9 = sub_10016B9DC(1, 4);

  sub_1001383E8(p_state, v9);
}

- (void)writeRawMessageSetExtension:(int)a3 value:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v8 = sub_10016B9DC(1, 3);
  sub_1001383E8(p_state, v8);
  sub_1001387FC(p_state, 2, a3);
  [(TransparencyGPBCodedOutputStream *)self writeBytes:3 value:a4];
  unsigned int v9 = sub_10016B9DC(1, 4);

  sub_1001383E8(p_state, v9);
}

- (void)flush
{
  if (self->state_.output) {
    sub_10013ACCC(&self->state_.bytes);
  }
}

- (void)writeRawByte:(unsigned __int8)a3
{
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_10013ACCC(&self->state_.bytes);
    unint64_t position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = a3;
}

- (void)writeRawData:(id)a3
{
  id v5 = [a3 bytes];
  id v6 = [a3 length];

  [(TransparencyGPBCodedOutputStream *)self writeRawPtr:v5 offset:0 length:v6];
}

- (void)writeRawPtr:(const void *)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  if (a3 && a5)
  {
    unint64_t size = self->state_.size;
    p_state = &self->state_;
    unint64_t position = self->state_.position;
    unint64_t v12 = size - position;
    long long v13 = &self->state_.bytes[position];
    long long v14 = (char *)a3 + a4;
    uint64_t v15 = (void *)(a5 - (size - position));
    if (a5 <= size - position)
    {
      memcpy(v13, v14, a5);
      self->state_.position += a5;
    }
    else
    {
      memcpy(v13, v14, size - position);
      unint64_t v16 = v12 + a4;
      self->state_.unint64_t position = size;
      sub_10013ACCC(p_state);
      if ((unint64_t)v15 <= self->state_.size)
      {
        memcpy(self->state_.bytes, (char *)a3 + v16, (size_t)v15);
        self->state_.unint64_t position = (unint64_t)v15;
      }
      else if ((void *)[(NSOutputStream *)self->state_.output write:(char *)a3 + v16 maxLength:v15] != v15)
      {
        +[NSException raise:@"WriteFailed" format:&stru_1002CE4C0];
      }
    }
  }
}

- (void)writeTag:(unsigned int)a3 format:(int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v5 = sub_10016B9DC(a3, a4);

  sub_1001383E8(p_state, v5);
}

- (void)writeRawVarint32:(int)a3
{
}

- (void)writeRawVarintSizeTAs32:(unint64_t)a3
{
}

- (void)writeRawVarint64:(int64_t)a3
{
}

- (void)writeRawLittleEndian32:(int)a3
{
}

- (void)writeRawLittleEndian64:(int64_t)a3
{
}

@end