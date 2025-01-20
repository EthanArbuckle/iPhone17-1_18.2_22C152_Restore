@interface _SFPBCloudChannelsRequestItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)channelIdentifier;
- (NSString)pushTopic;
- (NSString)subscribedEntityIdentifier;
- (_SFPBCloudChannelsRequestItem)initWithDictionary:(id)a3;
- (_SFPBCloudChannelsRequestItem)initWithFacade:(id)a3;
- (_SFPBCloudChannelsRequestItem)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setChannelIdentifier:(id)a3;
- (void)setPushTopic:(id)a3;
- (void)setSubscribedEntityIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCloudChannelsRequestItem

- (_SFPBCloudChannelsRequestItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCloudChannelsRequestItem *)self init];
  if (v5)
  {
    v6 = [v4 channelIdentifier];

    if (v6)
    {
      v7 = [v4 channelIdentifier];
      [(_SFPBCloudChannelsRequestItem *)v5 setChannelIdentifier:v7];
    }
    v8 = [v4 pushTopic];

    if (v8)
    {
      v9 = [v4 pushTopic];
      [(_SFPBCloudChannelsRequestItem *)v5 setPushTopic:v9];
    }
    v10 = [v4 subscribedEntityIdentifier];

    if (v10)
    {
      v11 = [v4 subscribedEntityIdentifier];
      [(_SFPBCloudChannelsRequestItem *)v5 setSubscribedEntityIdentifier:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

- (NSString)subscribedEntityIdentifier
{
  return self->_subscribedEntityIdentifier;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (_SFPBCloudChannelsRequestItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBCloudChannelsRequestItem;
  v5 = [(_SFPBCloudChannelsRequestItem *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"channelIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBCloudChannelsRequestItem *)v5 setChannelIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"pushTopic"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBCloudChannelsRequestItem *)v5 setPushTopic:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"subscribedEntityIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBCloudChannelsRequestItem *)v5 setSubscribedEntityIdentifier:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBCloudChannelsRequestItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCloudChannelsRequestItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCloudChannelsRequestItem *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_channelIdentifier)
  {
    id v4 = [(_SFPBCloudChannelsRequestItem *)self channelIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"channelIdentifier"];
  }
  if (self->_pushTopic)
  {
    v6 = [(_SFPBCloudChannelsRequestItem *)self pushTopic];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"pushTopic"];
  }
  if (self->_subscribedEntityIdentifier)
  {
    v8 = [(_SFPBCloudChannelsRequestItem *)self subscribedEntityIdentifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"subscribedEntityIdentifier"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_channelIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_pushTopic hash] ^ v3;
  return v4 ^ [(NSString *)self->_subscribedEntityIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBCloudChannelsRequestItem *)self channelIdentifier];
  v6 = [v4 channelIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBCloudChannelsRequestItem *)self channelIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBCloudChannelsRequestItem *)self channelIdentifier];
    v10 = [v4 channelIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBCloudChannelsRequestItem *)self pushTopic];
  v6 = [v4 pushTopic];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBCloudChannelsRequestItem *)self pushTopic];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(_SFPBCloudChannelsRequestItem *)self pushTopic];
    v15 = [v4 pushTopic];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBCloudChannelsRequestItem *)self subscribedEntityIdentifier];
  v6 = [v4 subscribedEntityIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBCloudChannelsRequestItem *)self subscribedEntityIdentifier];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBCloudChannelsRequestItem *)self subscribedEntityIdentifier];
    v20 = [v4 subscribedEntityIdentifier];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_SFPBCloudChannelsRequestItem *)self channelIdentifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBCloudChannelsRequestItem *)self pushTopic];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBCloudChannelsRequestItem *)self subscribedEntityIdentifier];
  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCloudChannelsRequestItemReadFrom(self, (uint64_t)a3);
}

- (void)setSubscribedEntityIdentifier:(id)a3
{
  self->_subscribedEntityIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPushTopic:(id)a3
{
  self->_pushTopic = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setChannelIdentifier:(id)a3
{
  self->_channelIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end