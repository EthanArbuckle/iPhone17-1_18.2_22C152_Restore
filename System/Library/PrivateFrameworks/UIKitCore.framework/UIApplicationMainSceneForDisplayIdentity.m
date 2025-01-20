@interface UIApplicationMainSceneForDisplayIdentity
@end

@implementation UIApplicationMainSceneForDisplayIdentity

void ___UIApplicationMainSceneForDisplayIdentity_block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  v6 = [v16 settings];
  v7 = [v6 displayIdentity];

  v8 = (void *)a1[4];
  if (v8)
  {
    if (([v8 isEqual:v7] & 1) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
    v9 = +[UIScreen _screenWithFBSDisplayIdentity:v7];
    int v10 = [v9 _isMainScreen];

    if (!v10) {
      goto LABEL_13;
    }
  }
  v11 = (void *)a1[5];
  if (v11)
  {
    v12 = [v16 identityToken];
    if ([v11 isEqual:v12]) {
      v13 = v16;
    }
    else {
      v13 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v13);
  }
  else
  {
    uint64_t v14 = *(void *)(a1[6] + 8);
    id v15 = v16;
    v12 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }

  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    *a4 = 1;
  }
LABEL_13:
}

@end