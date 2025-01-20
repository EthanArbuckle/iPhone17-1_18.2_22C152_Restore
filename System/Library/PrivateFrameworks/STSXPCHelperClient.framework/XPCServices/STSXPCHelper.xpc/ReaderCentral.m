@interface ReaderCentral
- (id)getIdentifierCharacteristicUUID;
- (id)getIncomingDataCharacteristicUUID;
- (id)getL2CAPCharacteristicUUID;
- (id)getOutgoingDataCharacteristicUUID;
- (id)getStateCharacteristicUUID;
@end

@implementation ReaderCentral

- (id)getStateCharacteristicUUID
{
  return @"00000001-A123-48CE-896B-4C76973373E6";
}

- (id)getIdentifierCharacteristicUUID
{
  return 0;
}

- (id)getIncomingDataCharacteristicUUID
{
  return @"00000003-A123-48CE-896B-4C76973373E6";
}

- (id)getOutgoingDataCharacteristicUUID
{
  return @"00000002-A123-48CE-896B-4C76973373E6";
}

- (id)getL2CAPCharacteristicUUID
{
  return @"0000000A-A123-48CE-896B-4C76973373E6";
}

@end