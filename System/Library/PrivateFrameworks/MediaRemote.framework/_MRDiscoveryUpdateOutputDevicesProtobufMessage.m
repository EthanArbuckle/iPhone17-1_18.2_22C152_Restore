@interface _MRDiscoveryUpdateOutputDevicesProtobufMessage
+ (Class)outputDevicesType;
- (BOOL)hasConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)outputDevices;
- (_MRDiscoverySessionConfigurationProtobuf)configuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outputDevicesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)outputDevicesCount;
- (void)addOutputDevices:(id)a3;
- (void)clearOutputDevices;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setOutputDevices:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRDiscoveryUpdateOutputDevicesProtobufMessage

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

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRDiscoveryUpdateOutputDevicesProtobufMessage;
  id v4 = [(_MRDiscoveryUpdateOutputDevicesProtobufMessage *)&v8 description];
  v5 = [(_MRDiscoveryUpdateOutputDevicesProtobufMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_outputDevices count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_outputDevices, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_outputDevices;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"outputDevices"];
  }
  configuration = self->_configuration;
  if (configuration)
  {
    v12 = [(_MRDiscoverySessionConfigurationProtobuf *)configuration dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"configuration"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRDiscoveryUpdateOutputDevicesProtobufMessageReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_outputDevices;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_configuration) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(_MRDiscoveryUpdateOutputDevicesProtobufMessage *)self outputDevicesCount])
  {
    [v8 clearOutputDevices];
    unint64_t v4 = [(_MRDiscoveryUpdateOutputDevicesProtobufMessage *)self outputDevicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRDiscoveryUpdateOutputDevicesProtobufMessage *)self outputDevicesAtIndex:i];
        [v8 addOutputDevices:v7];
      }
    }
  }
  if (self->_configuration) {
    objc_msgSend(v8, "setConfiguration:");
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
  uint64_t v6 = self->_outputDevices;
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
        [v5 addOutputDevices:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [(_MRDiscoverySessionConfigurationProtobuf *)self->_configuration copyWithZone:a3];
  long long v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((outputDevices = self->_outputDevices, !((unint64_t)outputDevices | v4[2]))
     || -[NSMutableArray isEqual:](outputDevices, "isEqual:")))
  {
    configuration = self->_configuration;
    if ((unint64_t)configuration | v4[1]) {
      char v7 = -[_MRDiscoverySessionConfigurationProtobuf isEqual:](configuration, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_outputDevices hash];
  return [(_MRDiscoverySessionConfigurationProtobuf *)self->_configuration hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[_MRDiscoveryUpdateOutputDevicesProtobufMessage addOutputDevices:](self, "addOutputDevices:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  configuration = self->_configuration;
  id v11 = v4[1];
  if (configuration)
  {
    if (v11) {
      -[_MRDiscoverySessionConfigurationProtobuf mergeFrom:](configuration, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[_MRDiscoveryUpdateOutputDevicesProtobufMessage setConfiguration:](self, "setConfiguration:");
  }
}

- (NSMutableArray)outputDevices
{
  return self->_outputDevices;
}

- (void)setOutputDevices:(id)a3
{
}

- (_MRDiscoverySessionConfigurationProtobuf)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end