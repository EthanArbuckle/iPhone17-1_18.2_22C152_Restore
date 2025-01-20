@interface ICAttachmentLocation
+ (id)newAttachmentLocationForAttachment:(id)a3;
- (NSString)formattedAddressWithoutAttachmentTitle;
@end

@implementation ICAttachmentLocation

- (NSString)formattedAddressWithoutAttachmentTitle
{
  v3 = [(ICLocation *)self formattedAddress];
  v4 = [(ICAttachmentLocation *)self attachment];
  uint64_t v5 = [v4 title];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(ICAttachmentLocation *)self attachment];
    v8 = [v7 title];
    int v9 = [v3 hasPrefix:v8];

    if (!v9) {
      goto LABEL_5;
    }
    v4 = [(ICAttachmentLocation *)self attachment];
    v10 = [v4 title];
    uint64_t v11 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v10, "length"));

    v3 = (void *)v11;
  }

LABEL_5:
  v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v13 = [v3 stringByTrimmingCharactersInSet:v12];

  return (NSString *)v13;
}

+ (id)newAttachmentLocationForAttachment:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C0A8];
  id v4 = a3;
  uint64_t v5 = [v4 managedObjectContext];
  v6 = [v3 insertNewObjectForEntityForName:@"ICAttachmentLocation" inManagedObjectContext:v5];

  [v6 setAttachment:v4];
  return v6;
}

@end