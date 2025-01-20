@interface PXAssistantStepContext
- (BOOL)firstButtonEnabled;
- (BOOL)secondButtonEnabled;
- (BOOL)useTransparentBarAppearance;
- (NSString)customSecondButtonTitle;
- (NSString)firstButtonTitle;
- (NSString)identifier;
- (PXAssistantStepContext)init;
- (PXAssistantStepContext)initWithIdentifier:(id)a3 viewController:(id)a4;
- (UIViewController)viewController;
- (int64_t)firstButtonType;
- (int64_t)secondButtonType;
- (void)performChanges:(id)a3;
- (void)setCustomSecondButtonTitle:(id)a3;
- (void)setFirstButtonEnabled:(BOOL)a3;
- (void)setFirstButtonTitle:(id)a3;
- (void)setFirstButtonType:(int64_t)a3;
- (void)setSecondButtonEnabled:(BOOL)a3;
- (void)setSecondButtonType:(int64_t)a3;
- (void)setUseTransparentBarAppearance:(BOOL)a3;
@end

@implementation PXAssistantStepContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSecondButtonTitle, 0);
  objc_storeStrong((id *)&self->_firstButtonTitle, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)useTransparentBarAppearance
{
  return self->_useTransparentBarAppearance;
}

- (BOOL)secondButtonEnabled
{
  return self->_secondButtonEnabled;
}

- (NSString)customSecondButtonTitle
{
  return self->_customSecondButtonTitle;
}

- (int64_t)secondButtonType
{
  return self->_secondButtonType;
}

- (BOOL)firstButtonEnabled
{
  return self->_firstButtonEnabled;
}

- (NSString)firstButtonTitle
{
  return self->_firstButtonTitle;
}

- (int64_t)firstButtonType
{
  return self->_firstButtonType;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setUseTransparentBarAppearance:(BOOL)a3
{
  if (self->_useTransparentBarAppearance != a3)
  {
    self->_useTransparentBarAppearance = a3;
    [(PXAssistantStepContext *)self signalChange:512];
  }
}

- (void)setSecondButtonEnabled:(BOOL)a3
{
  if (self->_secondButtonEnabled != a3)
  {
    self->_secondButtonEnabled = a3;
    [(PXAssistantStepContext *)self signalChange:16];
  }
}

- (void)setCustomSecondButtonTitle:(id)a3
{
  v11 = (NSString *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXAssistantStepContext.m", 88, @"Invalid parameter not satisfying: %@", @"customSecondButtonTitle" object file lineNumber description];
  }
  v5 = self->_customSecondButtonTitle;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v11];

    if (!v7)
    {
      v8 = (NSString *)[(NSString *)v11 copy];
      customSecondButtonTitle = self->_customSecondButtonTitle;
      self->_customSecondButtonTitle = v8;

      [(PXAssistantStepContext *)self signalChange:32];
    }
  }
}

- (void)setSecondButtonType:(int64_t)a3
{
  if (self->_secondButtonType != a3)
  {
    self->_secondButtonType = a3;
    [(PXAssistantStepContext *)self signalChange:8];
  }
}

- (void)setFirstButtonEnabled:(BOOL)a3
{
  if (self->_firstButtonEnabled != a3)
  {
    self->_firstButtonEnabled = a3;
    [(PXAssistantStepContext *)self signalChange:4];
  }
}

- (void)setFirstButtonTitle:(id)a3
{
  v11 = (NSString *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXAssistantStepContext.m", 63, @"Invalid parameter not satisfying: %@", @"firstButtonTitle" object file lineNumber description];
  }
  v5 = self->_firstButtonTitle;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v11];

    if (!v7)
    {
      v8 = (NSString *)[(NSString *)v11 copy];
      firstButtonTitle = self->_firstButtonTitle;
      self->_firstButtonTitle = v8;

      [(PXAssistantStepContext *)self signalChange:4];
    }
  }
}

- (void)setFirstButtonType:(int64_t)a3
{
  if (self->_firstButtonType != a3)
  {
    self->_firstButtonType = a3;
    [(PXAssistantStepContext *)self signalChange:1];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXAssistantStepContext;
  [(PXAssistantStepContext *)&v3 performChanges:a3];
}

- (PXAssistantStepContext)initWithIdentifier:(id)a3 viewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXAssistantStepContext.m", 25, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PXAssistantStepContext.m", 26, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PXAssistantStepContext;
  v10 = [(PXAssistantStepContext *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_viewController, a4);
    v10->_firstButtonType = 0;
    firstButtonTitle = v10->_firstButtonTitle;
    v10->_firstButtonTitle = (NSString *)&stru_1F00B0030;

    v10->_firstButtonEnabled = 1;
    v10->_secondButtonType = 0;
    customSecondButtonTitle = v10->_customSecondButtonTitle;
    v10->_customSecondButtonTitle = (NSString *)&stru_1F00B0030;

    v10->_secondButtonEnabled = 1;
    v10->_useTransparentBarAppearance = 1;
  }

  return v10;
}

- (PXAssistantStepContext)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssistantStepContext.m", 21, @"%s is not available as initializer", "-[PXAssistantStepContext init]");

  abort();
}

@end