@interface _SFPBSubscribeForUpdatesCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBCloudChannelsRequestItem)cloudChannelsRequestItem;
- (_SFPBDomainSubscriptionRequestItem)domainSubscriptionRequestItem;
- (_SFPBSubscribeForUpdatesCommand)initWithDictionary:(id)a3;
- (_SFPBSubscribeForUpdatesCommand)initWithFacade:(id)a3;
- (_SFPBSubscribeForUpdatesCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setCloudChannelsRequestItem:(id)a3;
- (void)setDomainSubscriptionRequestItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSubscribeForUpdatesCommand

- (_SFPBSubscribeForUpdatesCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBSubscribeForUpdatesCommand *)self init];
  if (v5)
  {
    v6 = [v4 cloudChannelsRequestItem];

    if (v6)
    {
      v7 = [_SFPBCloudChannelsRequestItem alloc];
      v8 = [v4 cloudChannelsRequestItem];
      v9 = [(_SFPBCloudChannelsRequestItem *)v7 initWithFacade:v8];
      [(_SFPBSubscribeForUpdatesCommand *)v5 setCloudChannelsRequestItem:v9];
    }
    v10 = [v4 domainSubscriptionRequestItem];

    if (v10)
    {
      v11 = [_SFPBDomainSubscriptionRequestItem alloc];
      v12 = [v4 domainSubscriptionRequestItem];
      v13 = [(_SFPBDomainSubscriptionRequestItem *)v11 initWithFacade:v12];
      [(_SFPBSubscribeForUpdatesCommand *)v5 setDomainSubscriptionRequestItem:v13];
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainSubscriptionRequestItem, 0);
  objc_storeStrong((id *)&self->_cloudChannelsRequestItem, 0);
}

- (_SFPBDomainSubscriptionRequestItem)domainSubscriptionRequestItem
{
  return self->_domainSubscriptionRequestItem;
}

- (_SFPBCloudChannelsRequestItem)cloudChannelsRequestItem
{
  return self->_cloudChannelsRequestItem;
}

- (_SFPBSubscribeForUpdatesCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBSubscribeForUpdatesCommand;
  v5 = [(_SFPBSubscribeForUpdatesCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"cloudChannelsRequestItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBCloudChannelsRequestItem alloc] initWithDictionary:v6];
      [(_SFPBSubscribeForUpdatesCommand *)v5 setCloudChannelsRequestItem:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"domainSubscriptionRequestItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBDomainSubscriptionRequestItem alloc] initWithDictionary:v8];
      [(_SFPBSubscribeForUpdatesCommand *)v5 setDomainSubscriptionRequestItem:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBSubscribeForUpdatesCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSubscribeForUpdatesCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSubscribeForUpdatesCommand *)self dictionaryRepresentation];
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
  if (self->_cloudChannelsRequestItem)
  {
    id v4 = [(_SFPBSubscribeForUpdatesCommand *)self cloudChannelsRequestItem];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"cloudChannelsRequestItem"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"cloudChannelsRequestItem"];
    }
  }
  if (self->_domainSubscriptionRequestItem)
  {
    uint64_t v7 = [(_SFPBSubscribeForUpdatesCommand *)self domainSubscriptionRequestItem];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"domainSubscriptionRequestItem"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"domainSubscriptionRequestItem"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBCloudChannelsRequestItem *)self->_cloudChannelsRequestItem hash];
  return [(_SFPBDomainSubscriptionRequestItem *)self->_domainSubscriptionRequestItem hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBSubscribeForUpdatesCommand *)self cloudChannelsRequestItem];
  v6 = [v4 cloudChannelsRequestItem];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBSubscribeForUpdatesCommand *)self cloudChannelsRequestItem];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBSubscribeForUpdatesCommand *)self cloudChannelsRequestItem];
    v10 = [v4 cloudChannelsRequestItem];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBSubscribeForUpdatesCommand *)self domainSubscriptionRequestItem];
  v6 = [v4 domainSubscriptionRequestItem];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBSubscribeForUpdatesCommand *)self domainSubscriptionRequestItem];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBSubscribeForUpdatesCommand *)self domainSubscriptionRequestItem];
    v15 = [v4 domainSubscriptionRequestItem];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBSubscribeForUpdatesCommand *)self cloudChannelsRequestItem];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBSubscribeForUpdatesCommand *)self domainSubscriptionRequestItem];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSubscribeForUpdatesCommandReadFrom(self, (uint64_t)a3);
}

- (void)setDomainSubscriptionRequestItem:(id)a3
{
}

- (void)setCloudChannelsRequestItem:(id)a3
{
}

@end