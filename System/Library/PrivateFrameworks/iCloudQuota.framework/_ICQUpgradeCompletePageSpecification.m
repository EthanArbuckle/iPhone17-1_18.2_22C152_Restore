@interface _ICQUpgradeCompletePageSpecification
+ (id)upgradeCompletePageSpecificationSampleForLevel:(int64_t)a3;
- (BOOL)hasCancelButtonForBack;
- (ICQLink)doneLink;
- (NSString)message;
- (NSString)title;
- (id)pageIdentifier;
- (void)setDoneLink:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _ICQUpgradeCompletePageSpecification

+ (id)upgradeCompletePageSpecificationSampleForLevel:(int64_t)a3
{
  v3 = objc_opt_new();
  [v3 setTitle:@"Storage Upgraded"];
  [v3 setMessage:@"You now have 50 GB of total storage.\niCloud will continue to backup your iPhone and keep your photos, documents, contacts and more up to date across all your devices.\n[ENG: LOCAL SAMPLE UI]"];
  v4 = +[ICQLink linkWithText:@"Done" action:5 parameters:MEMORY[0x1E4F1CC08]];
  [v3 setDoneLink:v4];

  return v3;
}

- (id)pageIdentifier
{
  return @"ICQUpgradeComplete";
}

- (BOOL)hasCancelButtonForBack
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (ICQLink)doneLink
{
  return self->_doneLink;
}

- (void)setDoneLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneLink, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end