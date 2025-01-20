@interface ICQUserNotifications
+ (void)postUserNotificationWithIdentifier:(id)a3 title:(id)a4 subTitle:(id)a5 bodyText:(id)a6 url:(id)a7 replaceExisting:(BOOL)a8 offerID:(id)a9 completion:(id)a10;
@end

@implementation ICQUserNotifications

+ (void)postUserNotificationWithIdentifier:(id)a3 title:(id)a4 subTitle:(id)a5 bodyText:(id)a6 url:(id)a7 replaceExisting:(BOOL)a8 offerID:(id)a9 completion:(id)a10
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v15 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v31 = a4;
  id v32 = a5;
  id v33 = a6;
  id v16 = a7;
  id v17 = a9;
  id v18 = a10;
  if (!a8)
  {
    v19 = +[_ICQHelperFunctions userDefaultsDictionaryForKey:@"ICQUserNotificationKey"];
    id v20 = [v19 objectForKeyedSubscript:v17];
    v21 = _ICQGetLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v38 = v15;
      _os_log_impl(&dword_1D5851000, v21, OS_LOG_TYPE_DEFAULT, "ICQUserNotification for offerID: %@, last notification ID was %@, new ID %@", buf, 0x20u);
    }

    if (v20 && [v15 isEqualToString:v20])
    {
      v22 = _ICQGetLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v15;
        _os_log_impl(&dword_1D5851000, v22, OS_LOG_TYPE_DEFAULT, "Ignoring notification with id %@ since it was already posted and we were asked not to repost.", buf, 0xCu);
      }
      goto LABEL_20;
    }
  }
  v23 = +[_ICQHelperFunctions userDefaultsDictionaryForKey:@"ICQUserNotificationKey"];
  v19 = (void *)[v23 mutableCopy];

  if (!v19) {
    v19 = objc_opt_new();
  }
  [v19 setObject:v15 forKeyedSubscript:v17];
  v24 = (void *)[v19 copy];
  +[_ICQHelperFunctions setUserDefaultsObject:v24 forKey:@"ICQUserNotificationKey"];

  id v20 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  [v20 setTitle:v31];
  [v20 setSubtitle:v32];
  [v20 setBody:v33];
  v25 = _ICQGetLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v16;
    _os_log_impl(&dword_1D5851000, v25, OS_LOG_TYPE_DEFAULT, "ICQUserNotifications: got URL: %@", buf, 0xCu);
  }

  if (v16)
  {
    v26 = v16;
  }
  else
  {
    v26 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ROOT"];
  }
  v22 = v26;
  [v20 setDefaultActionURL:v26];
  if (v15)
  {
    v27 = v15;
  }
  else
  {
    v28 = [MEMORY[0x1E4F29128] UUID];
    v27 = [v28 UUIDString];
  }
  v29 = [MEMORY[0x1E4F44628] requestWithIdentifier:v27 content:v20 trigger:0];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v38 = __Block_byref_object_copy__3;
  v39 = __Block_byref_object_dispose__3;
  id v40 = (id)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.iCloud.FollowUp"];
  v30 = *(void **)(*(void *)&buf[8] + 40);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __122__ICQUserNotifications_postUserNotificationWithIdentifier_title_subTitle_bodyText_url_replaceExisting_offerID_completion___block_invoke;
  v34[3] = &unk_1E6A52708;
  id v35 = v18;
  v36 = buf;
  [v30 addNotificationRequest:v29 withCompletionHandler:v34];

  _Block_object_dispose(buf, 8);
LABEL_20:
}

void __122__ICQUserNotifications_postUserNotificationWithIdentifier_title_subTitle_bodyText_url_replaceExisting_offerID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

@end