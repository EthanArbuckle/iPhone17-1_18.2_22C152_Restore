@interface MFParseMessageForWatch
+ (BOOL)attachmentTypeIsActionable:(unint64_t)a3;
+ (id)accountIDForAccount:(id)a3;
+ (id)createAttachment;
+ (id)createContentAttributedStringHTMLParser;
+ (id)createHTMLFromText:(id)a3 delSp:(BOOL)a4 flowed:(BOOL)a5;
+ (id)createImageAttachment;
+ (id)createMessage;
+ (id)createMessageContent;
+ (id)generateNotificationIdWithFolderId:(id)a3 remoteId:(id)a4;
+ (id)nanoMailboxIDForMFMailboxUID:(id)a3;
+ (id)scaleImageFromData:(id)a3 maxWidth:(float)a4;
+ (id)trimAttributedString:(id)a3;
@end

@implementation MFParseMessageForWatch

+ (id)createContentAttributedStringHTMLParser
{
  id v2 = objc_alloc_init(getNNMKContentAttributedStringHTMLParserClass());
  return v2;
}

+ (BOOL)attachmentTypeIsActionable:(unint64_t)a3
{
  Class NNMKAttachmentClass = getNNMKAttachmentClass();
  return [(objc_class *)NNMKAttachmentClass isTypeActionable:a3];
}

+ (id)trimAttributedString:(id)a3
{
  id v3 = a3;
  v4 = [(objc_class *)getNNMKContentAttributedStringHTMLParserClass() trimAttributedString:v3];

  return v4;
}

+ (id)createMessage
{
  id v2 = objc_alloc_init(getNNMKMessageClass());
  return v2;
}

+ (id)createMessageContent
{
  id v2 = objc_alloc_init(getNNMKMessageContentClass());
  return v2;
}

+ (id)createAttachment
{
  id v2 = objc_alloc_init(getNNMKAttachmentClass());
  return v2;
}

+ (id)createImageAttachment
{
  id v2 = objc_alloc_init(getNNMKImageAttachmentClass());
  return v2;
}

+ (id)generateNotificationIdWithFolderId:(id)a3 remoteId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(objc_class *)getNNMKMessageClass() generateNotificationIdWithFolderId:v5 remoteId:v6];

  return v7;
}

+ (id)accountIDForAccount:(id)a3
{
  id v3 = objc_msgSend(a3, "nano_account");
  v4 = [v3 accountId];

  return v4;
}

+ (id)nanoMailboxIDForMFMailboxUID:(id)a3
{
  id v3 = objc_msgSend(a3, "nano_mailboxId");
  return v3;
}

+ (id)scaleImageFromData:(id)a3 maxWidth:(float)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA58] data];
  Class NNMKImageUtilityClass = getNNMKImageUtilityClass();
  *(float *)&double v8 = a4;
  [(objc_class *)NNMKImageUtilityClass scaleImageFromData:v5 destinationData:v6 maxWidth:v8];

  return v6;
}

+ (id)createHTMLFromText:(id)a3 delSp:(BOOL)a4 flowed:(BOOL)a5
{
  if (a4) {
    int v5 = 10;
  }
  else {
    int v5 = 8;
  }
  char v8 = 0;
  id v6 = objc_msgSend(a3, "mf_convertFromFlowedText:visuallyEmpty:", v5 | a5, &v8);
  return v6;
}

@end