@interface SKUIEditProfileSettingDescription
+ (BOOL)allowsEdit;
+ (Class)_viewClassForSettingDescription:(id)a3;
- (BOOL)_validateHandle:(id)a3;
- (BOOL)_validateName:(id)a3;
- (BOOL)allowsSelection;
- (BOOL)commitEdits:(id)a3;
- (BOOL)isEditing;
- (BOOL)isHandleValid;
- (NSString)handle;
- (NSString)name;
- (SKUIEditProfileSettingDescription)initWithViewElement:(id)a3 parent:(id)a4;
- (UIImage)photo;
- (id)_valueStore;
- (void)_authenticateOnCompletion:(id)a3;
- (void)_displayFooter:(id)a3;
- (void)_displayRules:(BOOL)a3;
- (void)_displaySuggestedHandles:(id)a3;
- (void)_enterEditMode;
- (void)_fetchAccountInfo;
- (void)_fetchProfilePhoto;
- (void)_fetchSuggestedHandles;
- (void)_finalizeCommitWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_hideFooter;
- (void)_leaveEditMode;
- (void)_reloadData;
- (void)_updateAccountInfo;
- (void)_updateValidity;
- (void)_uploadProfileImage:(id)a3;
- (void)cancelEdits;
- (void)chooseNewProfilePhoto;
- (void)dealloc;
- (void)discardEdits;
- (void)profileImagePicker:(id)a3 didPickProfileImage:(id)a4 withCropRect:(id)a5;
- (void)profileImagePickerDidCancel:(id)a3;
- (void)setHandle:(id)a3;
- (void)setName:(id)a3;
- (void)setPhoto:(id)a3 withCropRect:(CGRect)a4;
- (void)suggestedHandlesSettingsHeaderFooterDescription:(id)a3 didSelectSuggestedHandle:(id)a4;
@end

@implementation SKUIEditProfileSettingDescription

- (SKUIEditProfileSettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditProfileSettingDescription initWithViewElement:parent:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIEditProfileSettingDescription;
  v8 = [(SKUISettingDescription *)&v14 initWithViewElement:v6 parent:v7];
  if (v8)
  {
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v8->_operationQueue;
    v8->_operationQueue = v9;

    [(NSOperationQueue *)v8->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v8->_operationQueue setQualityOfService:25];
    v11 = objc_alloc_init(SKUISettingValueStore);
    valueStore = v8->_valueStore;
    v8->_valueStore = v11;

    [(SKUIEditProfileSettingDescription *)v8 _reloadData];
  }

  return v8;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)SKUIEditProfileSettingDescription;
  [(SKUIEditProfileSettingDescription *)&v3 dealloc];
}

- (void)chooseNewProfilePhoto
{
  objc_super v3 = [SKUIProfileImagePicker alloc];
  v4 = [(SKUISettingDescription *)self parent];
  v5 = [v4 clientContext];
  id v6 = [(SKUIProfileImagePicker *)v3 initWithClientContext:v5];

  [(SKUIProfileImagePicker *)v6 setDelegate:self];
  [(SKUISettingDescription *)self _presentViewController:v6 animated:1 completion:0];
}

- (NSString)handle
{
  v2 = [(SKUISettingValueStore *)self->_valueStore resolvedValueForKey:@"handle"];
  objc_super v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)name
{
  v2 = [(SKUISettingValueStore *)self->_valueStore resolvedValueForKey:@"name"];
  objc_super v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (UIImage)photo
{
  v2 = [(SKUISettingValueStore *)self->_valueStore resolvedValueForKey:@"photo"];
  objc_super v3 = (void *)[v2 copy];

  v4 = -[SKUIStyledImageDataConsumer initWithSize:treatment:]([SKUIStyledImageDataConsumer alloc], "initWithSize:treatment:", 10, 56.0, 56.0);
  v5 = [(SKUIStyledImageDataConsumer *)v4 imageForImage:v3];

  return (UIImage *)v5;
}

- (void)setHandle:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  id v6 = [v4 whitespaceAndNewlineCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];

  [(SKUISettingValueStore *)self->_valueStore setModifiedValue:v7 forKey:@"handle"];
  [(SKUIEditProfileSettingDescription *)self _updateValidity];
}

