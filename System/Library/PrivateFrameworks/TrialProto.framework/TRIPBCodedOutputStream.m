@interface TRIPBCodedOutputStream
+ (id)streamWithData:(id)a3;
+ (id)streamWithOutputStream:(id)a3;
- (TRIPBCodedOutputStream)initWithData:(id)a3;
- (TRIPBCodedOutputStream)initWithOutputStream:(id)a3;
- (TRIPBCodedOutputStream)initWithOutputStream:(id)a3 data:(id)a4;
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

@implementation TRIPBCodedOutputStream

- (void)dealloc
{
  [(NSOutputStream *)self->state_.output close];

  v3.receiver = self;
  v3.super_class = (Class)TRIPBCodedOutputStream;
  [(TRIPBCodedOutputStream *)&v3 dealloc];
}

- (TRIPBCodedOutputStream)initWithOutputStream:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA58] dataWithLength:*MEMORY[0x1E4F14B00]];
  return [(TRIPBCodedOutputStream *)self initWithOutputStream:a3 data:v5];
}

- (TRIPBCodedOutputStream)initWithData:(id)a3
{
  return [(TRIPBCodedOutputStream *)self initWithOutputStream:0 data:a3];
}

- (TRIPBCodedOutputStream)initWithOutputStream:(id)a3 data:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TRIPBCodedOutputStream;
  v6 = [(TRIPBCodedOutputStream *)&v9 init];
  if (v6)
  {
    v6->buffer_ = (NSMutableData *)a4;
    v6->state_.bytes = (char *)[a4 mutableBytes];
    v6->state_.size = [a4 length];
    v7 = (NSOutputStream *)a3;
    v6->state_.output = v7;
    [(NSOutputStream *)v7 open];
  }
  return v6;
}

+ (id)streamWithOutputStream:(id)a3
{
  objc_super v3 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputStream:data:", a3, objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", *MEMORY[0x1E4F14B00]));
  return v3;
}

+ (id)streamWithData:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithData:a3];
  return v3;
}

- (void)writeDoubleNoTag:(double)a3
{
}

- (void)writeDouble:(int)a3 value:(double)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 1);
  TRIPBWriteRawLittleEndian64((uint64_t)p_state, *(uint64_t *)&a4);
}

- (void)writeFloatNoTag:(float)a3
{
}

- (void)writeFloat:(int)a3 value:(float)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 5);
  TRIPBWriteRawLittleEndian32((uint64_t)p_state, SLODWORD(a4));
}

- (void)writeUInt64NoTag:(unint64_t)a3
{
}

- (void)writeUInt64:(int)a3 value:(unint64_t)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint64((uint64_t)p_state, a4);
}

- (void)writeInt64NoTag:(int64_t)a3
{
}

- (void)writeInt64:(int)a3 value:(int64_t)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint64((uint64_t)p_state, a4);
}

- (void)writeInt32NoTag:(int)a3
{
}

- (void)writeInt32:(int)a3 value:(int)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteInt32NoTag((uint64_t)p_state, a4);
}

- (void)writeFixed64NoTag:(unint64_t)a3
{
}

- (void)writeFixed64:(int)a3 value:(unint64_t)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 1);
  TRIPBWriteRawLittleEndian64((uint64_t)p_state, a4);
}

- (void)writeFixed32NoTag:(unsigned int)a3
{
}

- (void)writeFixed32:(int)a3 value:(unsigned int)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 5);
  TRIPBWriteRawLittleEndian32((uint64_t)p_state, a4);
}

- (void)writeBoolNoTag:(BOOL)a3
{
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)&self->state_);
    unint64_t position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = a3;
}

- (void)writeBool:(int)a3 value:(BOOL)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)p_state);
    unint64_t position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = a4;
}

- (void)writeStringNoTag:(id)a3
{
  unint64_t v6 = [a3 lengthOfBytesUsingEncoding:4];
  TRIPBWriteRawVarint32((uint64_t)&self->state_, v6);
  if (v6)
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x8000100u);
    unint64_t position = self->state_.position;
    unint64_t v9 = self->state_.size - position;
    if (v9 >= v6)
    {
      unint64_t v13 = 0;
      v10 = &self->state_.bytes[position];
      if (CStringPtr)
      {
        memcpy(v10, CStringPtr, v6);
      }
      else
      {
        if (!objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v10, v9, &v13, 4, 0, 0, objc_msgSend(a3, "length"), 0))return; {
        if (v13 != v6)
        }
        {
          v12 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBCodedOutputStream.m", 311, @"Our UTF8 calc was wrong? %tu vs %zd", v13, v6);
          unint64_t v6 = v13;
        }
      }
      self->state_.position += v6;
    }
    else if (CStringPtr)
    {
      [(TRIPBCodedOutputStream *)self writeRawPtr:CStringPtr offset:0 length:v6];
    }
    else
    {
      v11 = (void *)[a3 dataUsingEncoding:4];
      if ([v11 length] != v6) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBCodedOutputStream.m", 322, @"Strings UTF8 length was wrong? %tu vs %zd", objc_msgSend(v11, "length"), v6);
      }
      [(TRIPBCodedOutputStream *)self writeRawData:v11];
    }
  }
}

