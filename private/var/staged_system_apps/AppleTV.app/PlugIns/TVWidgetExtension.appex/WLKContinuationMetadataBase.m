@interface WLKContinuationMetadataBase
- (id)tvun_contextString;
- (id)tvun_identifier;
@end

@implementation WLKContinuationMetadataBase

- (id)tvun_contextString
{
  if (qword_10012FF90 != -1) {
    dispatch_once(&qword_10012FF90, &stru_10011FBF8);
  }
  v3 = [(WLKContinuationMetadataBase *)self localizedContext];
  v4 = (void *)qword_10012FF88;
  v5 = [(WLKContinuationMetadataBase *)self context];
  v6 = [v4 objectForKey:v5];

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = v3;
  }
  id v8 = v7;

  return v8;
}

- (id)tvun_identifier
{
  v2 = [(WLKContinuationMetadataBase *)self movieOrShowContent];
  v3 = [v2 canonicalID];

  return v3;
}

@end