- (void)setName:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  id v6 = [v4 whitespaceAndNewlineCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];

  [(SKUISettingValueStore *)self->_valueStore setModifiedValue:v7 forKey:@"name"];
  [(SKUIEditProfileSettingDescription *)self _updateValidity];
}

- (void)setPhoto:(id)a3 withCropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v7 = a3;
  v12.CGFloat width = width;
  v12.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v12, 1, 1.0);
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, -1.0, -1.0);
  objc_msgSend(v7, "drawAtPoint:", vaddq_f64(*(float64x2_t *)&v11.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v11.c, y), *(float64x2_t *)&v11.a, x)));

  v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [(SKUISettingValueStore *)self->_valueStore setModifiedValue:v8 forKey:@"photo"];
}

- (void)profileImagePickerDidCancel:(id)a3
{
}

- (void)profileImagePicker:(id)a3 didPickProfileImage:(id)a4 withCropRect:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(SKUISettingDescription *)self _dismissViewController:a3 animated:1 completion:0];
  [v8 CGRectValue];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  -[SKUIEditProfileSettingDescription setPhoto:withCropRect:](self, "setPhoto:withCropRect:", v9, v11, v13, v15, v17);

  [(SKUISettingDescription *)self _reloadSetting];
}

+ (BOOL)allowsEdit
{
  return 1;
}

- (BOOL)allowsSelection
{
  return 0;
}

- (void)cancelEdits
{
}

- (BOOL)commitEdits:(id)a3
{
  v4 = (void *)[a3 copy];
  id commitBlock = self->_commitBlock;
  self->_id commitBlock = v4;

  BOOL v6 = [(SKUISettingValueStore *)self->_valueStore hasChanges];
  if (v6)
  {
    id v7 = [(SKUISettingValueStore *)self->_valueStore modifiedKeys];
    if ([v7 containsObject:@"photo"])
    {
      id v8 = [(SKUISettingValueStore *)self->_valueStore resolvedValueForKey:@"photo"];
      [(SKUIEditProfileSettingDescription *)self _uploadProfileImage:v8];
    }
    else
    {
      [(SKUIEditProfileSettingDescription *)self _updateAccountInfo];
    }
  }
  else
  {
    [(SKUIEditProfileSettingDescription *)self _finalizeCommitWithSuccess:1 error:0];
  }
  return v6;
}

- (void)discardEdits
{
  [(SKUISettingValueStore *)self->_valueStore discardChanges];

  [(SKUIEditProfileSettingDescription *)self _leaveEditMode];
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)suggestedHandlesSettingsHeaderFooterDescription:(id)a3 didSelectSuggestedHandle:(id)a4
{
  valueStore = self->_valueStore;
  BOOL v6 = objc_msgSend(a4, "copy", a3);
  [(SKUISettingValueStore *)valueStore setModifiedValue:v6 forKey:@"handle"];

  [(SKUISettingDescription *)self _reloadSetting];
}

- (void)_authenticateOnCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4FA8100] defaultStore];
  id v5 = [v4 activeAccount];

  if (v5)
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4FA8260]) initWithAccount:v5];
    [v6 setPromptStyle:1];
    [v6 setShouldCreateNewSession:1];
  }
  else
  {
    BOOL v6 = [MEMORY[0x1E4FA8260] contextForSignIn];
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA8128]) initWithAuthenticationContext:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__SKUIEditProfileSettingDescription__authenticateOnCompletion___block_invoke;
  v9[3] = &unk_1E64287D8;
  id v10 = v3;
  id v8 = v3;
  [v7 startWithAuthenticateResponseBlock:v9];
}

