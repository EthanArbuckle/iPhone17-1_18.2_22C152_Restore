@interface MSDGreyMatterHelper
+ (BOOL)isOptedIn;
+ (BOOL)waitForGMAvailability;
+ (void)configureAutoUpdate:(BOOL)a3;
+ (void)preservePrivateAccessTokens;
+ (void)purgeExistingAssetOfIdentifier:(id)a3;
+ (void)purgeExistingAssets;
+ (void)restorePrivateAccessTokens;
+ (void)setIsOptedIn:(BOOL)a3;
+ (void)toggleAutoUpdate:(BOOL)a3 forAssetOfIdentifier:(id)a4;
@end

@implementation MSDGreyMatterHelper

+ (BOOL)isOptedIn
{
  return +[MSDGreyMatterOpter isOptedIn];
}

+ (void)setIsOptedIn:(BOOL)a3
{
}

+ (BOOL)waitForGMAvailability
{
  unsigned __int8 v15 = 0;
  v2 = [@"/var/MobileAsset/AssetsV2" stringByAppendingPathComponent:@"com_apple_MobileAsset_UAF_FM_GenerativeModels"];
  v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:v2 isDirectory:&v15];
  int v5 = v15;

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6
    || (+[NSFileManager defaultManager],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 contentsOfDirectoryAtPath:v2 error:0],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        id v9 = [v8 count],
        v8,
        !v9))
  {
    v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "+[MSDGreyMatterHelper waitForGMAvailability]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s - Device has no GM assets.  Skip checkAvailability", buf, 0xCu);
    }

    unsigned __int8 v12 = 1;
  }
  else
  {
    if (+[MSDGreyMatterAvailabilityChecker waitForGMAvailability])
    {
      v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "+[MSDGreyMatterHelper waitForGMAvailability]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Now wait for Generative Playground app to become available!", buf, 0xCu);
      }

      v11 = +[MSDAppHelper sharedInstance];
      unsigned __int8 v12 = [v11 waitForAppToInstall:@"com.apple.GenerativePlaygroundApp" withTimeout:600];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
    sleep(0xAu);
  }

  return v12;
}

+ (void)preservePrivateAccessTokens
{
  v2 = +[MSDCryptoHandler sharedInstance];
  v3 = +[NSFileManager defaultManager];
  unsigned int v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Preserving Thimble long-lived tokens stored in keychain!", buf, 2u);
  }

  if ([v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.ThimbleLongLivedTokens"])
  {
    id v9 = 0;
    unsigned __int8 v5 = [v3 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.ThimbleLongLivedTokens" error:&v9];
    id v6 = v9;
    if ((v5 & 1) == 0)
    {
      v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000CCF8C(v6);
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  if (([v2 preserveAndEncryptKeychainItemsForKey:@"com.apple.NetworkServiceProxy.PrivateAccessTokens.LongLivedTokens" toFile:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.ThimbleLongLivedTokens"] & 1) == 0)
  {
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CCF58();
    }
  }
}

+ (void)restorePrivateAccessTokens
{
  v2 = +[MSDCryptoHandler sharedInstance];
  v3 = +[NSFileManager defaultManager];
  unsigned int v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restoring Thimble long-lived tokens to keychain!", buf, 2u);
  }

  if (([v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.ThimbleLongLivedTokens"] & 1) == 0)
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No input file for Thimble long-lived tokens found.", v10, 2u);
    }
    id v6 = 0;
    goto LABEL_12;
  }
  if (([v2 restoreAndDecryptKeychainItemsForKey:@"com.apple.NetworkServiceProxy.PrivateAccessTokens.LongLivedTokens" fromFile:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.ThimbleLongLivedTokens"] & 1) == 0)
  {
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CD01C();
    }
  }
  if (![v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.ThimbleLongLivedTokens"])
  {
    id v6 = 0;
    goto LABEL_14;
  }
  id v9 = 0;
  unsigned __int8 v5 = [v3 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/com.apple.MobileStoreDemo.ThimbleLongLivedTokens" error:&v9];
  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000CCF8C(v6);
    }
LABEL_12:
  }
LABEL_14:
}

+ (void)configureAutoUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [&off_100162D10 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(&off_100162D10);
        }
        +[MSDGreyMatterHelper toggleAutoUpdate:v3 forAssetOfIdentifier:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [&off_100162D10 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)purgeExistingAssets
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = [&off_100162D28 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(&off_100162D28);
        }
        +[MSDGreyMatterHelper purgeExistingAssetOfIdentifier:*(void *)(*((void *)&v6 + 1) + 8 * (void)v5)];
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [&off_100162D28 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

+ (void)toggleAutoUpdate:(BOOL)a3 forAssetOfIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  long long v6 = MAGetPallasUrlForType();
  long long v7 = +[NSURL URLWithString:@"https://foobar.apple.com"];
  unsigned int v8 = [v6 isEqual:v7];
  if (v4)
  {
    if (v8)
    {
      long long v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543362;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Clearing bogus Pallas URL to enable update for asset: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      if (MASetPallasUrlForType())
      {
        long long v10 = sub_100068600();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000CD050();
        }
LABEL_14:
      }
    }
  }
  else if ((v8 & 1) == 0)
  {
    long long v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Applying bogus Pallas URL to disable update for asset: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    if (MASetPallasUrlForType())
    {
      long long v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000CD0BC();
      }
      goto LABEL_14;
    }
  }
}

+ (void)purgeExistingAssetOfIdentifier:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Purging existing asset: %{public}@", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100043788;
  v14[3] = &unk_100152938;
  long long v6 = v4;
  unsigned __int8 v15 = v6;
  +[MAAutoAssetSet eliminateAtomic:@"Demod purging GreyMatter assets" usingClientDomain:@"com.apple.mobilestoredemod" forAssetSetIdentifier:v3 awaitingUnlocked:1 completion:v14];
  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    unsigned int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CD15C();
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000437F4;
  v12[3] = &unk_100152960;
  long long v9 = v6;
  id v13 = v9;
  +[MAAutoAsset eliminateAllForAssetType:v3 completion:v12];
  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    long long v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CD128();
    }
  }
}

@end