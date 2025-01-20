@interface ICAttachmentWebModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
- (BOOL)canConvertToHTMLForSharing;
- (BOOL)hasPreviews;
- (BOOL)showThumbnailInNoteList;
- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4;
- (id)pendingFetchCompletionHandler;
- (id)searchableTextContent;
- (void)setPendingFetchCompletionHandler:(id)a3;
@end

@implementation ICAttachmentWebModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  v4 = NSString;
  v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_WEB_LINKS_%lu" value:@"NOTE_LIST_WEB_LINKS_%lu" table:0 allowSiri:1];
  v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)showThumbnailInNoteList
{
  v3 = [(ICAttachmentModel *)self attachment];
  v4 = [v3 previewImages];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(ICAttachmentModel *)self attachment];
    v7 = [v6 URL];

    if (objc_msgSend(v7, "ic_isMapURL") & 1) != 0 || (objc_msgSend(v7, "ic_isiTunesURL")) {
      LOBYTE(v8) = 0;
    }
    else {
      int v8 = objc_msgSend(v7, "ic_isAppStoreURL") ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)searchableTextContent
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v11.receiver = self;
  v11.super_class = (Class)ICAttachmentWebModel;
  v4 = [(ICAttachmentModel *)&v11 searchableTextContent];
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  uint64_t v5 = [(ICAttachmentModel *)self attachment];
  v6 = [v5 title];
  objc_msgSend(v3, "ic_addNonNilObject:", v6);

  v7 = [(ICAttachmentModel *)self attachment];
  int v8 = [v7 quotedText];
  objc_msgSend(v3, "ic_addNonNilObject:", v8);

  v9 = [v3 componentsJoinedByString:@" "];

  return v9;
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  v6 = [(ICAttachmentModel *)self attachment];
  v7 = [v6 urlString];

  *a3 = @"a";
  id v8 = v7;
  *a4 = v8;
  v9 = [NSString stringWithFormat:@"href=%@", v8];

  return v9;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 1;
}

- (id)pendingFetchCompletionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingFetchCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end