@interface BKReadAloudEventHandler
+ (BKReadAloudEventHandler)readAloudEventHandlerWithMediaClass:(id)a3 delegate:(id)a4;
- (BKReadAloudEventHandlerDelegate)delegate;
- (NSString)mediaActiveClass;
- (void)addMarkupForReadAloudToDocument;
- (void)addhighlightForElementID:(id)a3;
- (void)installTapHandlersOnElementIDs:(id)a3 withHref:(id)a4;
- (void)removeHighlightForElementID:(id)a3;
- (void)removeMarkupForReadAloudToDocument;
- (void)removeTapHandlersOnElementIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaActiveClass:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation BKReadAloudEventHandler

+ (BKReadAloudEventHandler)readAloudEventHandlerWithMediaClass:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(BKReadAloudEventHandler);
  [(BKReadAloudEventHandler *)v7 setMediaActiveClass:v6];

  [(BKReadAloudEventHandler *)v7 setDelegate:v5];

  return v7;
}

- (void)setMediaActiveClass:(id)a3
{
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"media-overlay-active";
  }
  objc_storeStrong((id *)&self->_mediaActiveClass, v3);
}

- (void)addhighlightForElementID:(id)a3
{
  id v4 = a3;
  id v5 = [(BKReadAloudEventHandler *)self mediaActiveClass];
  id v8 = +[NSString stringWithFormat:@"__ibooks_read_aloud.highlightElement('%@', '%@')", v4, v5];

  id v6 = [(BKReadAloudEventHandler *)self delegate];
  v7 = [v6 wkWebView];
  [v7 evaluateJavaScript:v8 completionHandler:0];
}

- (void)removeHighlightForElementID:(id)a3
{
  id v4 = a3;
  id v5 = [(BKReadAloudEventHandler *)self mediaActiveClass];
  id v8 = +[NSString stringWithFormat:@"__ibooks_read_aloud.removeHighlightElement('%@', '%@')", v4, v5];

  id v6 = [(BKReadAloudEventHandler *)self delegate];
  v7 = [v6 wkWebView];
  [v7 evaluateJavaScript:v8 completionHandler:0];
}

- (void)installTapHandlersOnElementIDs:(id)a3 withHref:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = +[NSString stringWithFormat:@"__ibooks_read_aloud.installTapHandlerElementIDAndHREF('%@', '%@')", *(void *)(*((void *)&v16 + 1) + 8 * (void)v11), v7];
        v13 = [(BKReadAloudEventHandler *)self delegate];
        v14 = [v13 wkWebView];
        [v14 evaluateJavaScript:v12 completionHandler:0];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)removeTapHandlersOnElementIDs:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = +[NSString stringWithFormat:@"__ibooks_read_aloud.removeTapHandlerElementID('%@')", *(void *)(*((void *)&v12 + 1) + 8 * (void)v8)];
        uint64_t v10 = [(BKReadAloudEventHandler *)self delegate];
        v11 = [v10 wkWebView];
        [v11 evaluateJavaScript:v9 completionHandler:0];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)addMarkupForReadAloudToDocument
{
  id v3 = [(BKReadAloudEventHandler *)self delegate];
  v2 = [v3 wkWebView];
  [v2 evaluateJavaScript:@"__ibooks_read_aloud.addMediaOverlayClassToDocument()" completionHandler:0];
}

- (void)removeMarkupForReadAloudToDocument
{
  id v3 = [(BKReadAloudEventHandler *)self delegate];
  v2 = [v3 wkWebView];
  [v2 evaluateJavaScript:@"__ibooks_read_aloud.removeMediaOverlayClassFromDocument()" completionHandler:0];
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v21 = a4;
  objc_opt_class();
  id v5 = [v21 name];
  id v6 = BUDynamicCast();

  if ([v6 isEqualToString:@"readAloudHandler"])
  {
    objc_opt_class();
    uint64_t v7 = [v21 body];
    id v8 = BUDynamicCast();

    id v9 = [v8 objectForKeyedSubscript:@"event"];
    objc_opt_class();
    uint64_t v10 = [v8 objectForKeyedSubscript:@"data"];
    v11 = BUDynamicCast();

    if ([v9 isEqualToString:@"media_source_load"])
    {
      objc_opt_class();
      long long v12 = [v11 objectForKeyedSubscript:@"media_source"];
      long long v13 = BUDynamicCast();

      long long v14 = [(BKReadAloudEventHandler *)self delegate];
      [v14 readAloudEventHandler:self foundMediaSource:v13];
      goto LABEL_10;
    }
    if ([v9 isEqualToString:@"click"])
    {
      objc_opt_class();
      long long v15 = [v11 objectForKeyedSubscript:@"id"];
      long long v13 = BUDynamicCast();

      objc_opt_class();
      long long v16 = [v11 objectForKeyedSubscript:@"href"];
      long long v14 = BUDynamicCast();

      if (![v13 length]) {
        goto LABEL_10;
      }
      long long v17 = [(BKReadAloudEventHandler *)self delegate];
      [v17 readAloudEventHandler:self tappedElementID:v13 inHref:v14];
    }
    else
    {
      if (![v9 isEqualToString:@"action"])
      {
        if (![v9 isEqualToString:@"audio-ended"]) {
          goto LABEL_11;
        }
        objc_opt_class();
        v20 = [v11 objectForKeyedSubscript:@"media_source"];
        long long v13 = BUDynamicCast();

        long long v14 = [(BKReadAloudEventHandler *)self delegate];
        [v14 readAloudEventHandler:self audioElementEnded:v13];
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      objc_opt_class();
      long long v18 = [v11 objectForKeyedSubscript:@"action"];
      long long v13 = BUDynamicCast();

      objc_opt_class();
      long long v19 = [v11 objectForKeyedSubscript:@"auto_turn"];
      long long v14 = BUDynamicCast();

      long long v17 = [(BKReadAloudEventHandler *)self delegate];
      [v17 readAloudEventHandler:self performedAction:v13 turnStyle:v14];
    }

    goto LABEL_10;
  }
LABEL_12:
}

- (NSString)mediaActiveClass
{
  return self->_mediaActiveClass;
}

- (BKReadAloudEventHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKReadAloudEventHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mediaActiveClass, 0);
}

@end