@interface NSUserActivity(IMAVPlayer)
- (double)currentTime;
- (id)containerIdentifier;
- (id)containerTitle;
- (id)itemIdentifier;
- (id)itemTitle;
- (id)storeTrackID;
- (uint64_t)setContainerIdentifier:()IMAVPlayer;
- (uint64_t)setContainerTitle:()IMAVPlayer;
- (uint64_t)setItemIdentifier:()IMAVPlayer;
- (uint64_t)setItemTitle:()IMAVPlayer;
- (uint64_t)setStoreTrackID:()IMAVPlayer;
- (uint64_t)setValue:()IMAVPlayer forKey:;
- (void)setCurrentTime:()IMAVPlayer;
@end

@implementation NSUserActivity(IMAVPlayer)

- (uint64_t)setItemTitle:()IMAVPlayer
{
  return [a1 setValue:a3 forKey:@"itemTitle"];
}

- (id)itemTitle
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"itemTitle"];

  return v2;
}

- (uint64_t)setItemIdentifier:()IMAVPlayer
{
  return [a1 setValue:a3 forKey:@"itemIdentifier"];
}

- (id)itemIdentifier
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"itemIdentifier"];

  return v2;
}

- (uint64_t)setContainerTitle:()IMAVPlayer
{
  return [a1 setValue:a3 forKey:@"containerTitle"];
}

- (id)containerTitle
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"containerTitle"];

  return v2;
}

- (uint64_t)setContainerIdentifier:()IMAVPlayer
{
  return [a1 setValue:a3 forKey:@"containerIdentifier"];
}

- (id)containerIdentifier
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"containerIdentifier"];

  return v2;
}

- (void)setCurrentTime:()IMAVPlayer
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v2 forKey:@"currentTime"];
}

- (double)currentTime
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKey:@"currentTime"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (uint64_t)setStoreTrackID:()IMAVPlayer
{
  return [a1 setValue:a3 forKey:@"storeTrackID"];
}

- (id)storeTrackID
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKey:@"storeTrackID"];

  return v2;
}

- (uint64_t)setValue:()IMAVPlayer forKey:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = (void *)result;
    v10 = a4;
    v11[0] = a3;
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    id v7 = a4;
    id v8 = a3;
    v9 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];

    [v5 addUserInfoEntriesFromDictionary:v9];
    return [v5 setNeedsSave:1];
  }
  return result;
}

@end