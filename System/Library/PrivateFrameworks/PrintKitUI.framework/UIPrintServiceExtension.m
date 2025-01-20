@interface UIPrintServiceExtension
- (NSArray)printerDestinationsForPrintInfo:(UIPrintInfo *)printInfo;
- (void)_apOp:(id)a3 reply:(id)a4;
- (void)_authenticatedRequestForRequest:(id)a3 challengeResponse:(id)a4 reply:(id)a5;
@end

@implementation UIPrintServiceExtension

- (NSArray)printerDestinationsForPrintInfo:(UIPrintInfo *)printInfo
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)_authenticatedRequestForRequest:(id)a3 challengeResponse:(id)a4 reply:(id)a5
{
}

- (void)_apOp:(id)a3 reply:(id)a4
{
}

@end