void __63__SKUIEditProfileSettingDescription__authenticateOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SKUIEditProfileSettingDescription__authenticateOnCompletion___block_invoke_2;
  v5[3] = &unk_1E6423820;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __63__SKUIEditProfileSettingDescription__authenticateOnCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) authenticateResponseType];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_displayFooter:(id)a3
{
  id v4 = a3;
  id v8 = [(SKUISettingDescription *)self parent];
  [v8 setFooterDescription:v4];

  id v5 = [[SKUISettingsDescriptionUpdate alloc] initWithUpdateType:2];
  uint64_t v6 = [v8 index];
  id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v6];
  [(SKUISettingsDescriptionUpdate *)v5 setIndexSet:v7];

  [v8 dispatchUpdate:v5];
}

- (void)_displayRules:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [SKUIHandleRulesSettingsHeaderFooterDescription alloc];
  uint64_t v6 = [(SKUISettingDescription *)self parent];
  id v7 = [v6 clientContext];
  id v8 = [(SKUIHandleRulesSettingsHeaderFooterDescription *)v5 initWithClientContext:v7];

  [(SKUIHandleRulesSettingsHeaderFooterDescription *)v8 setShowInvalid:v3];
  [(SKUIEditProfileSettingDescription *)self _displayFooter:v8];
}

- (void)_displaySuggestedHandles:(id)a3
{
  self->_suggestedHandlesDisplayed = 1;
  id v4 = a3;
  id v5 = [SKUISuggestedHandlesSettingsHeaderFooterDescription alloc];
  uint64_t v6 = [(SKUISettingDescription *)self parent];
  id v7 = [v6 clientContext];
  id v8 = [(SKUISuggestedHandlesSettingsHeaderFooterDescription *)v5 initWithSuggestedHandles:v4 clientContext:v7 delegate:self];

  [(SKUIEditProfileSettingDescription *)self _displayFooter:v8];
}

- (void)_enterEditMode
{
  self->_editing = 1;
  [(SKUIEditProfileSettingDescription *)self _displayRules:0];
  [(SKUIEditProfileSettingDescription *)self _updateValidity];

  [(SKUISettingDescription *)self _reloadSetting];
}

- (void)_fetchAccountInfo
{
  BOOL v3 = +[SKUIMediaSocialProfileCoordinator sharedCoordinator];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SKUIEditProfileSettingDescription__fetchAccountInfo__block_invoke;
  v4[3] = &unk_1E6425CE8;
  objc_copyWeak(&v5, &location);
  [v3 getProfileWithOptions:0 profileBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__SKUIEditProfileSettingDescription__fetchAccountInfo__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__SKUIEditProfileSettingDescription__fetchAccountInfo__block_invoke_2;
    v6[3] = &unk_1E6425240;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);

    objc_destroyWeak(&v8);
  }
}

void __54__SKUIEditProfileSettingDescription__fetchAccountInfo__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    BOOL v3 = [WeakRetained _valueStore];
    id v4 = [*(id *)(a1 + 32) handle];
    id v5 = (void *)[v4 copy];
    [v3 setOriginalValue:v5 forKey:@"handle"];

    uint64_t v6 = [*(id *)(a1 + 32) name];
    id v7 = (void *)[v6 copy];
    [v3 setOriginalValue:v7 forKey:@"name"];

    id WeakRetained = v8;
  }
}

- (void)_fetchProfilePhoto
{
  BOOL v3 = [(SKUISettingDescription *)self parent];
  id v4 = [v3 clientContext];

  id v5 = [[SKUIMediaSocialLoadProfilePhotoOperation alloc] initWithClientContext:v4];
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __55__SKUIEditProfileSettingDescription__fetchProfilePhoto__block_invoke;
  id v9 = &unk_1E6425D10;
  objc_copyWeak(&v10, &location);
  [(SKUIMediaSocialLoadProfilePhotoOperation *)v5 setOutputBlock:&v6];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __55__SKUIEditProfileSettingDescription__fetchProfilePhoto__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained _valueStore];
    id v9 = v8;
    if ((a3 & 1) != 0
      || ([v8 originalValueForKey:@"photo"],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      double v11 = (void *)[v5 copy];
      [v9 setOriginalValue:v11 forKey:@"photo"];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__SKUIEditProfileSettingDescription__fetchProfilePhoto__block_invoke_2;
      block[3] = &unk_1E6422020;
      block[4] = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __55__SKUIEditProfileSettingDescription__fetchProfilePhoto__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadSetting];
}

