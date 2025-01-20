@interface MessageContentRepresentationRequestDelegate
- (void)contentObjectID:(id)a3 generateHTMLSnippetsForRelatedContentItems:(id)a4 completionHandler:(id)a5;
- (void)contentObjectID:(id)a3 placeholderHTMLForEmptyContentWithCompletionHandler:(id)a4;
@end

@implementation MessageContentRepresentationRequestDelegate

- (void)contentObjectID:(id)a3 generateHTMLSnippetsForRelatedContentItems:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void (**)(id, void *, void))a5;
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v14 = +[ContentItemMarkupGenerator markupStringForDisplayForContentItem:](ContentItemMarkupGenerator, "markupStringForDisplayForContentItem:", v13, (void)v16);
        v15 = [v13 contentID];
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v7[2](v7, v8, 0);
}

- (void)contentObjectID:(id)a3 placeholderHTMLForEmptyContentWithCompletionHandler:(id)a4
{
  id v9 = (void (**)(id, void *, void))a4;
  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 localizedStringForKey:@"NO_BODY" value:&stru_1F39E2A88 table:@"Main"];

  id v6 = NSString;
  v7 = objc_msgSend(v5, "mf_stringByEscapingHTMLCodes");
  v8 = [v6 localizedStringWithFormat:@"<html dir=auto><body><i><font color=#888>%@</font></i></body></html>", v7];

  v9[2](v9, v8, 0);
}

@end