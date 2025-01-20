@interface SSEnvironmentElement
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)_metadataIdentifierBlocklist;
- (BOOL)hasKeyboardFocus;
- (BOOL)isAppLauncher;
- (BOOL)supportsMetadataCapture;
- (CGRect)rect;
- (NSString)bundleIdentifier;
- (NSString)elementIdentifier;
- (NSString)identifier;
- (NSString)loggableDescription;
- (SSEnvironmentElement)init;
- (SSEnvironmentElement)initWithBSXPCCoder:(id)a3;
- (SSEnvironmentElement)initWithDisplayLayoutElement:(id)a3;
- (SSHarvestedApplicationDocument)document;
- (SSHarvestedApplicationMetadata)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setDocument:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation SSEnvironmentElement

- (SSEnvironmentElement)init
{
  v7.receiver = self;
  v7.super_class = (Class)SSEnvironmentElement;
  v2 = [(SSEnvironmentElement *)&v7 init];
  v3 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v4 = [v3 bundleIdentifier];
  bundleIdentifier = v2->_bundleIdentifier;
  v2->_bundleIdentifier = (NSString *)v4;

  return v2;
}

- (SSEnvironmentElement)initWithDisplayLayoutElement:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SSEnvironmentElement;
  id v3 = a3;
  uint64_t v4 = [(SSEnvironmentElement *)&v17 init];
  objc_msgSend(v3, "frame", v17.receiver, v17.super_class);
  v4->_rect.origin.x = v5;
  v4->_rect.origin.y = v6;
  v4->_rect.size.width = v7;
  v4->_rect.size.height = v8;
  uint64_t v9 = [v3 bundleIdentifier];
  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = (NSString *)v9;

  uint64_t v11 = [v3 identifier];
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v11;

  v13 = [MEMORY[0x263F08C38] UUID];
  uint64_t v14 = [v13 UUIDString];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v14;

  LOBYTE(v13) = [v3 hasKeyboardFocus];
  v4->_hasKeyboardFocus = (char)v13;
  return v4;
}

- (NSString)loggableDescription
{
  id v3 = [MEMORY[0x263F089D8] string];
  uint64_t v4 = NSString;
  CGFloat v5 = [(SSEnvironmentElement *)self identifier];
  CGFloat v6 = [v5 shorterLoggableString];
  CGFloat v7 = [v4 stringWithFormat:@"identifier: %@ ", v6];
  [v3 appendString:v7];

  CGFloat v8 = NSString;
  [(SSEnvironmentElement *)self rect];
  uint64_t v9 = NSStringFromCGRect(v13);
  v10 = [v8 stringWithFormat:@"rect: %@", v9];
  [v3 appendString:v10];

  return (NSString *)v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v7 = a3;
  [(SSEnvironmentElement *)self rect];
  objc_msgSend(v7, "encodeCGRect:forKey:", @"SSEnvironmentElementRect");
  uint64_t v4 = [(SSEnvironmentElement *)self bundleIdentifier];
  [v7 encodeObject:v4 forKey:@"SSEnvironmentElementBundleIdentifier"];

  CGFloat v5 = [(SSEnvironmentElement *)self elementIdentifier];
  [v7 encodeObject:v5 forKey:@"SSEnvironmentElementIdentifier"];

  CGFloat v6 = [(SSEnvironmentElement *)self identifier];
  [v7 encodeObject:v6 forKey:@"SSEnvironmentElementUUID"];

  objc_msgSend(v7, "encodeBool:forKey:", -[SSEnvironmentElement hasKeyboardFocus](self, "hasKeyboardFocus"), @"SSEnvironmentElementHasKeyboardFocusKey");
}

- (SSEnvironmentElement)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(SSEnvironmentElement *)self init];
  [v4 decodeCGRectForKey:@"SSEnvironmentElementRect"];
  v5->_rect.origin.x = v6;
  v5->_rect.origin.y = v7;
  v5->_rect.size.width = v8;
  v5->_rect.size.height = v9;
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentElementBundleIdentifier"];
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentElementIdentifier"];
  elementIdentifier = v5->_elementIdentifier;
  v5->_elementIdentifier = (NSString *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentElementUUID"];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v14;

  char v16 = [v4 decodeBoolForKey:@"SSEnvironmentElementHasKeyboardFocusKey"];
  v5->_hasKeyboardFocus = v16;
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SSEnvironmentElement *)self rect];
  v4[1] = v5;
  v4[2] = v6;
  v4[3] = v7;
  v4[4] = v8;
  uint64_t v9 = [(SSEnvironmentElement *)self bundleIdentifier];
  uint64_t v10 = (void *)v4[5];
  v4[5] = v9;

  uint64_t v11 = [(SSEnvironmentElement *)self elementIdentifier];
  uint64_t v12 = (void *)v4[6];
  v4[6] = v11;

  uint64_t v13 = [(SSEnvironmentElement *)self identifier];
  uint64_t v14 = (void *)v4[7];
  v4[7] = v13;

  *((unsigned char *)v4 + 64) = [(SSEnvironmentElement *)self hasKeyboardFocus];
  return v4;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (BOOL)hasKeyboardFocus
{
  return self->_hasKeyboardFocus;
}

+ (id)_metadataIdentifierBlocklist
{
  if (_metadataIdentifierBlocklist_onceToken != -1) {
    dispatch_once(&_metadataIdentifierBlocklist_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_metadataIdentifierBlocklist___metadataIdentifierBlocklist;
  return v2;
}

uint64_t __52__SSEnvironmentElement__metadataIdentifierBlocklist__block_invoke()
{
  _metadataIdentifierBlocklist___metadataIdentifierBlocklist = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", *MEMORY[0x263F794D0], *MEMORY[0x263F794B0], *MEMORY[0x263F79508], *MEMORY[0x263F794F0], *MEMORY[0x263F794B8], *MEMORY[0x263F794E8], *MEMORY[0x263F794F8], *MEMORY[0x263F794E0], *MEMORY[0x263F794C8], *MEMORY[0x263F3F560], *MEMORY[0x263F3F570], *MEMORY[0x263F3F558], *MEMORY[0x263F3F568], *MEMORY[0x263F794C0], *MEMORY[0x263F79500], 0);
  return MEMORY[0x270F9A758]();
}

- (BOOL)supportsMetadataCapture
{
  id v3 = [(id)objc_opt_class() _metadataIdentifierBlocklist];
  id v4 = [(SSEnvironmentElement *)self bundleIdentifier];
  if ([v3 containsObject:v4])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v6 = [(id)objc_opt_class() _metadataIdentifierBlocklist];
    uint64_t v7 = [(SSEnvironmentElement *)self elementIdentifier];
    int v5 = [v6 containsObject:v7] ^ 1;
  }
  return v5;
}

- (BOOL)isAppLauncher
{
  if (([(NSString *)self->_elementIdentifier isEqual:*MEMORY[0x263F794A0]] & 1) != 0
    || ([(NSString *)self->_elementIdentifier isEqual:*MEMORY[0x263F794A8]] & 1) != 0
    || ([(NSString *)self->_elementIdentifier isEqual:*MEMORY[0x263F79518]] & 1) != 0)
  {
    return 1;
  }
  elementIdentifier = self->_elementIdentifier;
  uint64_t v5 = *MEMORY[0x263F794D8];
  return [(NSString *)elementIdentifier isEqual:v5];
}

- (SSHarvestedApplicationMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (SSHarvestedApplicationDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end