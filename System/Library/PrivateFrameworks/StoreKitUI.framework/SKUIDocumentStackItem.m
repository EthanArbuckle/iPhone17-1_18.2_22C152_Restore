@interface SKUIDocumentStackItem
- (BOOL)isAnimated;
- (BOOL)usesNavigationControllerForModalPresentation;
- (IKAppDocument)document;
- (NSDictionary)presentationOptions;
- (NSString)overlayType;
- (NSString)presentationType;
- (NSString)sheetType;
- (NSString)sourceElementIdentifier;
- (SKUIDocumentStackItem)init;
- (SKUIDocumentStackItem)initWithDocument:(id)a3 presentationOptions:(id)a4;
- (SKUINavigationDocumentController)navigationDocumentController;
- (UIPopoverPresentationController)popoverPresentationController;
- (UIViewController)viewController;
- (void)_setDocument:(id)a3;
- (void)setNavigationDocumentController:(id)a3;
- (void)setPopoverPresentationController:(id)a3;
- (void)setUsesNavigationControllerForModalPresentation:(BOOL)a3;
- (void)setViewController:(id)a3;
@end

@implementation SKUIDocumentStackItem

- (SKUIDocumentStackItem)init
{
  return [(SKUIDocumentStackItem *)self initWithDocument:0 presentationOptions:0];
}

- (SKUIDocumentStackItem)initWithDocument:(id)a3 presentationOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIDocumentStackItem initWithDocument:presentationOptions:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIDocumentStackItem;
  v9 = [(SKUIDocumentStackItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_document, a3);
    objc_storeStrong((id *)&v10->_presentationOptions, a4);
    v10->_usesNavigationControllerForModalPresentation = 1;
  }

  return v10;
}

- (void)_setDocument:(id)a3
{
  v5 = (IKAppDocument *)a3;
  document = self->_document;
  p_document = &self->_document;
  if (document != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_document, a3);
    v5 = v8;
  }
}

- (BOOL)isAnimated
{
  v2 = [(NSDictionary *)self->_presentationOptions objectForKey:@"animated"];
  if (v2)
  {
    if (objc_opt_respondsToSelector()) {
      char v3 = [v2 BOOLValue];
    }
    else {
      char v3 = 0;
    }
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (NSString)presentationType
{
  v2 = [(NSDictionary *)self->_presentationOptions objectForKey:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = v2;
  }
  else {
    char v3 = @"sheet";
  }
  v4 = v3;

  return v4;
}

- (NSString)sheetType
{
  v2 = [(NSDictionary *)self->_presentationOptions objectForKey:@"sheetType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = v2;
  }
  else {
    char v3 = @"formSheet";
  }
  v4 = v3;

  return v4;
}

- (NSString)overlayType
{
  v2 = [(NSDictionary *)self->_presentationOptions objectForKey:@"overlayType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = v2;
  }
  else {
    char v3 = @"default";
  }
  v4 = v3;

  return v4;
}

- (NSString)sourceElementIdentifier
{
  v2 = [(NSDictionary *)self->_presentationOptions objectForKey:@"sourceElement"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (IKAppDocument)document
{
  return self->_document;
}

- (SKUINavigationDocumentController)navigationDocumentController
{
  return self->_navigationDocumentController;
}

- (void)setNavigationDocumentController:(id)a3
{
}

- (NSDictionary)presentationOptions
{
  return self->_presentationOptions;
}

- (BOOL)usesNavigationControllerForModalPresentation
{
  return self->_usesNavigationControllerForModalPresentation;
}

- (void)setUsesNavigationControllerForModalPresentation:(BOOL)a3
{
  self->_usesNavigationControllerForModalPresentation = a3;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (UIPopoverPresentationController)popoverPresentationController
{
  return self->_popoverPresentationController;
}

- (void)setPopoverPresentationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverPresentationController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_navigationDocumentController, 0);

  objc_storeStrong((id *)&self->_document, 0);
}

- (void)initWithDocument:presentationOptions:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDocumentStackItem initWithDocument:presentationOptions:]";
}

@end