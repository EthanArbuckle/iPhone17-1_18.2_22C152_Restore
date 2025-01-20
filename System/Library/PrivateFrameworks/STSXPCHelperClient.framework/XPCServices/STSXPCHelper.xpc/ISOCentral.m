@interface ISOCentral
- (id)getIdentifierCharacteristicUUID;
- (id)getIncomingDataCharacteristicUUID;
- (id)getL2CAPCharacteristicUUID;
- (id)getOutgoingDataCharacteristicUUID;
- (id)getStateCharacteristicUUID;
@end

@implementation ISOCentral

- (id)getStateCharacteristicUUID
{
  return @"00000005-A123-48CE-896B-4C76973373E6";
}

- (id)getIdentifierCharacteristicUUID
{
  return @"00000008-A123-48CE-896B-4C76973373E6";
}

- (id)getIncomingDataCharacteristicUUID
{
  return @"00000007-A123-48CE-896B-4C76973373E6";
}

- (id)getOutgoingDataCharacteristicUUID
{
  return @"00000006-A123-48CE-896B-4C76973373E6";
}

- (id)getL2CAPCharacteristicUUID
{
  return @"0000000B-A123-48CE-896B-4C76973373E6";
}

@end