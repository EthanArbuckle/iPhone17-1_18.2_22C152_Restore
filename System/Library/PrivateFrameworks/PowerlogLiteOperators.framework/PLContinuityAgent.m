@interface PLContinuityAgent
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionAutoUnlock;
+ (id)entryEventPointDefinitions;
+ (int64_t)unlockPeerTypeStringToEnum:(id)a3;
+ (void)load;
- (PLContinuityAgent)init;
@end

@implementation PLContinuityAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLContinuityAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"AutoUnlock";
  objc_super v2 = [a1 entryEventPointDefinitionAutoUnlock];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointDefinitionAutoUnlock
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLContinuityAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLContinuityAgent;
  return [(PLAgent *)&v3 init];
}

+ (int64_t)unlockPeerTypeStringToEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Phone"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Mac"])
  {
    int64_t v4 = 1;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

@end