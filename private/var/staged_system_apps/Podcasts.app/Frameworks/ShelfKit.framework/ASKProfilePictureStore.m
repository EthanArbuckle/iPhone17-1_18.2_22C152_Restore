@interface ASKProfilePictureStore
+ (ASKProfilePictureStore)sharedStore;
- (AAUIProfilePictureStore)profilePictureStore;
- (ACAccount)primaryAccount;
- (ACAccount)storeAccount;
- (ACAccountStore)accountStore;
- (ASKProfilePictureStore)init;
- (BOOL)hasRequestedImages;
- (NSString)primaryAccountName;
- (NSString)storeAccountName;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)notificationQueue;
- (void)_markAsHasRequestedImages;
- (void)appleAccountsDidChange:(id)a3;
- (void)configureProfilePictureStoreAndNotifyIfNeeded;
- (void)dealloc;
- (void)notifyIfNeeded;
- (void)profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter:(double)a3 completion:(id)a4;
- (void)profilePictureStoreDidChange:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setHasRequestedImages:(BOOL)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setPrimaryAccount:(id)a3;
- (void)setPrimaryAccountName:(id)a3;
- (void)setProfilePictureStore:(id)a3;
- (void)setStoreAccount:(id)a3;
- (void)setStoreAccountName:(id)a3;
- (void)storeAccountsDidChange:(id)a3;
@end

@implementation ASKProfilePictureStore

+ (ASKProfilePictureStore)sharedStore
{
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedStore_instance;

  return (ASKProfilePictureStore *)v2;
}

void __37__ASKProfilePictureStore_sharedStore__block_invoke(id a1)
{
  sharedStore_instance = objc_alloc_init(ASKProfilePictureStore);

  _objc_release_x1();
}

