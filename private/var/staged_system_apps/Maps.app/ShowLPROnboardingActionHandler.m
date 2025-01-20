@interface ShowLPROnboardingActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation ShowLPROnboardingActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  [a4 coordinator:a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 presentLPRWithVehicle:0 scenario:0 presenter:0 completionBlock:0];
}

@end