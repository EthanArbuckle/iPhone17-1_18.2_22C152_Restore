@interface WFSmartPromptDatabaseLookupResult
- (NSArray)allowedStates;
- (NSArray)deniedStates;
- (NSArray)restrictedStates;
- (NSArray)undefinedStates;
- (WFContentAttribution)previousAttribution;
- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5;
- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 previousAttribution:(id)a6;
- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 restrictedStates:(id)a6;
- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 restrictedStates:(id)a6 previousAttribution:(id)a7;
@end

@implementation WFSmartPromptDatabaseLookupResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAttribution, 0);
  objc_storeStrong((id *)&self->_restrictedStates, 0);
  objc_storeStrong((id *)&self->_undefinedStates, 0);
  objc_storeStrong((id *)&self->_deniedStates, 0);
  objc_storeStrong((id *)&self->_allowedStates, 0);
}

- (WFContentAttribution)previousAttribution
{
  return self->_previousAttribution;
}

- (NSArray)restrictedStates
{
  return self->_restrictedStates;
}

- (NSArray)undefinedStates
{
  return self->_undefinedStates;
}

- (NSArray)deniedStates
{
  return self->_deniedStates;
}

- (NSArray)allowedStates
{
  return self->_allowedStates;
}

- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 restrictedStates:(id)a6 previousAttribution:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WFSmartPromptDatabaseLookupResult;
  v17 = [(WFSmartPromptDatabaseLookupResult *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_allowedStates, a3);
    objc_storeStrong((id *)&v18->_deniedStates, a4);
    objc_storeStrong((id *)&v18->_undefinedStates, a5);
    objc_storeStrong((id *)&v18->_restrictedStates, a6);
    objc_storeStrong((id *)&v18->_previousAttribution, a7);
    v19 = v18;
  }

  return v18;
}

- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 previousAttribution:(id)a6
{
  return [(WFSmartPromptDatabaseLookupResult *)self initWithAllowedStates:a3 deniedStates:a4 undefinedStates:a5 restrictedStates:MEMORY[0x1E4F1CBF0] previousAttribution:a6];
}

- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 restrictedStates:(id)a6
{
  return [(WFSmartPromptDatabaseLookupResult *)self initWithAllowedStates:a3 deniedStates:a4 undefinedStates:a5 restrictedStates:a6 previousAttribution:0];
}

- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5
{
  return [(WFSmartPromptDatabaseLookupResult *)self initWithAllowedStates:a3 deniedStates:a4 undefinedStates:a5 restrictedStates:MEMORY[0x1E4F1CBF0] previousAttribution:0];
}

@end