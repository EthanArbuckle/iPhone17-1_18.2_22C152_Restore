@interface PCAdPolicyFormat
- (void)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5 completion:(id)a6;
- (void)policiesToEnforce:(id)a3;
@end

@implementation PCAdPolicyFormat

- (void)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5 completion:(id)a6
{
  id v9 = a6;
  if (v9)
  {
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    v13 = objc_alloc_init(PCSupportRequester);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_220C20968;
    v14[3] = &unk_26457C218;
    id v15 = v9;
    [(PCSupportRequester *)v13 policiesForContainerType:v12 adType:v11 adFormatType:v10 completion:v14];
  }
}

- (void)policiesToEnforce:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(PCSupportRequester);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_220C20A20;
    v5[3] = &unk_26457C218;
    id v6 = v3;
    [(PCSupportRequester *)v4 policiesToEnforce:v5];
  }
}

@end