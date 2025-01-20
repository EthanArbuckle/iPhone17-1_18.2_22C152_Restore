@interface NSObject(MusicKit_SoftLinking_MPCPlayerChangeItemCommand)
- (id)_musicKit_self_changeItemCommand;
- (id)musicKit_changeItemCommand_changeToItem:()MusicKit_SoftLinking_MPCPlayerChangeItemCommand;
- (id)musicKit_changeItemCommand_nextChapterCommandRequest;
- (id)musicKit_changeItemCommand_nextItemCommandRequest;
- (id)musicKit_changeItemCommand_nextSectionCommandRequest;
- (id)musicKit_changeItemCommand_previousChapterCommandRequest;
- (id)musicKit_changeItemCommand_previousItemCommandRequest;
- (id)musicKit_changeItemCommand_previousItemDeferringToPlaybackQueuePositionCommandRequest;
- (id)musicKit_changeItemCommand_previousSectionCommandRequest;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerChangeItemCommand)

- (id)musicKit_changeItemCommand_previousItemCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v2 = [v1 previousItem];

  return v2;
}

- (id)musicKit_changeItemCommand_nextItemCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v2 = [v1 nextItem];

  return v2;
}

- (id)_musicKit_self_changeItemCommand
{
  if ([a1 conformsToProtocol:&unk_1F3B8F188]) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)musicKit_changeItemCommand_previousItemDeferringToPlaybackQueuePositionCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  id v2 = [v1 previousItemDeferringToPlaybackQueuePosition];

  return v2;
}

- (id)musicKit_changeItemCommand_previousSectionCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  id v2 = [v1 previousSection];

  return v2;
}

- (id)musicKit_changeItemCommand_previousChapterCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  id v2 = [v1 previousChapter];

  return v2;
}

- (id)musicKit_changeItemCommand_nextSectionCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  id v2 = [v1 nextSection];

  return v2;
}

- (id)musicKit_changeItemCommand_nextChapterCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  id v2 = [v1 nextChapter];

  return v2;
}

- (id)musicKit_changeItemCommand_changeToItem:()MusicKit_SoftLinking_MPCPlayerChangeItemCommand
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v6 = [v5 changeToItem:v4];

  return v6;
}

@end