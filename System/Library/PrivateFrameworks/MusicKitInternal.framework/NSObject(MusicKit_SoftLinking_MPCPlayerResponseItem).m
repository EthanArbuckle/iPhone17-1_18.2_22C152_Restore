@interface NSObject(MusicKit_SoftLinking_MPCPlayerResponseItem)
- (double)musicKit_playerResponseItem_duration;
- (double)musicKit_playerResponseItem_elapsedTime;
- (double)musicKit_playerResponseItem_endTime;
- (double)musicKit_playerResponseItem_startTime;
- (float)musicKit_playerResponseItem_defaultRate;
- (float)musicKit_playerResponseItem_rate;
- (id)_musicKit_self_responseItem;
- (id)musicKit_playerResponseItem_contentItemIdentifier;
- (id)musicKit_playerResponseItem_nowPlayingAudioFormat;
- (id)musicKit_playerResponseItem_removeCommandRequest;
- (id)musicKit_playerResponseItem_seekCommand;
- (id)musicKit_playerResponseItem_underlyingModelObject;
- (uint64_t)musicKit_playerResponseItem_isLiveContent;
- (uint64_t)musicKit_playerResponseItem_isLoading;
- (uint64_t)musicKit_playerResponseItem_isPlaceholder;
- (void)_durationSnapshot;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerResponseItem)

- (double)musicKit_playerResponseItem_elapsedTime
{
  [a1 _durationSnapshot];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v2 = v6 + (v1 - v4) * v7;
  if (v2 >= v5) {
    double v2 = v5;
  }
  return fmax(v2, 0.0);
}

- (float)musicKit_playerResponseItem_rate
{
  [a1 _durationSnapshot];
  return v2;
}

- (id)musicKit_playerResponseItem_nowPlayingAudioFormat
{
  double v1 = objc_msgSend(a1, "_musicKit_self_responseItem");
  float v2 = [v1 nowPlayingAudioFormat];

  return v2;
}

- (void)_durationSnapshot
{
  v3 = objc_msgSend(a1, "_musicKit_self_responseItem");
  if (v3)
  {
    double v4 = v3;
    [v3 duration];
    v3 = v4;
  }
  else
  {
    *(void *)(a2 + 48) = 0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
}

- (id)musicKit_playerResponseItem_seekCommand
{
  double v1 = objc_msgSend(a1, "_musicKit_self_responseItem");
  float v2 = [v1 seekCommand];

  return v2;
}

- (id)_musicKit_self_responseItem
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  float v2 = (void *)getMPCPlayerResponseItemClass_softClass;
  uint64_t v10 = getMPCPlayerResponseItemClass_softClass;
  if (!getMPCPlayerResponseItemClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getMPCPlayerResponseItemClass_block_invoke;
    v6[3] = &unk_1E6D453B0;
    v6[4] = &v7;
    __getMPCPlayerResponseItemClass_block_invoke((uint64_t)v6);
    float v2 = (void *)v8[3];
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

- (id)musicKit_playerResponseItem_underlyingModelObject
{
  double v1 = objc_msgSend(a1, "_musicKit_self_responseItem");
  float v2 = [v1 metadataObject];

  return v2;
}

- (id)musicKit_playerResponseItem_contentItemIdentifier
{
  double v1 = objc_msgSend(a1, "_musicKit_self_responseItem");
  float v2 = [v1 contentItemIdentifier];

  return v2;
}

- (double)musicKit_playerResponseItem_startTime
{
  [a1 _durationSnapshot];
  return v2;
}

- (double)musicKit_playerResponseItem_endTime
{
  [a1 _durationSnapshot];
  return v2;
}

- (double)musicKit_playerResponseItem_duration
{
  [a1 _durationSnapshot];
  return v2;
}

- (float)musicKit_playerResponseItem_defaultRate
{
  [a1 _durationSnapshot];
  return v2;
}

- (uint64_t)musicKit_playerResponseItem_isLiveContent
{
  [a1 _durationSnapshot];
  return v2;
}

- (uint64_t)musicKit_playerResponseItem_isPlaceholder
{
  double v1 = objc_msgSend(a1, "_musicKit_self_responseItem");
  uint64_t v2 = [v1 isPlaceholder];

  return v2;
}

- (uint64_t)musicKit_playerResponseItem_isLoading
{
  [a1 _durationSnapshot];
  return v2;
}

- (id)musicKit_playerResponseItem_removeCommandRequest
{
  double v1 = objc_msgSend(a1, "_musicKit_self_responseItem");
  unsigned __int8 v2 = [v1 remove];

  return v2;
}

@end