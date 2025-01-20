@interface PKSharingMessageExtensionMessageBuilder
+ (void)messageFromConfiguration:(id)a3 completionHandler:(id)a4;
+ (void)messageFromInvitation:(id)a3 analyticsSessionToken:(id)a4 completionHandler:(id)a5;
+ (void)messageFromInvitation:(id)a3 completionHandler:(id)a4;
+ (void)messageFromSharingRequest:(id)a3 completionHandler:(id)a4;
+ (void)messageURLFromSharingRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation PKSharingMessageExtensionMessageBuilder

+ (void)messageFromConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(PKShareableCredentialMessage);
  v8 = [v6 credentialsMetadata];

  uint64_t v9 = [v8 count];
  if (v9 < 2)
  {
    v11 = [v8 objectAtIndexedSubscript:0];
    v12 = [v11 preview];
    v13 = [v12 ownerDisplayName];
    v10 = PKLocalizedShareableCredentialString(&cfstr_ShareOneSharea.isa, &stru_1EF1B4C70.isa, v13);
  }
  else
  {
    v10 = PKLocalizedShareableCredentialString(&cfstr_ShareMultipleS.isa, &cfstr_Lu.isa, v9);
  }
  [(PKShareableCredentialMessage *)v7 setCaption:v10];

  if (PKHidePlaceholderImageIniMessage())
  {
    v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Not including imagine in iMessage because of rdar://61852456 (Always failed to send shared Pass through iMessage via Ven1)", buf, 2u);
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4FB1818];
    v16 = [v8 firstObject];
    v17 = [v16 preview];
    v18 = objc_msgSend(v15, "imageWithCGImage:", objc_msgSend(v17, "passThumbnailImage"));
    [(PKShareableCredentialMessage *)v7 setPassThumbnailImage:v18];
  }
  v19 = objc_msgSend(v8, "pk_arrayByApplyingBlock:", &__block_literal_global_56);
  [(PKShareableCredentialMessage *)v7 setShareableCredentials:v19];
  id v20 = objc_alloc_init(MEMORY[0x1E4F35160]);
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F35158]) initWithAlternateLayout:v20];
  id v22 = objc_alloc(MEMORY[0x1E4F35150]);
  id v23 = objc_alloc_init(MEMORY[0x1E4F35168]);
  v24 = (void *)[v22 initWithSession:v23];

  v25 = [(PKShareableCredentialMessage *)v7 urlRepresentation];
  [v24 setURL:v25];

  [v24 setRequiresValidation:1];
  [v24 setLayout:v21];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKSharingMessageExtensionMessageBuilder_messageFromConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_1E59CAD68;
  id v29 = v24;
  id v30 = v5;
  id v26 = v24;
  id v27 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

id __86__PKSharingMessageExtensionMessageBuilder_messageFromConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F85008];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  id v5 = [v3 cardConfigurationIdentifier];
  [v4 setCardConfigurationIdentifier:v5];

  id v6 = [v3 credentialIdentifier];
  [v4 setCredentialIdentifier:v6];

  v7 = [v3 credentialIdentifier];
  v8 = [v7 dataUsingEncoding:4];
  uint64_t v9 = [v8 SHA256Hash];
  v10 = [v9 base64EncodedStringWithOptions:0];
  [v4 setCredentialIdentifierHash:v10];

  v11 = [v3 preview];
  v12 = [v11 ownerDisplayName];
  [v4 setOwnerDisplayName:v12];

  v13 = [v3 provisioningTarget];
  v14 = [v13 nonce];
  [v4 setNonce:v14];

  v15 = [v3 sharingInstanceIdentifier];

  [v4 setSharingInstanceIdentifier:v15];
  [v4 setStatus:1];

  return v4;
}

uint64_t __86__PKSharingMessageExtensionMessageBuilder_messageFromConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)messageFromInvitation:(id)a3 completionHandler:(id)a4
{
}

