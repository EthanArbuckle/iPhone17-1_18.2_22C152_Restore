@interface ICLiveLinkQueueEvent
+ (ICLiveLinkQueueEvent)queueEventWithContentAdded:(id)a3;
+ (ICLiveLinkQueueEvent)queueEventWithContentPlayedNow:(id)a3;
+ (ICLiveLinkQueueEvent)queueEventWithContentRemoved:(id)a3;
+ (ICLiveLinkQueueEvent)queueEventWithContentReordered:(id)a3;
+ (ICLiveLinkQueueEvent)queueEventWithContentReplaced:(id)a3;
+ (ICLiveLinkQueueEvent)queueEventWithContentUpdatedMessage:(id)a3;
+ (ICLiveLinkQueueEvent)queueEventWithPlaybackModeChanged:(id)a3;
- (ICLiveLinkQueueEventContentAdded)contentAdded;
- (ICLiveLinkQueueEventContentPlayedNow)contentPlayedNow;
- (ICLiveLinkQueueEventContentRemoved)contentRemoved;
- (ICLiveLinkQueueEventContentReordered)contentReordered;
- (ICLiveLinkQueueEventContentReplaced)contentReplaced;
- (ICLiveLinkQueueEventContentUpdatedMessage)contentUpdatedMessage;
- (ICLiveLinkQueueEventPlaybackModeChanged)playbackModeChanged;
- (id)description;
- (int64_t)kind;
@end

@implementation ICLiveLinkQueueEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackModeChanged, 0);
  objc_storeStrong((id *)&self->_contentUpdatedMessage, 0);
  objc_storeStrong((id *)&self->_contentReplaced, 0);
  objc_storeStrong((id *)&self->_contentReordered, 0);
  objc_storeStrong((id *)&self->_contentRemoved, 0);
  objc_storeStrong((id *)&self->_contentPlayedNow, 0);

  objc_storeStrong((id *)&self->_contentAdded, 0);
}

- (ICLiveLinkQueueEventPlaybackModeChanged)playbackModeChanged
{
  return self->_playbackModeChanged;
}

- (ICLiveLinkQueueEventContentUpdatedMessage)contentUpdatedMessage
{
  return self->_contentUpdatedMessage;
}

- (ICLiveLinkQueueEventContentReplaced)contentReplaced
{
  return self->_contentReplaced;
}

- (ICLiveLinkQueueEventContentReordered)contentReordered
{
  return self->_contentReordered;
}

- (ICLiveLinkQueueEventContentRemoved)contentRemoved
{
  return self->_contentRemoved;
}

- (ICLiveLinkQueueEventContentPlayedNow)contentPlayedNow
{
  return self->_contentPlayedNow;
}

- (ICLiveLinkQueueEventContentAdded)contentAdded
{
  return self->_contentAdded;
}

- (int64_t)kind
{
  return self->_kind;
}

- (id)description
{
  int64_t kind = self->_kind;
  switch(kind)
  {
    case 0:
      objc_msgSend(NSString, "stringWithFormat:", @"<ICLiveLinkQueueEvent: %p unknown/invalid>", self, v5);
      break;
    case 1:
      [NSString stringWithFormat:@"<ICLiveLinkQueueEvent: %p contentAdded=%@", self, self->_contentAdded];
      break;
    case 2:
      [NSString stringWithFormat:@"<ICLiveLinkQueueEvent: %p contentRemoved=%@", self, self->_contentRemoved];
      break;
    case 3:
      [NSString stringWithFormat:@"<ICLiveLinkQueueEvent: %p contentReordered=%@", self, self->_contentReordered];
      break;
    case 4:
      [NSString stringWithFormat:@"<ICLiveLinkQueueEvent: %p playbackModeChanged=%@", self, self->_playbackModeChanged];
      break;
    case 5:
      [NSString stringWithFormat:@"<ICLiveLinkQueueEvent: %p contentReplaced=%@", self, self->_contentReplaced];
      break;
    case 6:
      [NSString stringWithFormat:@"<ICLiveLinkQueueEvent: %p contentPlayedNow=%@", self, self->_contentPlayedNow];
      break;
    case 7:
      [NSString stringWithFormat:@"<ICLiveLinkQueueEvent: %p contentUpdatedMessage=%@", self, self->_contentUpdatedMessage];
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"<ICLiveLinkQueueEvent: %p unknown/eventKind=%ld", self, kind);
      break;
  v3 = };

  return v3;
}

+ (ICLiveLinkQueueEvent)queueEventWithPlaybackModeChanged:(id)a3
{
  v3 = (ICLiveLinkQueueEventPlaybackModeChanged *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_int64_t kind = 4;
  playbackModeChanged = v4->_playbackModeChanged;
  v4->_playbackModeChanged = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentUpdatedMessage:(id)a3
{
  v3 = (ICLiveLinkQueueEventContentUpdatedMessage *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_int64_t kind = 7;
  contentUpdatedMessage = v4->_contentUpdatedMessage;
  v4->_contentUpdatedMessage = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentReplaced:(id)a3
{
  v3 = (ICLiveLinkQueueEventContentReplaced *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_int64_t kind = 5;
  contentReplaced = v4->_contentReplaced;
  v4->_contentReplaced = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentReordered:(id)a3
{
  v3 = (ICLiveLinkQueueEventContentReordered *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_int64_t kind = 3;
  contentReordered = v4->_contentReordered;
  v4->_contentReordered = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentRemoved:(id)a3
{
  v3 = (ICLiveLinkQueueEventContentRemoved *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_int64_t kind = 2;
  contentRemoved = v4->_contentRemoved;
  v4->_contentRemoved = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentPlayedNow:(id)a3
{
  v3 = (ICLiveLinkQueueEventContentPlayedNow *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  v4->_int64_t kind = 6;
  contentPlayedNow = v4->_contentPlayedNow;
  v4->_contentPlayedNow = v3;

  return v4;
}

+ (ICLiveLinkQueueEvent)queueEventWithContentAdded:(id)a3
{
  v3 = (ICLiveLinkQueueEventContentAdded *)a3;
  v4 = objc_alloc_init(ICLiveLinkQueueEvent);
  contentAdded = v4->_contentAdded;
  v4->_int64_t kind = 1;
  v4->_contentAdded = v3;

  return v4;
}

@end