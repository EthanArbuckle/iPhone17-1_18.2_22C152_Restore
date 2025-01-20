@interface UNNotificationSound(MTSound_Notifications)
- (id)mtSound;
- (id)mt_Description;
@end

@implementation UNNotificationSound(MTSound_Notifications)

- (id)mtSound
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(a1, "mt_Description");
    int v17 = 138412290;
    v18 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "[Sound] Converting %@ to MTSound", (uint8_t *)&v17, 0xCu);
  }
  v4 = [a1 toneIdentifier];

  if (v4)
  {
    v5 = [a1 toneIdentifier];
    v6 = [a1 vibrationIdentifier];
    v7 = [a1 audioVolume];
    uint64_t v8 = +[MTSound toneSoundWithIdentifier:v5 vibrationIdentifer:v6 volume:v7];
LABEL_7:
    v9 = (void *)v8;

    goto LABEL_8;
  }
  if ([a1 toneMediaLibraryItemIdentifier])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(a1, "toneMediaLibraryItemIdentifier"));
    v6 = [a1 vibrationIdentifier];
    v7 = [a1 audioVolume];
    uint64_t v8 = +[MTSound songSoundWithIdentifier:v5 vibrationIdentifier:v6 volume:v7];
    goto LABEL_7;
  }
  v12 = [a1 alertTopic];
  char v13 = [v12 isEqualToString:*MEMORY[0x1E4FAF608]];

  if (v13)
  {
    uint64_t v14 = 2;
  }
  else
  {
    v15 = [a1 alertTopic];
    char v16 = [v15 isEqualToString:*MEMORY[0x1E4FAF610]];

    if (v16) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 4 * ([a1 alertType] == 17);
    }
  }
  v9 = +[MTSound defaultSoundForCategory:v14];
LABEL_8:
  v10 = MTLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v9;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "[Sound] Made %@", (uint8_t *)&v17, 0xCu);
  }

  return v9;
}

- (id)mt_Description
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = [a1 alertTopic];
  v5 = [a1 toneIdentifier];
  uint64_t v6 = [a1 toneMediaLibraryItemIdentifier];
  v7 = [a1 vibrationIdentifier];
  uint64_t v8 = [a1 audioVolume];
  v9 = [v2 stringWithFormat:@"<%@:%p alertTopic: %@, toneID: %@, mediaItemID: %llu, vibeID: %@, volume: %@", v3, a1, v4, v5, v6, v7, v8];

  return v9;
}

@end