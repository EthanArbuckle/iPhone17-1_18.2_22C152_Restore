@interface NTKGreenfieldAnalyticsModel
- (NSDictionary)complicationSlotToIdMapping;
- (NSError)error;
- (NSSet)purchasedComplicationsItemIds;
- (NSSet)skippedComplicationsItemIds;
- (NSString)addFaceFlowExitScreenName;
- (NSString)distributionMechanism;
- (NSString)errorMessage;
- (NSString)scannedCodeIdentifier;
- (NTKFace)watchFace;
- (void)setAddFaceFlowExitScreenName:(id)a3;
- (void)setComplicationSlotToIdMapping:(id)a3;
- (void)setDistributionMechanism:(id)a3;
- (void)setError:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setPurchasedComplicationsItemIds:(id)a3;
- (void)setScannedCodeIdentifier:(id)a3;
- (void)setSkippedComplicationsItemIds:(id)a3;
- (void)setWatchFace:(id)a3;
@end

@implementation NTKGreenfieldAnalyticsModel

- (NSString)errorMessage
{
  error = self->_error;
  if (error)
  {
    v4 = [(NSError *)error domain];
    int v5 = [v4 isEqualToString:@"com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"];

    if (v5)
    {
      switch([(NSError *)self->_error code])
      {
        case 0:
          goto LABEL_4;
        case 1:
          errorMessage = self->_errorMessage;
          v7 = @"Face Not Available.";
          goto LABEL_5;
        case 2:
          errorMessage = self->_errorMessage;
          v7 = @"Complication Requires OS Update.";
          goto LABEL_5;
        case 3:
          errorMessage = self->_errorMessage;
          v7 = @"No Watch Paired";
          goto LABEL_5;
        case 4:
          errorMessage = self->_errorMessage;
          v7 = @"Cannot Download Remote File.";
          goto LABEL_5;
        case 5:
          errorMessage = self->_errorMessage;
          v7 = @"Library Is Full.";
          goto LABEL_5;
        case 6:
          errorMessage = self->_errorMessage;
          v7 = @"Face must Be Singular In Library.";
          goto LABEL_5;
        case 7:
          errorMessage = self->_errorMessage;
          v7 = @"Photos Face Contains No Photos.";
          goto LABEL_5;
        case 8:
          errorMessage = self->_errorMessage;
          v7 = @"Face Cannot Be Customized.";
          goto LABEL_5;
        case 9:
          errorMessage = self->_errorMessage;
          v7 = @"Cannot Load Library";
          goto LABEL_5;
        case 10:
          errorMessage = self->_errorMessage;
          v7 = @"No Network Connection Or Invalid URL";
          goto LABEL_5;
        case 11:
          errorMessage = self->_errorMessage;
          v7 = @"Incompatible Watch Face";
          goto LABEL_5;
        case 12:
          errorMessage = self->_errorMessage;
          v7 = @"Require Watch OS Update";
          goto LABEL_5;
        case 13:
          errorMessage = self->_errorMessage;
          v7 = @"Cannot Add Watch Face to Tinker Paired Device";
          goto LABEL_5;
        case 14:
          errorMessage = self->_errorMessage;
          v7 = @"B640 productKit URL is invalid.";
          goto LABEL_5;
        case 15:
          errorMessage = self->_errorMessage;
          v7 = @"B640 failed to retrieve data from ProductKit.";
          goto LABEL_5;
        case 16:
          errorMessage = self->_errorMessage;
          v7 = @"B640 cannot add face";
          goto LABEL_5;
        default:
          break;
      }
    }
    else
    {
LABEL_4:
      errorMessage = self->_errorMessage;
      v7 = @"Cannot Add Watch Face.";
LABEL_5:
      self->_errorMessage = &v7->isa;
    }
  }
  v8 = self->_errorMessage;
  return v8;
}

- (NTKFace)watchFace
{
  return self->_watchFace;
}

- (void)setWatchFace:(id)a3
{
}

- (NSSet)purchasedComplicationsItemIds
{
  return self->_purchasedComplicationsItemIds;
}

- (void)setPurchasedComplicationsItemIds:(id)a3
{
}

- (NSSet)skippedComplicationsItemIds
{
  return self->_skippedComplicationsItemIds;
}

- (void)setSkippedComplicationsItemIds:(id)a3
{
}

- (NSDictionary)complicationSlotToIdMapping
{
  return self->_complicationSlotToIdMapping;
}

- (void)setComplicationSlotToIdMapping:(id)a3
{
}

- (NSString)addFaceFlowExitScreenName
{
  return self->_addFaceFlowExitScreenName;
}

- (void)setAddFaceFlowExitScreenName:(id)a3
{
}

- (NSString)distributionMechanism
{
  return self->_distributionMechanism;
}

- (void)setDistributionMechanism:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)scannedCodeIdentifier
{
  return self->_scannedCodeIdentifier;
}

- (void)setScannedCodeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannedCodeIdentifier, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_distributionMechanism, 0);
  objc_storeStrong((id *)&self->_addFaceFlowExitScreenName, 0);
  objc_storeStrong((id *)&self->_complicationSlotToIdMapping, 0);
  objc_storeStrong((id *)&self->_skippedComplicationsItemIds, 0);
  objc_storeStrong((id *)&self->_purchasedComplicationsItemIds, 0);
  objc_storeStrong((id *)&self->_watchFace, 0);
}

@end