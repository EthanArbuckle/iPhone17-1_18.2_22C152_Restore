@interface _MRRemoveOutputDevicesMessageProtobuf
+ (Class)outputDeviceUIDsType;
- (BOOL)hasEndpointUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)outputDeviceUIDs;
- (NSString)endpointUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outputDeviceUIDsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)outputDeviceUIDsCount;
- (void)addOutputDeviceUIDs:(id)a3;
- (void)clearOutputDeviceUIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndpointUID:(id)a3;
- (void)setOutputDeviceUIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRRemoveOutputDevicesMessageProtobuf

- (void)clearOutputDeviceUIDs
{
}

- (void)addOutputDeviceUIDs:(id)a3
{
  id v4 = a3;
  outputDeviceUIDs = self->_outputDeviceUIDs;
  id v8 = v4;
  if (!outputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_outputDeviceUIDs;
    self->_outputDeviceUIDs = v6;

    id v4 = v8;
    outputDeviceUIDs = self->_outputDeviceUIDs;
  }
  [(NSMutableArray *)outputDeviceUIDs addObject:v4];
}

- (unint64_t)outputDeviceUIDsCount
{
  return [(NSMutableArray *)self->_outputDeviceUIDs count];
}

- (id)outputDeviceUIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_outputDeviceUIDs objectAtIndex:a3];
}

+ (Class)outputDeviceUIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasEndpointUID
{
  return self->_endpointUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRRemoveOutputDevicesMessageProtobuf;
  id v4 = [(_MRRemoveOutputDevicesMessageProtobuf *)&v8 description];
  v5 = [(_MRRemoveOutputDevicesMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  outputDeviceUIDs = self->_outputDeviceUIDs;
  if (outputDeviceUIDs) {
    [v3 setObject:outputDeviceUIDs forKey:@"outputDeviceUIDs"];
  }
  endpointUID = self->_endpointUID;
  if (endpointUID) {
    [v4 setObject:endpointUID forKey:@"endpointUID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRemoveOutputDevicesMessageProtobufReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_outputDeviceUIDs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_endpointUID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(_MRRemoveOutputDevicesMessageProtobuf *)self outputDeviceUIDsCount])
  {
    [v8 clearOutputDeviceUIDs];
    unint64_t v4 = [(_MRRemoveOutputDevicesMessageProtobuf *)self outputDeviceUIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRRemoveOutputDevicesMessageProtobuf *)self outputDeviceUIDsAtIndex:i];
        [v8 addOutputDeviceUIDs:v7];
      }
    }
  }
  if (self->_endpointUID) {
    objc_msgSend(v8, "setEndpointUID:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_outputDeviceUIDs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addOutputDeviceUIDs:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_endpointUID copyWithZone:a3];
  long long v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((outputDeviceUIDs = self->_outputDeviceUIDs, !((unint64_t)outputDeviceUIDs | v4[2]))
     || -[NSMutableArray isEqual:](outputDeviceUIDs, "isEqual:")))
  {
    endpointUID = self->_endpointUID;
    if ((unint64_t)endpointUID | v4[1]) {
      char v7 = -[NSString isEqual:](endpointUID, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_outputDeviceUIDs hash];
  return [(NSString *)self->_endpointUID hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[_MRRemoveOutputDevicesMessageProtobuf addOutputDeviceUIDs:](self, "addOutputDeviceUIDs:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[1]) {
    -[_MRRemoveOutputDevicesMessageProtobuf setEndpointUID:](self, "setEndpointUID:");
  }
}

- (NSMutableArray)outputDeviceUIDs
{
  return self->_outputDeviceUIDs;
}

- (void)setOutputDeviceUIDs:(id)a3
{
}

- (NSString)endpointUID
{
  return self->_endpointUID;
}

- (void)setEndpointUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUIDs, 0);

  objc_storeStrong((id *)&self->_endpointUID, 0);
}

@end