- (void)_fetchSuggestedHandles
{
  BOOL v3 = [(SKUISettingDescription *)self parent];
  id v4 = [v3 clientContext];

  id v5 = [[SKUIMediaSocialSuggestedHandlesOperation alloc] initWithClientContext:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v7 = [(SKUISettingValueStore *)self->_valueStore resolvedValueForKey:@"name"];
  id v8 = [(SKUISettingValueStore *)self->_valueStore resolvedValueForKey:@"handle"];
  id v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, 0);

  [(SKUIMediaSocialSuggestedHandlesOperation *)v5 setWords:v9];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__SKUIEditProfileSettingDescription__fetchSuggestedHandles__block_invoke;
  v10[3] = &unk_1E6423C58;
  objc_copyWeak(&v11, &location);
  [(SKUIMediaSocialSuggestedHandlesOperation *)v5 setOutputBlock:v10];
  [(NSOperationQueue *)self->_operationQueue addOperation:v5];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __59__SKUIEditProfileSettingDescription__fetchSuggestedHandles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SKUIEditProfileSettingDescription__fetchSuggestedHandles__block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __59__SKUIEditProfileSettingDescription__fetchSuggestedHandles__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 32)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  id v4 = WeakRetained;
  [WeakRetained _displaySuggestedHandles:v3];
}

- (void)_finalizeCommitWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  [(SKUISettingValueStore *)self->_valueStore clearValueForKey:@"photoUpload"];
  id commitBlock = (void (**)(id, BOOL))self->_commitBlock;
  if (commitBlock)
  {
    commitBlock[2](commitBlock, v4);
    id v7 = self->_commitBlock;
    self->_id commitBlock = 0;
  }
  if (v4)
  {
    [(SKUIEditProfileSettingDescription *)self _leaveEditMode];
    [(SKUIEditProfileSettingDescription *)self _reloadData];
  }
  else
  {
    id v8 = v11;
    if (!v11) {
      goto LABEL_11;
    }
    id v9 = [v11 domain];
    if ([v9 isEqualToString:@"SKUIErrorDomain"])
    {
      uint64_t v10 = [v11 code];

      id v8 = v11;
      if (v10 != 5) {
        goto LABEL_11;
      }
      [(SKUIEditProfileSettingDescription *)self _fetchSuggestedHandles];
    }
    else
    {
    }
  }
  id v8 = v11;
LABEL_11:
}

- (void)_hideFooter
{
  self->_suggestedHandlesDisplayed = 0;
  id v5 = [(SKUISettingDescription *)self parent];
  [v5 setFooterDescription:0];
  v2 = [[SKUISettingsDescriptionUpdate alloc] initWithUpdateType:2];
  uint64_t v3 = [v5 index];
  BOOL v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v3];
  [(SKUISettingsDescriptionUpdate *)v2 setIndexSet:v4];

  [v5 dispatchUpdate:v2];
}

- (void)_leaveEditMode
{
  self->_editing = 0;
  [(SKUIEditProfileSettingDescription *)self _hideFooter];

  [(SKUISettingDescription *)self _reloadSetting];
}

- (void)_reloadData
{
  [(SKUIEditProfileSettingDescription *)self _fetchAccountInfo];

  [(SKUIEditProfileSettingDescription *)self _fetchProfilePhoto];
}

