@interface IDSAccount
+ (id)mr_activeGroupSessionAccount;
+ (id)mr_localGroupSessionHandle;
@end

@implementation IDSAccount

+ (id)mr_activeGroupSessionAccount
{
  v2 = +[IDSService mr_sharedGroupSessionService];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(v2, "accounts", 0);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v7 accountType] == 1)
        {
          if ([v7 isActive])
          {
            v8 = [v7 accountRegisteredURIs];
            id v9 = [v8 count];

            if (v9)
            {
              id v4 = v7;
              goto LABEL_13;
            }
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

+ (id)mr_localGroupSessionHandle
{
  v2 = +[IDSAccount mr_activeGroupSessionAccount];
  v3 = [v2 loginID];

  if (v3) {
    id v4 = (void *)IDSCopyIDForEmailAddress();
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end