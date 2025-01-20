@interface SAURLSizerConfiguration
+ (id)newWithReplyController:(id)a3 urls:(id)a4;
- (NSArray)urls;
- (NSUUID)sizerID;
- (SAReplyProtocol)replyController;
- (SAURLSizerConfiguration)initWithReplayController:(id)a3 urls:(id)a4;
- (SAURLSizerResults)results;
- (void)callHandlerWithResults:(id)a3 error:(id)a4;
- (void)setReplyController:(id)a3;
- (void)setResults:(id)a3;
- (void)setSizerID:(id)a3;
- (void)setUrls:(id)a3;
@end

@implementation SAURLSizerConfiguration

- (SAURLSizerConfiguration)initWithReplayController:(id)a3 urls:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SAURLSizerConfiguration;
  v9 = [(SAURLSizerConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_replyController, a3);
    objc_storeStrong((id *)&v10->_urls, a4);
  }

  return v10;
}

+ (id)newWithReplyController:(id)a3 urls:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithReplayController:v7 urls:v6];

  return v8;
}

- (void)callHandlerWithResults:(id)a3 error:(id)a4
{
  id v6 = (SAURLSizerResults *)a3;
  if (self->_replyController)
  {
    id v7 = a4;
    id v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100031CCC(v8);
    }

    replyController = self->_replyController;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001D4FC;
    v11[3] = &unk_10004CF50;
    v11[4] = self;
    [(SAReplyProtocol *)replyController callURLSizerHandlerWithResults:v6 error:v7 withHandlerResultsBlock:v11];
  }
  results = self->_results;
  self->_results = v6;
}

- (NSArray)urls
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrls:(id)a3
{
}

- (SAReplyProtocol)replyController
{
  return (SAReplyProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReplyController:(id)a3
{
}

- (SAURLSizerResults)results
{
  return (SAURLSizerResults *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResults:(id)a3
{
}

- (NSUUID)sizerID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSizerID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizerID, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_replyController, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

@end