@interface MTLLegacySVBufferErrorLog
- (MTLArgument)argument;
- (MTLBuffer)buffer;
- (MTLLegacySVBufferErrorLog)init;
- (id)description;
- (int)addressSpace;
- (int)operation;
- (int)specifiedUsage;
- (unint64_t)offset;
- (void)dealloc;
- (void)setAddressSpace:(int)a3;
- (void)setArgument:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setOperation:(int)a3;
- (void)setSpecifiedUsage:(int)a3;
@end

@implementation MTLLegacySVBufferErrorLog

- (MTLLegacySVBufferErrorLog)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVBufferErrorLog;
  result = [(MTLLegacySVBufferErrorLog *)&v3 init];
  result->_specifiedUsage = 128;
  return result;
}

- (id)description
{
  if (self->_addressSpace == 3)
  {
    objc_super v3 = 0;
  }
  else
  {
    buffer = self->_buffer;
    if (buffer && (uint64_t v5 = [(MTLBuffer *)buffer label], buffer = self->_buffer, v5))
    {
      objc_super v3 = (__CFString *)[(MTLBuffer *)buffer label];
    }
    else if (buffer)
    {
      objc_super v3 = @"<unnamed>";
    }
    else
    {
      objc_super v3 = @"<nil>";
    }
  }
  v6 = self->_buffer;
  if (v6)
  {
    int specifiedUsage = self->_specifiedUsage;
    switch(specifiedUsage)
    {
      case 0:
        v8 = @"No";
        goto LABEL_18;
      case 1:
        v8 = @"Read Only";
        goto LABEL_18;
      case 2:
        v8 = @"Write Only";
        goto LABEL_18;
      case 3:
        v8 = @"Read Write";
        goto LABEL_18;
      default:
        if (specifiedUsage == 128)
        {
          uint64_t v9 = [NSString stringWithFormat:@"%@, length:%llu", v3, -[MTLBuffer length](v6, "length"), v20];
        }
        else
        {
          v8 = @"Unknown";
LABEL_18:
          uint64_t v9 = [NSString stringWithFormat:@"%@, length:%llu, resident:%@", v3, -[MTLBuffer length](v6, "length"), v8];
        }
        objc_super v3 = (__CFString *)v9;
        break;
    }
  }
  v10 = NSString;
  int addressSpace = self->_addressSpace;
  uint64_t v12 = MTLGPUOperationString();
  unint64_t offset = self->_offset;
  v14 = [(MTLLegacySVGPULog *)self locationDescription];
  uint64_t v15 = [(MTLArgument *)self->_argument formattedDescription:4];
  if (v3) {
    v16 = (__CFString *)[NSString stringWithFormat:@"buffer: %@", v3];
  }
  else {
    v16 = &stru_26EF29A78;
  }
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = &stru_26EF29A78;
  }
  v18 = @"threadgroup";
  if (addressSpace == 1) {
    v18 = @"device";
  }
  return (id)[v10 stringWithFormat:@"Invalid %@ %@ at offset %llu, executing %@ %@\n%@\n", v18, v12, offset, v14, v17, v16];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVBufferErrorLog;
  [(MTLLegacySVGPULog *)&v3 dealloc];
}

- (int)addressSpace
{
  return self->_addressSpace;
}

- (void)setAddressSpace:(int)a3
{
  self->_int addressSpace = a3;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_unint64_t offset = a3;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_operation = a3;
}

- (MTLArgument)argument
{
  return self->_argument;
}

- (void)setArgument:(id)a3
{
}

- (int)specifiedUsage
{
  return self->_specifiedUsage;
}

- (void)setSpecifiedUsage:(int)a3
{
  self->_int specifiedUsage = a3;
}

@end