- (void)writeString:(int)a3 value:(id)a4
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 2);
  [(TRIPBCodedOutputStream *)self writeStringNoTag:a4];
}

- (void)writeGroupNoTag:(int)a3 value:(id)a4
{
  [a4 writeToCodedOutputStream:self];
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 4);
}

- (void)writeGroup:(int)a3 value:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 3);
  [(TRIPBCodedOutputStream *)self writeGroupNoTag:v5 value:a4];
}

- (void)writeUnknownGroupNoTag:(int)a3 value:(id)a4
{
  [a4 writeToCodedOutputStream:self];
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 4);
}

- (void)writeUnknownGroup:(int)a3 value:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 3);
  [(TRIPBCodedOutputStream *)self writeUnknownGroupNoTag:v5 value:a4];
}

- (void)writeMessageNoTag:(id)a3
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, [a3 serializedSize]);
  [a3 writeToCodedOutputStream:self];
}

- (void)writeMessage:(int)a3 value:(id)a4
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 2);
  [(TRIPBCodedOutputStream *)self writeMessageNoTag:a4];
}

- (void)writeBytesNoTag:(id)a3
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, [a3 length]);
  [(TRIPBCodedOutputStream *)self writeRawData:a3];
}

- (void)writeBytes:(int)a3 value:(id)a4
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 2);
  [(TRIPBCodedOutputStream *)self writeBytesNoTag:a4];
}

- (void)writeUInt32NoTag:(unsigned int)a3
{
}

- (void)writeUInt32:(int)a3 value:(unsigned int)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint32((uint64_t)p_state, a4);
}

- (void)writeEnumNoTag:(int)a3
{
}

- (void)writeEnum:(int)a3 value:(int)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint32((uint64_t)p_state, a4);
}

- (void)writeSFixed32NoTag:(int)a3
{
}

- (void)writeSFixed32:(int)a3 value:(int)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 5);
  TRIPBWriteRawLittleEndian32((uint64_t)p_state, a4);
}

- (void)writeSFixed64NoTag:(int64_t)a3
{
}

- (void)writeSFixed64:(int)a3 value:(int64_t)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 1);
  TRIPBWriteRawLittleEndian64((uint64_t)p_state, a4);
}

- (void)writeSInt32NoTag:(int)a3
{
}

- (void)writeSInt32:(int)a3 value:(int)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint32((uint64_t)p_state, (2 * a4) ^ (a4 >> 31));
}

- (void)writeSInt64NoTag:(int64_t)a3
{
}

- (void)writeSInt64:(int)a3 value:(int64_t)a4
{
  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint64((uint64_t)p_state, (2 * a4) ^ (a4 >> 63));
}

- (void)writeDoubleArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke;
      v11[3] = &unk_1E576BD68;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke_2;
      v10[3] = &unk_1E576C688;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C6B0;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDoubleNoTag:");
}

uint64_t __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDouble:value:", *(unsigned int *)(a1 + 40));
}

- (void)writeFloatArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke;
      v11[3] = &unk_1E576BD90;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke_2;
      v10[3] = &unk_1E576C6D8;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C700;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFloatNoTag:");
}

uint64_t __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFloat:value:", *(unsigned int *)(a1 + 40));
}

- (void)writeUInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke;
      v11[3] = &unk_1E576BDB8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke_2;
      v10[3] = &unk_1E576BF50;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C728;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = TRIPBComputeRawVarint64Size(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt64NoTag:a2];
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt64:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke;
      v11[3] = &unk_1E576BDE0;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke_2;
      v10[3] = &unk_1E576C750;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C778;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = TRIPBComputeRawVarint64Size(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt64NoTag:a2];
}

uint64_t __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt64:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke;
      v11[3] = &unk_1E576BE08;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke_2;
      v10[3] = &unk_1E576C7A0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C7C8;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 10;
  uint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a2 >> 28) {
    uint64_t v6 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (a2 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x80) {
    uint64_t v3 = v4;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt32NoTag:a2];
}

uint64_t __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt32:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeUInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke;
      v11[3] = &unk_1E576BE30;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke_2;
      v10[3] = &unk_1E576BF78;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C7F0;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (a2 >> 28) {
    uint64_t v5 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (a2 >= 0x80) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt32NoTag:a2];
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt32:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke;
      v11[3] = &unk_1E576BDB8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke_2;
      v10[3] = &unk_1E576BF50;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C728;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed64NoTag:a2];
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed64:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke;
      v11[3] = &unk_1E576BE30;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke_2;
      v10[3] = &unk_1E576BF78;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C7F0;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed32NoTag:a2];
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed32:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeSInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke;
      v11[3] = &unk_1E576BE08;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke_2;
      v10[3] = &unk_1E576C7A0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C7C8;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke(uint64_t result, int a2)
{
  unsigned int v2 = (2 * a2) ^ (a2 >> 31);
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v2 >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt32NoTag:a2];
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt32:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeSInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke;
      v11[3] = &unk_1E576BDE0;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke_2;
      v10[3] = &unk_1E576C750;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C778;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = TRIPBComputeRawVarint64Size((2 * a2) ^ (a2 >> 63));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt64NoTag:a2];
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt64:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeSFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke;
      v11[3] = &unk_1E576BDE0;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke_2;
      v10[3] = &unk_1E576C750;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C778;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed64NoTag:a2];
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed64:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeSFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke;
      v11[3] = &unk_1E576BE08;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke_2;
      v10[3] = &unk_1E576C7A0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C7C8;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed32NoTag:a2];
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed32:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeBoolArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke;
      v11[3] = &unk_1E576BE58;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke_2;
      v10[3] = &unk_1E576C818;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C840;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }
}

