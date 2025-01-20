@interface STProcessBlueprintChangesOperationResultObject
- (CEMPayloadBase)requestToInstall;
- (NSArray)blueprintPayloads;
- (void)setBlueprintPayloads:(id)a3;
- (void)setRequestToInstall:(id)a3;
@end

@implementation STProcessBlueprintChangesOperationResultObject

- (CEMPayloadBase)requestToInstall
{
  return self->_requestToInstall;
}

- (void)setRequestToInstall:(id)a3
{
}

- (NSArray)blueprintPayloads
{
  return self->_blueprintPayloads;
}

- (void)setBlueprintPayloads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blueprintPayloads, 0);
  objc_storeStrong((id *)&self->_requestToInstall, 0);
}

@end