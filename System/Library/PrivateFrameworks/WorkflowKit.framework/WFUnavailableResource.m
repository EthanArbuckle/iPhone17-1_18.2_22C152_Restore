@interface WFUnavailableResource
- (void)refreshAvailability;
@end

@implementation WFUnavailableResource

- (void)refreshAvailability
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WFResource *)self definition];
  v4 = [v3 objectForKey:@"WFUnavailableResourceReason"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    WFLocalizedString(@"This action is no longer available.");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28588];
  v12[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v10 = [v8 errorWithDomain:@"ResourceErrorDomain" code:0 userInfo:v9];

  [(WFResource *)self updateAvailability:0 withError:v10];
}

@end