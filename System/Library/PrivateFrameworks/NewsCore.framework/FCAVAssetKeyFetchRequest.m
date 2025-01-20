@interface FCAVAssetKeyFetchRequest
- (id)initWithContentKeySession:(void *)a3 keyURIs:(char)a4 forceRefresh:(void *)a5 completionHandler:;
@end

@implementation FCAVAssetKeyFetchRequest

- (id)initWithContentKeySession:(void *)a3 keyURIs:(char)a4 forceRefresh:(void *)a5 completionHandler:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)FCAVAssetKeyFetchRequest;
    v13 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 2, a2);
      uint64_t v14 = [v11 mutableCopy];
      id v15 = a1[3];
      a1[3] = (id)v14;

      *((unsigned char *)a1 + 8) = a4;
      uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
      id v17 = a1[4];
      a1[4] = (id)v16;

      uint64_t v18 = [v12 copy];
      id v19 = a1[5];
      a1[5] = (id)v18;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_errorsEncountered, 0);
  objc_storeStrong((id *)&self->_remainingKeyURIs, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
}

@end