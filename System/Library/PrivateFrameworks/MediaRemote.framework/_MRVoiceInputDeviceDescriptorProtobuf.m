@interface _MRVoiceInputDeviceDescriptorProtobuf
+ (Class)supportedFormatsType;
- (BOOL)hasDefaultFormat;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)supportedFormats;
- (_MRAudioFormatSettingsProtobuf)defaultFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)supportedFormatsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)supportedFormatsCount;
- (void)addSupportedFormats:(id)a3;
- (void)clearSupportedFormats;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDefaultFormat:(id)a3;
- (void)setSupportedFormats:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRVoiceInputDeviceDescriptorProtobuf

- (void)clearSupportedFormats
{
}

- (void)addSupportedFormats:(id)a3
{
  id v4 = a3;
  supportedFormats = self->_supportedFormats;
  id v8 = v4;
  if (!supportedFormats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_supportedFormats;
    self->_supportedFormats = v6;

    id v4 = v8;
    supportedFormats = self->_supportedFormats;
  }
  [(NSMutableArray *)supportedFormats addObject:v4];
}

- (unint64_t)supportedFormatsCount
{
  return [(NSMutableArray *)self->_supportedFormats count];
}

- (id)supportedFormatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_supportedFormats objectAtIndex:a3];
}

+ (Class)supportedFormatsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDefaultFormat
{
  return self->_defaultFormat != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRVoiceInputDeviceDescriptorProtobuf;
  id v4 = [(_MRVoiceInputDeviceDescriptorProtobuf *)&v8 description];
  v5 = [(_MRVoiceInputDeviceDescriptorProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_supportedFormats count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_supportedFormats, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_supportedFormats;
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

    [v3 setObject:v4 forKey:@"supportedFormats"];
  }
  defaultFormat = self->_defaultFormat;
  if (defaultFormat)
  {
    v12 = [(_MRAudioFormatSettingsProtobuf *)defaultFormat dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"defaultFormat"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVoiceInputDeviceDescriptorProtobufReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_supportedFormats;
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

  if (self->_defaultFormat) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(_MRVoiceInputDeviceDescriptorProtobuf *)self supportedFormatsCount])
  {
    [v8 clearSupportedFormats];
    unint64_t v4 = [(_MRVoiceInputDeviceDescriptorProtobuf *)self supportedFormatsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRVoiceInputDeviceDescriptorProtobuf *)self supportedFormatsAtIndex:i];
        [v8 addSupportedFormats:v7];
      }
    }
  }
  if (self->_defaultFormat) {
    objc_msgSend(v8, "setDefaultFormat:");
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
  uint64_t v6 = self->_supportedFormats;
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
        [v5 addSupportedFormats:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [(_MRAudioFormatSettingsProtobuf *)self->_defaultFormat copyWithZone:a3];
  long long v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((supportedFormats = self->_supportedFormats, !((unint64_t)supportedFormats | v4[2]))
     || -[NSMutableArray isEqual:](supportedFormats, "isEqual:")))
  {
    defaultFormat = self->_defaultFormat;
    if ((unint64_t)defaultFormat | v4[1]) {
      char v7 = -[_MRAudioFormatSettingsProtobuf isEqual:](defaultFormat, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_supportedFormats hash];
  return [(_MRAudioFormatSettingsProtobuf *)self->_defaultFormat hash] ^ v3;
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
        -[_MRVoiceInputDeviceDescriptorProtobuf addSupportedFormats:](self, "addSupportedFormats:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  defaultFormat = self->_defaultFormat;
  id v11 = v4[1];
  if (defaultFormat)
  {
    if (v11) {
      -[_MRAudioFormatSettingsProtobuf mergeFrom:](defaultFormat, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[_MRVoiceInputDeviceDescriptorProtobuf setDefaultFormat:](self, "setDefaultFormat:");
  }
}

- (NSMutableArray)supportedFormats
{
  return self->_supportedFormats;
}

- (void)setSupportedFormats:(id)a3
{
}

- (_MRAudioFormatSettingsProtobuf)defaultFormat
{
  return self->_defaultFormat;
}

- (void)setDefaultFormat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFormats, 0);

  objc_storeStrong((id *)&self->_defaultFormat, 0);
}

@end