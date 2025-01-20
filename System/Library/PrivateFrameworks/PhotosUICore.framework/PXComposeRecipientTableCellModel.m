@interface PXComposeRecipientTableCellModel
+ (double)imageDiameter;
+ (double)imageInset;
+ (double)imageVerticalInset;
- (BOOL)checked;
- (BOOL)isValidAddress;
- (BOOL)showsCheckbox;
- (CNContact)contact;
- (NSString)address;
- (NSString)name;
- (PXComposeRecipientTableCellModel)init;
- (UIImage)image;
- (int64_t)imageRequestID;
- (void)performChanges:(id)a3;
- (void)setAddress:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageRequestID:(int64_t)a3;
- (void)setIsValidAddress:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setShowsCheckbox:(BOOL)a3;
@end

@implementation PXComposeRecipientTableCellModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)showsCheckbox
{
  return self->_showsCheckbox;
}

- (BOOL)checked
{
  return self->_checked;
}

- (BOOL)isValidAddress
{
  return self->_isValidAddress;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)imageRequestID
{
  return self->_imageRequestID;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setContact:(id)a3
{
  v8 = (CNContact *)a3;
  v4 = self->_contact;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(CNContact *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (CNContact *)[(CNContact *)v8 copy];
      contact = self->_contact;
      self->_contact = v6;

      [(PXComposeRecipientTableCellModel *)self signalChange:128];
    }
  }
}

- (void)setShowsCheckbox:(BOOL)a3
{
  if (self->_showsCheckbox != a3)
  {
    self->_showsCheckbox = a3;
    [(PXComposeRecipientTableCellModel *)self signalChange:64];
  }
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    [(PXComposeRecipientTableCellModel *)self signalChange:32];
  }
}

- (void)setIsValidAddress:(BOOL)a3
{
  if (self->_isValidAddress != a3)
  {
    self->_isValidAddress = a3;
    [(PXComposeRecipientTableCellModel *)self signalChange:16];
  }
}

- (void)setAddress:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_address;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      address = self->_address;
      self->_address = v6;

      [(PXComposeRecipientTableCellModel *)self signalChange:8];
    }
  }
}

- (void)setName:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_name;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      name = self->_name;
      self->_name = v6;

      [(PXComposeRecipientTableCellModel *)self signalChange:4];
    }
  }
}

- (void)setImageRequestID:(int64_t)a3
{
  if (self->_imageRequestID != a3)
  {
    self->_imageRequestID = a3;
    [(PXComposeRecipientTableCellModel *)self signalChange:2];
  }
}

- (void)setImage:(id)a3
{
  v8 = (UIImage *)a3;
  v4 = self->_image;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(UIImage *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (UIImage *)[(UIImage *)v8 copy];
      image = self->_image;
      self->_image = v6;

      [(PXComposeRecipientTableCellModel *)self signalChange:1];
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXComposeRecipientTableCellModel;
  [(PXComposeRecipientTableCellModel *)&v3 performChanges:a3];
}

- (PXComposeRecipientTableCellModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXComposeRecipientTableCellModel;
  result = [(PXComposeRecipientTableCellModel *)&v3 init];
  if (result) {
    result->_imageRequestID = -1;
  }
  return result;
}

+ (double)imageInset
{
  return 12.0;
}

+ (double)imageVerticalInset
{
  return 5.0;
}

+ (double)imageDiameter
{
  return 37.0;
}

@end