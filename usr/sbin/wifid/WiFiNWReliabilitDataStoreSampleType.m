@interface WiFiNWReliabilitDataStoreSampleType
- (__CFDate)timestamp;
- (id)init:(int)a3 withTimestamp:(__CFDate *)a4;
- (int)data;
@end

@implementation WiFiNWReliabilitDataStoreSampleType

- (id)init:(int)a3 withTimestamp:(__CFDate *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WiFiNWReliabilitDataStoreSampleType;
  id result = [(WiFiNWReliabilitDataStoreSampleType *)&v7 init];
  *((_DWORD *)result + 2) = a3;
  *((void *)result + 2) = a4;
  return result;
}

- (int)data
{
  return self->_data;
}

- (__CFDate)timestamp
{
  return self->_timestamp;
}

@end