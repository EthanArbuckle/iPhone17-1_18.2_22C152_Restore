@interface _MRUpdateOutputDevicesMessageProtobuf
+ (Class)clusterAwareOutputDevicesType;
+ (Class)outputDevicesType;
- (BOOL)hasEndpointUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)clusterAwareOutputDevices;
- (NSMutableArray)outputDevices;
- (NSString)endpointUID;
- (id)clusterAwareOutputDevicesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outputDevicesAtIndex:(unint64_t)a3;
- (unint64_t)clusterAwareOutputDevicesCount;
- (unint64_t)hash;
- (unint64_t)outputDevicesCount;
- (void)addClusterAwareOutputDevices:(id)a3;
- (void)addOutputDevices:(id)a3;
- (void)clearClusterAwareOutputDevices;
- (void)clearOutputDevices;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClusterAwareOutputDevices:(id)a3;
- (void)setEndpointUID:(id)a3;
- (void)setOutputDevices:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRUpdateOutputDevicesMessageProtobuf

- (void)clearOutputDevices
{
}

- (void)addOutputDevices:(id)a3
{
  id v4 = a3;
  outputDevices = self->_outputDevices;
  id v8 = v4;
  if (!outputDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_outputDevices;
    self->_outputDevices = v6;

    id v4 = v8;
    outputDevices = self->_outputDevices;
  }
  [(NSMutableArray *)outputDevices addObject:v4];
}

- (unint64_t)outputDevicesCount
{
  return [(NSMutableArray *)self->_outputDevices count];
}

- (id)outputDevicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_outputDevices objectAtIndex:a3];
}

+ (Class)outputDevicesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasEndpointUID
{
  return self->_endpointUID != 0;
}

- (void)clearClusterAwareOutputDevices
{
}

- (void)addClusterAwareOutputDevices:(id)a3
{
  id v4 = a3;
  clusterAwareOutputDevices = self->_clusterAwareOutputDevices;
  id v8 = v4;
  if (!clusterAwareOutputDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_clusterAwareOutputDevices;
    self->_clusterAwareOutputDevices = v6;

    id v4 = v8;
    clusterAwareOutputDevices = self->_clusterAwareOutputDevices;
  }
  [(NSMutableArray *)clusterAwareOutputDevices addObject:v4];
}

- (unint64_t)clusterAwareOutputDevicesCount
{
  return [(NSMutableArray *)self->_clusterAwareOutputDevices count];
}

- (id)clusterAwareOutputDevicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clusterAwareOutputDevices objectAtIndex:a3];
}

+ (Class)clusterAwareOutputDevicesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRUpdateOutputDevicesMessageProtobuf;
  id v4 = [(_MRUpdateOutputDevicesMessageProtobuf *)&v8 description];
  v5 = [(_MRUpdateOutputDevicesMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_outputDevices count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_outputDevices, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v5 = self->_outputDevices;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"outputDevices"];
  }
  endpointUID = self->_endpointUID;
  if (endpointUID) {
    [v3 setObject:endpointUID forKey:@"endpointUID"];
  }
  if ([(NSMutableArray *)self->_clusterAwareOutputDevices count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_clusterAwareOutputDevices, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v13 = self->_clusterAwareOutputDevices;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "dictionaryRepresentation", (void)v20);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"clusterAwareOutputDevices"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRUpdateOutputDevicesMessageProtobufReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_outputDevices;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_endpointUID) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_clusterAwareOutputDevices;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(_MRUpdateOutputDevicesMessageProtobuf *)self outputDevicesCount])
  {
    [v12 clearOutputDevices];
    unint64_t v4 = [(_MRUpdateOutputDevicesMessageProtobuf *)self outputDevicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRUpdateOutputDevicesMessageProtobuf *)self outputDevicesAtIndex:i];
        [v12 addOutputDevices:v7];
      }
    }
  }
  if (self->_endpointUID) {
    objc_msgSend(v12, "setEndpointUID:");
  }
  if ([(_MRUpdateOutputDevicesMessageProtobuf *)self clusterAwareOutputDevicesCount])
  {
    [v12 clearClusterAwareOutputDevices];
    unint64_t v8 = [(_MRUpdateOutputDevicesMessageProtobuf *)self clusterAwareOutputDevicesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(_MRUpdateOutputDevicesMessageProtobuf *)self clusterAwareOutputDevicesAtIndex:j];
        [v12 addClusterAwareOutputDevices:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = self->_outputDevices;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addOutputDevices:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_endpointUID copyWithZone:a3];
  uint64_t v13 = (void *)v5[2];
  v5[2] = v12;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_clusterAwareOutputDevices;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addClusterAwareOutputDevices:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((outputDevices = self->_outputDevices, !((unint64_t)outputDevices | v4[3]))
     || -[NSMutableArray isEqual:](outputDevices, "isEqual:"))
    && ((endpointUID = self->_endpointUID, !((unint64_t)endpointUID | v4[2]))
     || -[NSString isEqual:](endpointUID, "isEqual:")))
  {
    clusterAwareOutputDevices = self->_clusterAwareOutputDevices;
    if ((unint64_t)clusterAwareOutputDevices | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](clusterAwareOutputDevices, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_outputDevices hash];
  NSUInteger v4 = [(NSString *)self->_endpointUID hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_clusterAwareOutputDevices hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(_MRUpdateOutputDevicesMessageProtobuf *)self addOutputDevices:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[_MRUpdateOutputDevicesMessageProtobuf setEndpointUID:](self, "setEndpointUID:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[_MRUpdateOutputDevicesMessageProtobuf addClusterAwareOutputDevices:](self, "addClusterAwareOutputDevices:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)outputDevices
{
  return self->_outputDevices;
}

- (void)setOutputDevices:(id)a3
{
}

- (NSString)endpointUID
{
  return self->_endpointUID;
}

- (void)setEndpointUID:(id)a3
{
}

- (NSMutableArray)clusterAwareOutputDevices
{
  return self->_clusterAwareOutputDevices;
}

- (void)setClusterAwareOutputDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_endpointUID, 0);

  objc_storeStrong((id *)&self->_clusterAwareOutputDevices, 0);
}

@end