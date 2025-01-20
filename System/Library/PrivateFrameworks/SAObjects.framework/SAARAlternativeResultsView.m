@interface SAARAlternativeResultsView
+ (id)alternativeResultsView;
- (BOOL)suggestedResult;
- (NSString)dialogIdentifier;
- (NSString)utterance;
- (SAUIAddViews)resultView;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)rank;
- (void)setDialogIdentifier:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setResultView:(id)a3;
- (void)setSuggestedResult:(BOOL)a3;
- (void)setUtterance:(id)a3;
@end

@implementation SAARAlternativeResultsView

- (id)groupIdentifier
{
  return @"com.apple.ace.alternatives";
}

- (id)encodedClassName
{
  return @"AlternativeResultsView";
}

+ (id)alternativeResultsView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)dialogIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dialogIdentifier"];
}

- (void)setDialogIdentifier:(id)a3
{
}

- (int64_t)rank
{
  return AceObjectIntegerForProperty(self, @"rank");
}

- (void)setRank:(int64_t)a3
{
}

- (SAUIAddViews)resultView
{
  return (SAUIAddViews *)AceObjectAceObjectForProperty(self, @"resultView");
}

- (void)setResultView:(id)a3
{
}

- (BOOL)suggestedResult
{
  return AceObjectBoolForProperty(self, @"suggestedResult");
}

- (void)setSuggestedResult:(BOOL)a3
{
}

- (NSString)utterance
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utterance"];
}

- (void)setUtterance:(id)a3
{
}

@end