@interface _MFIMAPMailboxDeletionQueueEntry
- (IMAPAccount)account;
- (NSArray)paths;
- (NSArray)urls;
- (void)setAccount:(id)a3;
- (void)setPaths:(id)a3;
- (void)setUrls:(id)a3;
@end

@implementation _MFIMAPMailboxDeletionQueueEntry

- (NSArray)urls
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrls:(id)a3
{
}

- (NSArray)paths
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPaths:(id)a3
{
}

- (IMAPAccount)account
{
  return (IMAPAccount *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->account, 0);
  objc_storeStrong((id *)&self->paths, 0);
  objc_storeStrong((id *)&self->urls, 0);
}

@end