uint64_t __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke(uint64_t result)
{
  return result;
}

uint64_t __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeBoolNoTag:a2];
}

uint64_t __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeBool:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeEnumArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke;
      v11[3] = &unk_1E576BE08;
      v11[4] = &v12;
      [a4 enumerateRawValuesWithBlock:v11];
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke_2;
      v10[3] = &unk_1E576C7A0;
      v10[4] = self;
      [a4 enumerateRawValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke_3;
    v8[3] = &unk_1E576C7C8;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateRawValuesWithBlock:v8];
  }
}

uint64_t __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (a2 >> 28) {
    uint64_t v5 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (a2 >= 0x80) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeEnumNoTag:a2];
}

uint64_t __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeEnum:*(unsigned int *)(a1 + 40) value:a2];
}

- (void)writeStringArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [(TRIPBCodedOutputStream *)self writeString:v5 value:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)writeMessageArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [(TRIPBCodedOutputStream *)self writeMessage:v5 value:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)writeBytesArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [(TRIPBCodedOutputStream *)self writeBytes:v5 value:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)writeGroupArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [(TRIPBCodedOutputStream *)self writeGroup:v5 value:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)writeUnknownGroupArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [(TRIPBCodedOutputStream *)self writeUnknownGroup:v5 value:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)writeMessageSetExtension:(int)a3 value:(id)a4
{
  p_state = &self->state_;
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)&self->state_);
    unint64_t position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = 11;
  unint64_t v10 = self->state_.position;
  if (v10 == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)p_state);
    unint64_t v10 = self->state_.position;
  }
  long long v11 = self->state_.bytes;
  self->state_.unint64_t position = v10 + 1;
  v11[v10] = 16;
  TRIPBWriteRawVarint32((uint64_t)p_state, a3);
  [(TRIPBCodedOutputStream *)self writeMessage:3 value:a4];
  unint64_t v12 = self->state_.position;
  if (v12 == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)p_state);
    unint64_t v12 = self->state_.position;
  }
  long long v13 = self->state_.bytes;
  self->state_.unint64_t position = v12 + 1;
  v13[v12] = 12;
}

- (void)writeRawMessageSetExtension:(int)a3 value:(id)a4
{
  p_state = &self->state_;
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)&self->state_);
    unint64_t position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = 11;
  unint64_t v10 = self->state_.position;
  if (v10 == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)p_state);
    unint64_t v10 = self->state_.position;
  }
  long long v11 = self->state_.bytes;
  self->state_.unint64_t position = v10 + 1;
  v11[v10] = 16;
  TRIPBWriteRawVarint32((uint64_t)p_state, a3);
  [(TRIPBCodedOutputStream *)self writeBytes:3 value:a4];
  unint64_t v12 = self->state_.position;
  if (v12 == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)p_state);
    unint64_t v12 = self->state_.position;
  }
  long long v13 = self->state_.bytes;
  self->state_.unint64_t position = v12 + 1;
  v13[v12] = 12;
}

- (void)flush
{
  if (self->state_.output) {
    TRIPBRefreshBuffer((uint64_t)&self->state_);
  }
}

- (void)writeRawByte:(unsigned __int8)a3
{
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)&self->state_);
    unint64_t position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = a3;
}

- (void)writeRawData:(id)a3
{
  uint64_t v5 = [a3 bytes];
  uint64_t v6 = [a3 length];
  [(TRIPBCodedOutputStream *)self writeRawPtr:v5 offset:0 length:v6];
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
    size_t v15 = a5 - (size - position);
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
      TRIPBRefreshBuffer((uint64_t)p_state);
      if (v15 <= self->state_.size)
      {
        memcpy(self->state_.bytes, (char *)a3 + v16, v15);
        self->state_.unint64_t position = v15;
      }
      else if ([(NSOutputStream *)self->state_.output write:(char *)a3 + v16 maxLength:v15] != v15)
      {
        v17 = (void *)MEMORY[0x1E4F1CA00];
        [v17 raise:@"WriteFailed" format:&stru_1EE43FA58];
      }
    }
  }
}

- (void)writeTag:(unsigned int)a3 format:(int)a4
{
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