- (void)_updateAccountInfo
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [SKUIMediaSocialUpdateProfileOperation alloc];
  val = self;
  BOOL v4 = [(SKUISettingDescription *)self parent];
  id v5 = [v4 clientContext];
  v23 = [(SKUIMediaSocialUpdateProfileOperation *)v3 initWithClientContext:v5];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [(SKUISettingValueStore *)self->_valueStore modifiedKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = (__CFString *)*(id *)(*((void *)&v27 + 1) + 8 * v9);
        char v11 = [(__CFString *)v10 isEqualToString:@"handle"];
        id v12 = SKUIMediaSocialUpdateProfileFieldHandle;
        if ((v11 & 1) != 0
          || (char v13 = [(__CFString *)v10 isEqualToString:@"name"],
              id v12 = SKUIMediaSocialUpdateProfileFieldName,
              (v13 & 1) != 0)
          || (int v14 = [(__CFString *)v10 isEqualToString:@"photoUpload"],
              id v12 = &SKUIMediaSocialUpdateProfileFieldProfileImage,
              v14))
        {
          double v15 = *v12;

          if (!v15) {
            goto LABEL_16;
          }
          double v16 = [(SKUISettingValueStore *)val->_valueStore resolvedValueForKey:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v16;
            double v16 = v17;
            if ([v17 isEqualToString:&stru_1F1C879E8])
            {
              double v16 = [MEMORY[0x1E4F1CA98] null];
            }
          }
          [(SKUIMediaSocialUpdateProfileOperation *)v23 setValue:v16 forProfileField:v15];
        }
        else
        {
          double v15 = v10;
        }

LABEL_16:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v18 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v7 = v18;
    }
    while (v18);
  }

  v19 = [MEMORY[0x1E4FA8100] defaultStore];
  v20 = [v19 activeAccount];

  v21 = [v20 uniqueIdentifier];
  [(SKUIMediaSocialUpdateProfileOperation *)v23 setIdentifier:v21];

  [(SKUIMediaSocialUpdateProfileOperation *)v23 setEntityType:@"user"];
  objc_initWeak(&location, val);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__SKUIEditProfileSettingDescription__updateAccountInfo__block_invoke;
  v24[3] = &unk_1E6424270;
  objc_copyWeak(&v25, &location);
  [(SKUIMediaSocialUpdateProfileOperation *)v23 setOutputBlock:v24];
  [(NSOperationQueue *)val->_operationQueue addOperation:v23];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __55__SKUIEditProfileSettingDescription__updateAccountInfo__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2)
  {
    uint64_t v9 = [v5 domain];
    if ([v9 isEqualToString:@"SKUIErrorDomain"])
    {
      uint64_t v10 = [v5 code];

      if (v10 == 5)
      {
        [WeakRetained _fetchSuggestedHandles];
        [WeakRetained _finalizeCommitWithSuccess:0 error:0];
        goto LABEL_12;
      }
    }
    else
    {
    }
    char v11 = [v5 domain];
    if ([v11 isEqualToString:@"SKUIErrorDomain"])
    {
      uint64_t v12 = [v5 code];

      if (v12 == 3)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __55__SKUIEditProfileSettingDescription__updateAccountInfo__block_invoke_3;
        v14[3] = &unk_1E64295F0;
        objc_copyWeak(&v15, v6);
        v14[4] = WeakRetained;
        [WeakRetained _authenticateOnCompletion:v14];
        objc_destroyWeak(&v15);
        goto LABEL_12;
      }
    }
    else
    {
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__SKUIEditProfileSettingDescription__updateAccountInfo__block_invoke_4;
    v13[3] = &unk_1E6422020;
    v13[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], v13);
    goto LABEL_12;
  }
  uint64_t v8 = +[SKUIMediaSocialProfileCoordinator sharedCoordinator];
  [v8 reset];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SKUIEditProfileSettingDescription__updateAccountInfo__block_invoke_2;
  block[3] = &unk_1E6422020;
  void block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_12:
}

uint64_t __55__SKUIEditProfileSettingDescription__updateAccountInfo__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finalizeCommitWithSuccess:1 error:0];
}

void __55__SKUIEditProfileSettingDescription__updateAccountInfo__block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _updateAccountInfo];
  }
  else
  {
    v2 = *(void **)(a1 + 32);
    [v2 _finalizeCommitWithSuccess:0 error:0];
  }
}

