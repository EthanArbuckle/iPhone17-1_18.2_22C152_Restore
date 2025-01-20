@interface ICAttachmentGenericModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
- (BOOL)hasPreviews;
@end

@implementation ICAttachmentGenericModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  v4 = NSString;
  v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_ATTACHMENTS_%lu" value:@"NOTE_LIST_ATTACHMENTS_%lu" table:0 allowSiri:1];
  v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (BOOL)hasPreviews
{
  v2 = [(ICAttachmentModel *)self attachment];
  char v3 = [v2 usesLinkPresentation];

  return v3;
}

@end