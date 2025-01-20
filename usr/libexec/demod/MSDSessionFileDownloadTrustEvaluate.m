@interface MSDSessionFileDownloadTrustEvaluate
- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4;
@end

@implementation MSDSessionFileDownloadTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MSDSessionFileDownloadTrustEvaluate;
  if ([(MSDSessionBaseTrustEvaluate *)&v6 trustServer:a3 isRedirect:a4]) {
    return 1;
  }
  else {
    return ![(MSDSessionBaseTrustEvaluate *)self isDone];
  }
}

@end