uint64_t __55__SKUIEditProfileSettingDescription__updateAccountInfo__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finalizeCommitWithSuccess:0 error:0];
}

- (void)_uploadProfileImage:(id)a3
{
  id v4 = a3;
  id v5 = [SKUIMediaSocialSaveProfilePhotoOperation alloc];
  id v6 = [(SKUISettingDescription *)self parent];
  uint64_t v7 = [v6 clientContext];
  uint64_t v8 = [(SKUIMediaSocialSaveProfilePhotoOperation *)v5 initWithClientContext:v7];

  [(SKUIMediaSocialSaveProfilePhotoOperation *)v8 setPhoto:v4];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SKUIEditProfileSettingDescription__uploadProfileImage___block_invoke;
  v10[3] = &unk_1E642AA70;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [(SKUIMediaSocialSaveProfilePhotoOperation *)v8 setOutputBlock:v10];
  [(NSOperationQueue *)self->_operationQueue addOperation:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __57__SKUIEditProfileSettingDescription__uploadProfileImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5 || v6)
  {
    uint64_t v10 = [v6 domain];
    if ([v10 isEqualToString:@"SKUIErrorDomain"])
    {
      uint64_t v11 = [v6 code];

      if (v11 == 3)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __57__SKUIEditProfileSettingDescription__uploadProfileImage___block_invoke_2;
        v12[3] = &unk_1E64287B0;
        objc_copyWeak(&v15, (id *)(a1 + 40));
        id v13 = *(id *)(a1 + 32);
        id v14 = WeakRetained;
        [WeakRetained _authenticateOnCompletion:v12];

        objc_destroyWeak(&v15);
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v8 = +[SKUIMediaSocialProfileCoordinator sharedCoordinator];
    [v8 reset];
    id v9 = [WeakRetained _valueStore];
    [v9 setModifiedValue:v5 forKey:@"photoUpload"];
    [WeakRetained _updateAccountInfo];
  }
}

void __57__SKUIEditProfileSettingDescription__uploadProfileImage___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _uploadProfileImage:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 40);
    [v3 _finalizeCommitWithSuccess:0 error:0];
  }
}

- (void)_updateValidity
{
  id v4 = [(SKUISettingValueStore *)self->_valueStore resolvedValueForKey:@"name"];
  uint64_t v3 = [(SKUISettingValueStore *)self->_valueStore resolvedValueForKey:@"handle"];
  [(SKUISettingDescription *)self _setEditsValid:[(SKUIEditProfileSettingDescription *)self _validateName:v4] & [(SKUIEditProfileSettingDescription *)self _validateHandle:v3]];
}

- (BOOL)_validateHandle:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || ([v4 isEqualToString:&stru_1F1C879E8] & 1) != 0
    || (unint64_t)[v5 length] > 0x20)
  {
    BOOL v11 = 0;
  }
  else
  {
    if (!self->_handleValidation)
    {
      id v6 = (NSRegularExpression *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"[A-Za-z0-9_]+" options:0 error:0];
      handleValidation = self->_handleValidation;
      self->_handleValidation = v6;
    }
    uint64_t v8 = [v5 length];
    if (-[NSRegularExpression rangeOfFirstMatchInString:options:range:](self->_handleValidation, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, v8))
    {
      BOOL v10 = 0;
    }
    else
    {
      BOOL v10 = v8 == v9;
    }
    BOOL v11 = v10;
  }
  self->_handleValid = v11;

  return v11;
}

- (BOOL)_validateName:(id)a3
{
  if (a3) {
    return [a3 isEqualToString:&stru_1F1C879E8] ^ 1;
  }
  else {
    return 0;
  }
}

- (id)_valueStore
{
  return self->_valueStore;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isHandleValid
{
  return self->_handleValid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueStore, 0);
  objc_storeStrong((id *)&self->_handleValidation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong(&self->_commitBlock, 0);
}

- (void)initWithViewElement:parent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEditProfileSettingDescription initWithViewElement:parent:]";
}

@end