@interface SNNMILDataValue
- (BOOL)isScalar;
- (NSArray)dimensions;
- (NSData)data;
- (SNNMILDataValue)initWithScalar:(id)a3 dataType:(unint64_t)a4;
- (SNNMILDataValue)initWithShape:(id)a3 bytes:(const void *)a4 dataType:(unint64_t)a5;
- (SNNMILDataValue)initWithShape:(id)a3 bytesNoCopy:(void *)a4 dataType:(unint64_t)a5;
- (SNNMILDataValue)initWithShape:(id)a3 scalars:(id)a4 dataType:(unint64_t)a5;
- (SNNMILDataValue)initWithStringScalar:(id)a3;
- (int64_t)rank;
- (int64_t)scalarCount;
- (unint64_t)byteCount;
- (unint64_t)dataType;
- (unique_ptr<const)milValueWithContext:(id)a3;
- (void)bytes;
@end

@implementation SNNMILDataValue

- (SNNMILDataValue)initWithStringScalar:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNNMILDataValue;
  v5 = [(SNNMILValue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 dataUsingEncoding:4];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_dataType = 1;
  }

  return v5;
}

- (SNNMILDataValue)initWithScalar:(id)a3 dataType:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SNNMILDataValue;
  v7 = [(SNNMILValue *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithScalar:v6 dataType:a4];
    data = v7->_data;
    v7->_data = (NSData *)v8;

    v7->_dataType = a4;
  }

  return v7;
}

- (SNNMILDataValue)initWithShape:(id)a3 scalars:(id)a4 dataType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SNNMILDataValue;
  objc_super v11 = [(SNNMILValue *)&v18 init];
  if (v11)
  {
    if (a5 - 2 > 0xA) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = qword_2576AB700[a5 - 2];
    }
    uint64_t v13 = [v10 count];
    v14 = (NSData *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:v13 * v12];
    [(NSData *)v14 appendScalars:v10 dataType:a5];
    data = v11->_data;
    v11->_data = v14;
    v16 = v14;

    objc_storeStrong((id *)&v11->_dimensions, a3);
    v11->_dataType = a5;
  }

  return v11;
}

- (SNNMILDataValue)initWithShape:(id)a3 bytes:(const void *)a4 dataType:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SNNMILDataValue;
  id v10 = [(SNNMILValue *)&v24 init];
  if (v10)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      uint64_t v14 = 1;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v11);
          }
          v14 *= objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "unsignedIntegerValue", (void)v20);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v14 = 1;
    }

    if (a5 - 2 > 0xA) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = qword_2576AB700[a5 - 2];
    }
    uint64_t v17 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a4 length:v16 * v14];
    data = v10->_data;
    v10->_data = (NSData *)v17;

    objc_storeStrong((id *)&v10->_dimensions, a3);
    v10->_dataType = a5;
  }

  return v10;
}

- (SNNMILDataValue)initWithShape:(id)a3 bytesNoCopy:(void *)a4 dataType:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SNNMILDataValue;
  id v10 = [(SNNMILValue *)&v24 init];
  if (v10)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      uint64_t v14 = 1;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v11);
          }
          v14 *= objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "unsignedIntegerValue", (void)v20);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v14 = 1;
    }

    if (a5 - 2 > 0xA) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = qword_2576AB700[a5 - 2];
    }
    uint64_t v17 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a4 length:v16 * v14 freeWhenDone:0];
    data = v10->_data;
    v10->_data = (NSData *)v17;

    objc_storeStrong((id *)&v10->_dimensions, a3);
    v10->_dataType = a5;
  }

  return v10;
}

- (void)bytes
{
  id v2 = [(SNNMILDataValue *)self data];
  v3 = (void *)[v2 bytes];

  return v3;
}

- (unint64_t)byteCount
{
  id v2 = [(SNNMILDataValue *)self data];
  unint64_t v3 = [v2 length];

  return v3;
}

- (BOOL)isScalar
{
  unint64_t v3 = [(SNNMILDataValue *)self dimensions];
  if (v3)
  {
    id v4 = [(SNNMILDataValue *)self dimensions];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (int64_t)rank
{
  unint64_t v3 = [(SNNMILDataValue *)self dimensions];

  if (v3)
  {
    id v4 = [(SNNMILDataValue *)self dimensions];
    unint64_t v3 = (void *)[v4 count];
  }
  return (int64_t)v3;
}

- (int64_t)scalarCount
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SNNMILDataValue *)self dimensions];

  if (!v3) {
    return 1;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(SNNMILDataValue *)self dimensions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    int64_t v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v7 *= [*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (unique_ptr<const)milValueWithContext:(id)a3
{
  uint64_t v5 = v3;
  id v14 = a3;
  uint64_t v6 = [(SNNMILDataValue *)self dimensions];

  if (v6)
  {
    int64_t v7 = [(SNNMILDataValue *)self bytes];
    uint64_t v8 = [(SNNMILDataValue *)self dimensions];
    unint64_t v9 = [(SNNMILDataValue *)self dataType];
    if (v14) {
      [v14 milValueForTensorWithBytes:v7 shape:v8 dataType:v9];
    }
    else {
      void *v5 = 0;
    }
  }
  else if ([(SNNMILDataValue *)self dataType] == 1)
  {
    long long v10 = (void *)[[NSString alloc] initWithData:self->_data encoding:4];
    if (v14) {
      [v14 milValueForString:v10];
    }
    else {
      void *v5 = 0;
    }
  }
  else
  {
    long long v11 = [(SNNMILDataValue *)self bytes];
    unint64_t v12 = [(SNNMILDataValue *)self dataType];
    if (v14) {
      [v14 milValueForScalarWithBytes:v11 dataType:v12];
    }
    else {
      void *v5 = 0;
    }
  }

  return v13;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end