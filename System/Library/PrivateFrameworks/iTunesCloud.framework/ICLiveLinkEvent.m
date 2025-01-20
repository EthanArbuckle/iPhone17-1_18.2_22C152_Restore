@interface ICLiveLinkEvent
+ (id)eventWithCustomEvent:(id)a3 participant:(id)a4;
+ (id)eventWithPlaybackEvent:(id)a3 participant:(id)a4;
+ (id)eventWithQueueEvent:(id)a3 participant:(id)a4;
+ (id)eventWithReactionEvent:(id)a3 participant:(id)a4;
+ (id)eventWithSessionEvent:(id)a3 participant:(id)a4;
- (ICLiveLinkCustomEvent)customEvent;
- (ICLiveLinkIdentity)participant;
- (ICLiveLinkPlaybackEvent)playbackEvent;
- (ICLiveLinkQueueEvent)queueEvent;
- (ICLiveLinkReactionEvent)reactionEvent;
- (ICLiveLinkSessionEvent)sessionEvent;
- (NSString)primaryReferencedIdentifier;
- (id)_initWithType:(int64_t)a3 participant:(id)a4;
- (id)description;
- (int64_t)type;
@end

@implementation ICLiveLinkEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customEvent, 0);
  objc_storeStrong((id *)&self->_reactionEvent, 0);
  objc_storeStrong((id *)&self->_queueEvent, 0);
  objc_storeStrong((id *)&self->_playbackEvent, 0);
  objc_storeStrong((id *)&self->_sessionEvent, 0);

  objc_storeStrong((id *)&self->_participant, 0);
}

- (ICLiveLinkCustomEvent)customEvent
{
  return self->_customEvent;
}

- (ICLiveLinkReactionEvent)reactionEvent
{
  return self->_reactionEvent;
}

- (ICLiveLinkQueueEvent)queueEvent
{
  return self->_queueEvent;
}

- (ICLiveLinkPlaybackEvent)playbackEvent
{
  return self->_playbackEvent;
}

- (ICLiveLinkSessionEvent)sessionEvent
{
  return self->_sessionEvent;
}

- (int64_t)type
{
  return self->_type;
}

- (ICLiveLinkIdentity)participant
{
  return self->_participant;
}

- (NSString)primaryReferencedIdentifier
{
  int64_t type = self->_type;
  if (type == 4)
  {
    v6 = [(ICLiveLinkReactionEvent *)self->_reactionEvent itemIdentifier];
  }
  else if (type == 3)
  {
    v3 = self->_queueEvent;
    switch([(ICLiveLinkQueueEvent *)v3 kind])
    {
      case 1:
        v4 = [(ICLiveLinkQueueEvent *)v3 contentAdded];
        v5 = [v4 itemIdentifiers];
        v6 = [v5 firstObject];

        goto LABEL_13;
      case 3:
        v4 = [(ICLiveLinkQueueEvent *)v3 contentReordered];
        uint64_t v7 = [v4 itemIdentifier];
        goto LABEL_12;
      case 5:
        v8 = [(ICLiveLinkQueueEvent *)v3 contentReplaced];
        goto LABEL_11;
      case 6:
        v8 = [(ICLiveLinkQueueEvent *)v3 contentPlayedNow];
LABEL_11:
        v4 = v8;
        uint64_t v7 = [v8 startItemIdentifier];
LABEL_12:
        v6 = (void *)v7;
LABEL_13:

        break;
      default:

        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v6 = 0;
  }

  return (NSString *)v6;
}

- (id)description
{
  int64_t type = self->_type;
  switch(type)
  {
    case 0:
      [NSString stringWithFormat:@"<ICLiveLinkEvent: %p participant=%@ unknown/invalid>", self, self->_participant, v5];
      break;
    case 1:
      [NSString stringWithFormat:@"<ICLiveLinkEvent: %p participant=%@ sessionEvent=%@>", self, self->_participant, self->_sessionEvent];
      break;
    case 2:
      [NSString stringWithFormat:@"<ICLiveLinkEvent: %p participant=%@ playbackEvent=%@>", self, self->_participant, self->_playbackEvent];
      break;
    case 3:
      [NSString stringWithFormat:@"<ICLiveLinkEvent: %p participant=%@ queueEvent=%@>", self, self->_participant, self->_queueEvent];
      break;
    case 4:
      [NSString stringWithFormat:@"<ICLiveLinkEvent: %p participant=%@ reactionEvent=%@>", self, self->_participant, self->_reactionEvent];
      break;
    case 5:
      [NSString stringWithFormat:@"<ICLiveLinkEvent: %p participant=%@ customEvent=%@>", self, self->_participant, self->_customEvent];
      break;
    default:
      [NSString stringWithFormat:@"<ICLiveLinkEvent: %p participant=%@ unknown/eventType=%ld>", self, self->_participant, type];
      break;
  v3 = };

  return v3;
}

- (id)_initWithType:(int64_t)a3 participant:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICLiveLinkEvent;
  uint64_t v7 = [(ICLiveLinkEvent *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_int64_t type = a3;
    uint64_t v9 = [v6 copy];
    participant = v8->_participant;
    v8->_participant = (ICLiveLinkIdentity *)v9;
  }
  return v8;
}

+ (id)eventWithCustomEvent:(id)a3 participant:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [[ICLiveLinkEvent alloc] _initWithType:5 participant:v6];

  v8 = (void *)v7[7];
  v7[7] = v5;

  return v7;
}

+ (id)eventWithReactionEvent:(id)a3 participant:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [[ICLiveLinkEvent alloc] _initWithType:4 participant:v6];

  v8 = (void *)v7[6];
  v7[6] = v5;

  return v7;
}

+ (id)eventWithQueueEvent:(id)a3 participant:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [[ICLiveLinkEvent alloc] _initWithType:3 participant:v6];

  v8 = (void *)v7[5];
  v7[5] = v5;

  return v7;
}

+ (id)eventWithPlaybackEvent:(id)a3 participant:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [[ICLiveLinkEvent alloc] _initWithType:2 participant:v6];

  v8 = (void *)v7[4];
  v7[4] = v5;

  return v7;
}

+ (id)eventWithSessionEvent:(id)a3 participant:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [[ICLiveLinkEvent alloc] _initWithType:1 participant:v6];

  v8 = (void *)v7[3];
  v7[3] = v5;

  return v7;
}

@end