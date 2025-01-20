@interface MTDownloadsGateway
+ (MTDownloadsGatewayProtocol)shared;
@end

@implementation MTDownloadsGateway

+ (MTDownloadsGatewayProtocol)shared
{
  if (qword_10060A938 != -1) {
    dispatch_once(&qword_10060A938, &stru_100552F58);
  }
  v2 = (void *)qword_10060A930;

  return (MTDownloadsGatewayProtocol *)v2;
}

@end