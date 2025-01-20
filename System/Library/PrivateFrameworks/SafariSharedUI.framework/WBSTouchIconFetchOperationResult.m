@interface WBSTouchIconFetchOperationResult
+ (id)resultForFetchFailureWithHost:(id)a3 pageRequestDidSucceed:(BOOL)a4 response:(id)a5 error:(id)a6;
+ (id)resultWithFavicon:(id)a3 iconData:(id)a4 iconURL:(id)a5 host:(id)a6 pageRequestDidSucceed:(BOOL)a7 response:(id)a8 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a9;
+ (id)resultWithTouchIcon:(id)a3 host:(id)a4 isFavicon:(BOOL)a5 pageRequestDidSucceed:(BOOL)a6 response:(id)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8;
- (BOOL)failedDueToUnrecoverableNetworkError;
- (BOOL)higherPriorityIconDownloadFailedDueToNetworkError;
- (BOOL)isFavicon;
- (BOOL)pageRequestDidSucceed;
- (NSData)iconData;
- (NSError)error;
- (NSString)host;
- (NSURL)iconURL;
- (NSURLResponse)response;
- (UIImage)touchIcon;
- (WBSTouchIconFetchOperationResult)initWithTouchIcon:(id)a3 iconData:(id)a4 iconURL:(id)a5 host:(id)a6 isFavicon:(BOOL)a7 pageRequestDidSucceed:(BOOL)a8 response:(id)a9 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a10 error:(id)a11;
@end

@implementation WBSTouchIconFetchOperationResult

+ (id)resultForFetchFailureWithHost:(id)a3 pageRequestDidSucceed:(BOOL)a4 response:(id)a5 error:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  LOBYTE(v14) = 0;
  v12 = (void *)[objc_alloc((Class)a1) initWithTouchIcon:0 iconData:0 iconURL:0 host:v11 isFavicon:0 pageRequestDidSucceed:0 response:v10 higherPriorityIconDownloadFailedDueToNetworkError:v14 error:v9];

  return v12;
}

+ (id)resultWithTouchIcon:(id)a3 host:(id)a4 isFavicon:(BOOL)a5 pageRequestDidSucceed:(BOOL)a6 response:(id)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  LOBYTE(v19) = a8;
  v17 = (void *)[objc_alloc((Class)a1) initWithTouchIcon:v16 iconData:0 iconURL:0 host:v15 isFavicon:v10 pageRequestDidSucceed:v9 response:v14 higherPriorityIconDownloadFailedDueToNetworkError:v19 error:0];

  return v17;
}

+ (id)resultWithFavicon:(id)a3 iconData:(id)a4 iconURL:(id)a5 host:(id)a6 pageRequestDidSucceed:(BOOL)a7 response:(id)a8 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a9
{
  BOOL v9 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  LOBYTE(v22) = a9;
  v20 = (void *)[objc_alloc((Class)a1) initWithTouchIcon:v19 iconData:v18 iconURL:v17 host:v16 isFavicon:1 pageRequestDidSucceed:v9 response:v15 higherPriorityIconDownloadFailedDueToNetworkError:v22 error:0];

  return v20;
}

- (WBSTouchIconFetchOperationResult)initWithTouchIcon:(id)a3 iconData:(id)a4 iconURL:(id)a5 host:(id)a6 isFavicon:(BOOL)a7 pageRequestDidSucceed:(BOOL)a8 response:(id)a9 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a10 error:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v29 = a5;
  id v18 = a6;
  id v28 = a9;
  id v19 = a11;
  v30.receiver = self;
  v30.super_class = (Class)WBSTouchIconFetchOperationResult;
  v20 = [(WBSTouchIconFetchOperationResult *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_touchIcon, a3);
    objc_storeStrong((id *)&v21->_iconData, a4);
    objc_storeStrong((id *)&v21->_iconURL, a5);
    uint64_t v22 = [v18 copy];
    host = v21->_host;
    v21->_host = (NSString *)v22;

    v21->_favicon = a7;
    v21->_pageRequestDidSucceed = a8;
    objc_storeStrong((id *)&v21->_response, a9);
    v21->_higherPriorityIconDownloadFailedDueToNetworkError = a10;
    objc_storeStrong((id *)&v21->_error, a11);
    v24 = v21;
  }

  return v21;
}

- (BOOL)failedDueToUnrecoverableNetworkError
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_pageRequestDidSucceed) {
    return 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = [(NSError *)self->_error underlyingErrors];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    uint64_t v7 = *MEMORY[0x1E4F28798];
    uint64_t v8 = *MEMORY[0x1E4F289A0];
    uint64_t v9 = *MEMORY[0x1E4F18F50];
    uint64_t v22 = *MEMORY[0x1E4F38C98];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        v12 = [v11 domain];
        int v13 = [v12 isEqualToString:v7];

        if (v13)
        {
          if ([v11 code] == 50) {
            goto LABEL_22;
          }
          goto LABEL_15;
        }
        id v14 = [v11 domain];
        int v15 = [v14 isEqualToString:v8];

        if (v15) {
          goto LABEL_14;
        }
        id v16 = [v11 domain];
        int v17 = [v16 isEqualToString:v9];

        if (v17)
        {
          if ([v11 code] == -1003) {
            goto LABEL_22;
          }
LABEL_14:
          if ([v11 code] == -1009) {
            goto LABEL_22;
          }
          goto LABEL_15;
        }
        id v18 = [v11 domain];
        int v19 = [v18 isEqualToString:v22];

        if (v19 && [v11 code] == -65554)
        {
LABEL_22:
          BOOL v2 = 1;
          goto LABEL_23;
        }
LABEL_15:
        ++v10;
      }
      while (v5 != v10);
      uint64_t v20 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v5 = v20;
    }
    while (v20);
  }
  BOOL v2 = 0;
LABEL_23:

  return v2;
}

- (UIImage)touchIcon
{
  return self->_touchIcon;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (NSString)host
{
  return self->_host;
}

- (BOOL)isFavicon
{
  return self->_favicon;
}

- (BOOL)pageRequestDidSucceed
{
  return self->_pageRequestDidSucceed;
}

- (BOOL)higherPriorityIconDownloadFailedDueToNetworkError
{
  return self->_higherPriorityIconDownloadFailedDueToNetworkError;
}

- (NSURLResponse)response
{
  return self->_response;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_touchIcon, 0);
}

@end