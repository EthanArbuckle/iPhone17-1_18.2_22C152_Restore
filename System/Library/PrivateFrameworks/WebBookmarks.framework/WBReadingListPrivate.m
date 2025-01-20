@interface WBReadingListPrivate
- (WBReadingListPrivate)init;
- (void)_addReadingListItemWithURL:(id)a3 title:(id)a4 previewText:(id)a5;
@end

@implementation WBReadingListPrivate

- (WBReadingListPrivate)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBReadingListPrivate;
  v2 = [(WBReadingListPrivate *)&v8 init];
  if (v2)
  {
    v3 = [WebBookmarksXPCConnection alloc];
    uint64_t v4 = [(WebBookmarksXPCConnection *)v3 initClientForMachService:kWebBookmarksdServiceName];
    connection = v2->_connection;
    v2->_connection = (WebBookmarksXPCConnection *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)_addReadingListItemWithURL:(id)a3 title:(id)a4 previewText:(id)a5
{
  id v22 = a4;
  id v8 = a5;
  id v9 = a3;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  v11 = [v9 absoluteString];

  id v12 = v11;
  v13 = (const char *)[v12 UTF8String];

  if (v22)
  {
    +[WebBookmark _trimmedTitle:](WebBookmark, "_trimmedTitle:");
    id v14 = objc_claimAutoreleasedReturnValue();
    v15 = (const char *)[v14 UTF8String];

    if (v8)
    {
LABEL_3:
      id v16 = +[WebBookmark _trimmedPreviewText:v8];
      v17 = (const char *)[v16 UTF8String];

      goto LABEL_6;
    }
  }
  else
  {
    v15 = "";
    if (v8) {
      goto LABEL_3;
    }
  }
  v17 = "";
LABEL_6:
  xpc_dictionary_set_string(v10, kWebBookmarksAddressKey, v13);
  xpc_dictionary_set_string(v10, kWebBookmarksTitleKey, v15);
  xpc_dictionary_set_string(v10, kWebBookmarksPreviewTextKey, v17);
  v18 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksAddToReadingListMessageName];
  xpc_dictionary_set_value(v18, kWebBookmarksItemKey, v10);
  [(WebBookmarksXPCConnection *)self->_connection sendMessage:v18];
  v19 = +[WBFeatureManager sharedFeatureManager];
  int v20 = [v19 isOfflineReadingListAvailable];

  if (v20)
  {
    v21 = objc_alloc_init(SafariFetcherServerProxy);
    [(SafariFetcherServerProxy *)v21 startReadingListFetcher];
  }
}

- (void).cxx_destruct
{
}

@end