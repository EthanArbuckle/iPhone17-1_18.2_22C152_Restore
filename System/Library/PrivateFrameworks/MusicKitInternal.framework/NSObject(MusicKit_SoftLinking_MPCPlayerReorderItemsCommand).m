@interface NSObject(MusicKit_SoftLinking_MPCPlayerReorderItemsCommand)
- (id)_musicKit_self_reorderItemsCommand;
- (id)musicKit_reorderItemsCommand_moveItem:()MusicKit_SoftLinking_MPCPlayerReorderItemsCommand afterItem:;
- (id)musicKit_reorderItemsCommand_moveItem:()MusicKit_SoftLinking_MPCPlayerReorderItemsCommand beforeItem:;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerReorderItemsCommand)

- (id)_musicKit_self_reorderItemsCommand
{
  if ([a1 conformsToProtocol:&unk_1F3B8F068]) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)musicKit_reorderItemsCommand_moveItem:()MusicKit_SoftLinking_MPCPlayerReorderItemsCommand afterItem:
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(a1, "_musicKit_self_reorderItemsCommand");
  v9 = [v8 moveItem:v7 afterItem:v6];

  return v9;
}

- (id)musicKit_reorderItemsCommand_moveItem:()MusicKit_SoftLinking_MPCPlayerReorderItemsCommand beforeItem:
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(a1, "_musicKit_self_reorderItemsCommand");
  v9 = [v8 moveItem:v7 beforeItem:v6];

  return v9;
}

@end