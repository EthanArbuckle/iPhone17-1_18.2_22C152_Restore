@interface MTLCountersTraceCommandBuffer
- (id).cxx_construct;
- (id)blitCommandEncoder;
- (id)computeCommandEncoder;
- (id)init:(BOOL)a3;
- (id)renderCommandEncoder;
- (id)resourceStateCommandEncoder;
- (void)appendSamples:(const void *)a3 length:(unint64_t)a4;
- (void)dealloc;
- (void)presentDrawable:(id)a3;
- (void)presentDrawable:(id)a3 atTime:(double)a4;
- (void)saveCommandBuffer:(const void *)a3 queue:(id)a4 profilingResults:(id)a5;
- (void)waitUntilCompleted;
- (void)waitUntilScheduled;
@end

@implementation MTLCountersTraceCommandBuffer

- (id)init:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTLCountersTraceCommandBuffer;
  v4 = [(MTLCountersTraceCommandBuffer *)&v6 init];
  if (v4)
  {
    v4->_encoders = (NSMutableArray *)objc_opt_new();
    v4->_flags |= v3;
    v4->_timestamp = mach_absolute_time();
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCountersTraceCommandBuffer;
  [(MTLCountersTraceCommandBuffer *)&v3 dealloc];
}

- (id)blitCommandEncoder
{
  id v3 = [[MTLCountersTraceBlitCommandEncoder alloc] init:&self->_commands];
  [(NSMutableArray *)self->_encoders addObject:v3];

  return v3;
}

- (id)computeCommandEncoder
{
  id v3 = [[MTLCountersTraceComputeCommandEncoder alloc] init:&self->_commands];
  [(NSMutableArray *)self->_encoders addObject:v3];

  return v3;
}

- (id)renderCommandEncoder
{
  id v3 = [[MTLCountersTraceRenderCommandEncoder alloc] init:&self->_commands];
  [(NSMutableArray *)self->_encoders addObject:v3];

  return v3;
}

- (id)resourceStateCommandEncoder
{
  id v3 = [[MTLCountersTraceResourceStateCommandEncoder alloc] init:&self->_commands];
  [(NSMutableArray *)self->_encoders addObject:v3];

  return v3;
}

- (void)waitUntilScheduled
{
  self->_flags |= 2uLL;
}

- (void)waitUntilCompleted
{
  self->_flags |= 4uLL;
}

- (void)presentDrawable:(id)a3
{
  self->_flags |= 8uLL;
}

- (void)presentDrawable:(id)a3 atTime:(double)a4
{
  self->_flags |= 8uLL;
}

- (void)appendSamples:(const void *)a3 length:(unint64_t)a4
{
}

