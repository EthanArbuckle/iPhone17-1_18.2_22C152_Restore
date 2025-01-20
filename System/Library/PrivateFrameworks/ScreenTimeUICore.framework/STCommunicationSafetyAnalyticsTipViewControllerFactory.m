@interface STCommunicationSafetyAnalyticsTipViewControllerFactory
+ (id)makeCommunicationSafetyAnalyticsTipViewControllerWithActionBlock:(id)a3 dismissTipBlock:(id)a4;
@end

@implementation STCommunicationSafetyAnalyticsTipViewControllerFactory

+ (id)makeCommunicationSafetyAnalyticsTipViewControllerWithActionBlock:(id)a3 dismissTipBlock:(id)a4
{
  return +[STCommunicationSafetyAnalyticsTipContentInterface makeCommunicationSafetyAnalyticsTipViewControllerWithActionBlock:a3 dismissTipBlock:a4];
}

@end