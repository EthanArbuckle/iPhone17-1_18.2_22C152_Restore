@interface SXPhoneNumberActionActivityProvider
- (SXDeviceCapabilities)deviceCapabilities;
- (SXHost)host;
- (SXMessagePresenter)messagePresenter;
- (SXPhoneNumberActionActivityProvider)initWithHost:(id)a3 messagePresenter:(id)a4 deviceCapabilities:(id)a5;
- (id)activityGroupForAction:(id)a3;
- (void)call:(id)a3 showDialog:(BOOL)a4;
- (void)copy:(id)a3;
- (void)faceTime:(id)a3;
- (void)message:(id)a3;
@end

@implementation SXPhoneNumberActionActivityProvider

- (SXPhoneNumberActionActivityProvider)initWithHost:(id)a3 messagePresenter:(id)a4 deviceCapabilities:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXPhoneNumberActionActivityProvider;
  v12 = [(SXPhoneNumberActionActivityProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_host, a3);
    objc_storeStrong((id *)&v13->_messagePresenter, a4);
    objc_storeStrong((id *)&v13->_deviceCapabilities, a5);
  }

  return v13;
}

- (id)activityGroupForAction:(id)a3
{
  id v4 = a3;
  v5 = [SXActionActivityGroup alloc];
  v6 = [v4 phoneNumber];
  v7 = [(SXActionActivityGroup *)v5 initWithTitle:v6];

  v8 = [(SXPhoneNumberActionActivityProvider *)self deviceCapabilities];
  int v9 = [v8 hasCellularTelephonyCapabilities];

  if (v9)
  {
    id v10 = [SXBlockActionActivity alloc];
    id v11 = SXBundle();
    v12 = [v11 localizedStringForKey:@"Call" value:&stru_26D5311C0 table:0];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke;
    v41[3] = &unk_2646512B0;
    v41[4] = self;
    id v42 = v4;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_2;
    v39[3] = &unk_2646512B0;
    v39[4] = self;
    id v40 = v42;
    v13 = [(SXBlockActionActivity *)v10 initWithLabel:v12 type:0 immediateBlock:v41 userSelectedBlock:v39];
    [(SXActionActivityGroup *)v7 addActivity:v13];
  }
  v14 = [SXBlockActionActivity alloc];
  objc_super v15 = SXBundle();
  v16 = [v15 localizedStringForKey:@"FaceTime Audio" value:&stru_26D5311C0 table:0];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_3;
  v37[3] = &unk_2646512B0;
  v37[4] = self;
  id v17 = v4;
  id v38 = v17;
  v18 = [(SXBlockActionActivity *)v14 initWithLabel:v16 type:1 block:v37];
  [(SXActionActivityGroup *)v7 addActivity:v18];

  v19 = [(SXPhoneNumberActionActivityProvider *)self messagePresenter];
  LODWORD(v18) = [v19 canPresentMessage];

  if (v18)
  {
    v20 = [SXBlockActionActivity alloc];
    v21 = SXBundle();
    v22 = [v21 localizedStringForKey:@"Send Message" value:&stru_26D5311C0 table:0];
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_4;
    v34 = &unk_2646512B0;
    v35 = self;
    id v36 = v17;
    v23 = [(SXBlockActionActivity *)v20 initWithLabel:v22 type:1 block:&v31];
    -[SXActionActivityGroup addActivity:](v7, "addActivity:", v23, v31, v32, v33, v34, v35);
  }
  v24 = [SXPasteboardActionActivity alloc];
  v25 = SXBundle();
  v26 = [v25 localizedStringForKey:@"Copy" value:&stru_26D5311C0 table:0];
  v27 = [MEMORY[0x263F1C840] generalPasteboard];
  v28 = [v17 phoneNumber];
  v29 = [(SXPasteboardActionActivity *)v24 initWithLabel:v26 type:1 pasteboard:v27 string:v28];
  [(SXActionActivityGroup *)v7 addActivity:v29];

  return v7;
}

uint64_t __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) call:*(void *)(a1 + 40) showDialog:1];
}

uint64_t __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) call:*(void *)(a1 + 40) showDialog:0];
}

uint64_t __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) faceTime:*(void *)(a1 + 40)];
}

uint64_t __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) message:*(void *)(a1 + 40)];
}

- (void)call:(id)a3 showDialog:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (objc_class *)MEMORY[0x263F7E1B0];
  id v7 = a3;
  id v16 = objc_alloc_init(v6);
  v8 = [v16 providersPassingTest:&__block_literal_global_100];
  int v9 = [v8 firstObject];

  id v10 = objc_alloc(MEMORY[0x263F7E248]);
  id v11 = [v7 phoneNumber];

  v12 = (void *)[v10 initWithType:2 value:v11];
  v13 = (void *)[objc_alloc(MEMORY[0x263F7E230]) initWithProvider:v9];
  [v13 setVideo:0];
  [v13 setHandle:v12];
  [v13 setShowUIPrompt:v4];
  v14 = [(SXPhoneNumberActionActivityProvider *)self host];
  objc_super v15 = [v13 URL];
  [v14 openURL:v15 completion:0];
}

uint64_t __55__SXPhoneNumberActionActivityProvider_call_showDialog___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isTelephonyProvider];
}

- (void)faceTime:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263F7E1B0];
  id v5 = a3;
  id v14 = objc_alloc_init(v4);
  v6 = [v14 providersPassingTest:&__block_literal_global_22_0];
  id v7 = [v6 firstObject];

  id v8 = objc_alloc(MEMORY[0x263F7E248]);
  int v9 = [v5 phoneNumber];

  id v10 = (void *)[v8 initWithType:2 value:v9];
  id v11 = (void *)[objc_alloc(MEMORY[0x263F7E230]) initWithProvider:v7];
  [v11 setVideo:0];
  [v11 setHandle:v10];
  v12 = [(SXPhoneNumberActionActivityProvider *)self host];
  v13 = [v11 URL];
  [v12 openURL:v13 completion:0];
}

uint64_t __48__SXPhoneNumberActionActivityProvider_faceTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFaceTimeProvider];
}

- (void)message:(id)a3
{
  id v4 = a3;
  id v5 = [SXPresentableMessage alloc];
  v6 = [v4 phoneNumber];

  id v8 = [(SXPresentableMessage *)v5 initWithRecipient:v6 message:0];
  id v7 = [(SXPhoneNumberActionActivityProvider *)self messagePresenter];
  [v7 presentMessage:v8];
}

- (void)copy:(id)a3
{
  v3 = (void *)MEMORY[0x263F1C840];
  id v4 = a3;
  id v6 = [v3 generalPasteboard];
  id v5 = [v4 phoneNumber];

  [v6 setString:v5];
}

- (SXHost)host
{
  return self->_host;
}

- (SXMessagePresenter)messagePresenter
{
  return self->_messagePresenter;
}

- (SXDeviceCapabilities)deviceCapabilities
{
  return self->_deviceCapabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCapabilities, 0);
  objc_storeStrong((id *)&self->_messagePresenter, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end