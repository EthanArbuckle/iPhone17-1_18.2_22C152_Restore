@interface NTPBAudioPlaylistItem(PlaylistExtensions)
+ (uint64_t)keyValuePairType;
+ (uint64_t)readValueFromKeyValuePair:()PlaylistExtensions;
- (id)order;
- (void)copyWithOrder:()PlaylistExtensions;
- (void)writeToKeyValuePair:()PlaylistExtensions;
@end

@implementation NTPBAudioPlaylistItem(PlaylistExtensions)

+ (uint64_t)keyValuePairType
{
  return 16;
}

+ (uint64_t)readValueFromKeyValuePair:()PlaylistExtensions
{
  return [a3 audioPlaylistItem];
}

- (void)writeToKeyValuePair:()PlaylistExtensions
{
  id v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  [v4 setAudioPlaylistItem:a1];
}

- (id)order
{
  if ([a1 hasListOrder])
  {
    v2 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1, "listOrder"));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)copyWithOrder:()PlaylistExtensions
{
  id v4 = a3;
  v5 = (void *)[a1 copy];
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setListOrder:", objc_msgSend(v4, "longLongValue"));
  }
  else
  {
    [v5 setListOrder:0];
    [v6 setHasListOrder:0];
  }

  return v6;
}

@end