+ (void)messageFromInvitation:(id)a3 analyticsSessionToken:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 share];
  v11 = [v7 pass];
  v12 = [v7 displayInformation];
  if (!v12)
  {
    v12 = [MEMORY[0x1E4F85030] displayInformationForAccessPass:v11 webService:0];
  }
  v13 = objc_alloc_init(PKSharingMessageExtensionRelayServerMessage);
  v14 = [v12 title];
  [(PKSharingMessageExtensionCommonMessage *)v13 setTitle:v14];

  v15 = [v12 subtitle];
  [(PKSharingMessageExtensionCommonMessage *)v13 setSubtitle:v15];

  uint64_t v16 = [v10 status];
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 3;
  }
  [(PKSharingMessageExtensionRelayServerMessage *)v13 setStatus:v17];
  v18 = objc_alloc_init(PKSharingMessageExtensionRelayServerLocalProperties);
  [(PKSharingMessageExtensionRelayServerLocalProperties *)v18 setPartialInvite:v7];
  [(PKSharingMessageExtensionRelayServerLocalProperties *)v18 setAnalyticsSessionToken:v9];

  [(PKSharingMessageExtensionRelayServerMessage *)v13 setLocalProperties:v18];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke;
  aBlock[3] = &unk_1E59CAD18;
  v19 = v13;
  v33 = v19;
  id v20 = v8;
  id v34 = v20;
  v21 = (void (**)(void))_Block_copy(aBlock);
  if (PKHidePlaceholderImageIniMessage())
  {
    id v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Not including image in iMessage because of rdar://61852456 (Always failed to send shared Pass through iMessage via Ven1)", buf, 2u);
    }

    v21[2](v21);
  }
  else
  {
    id v23 = [v12 imageURL];
    if (v23)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke_3;
      v29[3] = &unk_1E59CC4C0;
      id v30 = v19;
      v31 = v21;
      PKCommonCachedImageFromURL(v23, v29);
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4FB1818];
      PKPassKitUIBundle();
      v25 = id v27 = v11;
      id v26 = [v24 imageNamed:@"Generic-Shared-Key" inBundle:v25];
      [(PKSharingMessageExtensionCommonMessage *)v19 setThumbnail:v26];

      v11 = v27;
      v21[2](v21);
    }
  }
}

void __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F35160]);
  id v3 = [*(id *)(a1 + 32) title];
  [v2 setCaption:v3];

  id v4 = [*(id *)(a1 + 32) subtitle];
  [v2 setSubcaption:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F35158]) initWithAlternateLayout:v2];
  id v6 = objc_alloc(MEMORY[0x1E4F35150]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F35168]);
  id v8 = (void *)[v6 initWithSession:v7];

  id v9 = [*(id *)(a1 + 32) urlRepresentation];
  [v8 setURL:v9];

  [v8 setRequiresValidation:1];
  [v8 setLayout:v5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke_2;
  v12[3] = &unk_1E59CAD68;
  id v10 = *(id *)(a1 + 40);
  id v13 = v8;
  id v14 = v10;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F84780];
    id v5 = a3;
    id v6 = [v4 alloc];
    id v7 = UIImagePNGRepresentation(v5);

    id v8 = (void *)[v6 initWithData:v7 scale:3.0];
    id v9 = objc_msgSend(MEMORY[0x1E4F84790], "constraintsWithAspectFillToSize:", 242.0, 152.0);
    [v9 setOutputScale:3.0];
    id v10 = [v8 resizedImageWithConstraints:v9];
    id v11 = *(void **)(a1 + 32);
    id v12 = objc_alloc(MEMORY[0x1E4FB1818]);
    id v13 = [v10 imageData];
    id v14 = (void *)[v12 initWithData:v13 scale:3.0];
    [v11 setThumbnail:v14];
  }
  v15 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v15();
}

