@interface NTPBBucketGroupConfigResponse
- (BOOL)hasBucketGroupConfig;
- (BOOL)hasDomainBloomFilterInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NTPBBloomFilterInfo)domainBloomFilterInfo;
- (NTPBBucketGroupConfig)bucketGroupConfig;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setBucketGroupConfig:(id)a3;
- (void)setDomainBloomFilterInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBBucketGroupConfigResponse

- (BOOL)hasBucketGroupConfig
{
  return self->_bucketGroupConfig != 0;
}

- (BOOL)hasDomainBloomFilterInfo
{
  return self->_domainBloomFilterInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBBucketGroupConfigResponse;
  v4 = [(NTPBBucketGroupConfigResponse *)&v8 description];
  v5 = [(NTPBBucketGroupConfigResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  bucketGroupConfig = self->_bucketGroupConfig;
  if (bucketGroupConfig)
  {
    v5 = [(NTPBBucketGroupConfig *)bucketGroupConfig dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"bucket_group_config"];
  }
  domainBloomFilterInfo = self->_domainBloomFilterInfo;
  if (domainBloomFilterInfo)
  {
    v7 = [(NTPBBloomFilterInfo *)domainBloomFilterInfo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"domain_bloom_filter_info"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBucketGroupConfigResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bucketGroupConfig)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_domainBloomFilterInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NTPBBucketGroupConfig *)self->_bucketGroupConfig copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NTPBBloomFilterInfo *)self->_domainBloomFilterInfo copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((bucketGroupConfig = self->_bucketGroupConfig, !((unint64_t)bucketGroupConfig | v4[1]))
     || -[NTPBBucketGroupConfig isEqual:](bucketGroupConfig, "isEqual:")))
  {
    domainBloomFilterInfo = self->_domainBloomFilterInfo;
    if ((unint64_t)domainBloomFilterInfo | v4[2]) {
      char v7 = -[NTPBBloomFilterInfo isEqual:](domainBloomFilterInfo, "isEqual:");
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
  unint64_t v3 = [(NTPBBucketGroupConfig *)self->_bucketGroupConfig hash];
  return [(NTPBBloomFilterInfo *)self->_domainBloomFilterInfo hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  bucketGroupConfig = self->_bucketGroupConfig;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (bucketGroupConfig)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NTPBBucketGroupConfig mergeFrom:](bucketGroupConfig, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NTPBBucketGroupConfigResponse setBucketGroupConfig:](self, "setBucketGroupConfig:");
  }
  id v4 = v9;
LABEL_7:
  domainBloomFilterInfo = self->_domainBloomFilterInfo;
  uint64_t v8 = v4[2];
  if (domainBloomFilterInfo)
  {
    if (v8) {
      -[NTPBBloomFilterInfo mergeFrom:](domainBloomFilterInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBBucketGroupConfigResponse setDomainBloomFilterInfo:](self, "setDomainBloomFilterInfo:");
  }

  MEMORY[0x270F9A758]();
}

- (NTPBBucketGroupConfig)bucketGroupConfig
{
  return self->_bucketGroupConfig;
}

- (void)setBucketGroupConfig:(id)a3
{
}

- (NTPBBloomFilterInfo)domainBloomFilterInfo
{
  return self->_domainBloomFilterInfo;
}

- (void)setDomainBloomFilterInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainBloomFilterInfo, 0);

  objc_storeStrong((id *)&self->_bucketGroupConfig, 0);
}

@end