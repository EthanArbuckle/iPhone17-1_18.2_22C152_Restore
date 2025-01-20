@interface SNNMILBlobValue
- (NSArray)dimensions;
- (NSNumber)offset;
- (NSString)filename;
- (SNNMILBlobValue)initWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6;
- (unint64_t)dataType;
- (unint64_t)length;
- (unique_ptr<const)milValueWithContext:(id)a3;
@end

@implementation SNNMILBlobValue

- (SNNMILBlobValue)initWithFilename:(id)a3 shape:(id)a4 dataType:(unint64_t)a5 offset:(id)a6
{
  v10 = (NSString *)a3;
  v11 = (NSArray *)a4;
  v12 = (NSNumber *)a6;
  v20.receiver = self;
  v20.super_class = (Class)SNNMILBlobValue;
  v13 = [(SNNMILValue *)&v20 init];
  filename = v13->_filename;
  v13->_filename = v10;
  v15 = v10;

  dimensions = v13->_dimensions;
  v13->_dimensions = v11;
  v17 = v11;

  v13->_dataType = a5;
  offset = v13->_offset;
  v13->_offset = v12;

  return v13;
}

- (unint64_t)length
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(SNNMILBlobValue *)self dimensions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    unsigned int v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        v6 *= [*(id *)(*((void *)&v12 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
    uint64_t v8 = v6;
  }
  else
  {
    uint64_t v8 = 1;
  }

  unint64_t v9 = [(SNNMILBlobValue *)self dataType];
  if (v9 - 2 > 0xA) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = qword_2576AB700[v9 - 2];
  }
  return v10 * v8;
}

- (unique_ptr<const)milValueWithContext:(id)a3
{
  uint64_t v5 = v3;
  id v11 = a3;
  unsigned int v6 = [(SNNMILBlobValue *)self filename];
  v7 = [(SNNMILBlobValue *)self dimensions];
  unint64_t v8 = [(SNNMILBlobValue *)self dataType];
  unint64_t v9 = [(SNNMILBlobValue *)self offset];
  if (v11) {
    [v11 milValueForTensorBlobWithFilename:v6 shape:v7 dataType:v8 offset:v9];
  }
  else {
    *uint64_t v5 = 0;
  }

  return v10;
}

- (NSString)filename
{
  return self->_filename;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (NSNumber)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

@end