@interface CNContact(VoiceDial)
- (void)callNumberWithLabeledValue:()VoiceDial;
- (void)faceTimeEmailWithLabeledValue:()VoiceDial;
@end

@implementation CNContact(VoiceDial)

- (void)callNumberWithLabeledValue:()VoiceDial
{
  v4 = [a3 value];
  v5 = [v4 stringValue];

  id v6 = objc_alloc_init(MEMORY[0x263F7E1B0]);
  id v7 = objc_alloc(MEMORY[0x263F7E230]);
  v8 = [v6 telephonyProvider];
  v9 = (void *)[v7 initWithProvider:v8];

  v10 = [MEMORY[0x263F7E248] normalizedHandleWithDestinationID:v5];
  [v9 setHandle:v10];

  v11 = [a1 identifier];
  [v9 setContactIdentifier:v11];

  v12 = [MEMORY[0x263F82438] sharedApplication];
  v13 = [v9 URL];
  v14 = [NSDictionary dictionary];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__CNContact_VoiceDial__callNumberWithLabeledValue___block_invoke;
  v16[3] = &unk_264D12610;
  v16[4] = a1;
  id v17 = v5;
  id v15 = v5;
  [v12 openURL:v13 options:v14 completionHandler:v16];
}

- (void)faceTimeEmailWithLabeledValue:()VoiceDial
{
  v4 = [a3 value];
  id v5 = objc_alloc_init(MEMORY[0x263F7E1B0]);
  id v6 = objc_alloc(MEMORY[0x263F7E230]);
  id v7 = [v5 faceTimeProvider];
  v8 = (void *)[v6 initWithProvider:v7];

  v9 = [MEMORY[0x263F7E248] normalizedHandleWithDestinationID:v4];
  [v8 setHandle:v9];

  v10 = [a1 identifier];
  [v8 setContactIdentifier:v10];

  v11 = [MEMORY[0x263F82438] sharedApplication];
  v12 = [v8 URL];
  v13 = [NSDictionary dictionary];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__CNContact_VoiceDial__faceTimeEmailWithLabeledValue___block_invoke;
  v15[3] = &unk_264D12610;
  v15[4] = a1;
  id v16 = v4;
  id v14 = v4;
  [v11 openURL:v12 options:v13 completionHandler:v15];
}

@end