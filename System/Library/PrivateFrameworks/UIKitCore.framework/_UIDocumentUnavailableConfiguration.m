@interface _UIDocumentUnavailableConfiguration
+ (id)createDocumentActionWithIntent:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (id)initWithBrowserViewController:(void *)a1;
- (unint64_t)hash;
- (void)_setSecondaryMenu:(uint64_t)a1;
- (void)setBackgroundAccessoryView:(uint64_t)a1;
- (void)setDocumentTargetView:(uint64_t)a1;
@end

@implementation _UIDocumentUnavailableConfiguration

- (void)setDocumentTargetView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (id)initWithBrowserViewController:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_UIDocumentUnavailableConfiguration;
  v3 = (id *)objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong(v3 + 6, a2);
    uint64_t v5 = +[UIBackgroundConfiguration clearConfiguration];
    id v6 = v4[11];
    v4[11] = (id)v5;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (!a3) {
    goto LABEL_11;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  LOBYTE(v6) = 0;
  if (self && (isKindOfClass & 1) != 0)
  {
    if (self->_enabled != *((unsigned __int8 *)a3 + 8)
      || self->_documentState != *((void *)a3 + 4)
      || self->_browserViewController != (UIViewController *)*((void *)a3 + 6)
      || self->_documentTargetView != (UIView *)*((void *)a3 + 10)
      || self->_foregroundAccessoryView != (UIView *)*((void *)a3 + 12)
      || self->_backgroundAccessoryView != (UIView *)*((void *)a3 + 13))
    {
LABEL_11:
      LOBYTE(v6) = 0;
      return v6;
    }
    objc_super v8 = (void *)*((void *)a3 + 5);
    v9 = self->_documentCreationIntent;
    v10 = v8;
    if (v9 == v10)
    {
    }
    else
    {
      v11 = v10;
      LOBYTE(v6) = 0;
      if (!v9 || !v10) {
        goto LABEL_55;
      }
      int v6 = [(NSURL *)v9 isEqual:v10];

      if (!v6) {
        return v6;
      }
    }
    v12 = (void *)*((void *)a3 + 7);
    v9 = self->_title;
    v13 = v12;
    if (v9 == v13)
    {
    }
    else
    {
      v11 = v13;
      LOBYTE(v6) = 0;
      if (!v9 || !v13) {
        goto LABEL_55;
      }
      int v6 = [(NSURL *)v9 isEqual:v13];

      if (!v6) {
        return v6;
      }
    }
    v14 = (void *)*((void *)a3 + 3);
    v9 = self->_documentURL;
    v15 = v14;
    if (v9 == v15)
    {
    }
    else
    {
      v11 = v15;
      LOBYTE(v6) = 0;
      if (!v9 || !v15) {
        goto LABEL_55;
      }
      int v6 = [(NSURL *)v9 isEqual:v15];

      if (!v6) {
        return v6;
      }
    }
    v16 = (void *)*((void *)a3 + 8);
    v9 = self->_primaryAction;
    v17 = v16;
    if (v9 == v17)
    {
    }
    else
    {
      v11 = v17;
      LOBYTE(v6) = 0;
      if (!v9 || !v17) {
        goto LABEL_55;
      }
      int v6 = [(NSURL *)v9 isEqual:v17];

      if (!v6) {
        return v6;
      }
    }
    v18 = (void *)*((void *)a3 + 9);
    v9 = self->_secondaryAction;
    v19 = v18;
    if (v9 == v19)
    {
    }
    else
    {
      v11 = v19;
      LOBYTE(v6) = 0;
      if (!v9 || !v19) {
        goto LABEL_55;
      }
      int v6 = [(NSURL *)v9 isEqual:v19];

      if (!v6) {
        return v6;
      }
    }
    v20 = (void *)*((void *)a3 + 2);
    v9 = self->_secondaryMenu;
    v21 = v20;
    if (v9 == v21)
    {

LABEL_50:
      v22 = (void *)*((void *)a3 + 11);
      v9 = self->_background;
      v23 = v22;
      v11 = v23;
      if (v9 == v23)
      {
        LOBYTE(v6) = 1;
      }
      else
      {
        LOBYTE(v6) = 0;
        if (v9 && v23) {
          LOBYTE(v6) = [(NSURL *)v9 isEqual:v23];
        }
      }
      goto LABEL_55;
    }
    v11 = v21;
    LOBYTE(v6) = 0;
    if (v9 && v21)
    {
      int v6 = [(NSURL *)v9 isEqual:v21];

      if (!v6) {
        return v6;
      }
      goto LABEL_50;
    }
LABEL_55:
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(UIViewController *)self->_browserViewController hash];
  NSUInteger v4 = [(NSString *)self->_title hash] ^ v3;
  unint64_t v5 = [(UIAction *)self->_primaryAction hash];
  unint64_t v6 = v4 ^ v5 ^ [(UIAction *)self->_secondaryAction hash];
  return v6 ^ [(UIBackgroundConfiguration *)self->_background hash];
}

- (void)_setSecondaryMenu:(uint64_t)a1
{
  if (a1)
  {
    NSUInteger v4 = [a2 children];
    _UIMenuReplacingElementMatchingPredicate(v4, &__block_literal_global_325, &__block_literal_global_5_2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v5 = [a2 menuByReplacingChildren:v7];
    unint64_t v6 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v5;
  }
}

+ (id)createDocumentActionWithIntent:(uint64_t)a1
{
  uint64_t v3 = self;
  if (![a2 length])
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:sel_createDocumentActionWithIntent_ object:v3 file:@"_UIDocumentUnavailableConfiguration.m" lineNumber:128 description:@"UIDocumentCreationIntent should have a non-zero length"];
  }
  NSUInteger v4 = _UILocalizedString(@"com.apple.documents.create.action", @"The title of the button that creates a new document.", @"Create Document");
  uint64_t v5 = [@"com.apple.documents.action.create.document." stringByAppendingString:a2];
  unint64_t v6 = +[UIAction actionWithTitle:v4 image:0 identifier:v5 handler:&__block_literal_global_27_0];

  return v6;
}

- (void)setBackgroundAccessoryView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_foregroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_documentTargetView, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_browserViewController, 0);
  objc_storeStrong((id *)&self->_documentCreationIntent, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_secondaryMenu, 0);
}

@end