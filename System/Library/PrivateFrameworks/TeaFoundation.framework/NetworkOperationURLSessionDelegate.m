@interface NetworkOperationURLSessionDelegate
- (_TtC13TeaFoundation34NetworkOperationURLSessionDelegate)init;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
@end

@implementation NetworkOperationURLSessionDelegate

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  NetworkOperationURLSessionDelegate.urlSession(_:didBecomeInvalidWithError:)(v6, a4);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  NetworkOperationURLSessionDelegate.urlSession(_:task:didCompleteWithError:)();
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  NetworkOperationURLSessionDelegate.urlSession(_:task:didFinishCollecting:)((NSURLSession)v11, (NSURLSessionTask)v9, (NSURLSessionTaskMetrics)v10);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15 = self;
  uint64_t v11 = sub_191EE7500();
  unint64_t v13 = v12;

  NetworkOperationURLSessionDelegate.urlSession(_:dataTask:didReceive:)(v14, v9, v11, v13);
  sub_191D76D1C(v11, v13);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v8 = sub_191EE73F0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_191EE7380();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  NetworkOperationURLSessionDelegate.urlSession(_:downloadTask:didFinishDownloadingTo:)();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  NetworkOperationURLSessionDelegate.urlSessionDidFinishEvents(forBackgroundURLSession:)((NSURLSession)v4);
}

- (_TtC13TeaFoundation34NetworkOperationURLSessionDelegate)init
{
  return (_TtC13TeaFoundation34NetworkOperationURLSessionDelegate *)NetworkOperationURLSessionDelegate.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end