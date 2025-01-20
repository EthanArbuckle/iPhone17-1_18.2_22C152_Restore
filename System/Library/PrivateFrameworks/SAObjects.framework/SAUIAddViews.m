@interface SAUIAddViews
+ (id)addViews;
- (BOOL)immersiveExperience;
- (BOOL)mutatingCommand;
- (BOOL)persistentAcrossInvocations;
- (BOOL)requiresResponse;
- (BOOL)scrollToTop;
- (BOOL)supplemental;
- (BOOL)temporary;
- (NSArray)coordinationOptions;
- (NSArray)views;
- (NSString)dialogPhase;
- (NSString)displayTarget;
- (NSString)patternId;
- (NSString)patternType;
- (NSString)personaId;
- (NSString)responseMode;
- (SASendCommands)refreshCommand;
- (SAUIFeedbackForm)feedbackForm;
- (SAUIRequestEndBehavior)requestEndBehavior;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCoordinationOptions:(id)a3;
- (void)setDialogPhase:(id)a3;
- (void)setDisplayTarget:(id)a3;
- (void)setFeedbackForm:(id)a3;
- (void)setImmersiveExperience:(BOOL)a3;
- (void)setMutatingCommand:(BOOL)a3;
- (void)setPatternId:(id)a3;
- (void)setPatternType:(id)a3;
- (void)setPersistentAcrossInvocations:(BOOL)a3;
- (void)setPersonaId:(id)a3;
- (void)setRefreshCommand:(id)a3;
- (void)setRequestEndBehavior:(id)a3;
- (void)setRequiresResponse:(BOOL)a3;
- (void)setResponseMode:(id)a3;
- (void)setScrollToTop:(BOOL)a3;
- (void)setSupplemental:(BOOL)a3;
- (void)setTemporary:(BOOL)a3;
- (void)setViews:(id)a3;
@end

@implementation SAUIAddViews

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AddViews";
}

+ (id)addViews
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)coordinationOptions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"coordinationOptions"];
}

- (void)setCoordinationOptions:(id)a3
{
}

- (NSString)dialogPhase
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dialogPhase"];
}

- (void)setDialogPhase:(id)a3
{
}

- (NSString)displayTarget
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayTarget"];
}

- (void)setDisplayTarget:(id)a3
{
}

- (SAUIFeedbackForm)feedbackForm
{
  return (SAUIFeedbackForm *)AceObjectAceObjectForProperty(self, @"feedbackForm");
}

- (void)setFeedbackForm:(id)a3
{
}

- (BOOL)immersiveExperience
{
  return AceObjectBoolForProperty(self, @"immersiveExperience");
}

- (void)setImmersiveExperience:(BOOL)a3
{
}

- (BOOL)mutatingCommand
{
  return AceObjectBoolForProperty(self, @"mutatingCommand");
}

- (void)setMutatingCommand:(BOOL)a3
{
}

- (NSString)patternId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"patternId"];
}

- (void)setPatternId:(id)a3
{
}

- (NSString)patternType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"patternType"];
}

- (void)setPatternType:(id)a3
{
}

- (BOOL)persistentAcrossInvocations
{
  return AceObjectBoolForProperty(self, @"persistentAcrossInvocations");
}

- (void)setPersistentAcrossInvocations:(BOOL)a3
{
}

- (NSString)personaId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"personaId"];
}

- (void)setPersonaId:(id)a3
{
}

- (SASendCommands)refreshCommand
{
  return (SASendCommands *)AceObjectAceObjectForProperty(self, @"refreshCommand");
}

- (void)setRefreshCommand:(id)a3
{
}

- (SAUIRequestEndBehavior)requestEndBehavior
{
  return (SAUIRequestEndBehavior *)AceObjectAceObjectForProperty(self, @"requestEndBehavior");
}

- (void)setRequestEndBehavior:(id)a3
{
}

- (BOOL)requiresResponse
{
  return AceObjectBoolForProperty(self, @"requiresResponse");
}

- (void)setRequiresResponse:(BOOL)a3
{
}

- (NSString)responseMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"responseMode"];
}

- (void)setResponseMode:(id)a3
{
}

- (BOOL)scrollToTop
{
  return AceObjectBoolForProperty(self, @"scrollToTop");
}

- (void)setScrollToTop:(BOOL)a3
{
}

- (BOOL)supplemental
{
  return AceObjectBoolForProperty(self, @"supplemental");
}

- (void)setSupplemental:(BOOL)a3
{
}

- (BOOL)temporary
{
  return AceObjectBoolForProperty(self, @"temporary");
}

- (void)setTemporary:(BOOL)a3
{
}

- (NSArray)views
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"views", v3);
}

- (void)setViews:(id)a3
{
}

@end