- (void)saveCommandBuffer:(const void *)a3 queue:(id)a4 profilingResults:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v46 = a4;
  v47 = a3;
  unsigned __int8 v45 = 0;
  uint64_t v44 = 0;
  memset(&v43.stream, 0, sizeof(v43.stream));
  v43._vptr$AppendBuffer = (void **)&unk_26EF29738;
  AppendBuffer::WriteBytes(&v43, &v43.stream, "{", 1uLL);
  StringBuffer::Append<char [12],char [6],char [2]>(&v43, "\"version\":\", "0.908", "\");
  StringBuffer::Append<char [12],void const*,char [2]>(&v43, ",\"handle\":\", &v47, "\");
  AppendBuffer::WriteBytes(&v43, &v43.stream, ",\"device\":{", 0xBuLL);
  v37[0] = (const void *)[a4 device];
  StringBuffer::Append<char [12],void const*,char [2]>(&v43, "\"handle\":\", v37, "\");
  v37[0] = (const void *)objc_msgSend((id)objc_msgSend(a4, "device"), "name");
  StringBuffer::Append<char [10],NSString *,char [2]>(&v43, ",\"name\":\", (id *)v37, "\");
  AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
  AppendBuffer::WriteBytes(&v43, &v43.stream, ",\"queue\":{", 0xAuLL);
  StringBuffer::Append<char [12],void const*,char [2]>(&v43, "\"handle\":\", (const void **)&v46, "\");
  AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
  if (a5)
  {
    AppendBuffer::WriteBytes(&v43, &v43.stream, ",\"events\":{", 0xBuLL);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v8 = [a5 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      char v11 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(a5);
          }
          v37[0] = 0;
          v37[0] = *(const void **)(*((void *)&v39 + 1) + 8 * i);
          if ((v11 & 1) == 0) {
            AppendBuffer::WriteBytes(&v43, &v43.stream, ",", 1uLL);
          }
          id v35 = (id)objc_msgSend((id)objc_msgSend(a5, "objectForKey:"), "unsignedIntegerValue");
          StringBuffer::Append<char [2],NSString const*,char [3],unsigned long>(&v43, "\", (id *)v37, "\":"", &v35);
          char v11 = 0;
        }
        uint64_t v9 = [a5 countByEnumeratingWithState:&v39 objects:v48 count:16];
        char v11 = 0;
      }
      while (v9);
    }
    AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
  }
  uint64_t v38 = (*((uint64_t (**)(BinaryBuffer *, unsigned __int8 *, uint64_t *))self->_commands._vptr$AppendBuffer + 3))(&self->_commands, &v45, &v44);
  if (v44)
  {
    AppendBuffer::WriteBytes(&v43, &v43.stream, ",\"methods\":[", 0xCuLL);
    for (uint64_t j = 0; j != 274; j += 2)
    {
      if (j * 8) {
        v14 = ",";
      }
      else {
        v14 = "";
      }
      v37[0] = v14;
      StringBuffer::Append<char const*,char [14],char const*,char [2]>(&v43, (const char **)v37, "{\"selector\":\", (const char **)&(&methods)[j], "\");
      if ((&methods)[j + 1]) {
        StringBuffer::Append<char [10],unsigned long long>(&v43, ",\"flags\":", &(&methods)[j + 1]);
      }
      AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
    }
    AppendBuffer::WriteBytes(&v43, &v43.stream, "]", 1uLL);
    StringBuffer::Append<char [14],NSData *,char [2]>(&v43, ",\"commands\":\", (id *)&v38, "\");
    StringBuffer::Append<char [10],unsigned long long>(&v43, ",\"commandBufferLength\":", &v44);
    self->_flags |= 16 * v45;
  }
  if ([(NSMutableArray *)self->_encoders count])
  {
    AppendBuffer::WriteBytes(&v43, &v43.stream, ",\"encoders\":[", 0xDuLL);
    uint64_t v15 = [(NSMutableArray *)self->_encoders count];
    if (v15)
    {
      uint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        v18 = self;
        v19 = (void *)[(NSMutableArray *)self->_encoders objectAtIndexedSubscript:k];
        if (k) {
          v20 = ",";
        }
        else {
          v20 = "";
        }
        AppendBuffer::WriteBytes(&v43, &v43.stream, v20, k != 0);
        v37[0] = (const void *)[v19 flags];
        StringBuffer::Append<char [10],unsigned long long>(&v43, "{\"flags\":", v37);
        [v19 segment];
        if (v21)
        {
          v37[0] = (const void *)[v19 segment];
          v37[1] = v22;
          id v35 = (id)[v19 segment];
          uint64_t v36 = v23;
          StringBuffer::Append<char [24],unsigned long,char [11],unsigned long,char [2]>(&v43, ",\"segment\":{\"location\":", v37, ",\"length\":", &v36, "}");
        }
        AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
        self = v18;
      }
    }
    AppendBuffer::WriteBytes(&v43, &v43.stream, "]", 1uLL);
  }
  v37[0] = (const void *)(*((uint64_t (**)(AppendBuffer *, unsigned __int8 *, uint64_t *))self->_samples._vptr$AppendBuffer
                          + 3))(&self->_samples, &v45, &v44);
  if (v44)
  {
    __int16 v24 = [v46 getStatLocations];
    id v35 = (id)(v45 | (2 * ((~v24 & 0xF300) == 0)));
    v25 = (void *)[v46 getRequestedCounters];
    StringBuffer::Append<char [24],unsigned long long,char [14]>(&v43, ",\"statistics\":{\"flags\":", &v35, ",\"counters\":[");
    uint64_t v26 = [v25 count];
    if (v26)
    {
      uint64_t v27 = v26;
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (m) {
          v29 = ",";
        }
        else {
          v29 = "";
        }
        v34 = v29;
        uint64_t v33 = [v25 objectAtIndexedSubscript:m];
        StringBuffer::Append<char const*,char [10],NSString *,char [3]>(&v43, &v34, "{\"name\":\", (id *)&v33, "\"}"");
      }
    }
    StringBuffer::Append<char [14],NSData *,char [2]>(&v43, "],\"samples\":\", (id *)v37, "\");
    StringBuffer::Append<char [24],unsigned long long,char [14]>(&v43, ",\"sampleBufferLength\":", &v44, "}");
  }
  StringBuffer::Append<char [10],unsigned long long>(&v43, ",\"flags\":", &self->_flags);
  AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
  uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"cb_%llu.json", self->_timestamp);
  uint64_t v31 = objc_msgSend((id)objc_msgSend(v46, "tracePath"), "stringByAppendingPathComponent:", v30);
  id v35 = 0;
  v32 = (void *)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v43.stream.bytes length:v43.stream.pWrite - v43.stream.bytes freeWhenDone:1];
  memset(&v43.stream, 0, sizeof(v43.stream));
  if (([v32 writeToFile:v31 options:0 error:&v35] & 1) == 0) {
    NSLog(&cfstr_ErrorSavingFil.isa, v31, [v35 localizedDescription]);
  }
}

- (id).cxx_construct
{
  self->_commands.stream.bytes = 0;
  self->_commands.stream.pWrite = 0;
  self->_commands.stream.pEnd = 0;
  self->_commands._vptr$AppendBuffer = (void **)&unk_26EF29708;
  mach_timebase_info(&self->_commands._timebase);
  self->_samples._vptr$AppendBuffer = (void **)&unk_26EF296D8;
  self->_samples.stream.bytes = 0;
  self->_samples.stream.pWrite = 0;
  self->_samples.stream.pEnd = 0;
  return self;
}

@end