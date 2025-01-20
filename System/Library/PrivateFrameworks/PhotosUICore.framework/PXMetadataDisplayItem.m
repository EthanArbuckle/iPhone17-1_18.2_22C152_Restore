@interface PXMetadataDisplayItem
+ (id)emptyItem;
- (BOOL)isEmpty;
- (NSString)accessibilityDescription;
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityValue;
- (NSString)accessoryImageSystemName;
- (PXMetadataDisplayItem)init;
- (PXMetadataDisplayItem)initWithContent:(id)a3 accessibilityDescription:(id)a4 accessibilityValue:(id)a5 accessibilityIdentifier:(id)a6 accessoryImageSystemName:(id)a7;
- (id)content;
- (void)setAccessibilityDescription:(id)a3;
- (void)setContent:(id)a3;
@end

@implementation PXMetadataDisplayItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityValue, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_accessoryImageSystemName, 0);
  objc_storeStrong(&self->_content, 0);
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (NSString)accessibilityValue
{
  return self->_accessibilityValue;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (NSString)accessoryImageSystemName
{
  return self->_accessoryImageSystemName;
}

- (void)setContent:(id)a3
{
}

- (id)content
{
  return self->_content;
}

- (PXMetadataDisplayItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMetadataUtilities.m", 1446, @"%s is not available as initializer", "-[PXMetadataDisplayItem init]");

  abort();
}

- (PXMetadataDisplayItem)initWithContent:(id)a3 accessibilityDescription:(id)a4 accessibilityValue:(id)a5 accessibilityIdentifier:(id)a6 accessoryImageSystemName:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PXMetadataDisplayItem;
  v17 = [(PXMetadataDisplayItem *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong(&v17->_content, a3);
    objc_storeStrong((id *)&v18->_accessibilityDescription, a4);
    objc_storeStrong((id *)&v18->_accessibilityValue, a5);
    objc_storeStrong((id *)&v18->_accessibilityIdentifier, a6);
    objc_storeStrong((id *)&v18->_accessoryImageSystemName, a7);
  }

  return v18;
}

- (BOOL)isEmpty
{
  v3 = [(PXMetadataDisplayItem *)self content];
  if ([v3 isEqual:&stru_1F00B0030])
  {
    v4 = [(PXMetadataDisplayItem *)self accessibilityDescription];
    if (v4)
    {
      BOOL v5 = 0;
    }
    else
    {
      v6 = [(PXMetadataDisplayItem *)self accessoryImageSystemName];
      BOOL v5 = v6 == 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)emptyItem
{
  v2 = [[PXMetadataDisplayItem alloc] initWithContent:&stru_1F00B0030 accessibilityDescription:0 accessibilityValue:0 accessibilityIdentifier:0 accessoryImageSystemName:0];
  return v2;
}

@end