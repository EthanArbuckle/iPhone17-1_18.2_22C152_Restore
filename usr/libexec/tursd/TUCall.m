@interface TUCall
- (BOOL)nph_hasFailed;
- (BOOL)nph_isTinCanCall;
- (BOOL)nph_wasDestinationIDRung:(id)a3;
- (NSString)nph_description;
- (NSString)nph_displayName;
- (TUConversation)nph_conversation;
- (TUConversation)nph_lastAssociatedConversation;
- (unint64_t)nph_audioMessageType;
- (void)setNph_audioMessageType:(unint64_t)a3;
- (void)setNph_lastAssociatedConversation:(id)a3;
- (void)setNph_wasDestinationID:(id)a3 rung:(BOOL)a4;
@end

@implementation TUCall

- (BOOL)nph_hasFailed
{
  v3 = [(TUCall *)self provider];
  unsigned __int8 v4 = [v3 isTinCanProvider];

  if (v4) {
    return 0;
  }
  unsigned int v6 = [(TUCall *)self disconnectedReason];
  if (v6 <= 0x19) {
    return (0x1CF7F00u >> v6) & 1;
  }
  else {
    return 0;
  }
}

- (BOOL)nph_isTinCanCall
{
  v2 = [(TUCall *)self provider];
  unsigned __int8 v3 = [v2 isTinCanProvider];

  return v3;
}

- (NSString)nph_description
{
  unsigned int v3 = [(TUCall *)self isOutgoing];
  unsigned int v4 = [(TUCall *)self needsManualInCallSounds];
  v5 = [(TUCall *)self nph_conversation];
  unsigned int v6 = [(TUCall *)self remoteParticipantHandles];
  v7 = +[NSString stringWithFormat:@"%@ isOutgoing: %d, needsManualInCallSounds: %d, conversation: %@, remoteParticipantHandles: %@", self, v3, v4, v5, v6];

  return (NSString *)v7;
}

- (void)setNph_audioMessageType:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  objc_setAssociatedObject(self, "nph_audioMessageType", v4, (void *)3);
}

- (unint64_t)nph_audioMessageType
{
  v2 = objc_getAssociatedObject(self, "nph_audioMessageType");
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setNph_wasDestinationID:(id)a3 rung:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (-[TUCall nph_wasDestinationIDRung:](self, "nph_wasDestinationIDRung:") != v4)
  {
    unsigned int v6 = objc_getAssociatedObject(self, "nph_wasDestinationIDRung:");
    v7 = +[NSNumber numberWithBool:v4];
    [v6 setObject:v7 forKeyedSubscript:v8];
  }
}

- (BOOL)nph_wasDestinationIDRung:(id)a3
{
  id v4 = a3;
  objc_getAssociatedObject(self, "nph_wasDestinationIDRung:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    objc_setAssociatedObject(self, "nph_wasDestinationIDRung:", v5, (void *)1);
  }
  unsigned int v6 = [v5 objectForKeyedSubscript:v4];
  unsigned __int8 v7 = [v6 BOOLValue];

  return v7;
}

- (NSString)nph_displayName
{
  id v3 = [(TUCall *)self nph_conversation];
  id v4 = [v3 displayName];
  id v5 = [v4 copy];
  unsigned int v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(TUCall *)self displayName];
    id v7 = [v8 copy];
  }

  return (NSString *)v7;
}

- (TUConversation)nph_conversation
{
  if (([(TUCall *)self isConferenced] & 1) != 0
    || ![(TUCall *)self isConversation])
  {
    id v4 = 0;
  }
  else
  {
    id v3 = [(TUCall *)self callCenter];
    id v4 = [v3 activeConversationForCall:self];

    if (v4)
    {
      [(TUCall *)self setNph_lastAssociatedConversation:v4];
    }
    else
    {
      unsigned int v6 = [(TUCall *)self nph_lastAssociatedConversation];
      [(TUCall *)self setNph_lastAssociatedConversation:v6];
    }
  }

  return (TUConversation *)v4;
}

- (void)setNph_lastAssociatedConversation:(id)a3
{
}

- (TUConversation)nph_lastAssociatedConversation
{
  return (TUConversation *)objc_getAssociatedObject(self, "nph_lastAssociatedConversation");
}

@end