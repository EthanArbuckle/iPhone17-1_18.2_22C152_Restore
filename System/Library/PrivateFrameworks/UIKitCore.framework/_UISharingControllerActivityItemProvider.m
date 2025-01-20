@interface _UISharingControllerActivityItemProvider
- (_UISharingControllerActivityItemProvider)initWithCKShare:(id)a3 container:(id)a4 allowedSharingOptions:(id)a5;
- (_UISharingControllerActivityItemProvider)initWithCKSharePreparationHandler:(id)a3 allowedSharingOptions:(id)a4;
- (void)registerCloudKitShareWithPreparationHandler:(id)a3 allowedSharingOptions:(id)a4;
@end

@implementation _UISharingControllerActivityItemProvider

- (_UISharingControllerActivityItemProvider)initWithCKShare:(id)a3 container:(id)a4 allowedSharingOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_UISharingControllerActivityItemProvider;
  v11 = [(_UISharingControllerActivityItemProvider *)&v14 init];
  v12 = v11;
  if (v11) {
    [(_UISharingControllerActivityItemProvider *)v11 registerCKShare:v8 container:v9 allowedSharingOptions:v10];
  }

  return v12;
}

- (_UISharingControllerActivityItemProvider)initWithCKSharePreparationHandler:(id)a3 allowedSharingOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UISharingControllerActivityItemProvider;
  id v8 = [(_UISharingControllerActivityItemProvider *)&v11 init];
  id v9 = v8;
  if (v8) {
    [(_UISharingControllerActivityItemProvider *)v8 registerCloudKitShareWithPreparationHandler:v6 allowedSharingOptions:v7];
  }

  return v9;
}

- (void)registerCloudKitShareWithPreparationHandler:(id)a3 allowedSharingOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  getCKAllowedSharingOptionsClass();
  uint64_t v8 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke;
  v16[3] = &unk_1E5311650;
  id v9 = v7;
  id v17 = v9;
  [(_UISharingControllerActivityItemProvider *)self registerObjectOfClass:v8 visibility:0 loadHandler:v16];
  getCKPreSharingContextClass();
  uint64_t v10 = objc_opt_class();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke_2;
  v13[3] = &unk_1E5311678;
  id v14 = v9;
  id v15 = v6;
  id v11 = v9;
  id v12 = v6;
  [(_UISharingControllerActivityItemProvider *)self registerObjectOfClass:v10 visibility:0 loadHandler:v13];
}

@end