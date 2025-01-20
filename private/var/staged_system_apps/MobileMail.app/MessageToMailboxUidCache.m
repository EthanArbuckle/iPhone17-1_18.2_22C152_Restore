@interface MessageToMailboxUidCache
- (MessageToMailboxUidCache)init;
- (MessageToMailboxUidCache)initWithLibrary:(id)a3;
- (id)_mailboxWithMailboxLibraryID:(int64_t)a3;
- (id)debugDescription;
- (id)mailboxForMessage:(id)a3;
- (unint64_t)count;
- (void)removeAllObjects;
@end

@implementation MessageToMailboxUidCache

- (MessageToMailboxUidCache)initWithLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MessageToMailboxUidCache.m", 22, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)MessageToMailboxUidCache;
  v7 = [(MessageToMailboxUidCache *)&v12 init];
  if (v7)
  {
    uint64_t v8 = +[NSMapTable strongToStrongObjectsMapTable];
    mailboxCache = v7->_mailboxCache;
    v7->_mailboxCache = (NSMapTable *)v8;

    objc_storeStrong((id *)&v7->_library, a3);
  }

  return v7;
}

- (MessageToMailboxUidCache)init
{
  v3 = +[MFMailMessageLibrary defaultInstance];
  v4 = [(MessageToMailboxUidCache *)self initWithLibrary:v3];

  return v4;
}

- (id)mailboxForMessage:(id)a3
{
  id v4 = a3;
  if (!qword_100699948) {
    qword_100699948 = objc_opt_class();
  }
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 mailboxID];
    mailboxCache = self->_mailboxCache;
    v7 = +[NSNumber numberWithLongLong:v5];
    uint64_t v8 = [(NSMapTable *)mailboxCache objectForKey:v7];

    if (!v8)
    {
      uint64_t v8 = [v4 mailbox];
      if (v8)
      {
        v9 = self->_mailboxCache;
        v10 = +[NSNumber numberWithLongLong:v5];
        [(NSMapTable *)v9 setObject:v8 forKey:v10];
      }
    }
  }
  else
  {
    uint64_t v8 = [v4 mailbox];
  }

  return v8;
}

- (void)removeAllObjects
{
}

- (unint64_t)count
{
  return [(NSMapTable *)self->_mailboxCache count];
}

- (id)_mailboxWithMailboxLibraryID:(int64_t)a3
{
  v3 = [(MFMailMessageLibrary *)self->_library urlForMailboxID:a3];
  id v4 = +[MailAccount mailboxUidFromActiveAccountsForURL:v3];

  return v4;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@:%p> {(\n"), v4, self;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_mailboxCache;
  id v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [(NSMapTable *)self->_mailboxCache objectForKey:v10];
        id v12 = [v10 unsignedLongValue];
        [v5 appendFormat:@"\t%ld\t: %@\n", v12, v11, (void)v14];
      }
      id v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [v5 appendString:@"}"]);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_mailboxCache, 0);
}

@end