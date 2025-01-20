@interface MRVirtualVoiceInputDeviceDescriptor
- (MRVirtualVoiceInputDeviceDescriptor)initWithData:(id)a3;
- (MRVirtualVoiceInputDeviceDescriptor)initWithProtobuf:(id)a3;
- (NSArray)supportedFormats;
- (NSData)data;
- (NSDictionary)defaultFormat;
- (_MRVoiceInputDeviceDescriptorProtobuf)protobuf;
- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation MRVirtualVoiceInputDeviceDescriptor

- (MRVirtualVoiceInputDeviceDescriptor)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [[_MRVoiceInputDeviceDescriptorProtobuf alloc] initWithData:v4];

  v6 = [(MRVirtualVoiceInputDeviceDescriptor *)self initWithProtobuf:v5];
  return v6;
}

- (MRVirtualVoiceInputDeviceDescriptor)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MRVirtualVoiceInputDeviceDescriptor;
  v5 = [(MRVirtualVoiceInputDeviceDescriptor *)&v20 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v4 supportedFormatsCount])
    {
      uint64_t v7 = 0;
      unsigned int v8 = 1;
      do
      {
        v9 = [v4 supportedFormatsAtIndex:v7];
        v10 = (void *)MEMORY[0x1E4F28F98];
        v11 = [v9 formatSettingsPlistData];
        v12 = [v10 propertyListWithData:v11 options:0 format:0 error:0];

        if (v12) {
          [v6 addObject:v12];
        }

        uint64_t v7 = v8;
      }
      while ([v4 supportedFormatsCount] > (unint64_t)v8++);
    }
    objc_storeStrong((id *)&v5->_supportedFormats, v6);
    v14 = [v4 defaultFormat];
    if ([v14 hasFormatSettingsPlistData])
    {
      v15 = (void *)MEMORY[0x1E4F28F98];
      v16 = [v14 formatSettingsPlistData];
      uint64_t v17 = [v15 propertyListWithData:v16 options:0 format:0 error:0];
      defaultFormat = v5->_defaultFormat;
      v5->_defaultFormat = (NSDictionary *)v17;
    }
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p, supportedFormats = %@, defaultFormat = %@>", objc_opt_class(), self, self->_supportedFormats, self->_defaultFormat];
}

- (NSData)data
{
  v2 = [(MRVirtualVoiceInputDeviceDescriptor *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (_MRVoiceInputDeviceDescriptorProtobuf)protobuf
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(_MRVoiceInputDeviceDescriptorProtobuf);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_supportedFormats;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(MEMORY[0x1E4F28F98], "dataWithPropertyList:format:options:error:", *(void *)(*((void *)&v14 + 1) + 8 * i), 200, 0, 0, (void)v14);
        v10 = objc_alloc_init(_MRAudioFormatSettingsProtobuf);
        [(_MRAudioFormatSettingsProtobuf *)v10 setFormatSettingsPlistData:v9];
        [(_MRVoiceInputDeviceDescriptorProtobuf *)v3 addSupportedFormats:v10];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:self->_defaultFormat format:200 options:0 error:0];
  v12 = objc_alloc_init(_MRAudioFormatSettingsProtobuf);
  [(_MRAudioFormatSettingsProtobuf *)v12 setFormatSettingsPlistData:v11];
  [(_MRVoiceInputDeviceDescriptorProtobuf *)v3 setDefaultFormat:v12];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MRVirtualVoiceInputDeviceDescriptor *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MRVirtualVoiceInputDeviceDescriptor *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  uint64_t v5 = objc_alloc_init(a4);
  uint64_t v6 = [(NSArray *)self->_supportedFormats copy];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDictionary *)self->_defaultFormat copy];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (NSArray)supportedFormats
{
  return self->_supportedFormats;
}

- (NSDictionary)defaultFormat
{
  return self->_defaultFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFormat, 0);

  objc_storeStrong((id *)&self->_supportedFormats, 0);
}

@end