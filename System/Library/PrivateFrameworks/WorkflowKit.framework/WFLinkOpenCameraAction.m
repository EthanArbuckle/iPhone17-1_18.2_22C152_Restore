@interface WFLinkOpenCameraAction
- (id)serializationKeysByParameter;
- (void)serializeAppIntentDescriptorIfNecessary;
@end

@implementation WFLinkOpenCameraAction

- (id)serializationKeysByParameter
{
  return &unk_1F2317D78;
}

- (void)serializeAppIntentDescriptorIfNecessary
{
  v3 = [(WFAction *)self serializedParameters];
  v4 = [v3 objectForKey:@"AppIntentDescriptor"];

  if (!v4)
  {
    [(WFAction *)self setSupplementalParameterValue:&unk_1F2317D50 forKey:@"AppIntentDescriptor"];
  }
}

@end