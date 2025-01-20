@interface MFMailMessage
- (BOOL)canReplyAll;
@end

@implementation MFMailMessage

- (BOOL)canReplyAll
{
  v3 = [(MFMailMessage *)self to];
  v4 = +[MFEmailSet setWithArray:v3];

  v5 = [(MFMailMessage *)self cc];
  [v4 addObjectsFromArray:v5];

  v6 = [(MFMailMessage *)self senders];
  [v4 addObjectsFromArray:v6];

  v7 = [(MFMailMessage *)self account];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[MailAccount defaultMailAccountForDelivery];
  }
  v10 = v9;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = [v10 emailAddressesAndAliasesList];
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        [v4 removeObject:*(void *)(*((void *)&v17 + 1) + 8 * i)];
      }
      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  BOOL v15 = (unint64_t)[v4 count] > 1;
  return v15;
}

@end