+ (void)messageFromSharingRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v36 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init(PKSubcredentialInvitationMessage);
  v38 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  v37 = [v38 hexEncoding];
  -[PKSubcredentialInvitationMessage setDataString:](v6, "setDataString:");
  id v7 = [MEMORY[0x1E4F84898] sharedInstance];
  id v8 = [v5 passIdentifier];

  id v9 = [v7 passWithUniqueID:v8];
  id v10 = [v9 paymentPass];

  id v11 = [v10 organizationName];
  id v12 = [v10 localizedDescription];
  id v13 = v12;
  if (v12)
  {
    unint64_t v14 = objc_msgSend(v12, "length", v36);
    uint64_t v15 = [v11 length];
    uint64_t v16 = v15 + 1;
    if (v14 > v15 + 1)
    {
      uint64_t v17 = v15;
      if ([v13 hasPrefix:v11])
      {
        v18 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        int v19 = objc_msgSend(v18, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", v17));

        if (v19)
        {
          uint64_t v20 = [v13 substringFromIndex:v16];

          id v13 = (void *)v20;
        }
      }
    }
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F84428]);
  [v21 setIssuer:v11];
  [v21 setDeviceModel:v13];
  [v21 setForWatch:0];
  [(PKSubcredentialInvitationMessage *)v6 setPhoneInvitation:v21];
  id v22 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v49 = v21;
    _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Compose message with invitation for phone: %@", buf, 0xCu);
  }

  id v23 = objc_alloc_init(MEMORY[0x1E4F84428]);
  [v23 setIssuer:v11];
  [v23 setDeviceModel:v13];
  [v21 setForWatch:1];
  [(PKSubcredentialInvitationMessage *)v6 setWatchInvitation:v23];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v49 = v23;
    _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Compose message with invitation for watch: %@", buf, 0xCu);
  }

  v24 = [MEMORY[0x1E4F29128] UUID];
  v25 = [v24 UUIDString];
  [(PKSubcredentialInvitationMessage *)v6 setUniqueIdentifier:v25];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E59CB728;
  id v26 = v6;
  v44 = v26;
  id v27 = v11;
  id v45 = v27;
  id v28 = v13;
  id v46 = v28;
  id v29 = v36;
  id v47 = v29;
  id v30 = (void (**)(void))_Block_copy(aBlock);
  if (PKHidePlaceholderImageIniMessage())
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Not including image in iMessage because of rdar://61852456 (Always failed to send shared Pass through iMessage via Ven1)", buf, 2u);
    }

    v30[2](v30);
  }
  else
  {
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize];
    double v32 = v31;
    double v34 = v33;
    v35 = +[PKPassSnapshotter sharedInstance];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke_3;
    v39[3] = &unk_1E59D0428;
    id v40 = v10;
    v41 = v26;
    v42 = v30;
    objc_msgSend(v35, "snapshotWithPass:size:completion:", v40, v39, v32, v34);
  }
}

void __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F35160]);
  id v3 = PKPassKitCoreBundle();
  id v4 = [v3 URLForResource:@"SubcredentialMessageFallbackMedia" withExtension:@"png"];
  [v2 setMediaFileURL:v4];

  id v5 = PKLocalizedCredentialString(&cfstr_CarkeyNotSuppo_0.isa);
  [v2 setCaption:v5];

  id v6 = PKLocalizedString(&cfstr_Wallet_0.isa);
  [v2 setSubcaption:v6];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F35158]) initWithAlternateLayout:v2];
  id v8 = objc_alloc(MEMORY[0x1E4F35150]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F35168]);
  id v10 = (void *)[v8 initWithSession:v9];

  id v11 = [*(id *)(a1 + 32) urlRepresentation];
  [v10 setURL:v11];

  [v10 setRequiresValidation:1];
  [v10 setLayout:v7];
  id v12 = PKLocalizedCredentialString(&cfstr_CarkeyAccessib.isa, &stru_1EF1B5770.isa, *(void *)(a1 + 40), *(void *)(a1 + 48));
  [v10 setAccessibilityLabel:v12];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke_2;
  block[3] = &unk_1E59CAD68;
  id v13 = *(id *)(a1 + 56);
  id v16 = v10;
  id v17 = v13;
  id v14 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Finished snapshotting pass %@ with resulting snapshot %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) setPassThumbnailImage:v3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)messageURLFromSharingRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__PKSharingMessageExtensionMessageBuilder_messageURLFromSharingRequest_completionHandler___block_invoke;
  v8[3] = &unk_1E59D0450;
  id v9 = v6;
  id v7 = v6;
  [a1 messageFromSharingRequest:a3 completionHandler:v8];
}

void __90__PKSharingMessageExtensionMessageBuilder_messageURLFromSharingRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 URL];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

@end