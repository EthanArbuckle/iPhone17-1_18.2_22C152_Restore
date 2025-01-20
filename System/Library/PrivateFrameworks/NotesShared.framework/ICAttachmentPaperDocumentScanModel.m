@interface ICAttachmentPaperDocumentScanModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
@end

@implementation ICAttachmentPaperDocumentScanModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  v4 = NSString;
  v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_SCANNED_DOCUMENTS_%lu" value:@"NOTE_LIST_SCANNED_DOCUMENTS_%lu" table:0 allowSiri:1];
  v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

@end