@interface KmlMailboxMappingData
@end

@implementation KmlMailboxMappingData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredVersionTlvs, 0);

  objc_storeStrong((id *)&self->_allMailboxMappingTlvs, 0);
}

@end