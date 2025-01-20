@interface NSUserActivity(NSUserActivityPayloadServicesSupport)
- (id)_objectForIdentifier:()NSUserActivityPayloadServicesSupport;
- (id)_payloadForIdentifier:()NSUserActivityPayloadServicesSupport;
- (id)_payloadUpdateBlockForIdentifier:()NSUserActivityPayloadServicesSupport;
- (void)_setDirty:()NSUserActivityPayloadServicesSupport identifier:;
- (void)_setPayload:()NSUserActivityPayloadServicesSupport object:identifier:;
- (void)_setPayload:()NSUserActivityPayloadServicesSupport object:identifier:dirty:;
- (void)_setPayloadIdentifier:()NSUserActivityPayloadServicesSupport object:withBlock:;
@end

@implementation NSUserActivity(NSUserActivityPayloadServicesSupport)

- (id)_payloadForIdentifier:()NSUserActivityPayloadServicesSupport
{
  id v4 = a3;
  v5 = [a1 _internalUserActivity];
  v6 = [v5 payloadForIdentifier:v4];

  return v6;
}

- (id)_objectForIdentifier:()NSUserActivityPayloadServicesSupport
{
  id v4 = a3;
  v5 = [a1 _internalUserActivity];
  v6 = [v5 objectForIdentifier:v4];

  return v6;
}

- (id)_payloadUpdateBlockForIdentifier:()NSUserActivityPayloadServicesSupport
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__NSUserActivity_NSUserActivityPayloadServicesSupport___payloadUpdateBlockForIdentifier___block_invoke;
  aBlock[3] = &unk_1E60832C0;
  aBlock[4] = a1;
  v1 = _Block_copy(aBlock);
  v2 = _Block_copy(v1);

  return v2;
}

- (void)_setPayload:()NSUserActivityPayloadServicesSupport object:identifier:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [a1 _internalUserActivity];
  [v11 setPayload:v10 object:v9 identifier:v8];
}

- (void)_setPayload:()NSUserActivityPayloadServicesSupport object:identifier:dirty:
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [a1 _internalUserActivity];
  [v13 setPayload:v12 object:v11 identifier:v10 dirty:a6];
}

- (void)_setPayloadIdentifier:()NSUserActivityPayloadServicesSupport object:withBlock:
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __95__NSUserActivity_NSUserActivityPayloadServicesSupport___setPayloadIdentifier_object_withBlock___block_invoke;
  v18 = &unk_1E6083310;
  id v19 = v8;
  id v20 = v9;
  id v10 = v8;
  id v11 = v9;
  id v12 = a4;
  id v13 = _Block_copy(&v15);
  v14 = objc_msgSend(a1, "_internalUserActivity", v15, v16, v17, v18);
  [v14 setPayloadIdentifier:v10 object:v12 withBlock:v13];
}

- (void)_setDirty:()NSUserActivityPayloadServicesSupport identifier:
{
  id v6 = a4;
  id v7 = [a1 _internalUserActivity];
  [v7 setDirty:a3 identifier:v6];
}

@end