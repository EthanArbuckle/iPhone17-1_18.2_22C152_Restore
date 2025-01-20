@interface APThirdPartySegmentUpdateLegacyInterface
- (void)addClientToSegments:(id)a3 token:(id)a4 bundleID:(id)a5 replaceExisting:(BOOL)a6 privateSegment:(BOOL)a7;
@end

@implementation APThirdPartySegmentUpdateLegacyInterface

- (void)addClientToSegments:(id)a3 token:(id)a4 bundleID:(id)a5 replaceExisting:(BOOL)a6 privateSegment:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[APThirdPartySegmentUpdateRequester alloc] initWithBundleID:v11 identifier:v12 segmentIdentifiers:v13 replaceExisting:v8 privateSegment:v7];

  [(APServerRequester *)v14 makeRequest:&stru_100236070];
}

@end