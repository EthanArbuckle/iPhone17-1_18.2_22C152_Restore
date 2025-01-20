@interface WFMissingAction
- (BOOL)inputPassthrough;
- (BOOL)isForLocalization;
- (BOOL)isMissing;
- (BOOL)requiresRemoteExecution;
- (id)iconImage;
- (id)localizedDescriptionSummary;
- (id)localizedNameWithContext:(id)a3;
- (void)runWithInput:(id)a3 error:(id *)a4;
- (void)setIsForLocalization:(BOOL)a3;
@end

@implementation WFMissingAction

- (void)setIsForLocalization:(BOOL)a3
{
  self->_isForLocalization = a3;
}

- (BOOL)isForLocalization
{
  return self->_isForLocalization;
}

- (BOOL)requiresRemoteExecution
{
  return 0;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v5 = WFLocalizedString(@"The shortcut could not be run because an action could not be found.");
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = v5;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  *a4 = [v6 errorWithDomain:@"WFActionErrorDomain" code:14 userInfo:v7];
}

- (BOOL)inputPassthrough
{
  return 1;
}

- (BOOL)isMissing
{
  return 1;
}

- (id)localizedDescriptionSummary
{
  v3 = NSString;
  v4 = WFLocalizedString(@"This action could not be found. It may require a newer version of Shortcuts or another app.\n\nThe missing action’s identifier is “%@”.");
  v5 = [(WFAction *)self identifier];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  return v6;
}

- (id)iconImage
{
  v2 = objc_opt_new();
  return v2;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFAction *)self definition];

  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)WFMissingAction;
    v6 = [(WFAction *)&v9 localizedNameWithContext:v4];
  }
  else
  {
    v7 = WFLocalizedStringResourceWithKey(@"Unknown Action", @"Unknown Action");
    v6 = [v4 localize:v7];
  }
  return v6;
}

@end