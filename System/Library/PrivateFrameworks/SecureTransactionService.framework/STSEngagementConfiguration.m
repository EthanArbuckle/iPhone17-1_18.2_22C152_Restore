@interface STSEngagementConfiguration
+ (id)configurationWithDeviceEngagementType:(unint64_t)a3 dataRetrievalType:(unint64_t)a4 engagementData:(id)a5;
+ (id)configurationWithDeviceEngagementType:(unint64_t)a3 dataRetrievalType:(unint64_t)a4 engagementData:(id)a5 sessionCryptarch:(id)a6;
- (NSData)engagementData;
- (STSEngagementConfiguration)initWithDeviceEngagementType:(unint64_t)a3 dataRetrievalType:(unint64_t)a4 engagementData:(id)a5 sessionCryptarch:(id)a6;
- (STSReaderCryptarch)sessionCryptarch;
- (unint64_t)dataRetrievalType;
- (unint64_t)deviceEngagementType;
@end

@implementation STSEngagementConfiguration

+ (id)configurationWithDeviceEngagementType:(unint64_t)a3 dataRetrievalType:(unint64_t)a4 engagementData:(id)a5
{
  id v7 = a5;
  v8 = [[STSEngagementConfiguration alloc] initWithDeviceEngagementType:a3 dataRetrievalType:a4 engagementData:v7 sessionCryptarch:0];

  return v8;
}

+ (id)configurationWithDeviceEngagementType:(unint64_t)a3 dataRetrievalType:(unint64_t)a4 engagementData:(id)a5 sessionCryptarch:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  v11 = [[STSEngagementConfiguration alloc] initWithDeviceEngagementType:a3 dataRetrievalType:a4 engagementData:v10 sessionCryptarch:v9];

  return v11;
}

- (STSEngagementConfiguration)initWithDeviceEngagementType:(unint64_t)a3 dataRetrievalType:(unint64_t)a4 engagementData:(id)a5 sessionCryptarch:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  if (a3 != 1 || v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)STSEngagementConfiguration;
    v14 = [(STSEngagementConfiguration *)&v17 init];
    p_isa = (id *)&v14->super.isa;
    if (v14)
    {
      v14->_deviceEngagementType = a3;
      v14->_dataRetrievalType = a4;
      objc_storeStrong((id *)&v14->_engagementData, a5);
      objc_storeStrong(p_isa + 4, a6);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)deviceEngagementType
{
  return self->_deviceEngagementType;
}

- (unint64_t)dataRetrievalType
{
  return self->_dataRetrievalType;
}

- (NSData)engagementData
{
  return self->_engagementData;
}

- (STSReaderCryptarch)sessionCryptarch
{
  return self->_sessionCryptarch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCryptarch, 0);
  objc_storeStrong((id *)&self->_engagementData, 0);
}

@end