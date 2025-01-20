@interface SLAMPersonalizationInfo
@end

@implementation SLAMPersonalizationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getPersonalizationIDCommand, 0);

  objc_storeStrong((id *)&self->_instanceAID, 0);
}

@end