@interface BKPDFActionController
- (BOOL)_bookHasCapability:(id)a3;
- (BOOL)_isEmailAllowedForBook:(id)a3;
- (BOOL)_isPrintingAllowedForBook:(id)a3;
- (BOOL)canAirDrop;
- (BOOL)canEmailBook;
- (BOOL)canMarkupAsPDF;
- (BOOL)canPrintBook;
- (BOOL)didComputeMailingAllowed;
- (BOOL)didComputePrintingAllowed;
- (BOOL)isMailingAllowed;
- (BOOL)isPrintingAllowed;
- (id)activityItems;
- (void)_setActivities;
- (void)setDidComputeMailingAllowed:(BOOL)a3;
- (void)setDidComputePrintingAllowed:(BOOL)a3;
- (void)setIsMailingAllowed:(BOOL)a3;
- (void)setIsPrintingAllowed:(BOOL)a3;
@end

@implementation BKPDFActionController

- (id)activityItems
{
  v8.receiver = self;
  v8.super_class = (Class)BKPDFActionController;
  v3 = [(BKActionController *)&v8 activityItems];
  v4 = [BKActivityPDFLinkPresentationItemSource alloc];
  v5 = [(BKActionController *)self bookInfo];
  v6 = [(BKActivityPDFLinkPresentationItemSource *)v4 initWithBookInfo:v5];

  [v3 addObject:v6];

  return v3;
}

- (BOOL)_isPrintingAllowedForBook:(id)a3
{
  v3 = [a3 url];
  Class v4 = NSClassFromString(@"UIPrintInteractionController");
  if (v4 && [(objc_class *)v4 canPrintURL:v3])
  {
    id v5 = [objc_alloc((Class)NSData) initWithContentsOfURL:v3 options:1 error:0];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_bookHasCapability:(id)a3
{
  if ([a3 isManagedBook]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }

  return +[MFMailComposeViewController canSendMailSourceAccountManagement:v3];
}

- (BOOL)_isEmailAllowedForBook:(id)a3
{
  id v4 = a3;
  if ([(BKPDFActionController *)self _bookHasCapability:v4])
  {
    id v5 = [v4 bookBundlePath];
    BOOL v6 = +[NSURL fileURLWithPath:v5];
    v7 = +[NSFileManager defaultManager];
    objc_super v8 = v7;
    if (v6 && [v7 fileExistsAtPath:v5])
    {
      v9 = [v8 attributesOfItemAtPath:v5 error:0];
      v10 = v9;
      BOOL v13 = 0;
      if (v9)
      {
        v11 = [v9 objectForKey:NSFileSize];
        id v12 = [v11 unsignedLongLongValue];

        if ((unint64_t)v12 < 0x12C0001) {
          BOOL v13 = 1;
        }
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)canPrintBook
{
  if (![(BKPDFActionController *)self didComputePrintingAllowed])
  {
    [(BKPDFActionController *)self setDidComputePrintingAllowed:1];
    uint64_t v3 = [(BKActionController *)self bookInfo];
    [(BKPDFActionController *)self setIsPrintingAllowed:[(BKPDFActionController *)self _isPrintingAllowedForBook:v3]];
  }
  v6.receiver = self;
  v6.super_class = (Class)BKPDFActionController;
  BOOL v4 = [(BKActionController *)&v6 canPrintBook];
  if (v4) {
    LOBYTE(v4) = [(BKPDFActionController *)self isPrintingAllowed];
  }
  return v4;
}

- (BOOL)canEmailBook
{
  if (![(BKPDFActionController *)self didComputeMailingAllowed])
  {
    [(BKPDFActionController *)self setDidComputeMailingAllowed:1];
    uint64_t v3 = [(BKActionController *)self bookInfo];
    [(BKPDFActionController *)self setIsMailingAllowed:[(BKPDFActionController *)self _isEmailAllowedForBook:v3]];
  }

  return [(BKPDFActionController *)self isMailingAllowed];
}

- (BOOL)canMarkupAsPDF
{
  return 0;
}

- (BOOL)canAirDrop
{
  v2 = [(BKActionController *)self bookInfo];
  char v3 = [v2 isManagedBook] ^ 1;

  return v3;
}

- (void)_setActivities
{
  if ([(BKPDFActionController *)self canEmailBook])
  {
    char v3 = [(BKActionController *)self includedActivityTypes];
    [v3 addObject:UIActivityTypeMail];

    BOOL v4 = [(BKActionController *)self includedActivityTypes];
    [v4 addObject:UIActivityTypeMessage];
  }
  if ([(BKPDFActionController *)self canPrintBook])
  {
    id v5 = [(BKActionController *)self includedActivityTypes];
    [v5 addObject:UIActivityTypePrint];
  }
  objc_super v6 = +[BCProgressKitController sharedController];
  v7 = [(BKActionController *)self bookInfo];
  objc_super v8 = [v7 assetID];
  unsigned int v9 = [v6 isTrackingAssetID:v8];

  if (v9)
  {
    v10 = [(BKActionController *)self includedActivityTypes];
    [v10 addObject:IMActivityTypeSaveToClassKitApp];

    v11 = [(BKActionController *)self includedActivityTypes];
    [v11 addObject:IMActivityTypeShareToClassKitApp];
  }
  if (![(BKPDFActionController *)self canMarkupAsPDF])
  {
    id v12 = [(BKActionController *)self excludedActivityTypes];
    [v12 addObject:UIActivityTypeMarkupAsPDF];
  }
  if ([(BKPDFActionController *)self canAirDrop]) {
    [(BKActionController *)self includedActivityTypes];
  }
  else {
  id v13 = [(BKActionController *)self excludedActivityTypes];
  }
  [v13 addObject:UIActivityTypeAirDrop];
}

- (BOOL)didComputePrintingAllowed
{
  return self->_didComputePrintingAllowed;
}

- (void)setDidComputePrintingAllowed:(BOOL)a3
{
  self->_didComputePrintingAllowed = a3;
}

- (BOOL)isPrintingAllowed
{
  return self->_isPrintingAllowed;
}

- (void)setIsPrintingAllowed:(BOOL)a3
{
  self->_isPrintingAllowed = a3;
}

- (BOOL)didComputeMailingAllowed
{
  return self->_didComputeMailingAllowed;
}

- (void)setDidComputeMailingAllowed:(BOOL)a3
{
  self->_didComputeMailingAllowed = a3;
}

- (BOOL)isMailingAllowed
{
  return self->_isMailingAllowed;
}

- (void)setIsMailingAllowed:(BOOL)a3
{
  self->_isMailingAllowed = a3;
}

@end