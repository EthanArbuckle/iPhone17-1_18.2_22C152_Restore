@interface NSObject(MusicKit_SoftLinking_MPCPlayerResponseTracklist)
- (id)_musicKit_self_responseTracklist;
- (id)musicKit_responseTracklist_actionAtQueueEndCommand;
- (id)musicKit_responseTracklist_changeItemCommand;
- (id)musicKit_responseTracklist_insertCommand;
- (id)musicKit_responseTracklist_playingItem;
- (id)musicKit_responseTracklist_reorderCommand;
- (id)musicKit_responseTracklist_repeatCommand;
- (id)musicKit_responseTracklist_resetCommand;
- (id)musicKit_responseTracklist_sectionedCollection;
- (id)musicKit_responseTracklist_shuffleCommand;
- (id)musicKit_responseTracklist_underlyingSectionObjectAtIndexPathBlock;
- (uint64_t)musicKit_globalItemCount;
- (uint64_t)musicKit_responseTracklist_actionAtQueueEnd;
- (uint64_t)musicKit_responseTracklist_repeatType;
- (uint64_t)musicKit_responseTracklist_shuffleType;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerResponseTracklist)

- (id)musicKit_responseTracklist_resetCommand
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v2 = [v1 resetCommand];

  return v2;
}

- (id)musicKit_responseTracklist_changeItemCommand
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v2 = [v1 changeItemCommand];

  return v2;
}

- (id)musicKit_responseTracklist_insertCommand
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v2 = [v1 insertCommand];

  return v2;
}

- (id)musicKit_responseTracklist_playingItem
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v2 = [v1 playingItem];

  return v2;
}

- (id)_musicKit_self_responseTracklist
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getMPCPlayerResponseTracklistClass_softClass;
  uint64_t v10 = getMPCPlayerResponseTracklistClass_softClass;
  if (!getMPCPlayerResponseTracklistClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getMPCPlayerResponseTracklistClass_block_invoke;
    v6[3] = &unk_1E6D453B0;
    v6[4] = &v7;
    __getMPCPlayerResponseTracklistClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  if (objc_opt_isKindOfClass()) {
    id v4 = a1;
  }
  else {
    id v4 = 0;
  }
  return v4;
}

- (uint64_t)musicKit_responseTracklist_repeatType
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  uint64_t v2 = [v1 repeatType];

  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (uint64_t)musicKit_responseTracklist_shuffleType
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  uint64_t v2 = [v1 shuffleType];

  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (uint64_t)musicKit_responseTracklist_actionAtQueueEnd
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  uint64_t v2 = [v1 actionAtQueueEnd];

  if ((unint64_t)(v2 - 1) >= 3) {
    return 0;
  }
  else {
    return v2;
  }
}

- (id)musicKit_responseTracklist_reorderCommand
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  uint64_t v2 = [v1 reorderCommand];

  return v2;
}

- (id)musicKit_responseTracklist_repeatCommand
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  uint64_t v2 = [v1 repeatCommand];

  return v2;
}

- (id)musicKit_responseTracklist_shuffleCommand
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  uint64_t v2 = [v1 shuffleCommand];

  return v2;
}

- (id)musicKit_responseTracklist_actionAtQueueEndCommand
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  uint64_t v2 = [v1 actionAtQueueEndCommand];

  return v2;
}

- (id)musicKit_responseTracklist_sectionedCollection
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  uint64_t v2 = [v1 displayItems];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F386A8]) initWithUnderlyingSectionedCollection:v2];

  return v3;
}

- (id)musicKit_responseTracklist_underlyingSectionObjectAtIndexPathBlock
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__NSObject_MusicKit_SoftLinking_MPCPlayerResponseTracklist__musicKit_responseTracklist_underlyingSectionObjectAtIndexPathBlock__block_invoke;
  aBlock[3] = &unk_1E6D458C8;
  aBlock[4] = a1;
  v1 = _Block_copy(aBlock);
  return v1;
}

- (uint64_t)musicKit_globalItemCount
{
  v1 = objc_msgSend(a1, "_musicKit_self_responseTracklist");
  uint64_t v2 = [v1 globalItemCount];

  return v2;
}

@end