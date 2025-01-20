@interface SFCloudChannelsRequestItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)channelIdentifier;
- (NSString)pushTopic;
- (NSString)subscribedEntityIdentifier;
- (SFCloudChannelsRequestItem)initWithCoder:(id)a3;
- (SFCloudChannelsRequestItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChannelIdentifier:(id)a3;
- (void)setPushTopic:(id)a3;
- (void)setSubscribedEntityIdentifier:(id)a3;
@end

@implementation SFCloudChannelsRequestItem

- (SFCloudChannelsRequestItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFCloudChannelsRequestItem;
  v5 = [(SFCloudChannelsRequestItem *)&v14 init];
  if (v5)
  {
    v6 = [v4 channelIdentifier];

    if (v6)
    {
      v7 = [v4 channelIdentifier];
      [(SFCloudChannelsRequestItem *)v5 setChannelIdentifier:v7];
    }
    v8 = [v4 pushTopic];

    if (v8)
    {
      v9 = [v4 pushTopic];
      [(SFCloudChannelsRequestItem *)v5 setPushTopic:v9];
    }
    v10 = [v4 subscribedEntityIdentifier];

    if (v10)
    {
      v11 = [v4 subscribedEntityIdentifier];
      [(SFCloudChannelsRequestItem *)v5 setSubscribedEntityIdentifier:v11];
    }
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

- (void)setSubscribedEntityIdentifier:(id)a3
{
}

- (NSString)subscribedEntityIdentifier
{
  return self->_subscribedEntityIdentifier;
}

- (void)setPushTopic:(id)a3
{
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setChannelIdentifier:(id)a3
{
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (unint64_t)hash
{
  v3 = [(SFCloudChannelsRequestItem *)self channelIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(SFCloudChannelsRequestItem *)self pushTopic];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFCloudChannelsRequestItem *)self subscribedEntityIdentifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFCloudChannelsRequestItem *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFCloudChannelsRequestItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFCloudChannelsRequestItem *)self channelIdentifier];
      unint64_t v8 = [(SFCloudChannelsRequestItem *)v6 channelIdentifier];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v9 = [(SFCloudChannelsRequestItem *)self channelIdentifier];
      if (v9)
      {
        v3 = [(SFCloudChannelsRequestItem *)self channelIdentifier];
        v10 = [(SFCloudChannelsRequestItem *)v6 channelIdentifier];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      v12 = [(SFCloudChannelsRequestItem *)self pushTopic];
      v13 = [(SFCloudChannelsRequestItem *)v6 pushTopic];
      objc_super v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_27;
      }
      v15 = [(SFCloudChannelsRequestItem *)self pushTopic];
      if (v15)
      {
        v25 = v12;
        v16 = [(SFCloudChannelsRequestItem *)self pushTopic];
        v28 = [(SFCloudChannelsRequestItem *)v6 pushTopic];
        v29 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v11 = 0;
          v12 = v25;
          goto LABEL_25;
        }
        v30 = v15;
        v27 = v3;
        v12 = v25;
      }
      else
      {
        v30 = 0;
        v27 = v3;
      }
      v17 = [(SFCloudChannelsRequestItem *)self subscribedEntityIdentifier];
      v18 = [(SFCloudChannelsRequestItem *)v6 subscribedEntityIdentifier];
      if ((v17 == 0) == (v18 != 0))
      {

        char v11 = 0;
        v3 = v27;
        v15 = v30;
        if (!v30) {
          goto LABEL_26;
        }
      }
      else
      {
        v24 = v17;
        v26 = v18;
        uint64_t v19 = [(SFCloudChannelsRequestItem *)self subscribedEntityIdentifier];
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          v22 = [(SFCloudChannelsRequestItem *)self subscribedEntityIdentifier];
          v20 = [(SFCloudChannelsRequestItem *)v6 subscribedEntityIdentifier];
          char v11 = objc_msgSend(v22, "isEqual:");
        }
        else
        {

          char v11 = 1;
        }
        v3 = v27;
        if (!v30) {
          goto LABEL_26;
        }
      }
LABEL_25:

LABEL_26:
LABEL_27:
      v10 = v31;
      if (!v9)
      {
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    char v11 = 0;
  }
LABEL_31:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFCloudChannelsRequestItem *)self channelIdentifier];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setChannelIdentifier:v6];

  v7 = [(SFCloudChannelsRequestItem *)self pushTopic];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setPushTopic:v8];

  v9 = [(SFCloudChannelsRequestItem *)self subscribedEntityIdentifier];
  v10 = (void *)[v9 copy];
  [v4 setSubscribedEntityIdentifier:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCloudChannelsRequestItem alloc] initWithFacade:self];
  v3 = [(_SFPBCloudChannelsRequestItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCloudChannelsRequestItem alloc] initWithFacade:self];
  v3 = [(_SFPBCloudChannelsRequestItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBCloudChannelsRequestItem alloc] initWithFacade:self];
  v5 = [(_SFPBCloudChannelsRequestItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCloudChannelsRequestItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBCloudChannelsRequestItem alloc] initWithData:v5];
  v7 = [(SFCloudChannelsRequestItem *)self initWithProtobuf:v6];

  return v7;
}

@end