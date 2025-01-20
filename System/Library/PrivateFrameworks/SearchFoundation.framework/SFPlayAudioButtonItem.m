@interface SFPlayAudioButtonItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFAudioData)audioData;
- (SFMediaMetadata)mediaMetadata;
- (SFPlayAudioButtonItem)initWithCoder:(id)a3;
- (SFPlayAudioButtonItem)initWithProtobuf:(id)a3;
- (SFToggleButtonConfiguration)toggleButtonConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioData:(id)a3;
- (void)setMediaMetadata:(id)a3;
- (void)setToggleButtonConfiguration:(id)a3;
@end

@implementation SFPlayAudioButtonItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_toggleButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
}

- (void)setAudioData:(id)a3
{
}

- (SFAudioData)audioData
{
  return self->_audioData;
}

- (void)setToggleButtonConfiguration:(id)a3
{
}

- (SFToggleButtonConfiguration)toggleButtonConfiguration
{
  return self->_toggleButtonConfiguration;
}

- (void)setMediaMetadata:(id)a3
{
}

- (SFMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)SFPlayAudioButtonItem;
  unint64_t v3 = [(SFButtonItem *)&v12 hash];
  v4 = [(SFPlayAudioButtonItem *)self mediaMetadata];
  uint64_t v5 = [v4 hash];
  v6 = [(SFPlayAudioButtonItem *)self toggleButtonConfiguration];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFPlayAudioButtonItem *)self audioData];
  uint64_t v9 = v7 ^ [v8 hash];
  unint64_t v10 = v9 ^ [(SFButtonItem *)self uniqueId] ^ v3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFPlayAudioButtonItem *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFPlayAudioButtonItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      v33.receiver = self;
      v33.super_class = (Class)SFPlayAudioButtonItem;
      if ([(SFButtonItem *)&v33 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFPlayAudioButtonItem *)self mediaMetadata];
        v8 = [(SFPlayAudioButtonItem *)v6 mediaMetadata];
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v9 = [(SFPlayAudioButtonItem *)self mediaMetadata];
        if (v9)
        {
          unint64_t v10 = [(SFPlayAudioButtonItem *)self mediaMetadata];
          unint64_t v3 = [(SFPlayAudioButtonItem *)v6 mediaMetadata];
          if (![v10 isEqual:v3])
          {
            BOOL v11 = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        objc_super v12 = [(SFPlayAudioButtonItem *)self toggleButtonConfiguration];
        v13 = [(SFPlayAudioButtonItem *)v6 toggleButtonConfiguration];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          BOOL v11 = 0;
          goto LABEL_30;
        }
        v15 = [(SFPlayAudioButtonItem *)self toggleButtonConfiguration];
        if (v15)
        {
          v26 = v12;
          v16 = [(SFPlayAudioButtonItem *)self toggleButtonConfiguration];
          v29 = [(SFPlayAudioButtonItem *)v6 toggleButtonConfiguration];
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            BOOL v11 = 0;
            objc_super v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          objc_super v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        v17 = [(SFPlayAudioButtonItem *)self audioData];
        v18 = [(SFPlayAudioButtonItem *)v6 audioData];
        if ((v17 == 0) == (v18 != 0))
        {

          BOOL v11 = 0;
          v15 = v31;
          unint64_t v3 = v28;
          if (!v31) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        v24 = v18;
        v25 = v17;
        [(SFPlayAudioButtonItem *)self audioData];
        v27 = v15 = v31;
        if (!v27
          || ([(SFPlayAudioButtonItem *)self audioData],
              v19 = objc_claimAutoreleasedReturnValue(),
              [(SFPlayAudioButtonItem *)v6 audioData],
              v22 = objc_claimAutoreleasedReturnValue(),
              v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          unint64_t v3 = v28;
          unint64_t v20 = [(SFButtonItem *)self uniqueId];
          BOOL v11 = v20 == [(SFButtonItem *)v6 uniqueId];
          if (!v27) {
            goto LABEL_27;
          }
        }
        else
        {
          BOOL v11 = 0;
          unint64_t v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          unint64_t v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    BOOL v11 = 0;
  }
LABEL_34:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFPlayAudioButtonItem;
  id v4 = [(SFButtonItem *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFPlayAudioButtonItem *)self mediaMetadata];
  v6 = (void *)[v5 copy];
  [v4 setMediaMetadata:v6];

  uint64_t v7 = [(SFPlayAudioButtonItem *)self toggleButtonConfiguration];
  v8 = (void *)[v7 copy];
  [v4 setToggleButtonConfiguration:v8];

  uint64_t v9 = [(SFPlayAudioButtonItem *)self audioData];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setAudioData:v10];

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPlayAudioButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPlayAudioButtonItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPlayAudioButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPlayAudioButtonItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBPlayAudioButtonItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBPlayAudioButtonItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFPlayAudioButtonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBPlayAudioButtonItem alloc] initWithData:v5];
  uint64_t v7 = [(SFPlayAudioButtonItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPlayAudioButtonItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFPlayAudioButtonItem;
  uint64_t v5 = [(SFPlayAudioButtonItem *)&v20 init];
  if (v5)
  {
    v6 = [v4 mediaMetadata];

    if (v6)
    {
      uint64_t v7 = [SFMediaMetadata alloc];
      v8 = [v4 mediaMetadata];
      uint64_t v9 = [(SFMediaMetadata *)v7 initWithProtobuf:v8];
      [(SFPlayAudioButtonItem *)v5 setMediaMetadata:v9];
    }
    unint64_t v10 = [v4 toggleButtonConfiguration];

    if (v10)
    {
      BOOL v11 = [SFToggleButtonConfiguration alloc];
      objc_super v12 = [v4 toggleButtonConfiguration];
      v13 = [(SFToggleButtonConfiguration *)v11 initWithProtobuf:v12];
      [(SFPlayAudioButtonItem *)v5 setToggleButtonConfiguration:v13];
    }
    v14 = [v4 audioData];

    if (v14)
    {
      v15 = [SFAudioData alloc];
      v16 = [v4 audioData];
      v17 = [(SFAudioData *)v15 initWithProtobuf:v16];
      [(SFPlayAudioButtonItem *)v5 setAudioData:v17];
    }
    if ([v4 uniqueId]) {
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v18 = v5;
  }

  return v5;
}

@end