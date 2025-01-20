@interface SECC2MPServerInfo
- (BOOL)hasPartition;
- (BOOL)hasServiceBuild;
- (BOOL)hasServiceInstance;
- (BOOL)hasServiceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)partition;
- (NSString)serviceBuild;
- (NSString)serviceInstance;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPartition:(id)a3;
- (void)setServiceBuild:(id)a3;
- (void)setServiceInstance:(id)a3;
- (void)setServiceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPServerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serviceInstance, 0);
  objc_storeStrong((id *)&self->_serviceBuild, 0);

  objc_storeStrong((id *)&self->_partition, 0);
}

- (void)setServiceInstance:(id)a3
{
}

- (NSString)serviceInstance
{
  return self->_serviceInstance;
}

- (void)setServiceBuild:(id)a3
{
}

- (NSString)serviceBuild
{
  return self->_serviceBuild;
}

- (void)setPartition:(id)a3
{
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[4]) {
    -[SECC2MPServerInfo setServiceName:](self, "setServiceName:");
  }
  if (v4[1]) {
    -[SECC2MPServerInfo setPartition:](self, "setPartition:");
  }
  if (v4[2]) {
    -[SECC2MPServerInfo setServiceBuild:](self, "setServiceBuild:");
  }
  if (v4[3]) {
    -[SECC2MPServerInfo setServiceInstance:](self, "setServiceInstance:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_serviceName hash];
  unint64_t v4 = [(NSString *)self->_partition hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_serviceBuild hash];
  return v4 ^ v5 ^ [(NSString *)self->_serviceInstance hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((serviceName = self->_serviceName, !((unint64_t)serviceName | v4[4]))
     || -[NSString isEqual:](serviceName, "isEqual:"))
    && ((partition = self->_partition, !((unint64_t)partition | v4[1]))
     || -[NSString isEqual:](partition, "isEqual:"))
    && ((serviceBuild = self->_serviceBuild, !((unint64_t)serviceBuild | v4[2]))
     || -[NSString isEqual:](serviceBuild, "isEqual:")))
  {
    serviceInstance = self->_serviceInstance;
    if ((unint64_t)serviceInstance | v4[3]) {
      unsigned __int8 v9 = -[NSString isEqual:](serviceInstance, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_serviceName copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_partition copyWithZone:a3];
  unsigned __int8 v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSString *)self->_serviceBuild copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(NSString *)self->_serviceInstance copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceName)
  {
    [v4 setServiceName:];
    id v4 = v5;
  }
  if (self->_partition)
  {
    [v5 setPartition:];
    id v4 = v5;
  }
  if (self->_serviceBuild)
  {
    [v5 setServiceBuild:];
    id v4 = v5;
  }
  if (self->_serviceInstance)
  {
    [v5 setServiceInstance:];
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_partition)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_serviceBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_serviceInstance)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001D7B80((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  serviceName = self->_serviceName;
  if (serviceName) {
    [v3 setObject:serviceName forKey:@"service_name"];
  }
  partition = self->_partition;
  if (partition) {
    [v4 setObject:partition forKey:@"partition"];
  }
  serviceBuild = self->_serviceBuild;
  if (serviceBuild) {
    [v4 setObject:serviceBuild forKey:@"service_build"];
  }
  serviceInstance = self->_serviceInstance;
  if (serviceInstance) {
    [v4 setObject:serviceInstance forKey:@"service_instance"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SECC2MPServerInfo;
  NSUInteger v3 = [(SECC2MPServerInfo *)&v7 description];
  id v4 = [(SECC2MPServerInfo *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasServiceInstance
{
  return self->_serviceInstance != 0;
}

- (BOOL)hasServiceBuild
{
  return self->_serviceBuild != 0;
}

- (BOOL)hasPartition
{
  return self->_partition != 0;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

@end