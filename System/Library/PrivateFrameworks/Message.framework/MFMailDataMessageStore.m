@interface MFMailDataMessageStore
+ (Class)classForMimePart;
- (BOOL)shouldDownloadBodyDataForMessage:(id)a3;
- (MFMailboxUid)mailbox;
- (MailAccount)account;
- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4;
- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5;
@end

@implementation MFMailDataMessageStore

+ (Class)classForMimePart
{
  return (Class)objc_opt_class();
}

- (MailAccount)account
{
  return 0;
}

- (MFMailboxUid)mailbox
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailDataMessageStore;
  v2 = [(MFDataMessageStore *)&v4 mailboxUid];
  return (MFMailboxUid *)v2;
}

- (BOOL)shouldDownloadBodyDataForMessage:(id)a3
{
  return 0;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  v6 = [a4 parentPart];
  v7 = [v6 mimeBody];
  v8 = [v7 message];

  v9 = [v8 storageLocationForAttachment:v5];

  return v9;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  id v5 = a3;
  return v5;
}

@end