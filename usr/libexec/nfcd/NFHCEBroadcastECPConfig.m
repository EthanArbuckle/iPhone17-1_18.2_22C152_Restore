@interface NFHCEBroadcastECPConfig
@end

@implementation NFHCEBroadcastECPConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchOnFieldResume, 0);

  objc_storeStrong((id *)&self->_ecpFrame, 0);
}

@end