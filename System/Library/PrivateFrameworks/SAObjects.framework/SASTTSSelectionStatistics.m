@interface SASTTSSelectionStatistics
+ (id)tTSSelectionStatistics;
- (BOOL)requiresResponse;
- (NSArray)listenedItems;
- (NSArray)timesListened;
- (NSString)completionType;
- (NSString)interactionId;
- (NSString)sessionId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)selectedItemIndex;
- (void)setCompletionType:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setListenedItems:(id)a3;
- (void)setSelectedItemIndex:(int64_t)a3;
- (void)setSessionId:(id)a3;
- (void)setTimesListened:(id)a3;
@end

@implementation SASTTSSelectionStatistics

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"TTSSelectionStatistics";
}

+ (id)tTSSelectionStatistics
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)completionType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"completionType"];
}

- (void)setCompletionType:(id)a3
{
}

- (NSString)interactionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interactionId"];
}

- (void)setInteractionId:(id)a3
{
}

- (NSArray)listenedItems
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"listenedItems"];
}

- (void)setListenedItems:(id)a3
{
}

- (int64_t)selectedItemIndex
{
  return AceObjectIntegerForProperty(self, @"selectedItemIndex");
}

- (void)setSelectedItemIndex:(int64_t)a3
{
}

- (NSString)sessionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sessionId"];
}

- (void)setSessionId:(id)a3
{
}

- (NSArray)timesListened
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"timesListened"];
}

- (void)setTimesListened:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end