- (ASKProfilePictureStore)init
{
  v16.receiver = self;
  v16.super_class = (Class)ASKProfilePictureStore;
  v2 = [(ASKProfilePictureStore *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("ShelfKit.ASKProfilePictureStore.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("ShelfKit.ASKProfilePictureStore.notificationQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v7 = +[NSNotificationCenter defaultCenter];
    uint64_t v8 = ACDAccountStoreDidChangeNotification;
    [v7 addObserver:v2 selector:"appleAccountsDidChange:" name:ACDAccountStoreDidChangeNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"storeAccountsDidChange:" name:v8 object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"profilePictureStoreDidChange:" name:AAUIProfilePictureStoreDidChangeNotification object:0];

    objc_initWeak(&location, v2);
    v11 = [(ASKProfilePictureStore *)v2 accessQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __30__ASKProfilePictureStore_init__block_invoke;
    v13[3] = &unk_471070;
    objc_copyWeak(&v14, &location);
    dispatch_async(v11, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__ASKProfilePictureStore_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained configureProfilePictureStoreAndNotifyIfNeeded];
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASKProfilePictureStore;
  [(ASKProfilePictureStore *)&v4 dealloc];
}

- (void)configureProfilePictureStoreAndNotifyIfNeeded
{
  dispatch_queue_t v3 = [(ASKProfilePictureStore *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = +[ACAccountStore ams_sharedAccountStore];
  [(ASKProfilePictureStore *)self setAccountStore:v4];

  dispatch_queue_t v5 = [(ASKProfilePictureStore *)self accountStore];
  [v5 aa_primaryAppleAccount];
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [v26 username];
  v7 = [(ASKProfilePictureStore *)self accountStore];
  uint64_t v8 = [v7 ams_activeiTunesAccount];
  v9 = [v8 username];

  v10 = [(ASKProfilePictureStore *)self primaryAccountName];
  id v11 = [v10 length];
  if (v11 == [v6 length])
  {
    unsigned int v12 = 0;
  }
  else
  {
    v13 = [(ASKProfilePictureStore *)self primaryAccountName];
    unsigned int v12 = [v13 isEqualToString:v6] ^ 1;
  }
  id v14 = [(ASKProfilePictureStore *)self storeAccountName];
  id v15 = [v14 length];
  if (v15 == [v9 length])
  {
    unsigned int v16 = 0;
  }
  else
  {
    v17 = [(ASKProfilePictureStore *)self storeAccountName];
    unsigned int v16 = [v17 isEqualToString:v9] ^ 1;
  }
  if ([v6 length] && objc_msgSend(v9, "length"))
  {
    v18 = [(ASKProfilePictureStore *)self profilePictureStore];
    BOOL v19 = v18 == 0;
    int v20 = 1;
  }
  else
  {
    v18 = [(ASKProfilePictureStore *)self profilePictureStore];
    int v20 = 0;
    BOOL v19 = v18 != 0;
  }

  int v21 = v12 | v16;
  if ((v21 & 1) != 0 || v19)
  {
    [(ASKProfilePictureStore *)self setPrimaryAccountName:v6];
    [(ASKProfilePictureStore *)self setStoreAccountName:v9];
    if (v20)
    {
      id v22 = objc_alloc((Class)AAUIProfilePictureStore);
      v23 = [(ASKProfilePictureStore *)self accountStore];
      id v24 = [v22 initWithAppleAccount:v26 store:v23];
      [(ASKProfilePictureStore *)self setProfilePictureStore:v24];

      v25 = [(ASKProfilePictureStore *)self profilePictureStore];
      [v25 setMonogramType:0];

      if (!v21) {
        goto LABEL_18;
      }
    }
    else
    {
      [(ASKProfilePictureStore *)self setProfilePictureStore:0];
      if (!v21) {
        goto LABEL_18;
      }
    }
    [(ASKProfilePictureStore *)self notifyIfNeeded];
  }
LABEL_18:
}

- (void)notifyIfNeeded
{
  dispatch_queue_t v3 = [(ASKProfilePictureStore *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  if ([(ASKProfilePictureStore *)self hasRequestedImages])
  {
    objc_initWeak(&location, self);
    objc_super v4 = [(ASKProfilePictureStore *)self notificationQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __40__ASKProfilePictureStore_notifyIfNeeded__block_invoke;
    v5[3] = &unk_471070;
    objc_copyWeak(&v6, &location);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __40__ASKProfilePictureStore_notifyIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"ASKProfilePictureStoreDidChange" object:WeakRetained];
}

- (void)appleAccountsDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = [(ASKProfilePictureStore *)self accessQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __49__ASKProfilePictureStore_appleAccountsDidChange___block_invoke;
  v6[3] = &unk_471070;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__ASKProfilePictureStore_appleAccountsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_alloc_init((Class)ACAccountStore);
  [WeakRetained setAccountStore:v1];

  [WeakRetained setProfilePictureStore:0];
  [WeakRetained configureProfilePictureStoreAndNotifyIfNeeded];
}

- (void)storeAccountsDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = [(ASKProfilePictureStore *)self accessQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __49__ASKProfilePictureStore_storeAccountsDidChange___block_invoke;
  v6[3] = &unk_471070;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__ASKProfilePictureStore_storeAccountsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained configureProfilePictureStoreAndNotifyIfNeeded];
}

- (void)profilePictureStoreDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = [(ASKProfilePictureStore *)self accessQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __55__ASKProfilePictureStore_profilePictureStoreDidChange___block_invoke;
  v6[3] = &unk_471070;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__ASKProfilePictureStore_profilePictureStoreDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyIfNeeded];
}

- (void)profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter:(double)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(ASKProfilePictureStore *)self accessQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __109__ASKProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter_completion___block_invoke;
  v9[3] = &unk_471110;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __109__ASKProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = *(double *)(a1 + 48);
  id v4 = [WeakRetained profilePictureStore];
  [v4 setPictureDiameter:v3];

  dispatch_queue_t v5 = [WeakRetained profilePictureStore];
  id v6 = [v5 profilePictureForAccountOwnerWithoutMonogramFallback];

  [WeakRetained _markAsHasRequestedImages];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __109__ASKProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter_completion___block_invoke_2;
  v9[3] = &unk_4710E8;
  id v7 = *(id *)(a1 + 32);
  id v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

uint64_t __109__ASKProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallbackWithPictureDiameter_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_markAsHasRequestedImages
{
  if (![(ASKProfilePictureStore *)self hasRequestedImages])
  {
    [(ASKProfilePictureStore *)self setHasRequestedImages:1];
  }
}

- (AAUIProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (void)setProfilePictureStore:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (ACAccount)storeAccount
{
  return self->_storeAccount;
}

- (void)setStoreAccount:(id)a3
{
}

- (ACAccount)primaryAccount
{
  return self->_primaryAccount;
}

- (void)setPrimaryAccount:(id)a3
{
}

- (NSString)primaryAccountName
{
  return self->_primaryAccountName;
}

- (void)setPrimaryAccountName:(id)a3
{
}

- (NSString)storeAccountName
{
  return self->_storeAccountName;
}

- (void)setStoreAccountName:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BOOL)hasRequestedImages
{
  return self->_hasRequestedImages;
}

- (void)setHasRequestedImages:(BOOL)a3
{
  self->_hasRequestedImages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_storeAccountName, 0);
  objc_storeStrong((id *)&self->_primaryAccountName, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_storeAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_profilePictureStore, 0);
}

@end