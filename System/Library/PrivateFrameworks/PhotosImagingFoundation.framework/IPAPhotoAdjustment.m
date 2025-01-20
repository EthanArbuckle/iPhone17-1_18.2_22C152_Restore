@interface IPAPhotoAdjustment
- (BOOL)enabled;
- (NSDictionary)autoSettings;
- (NSString)maskUUID;
- (id)_debugDescriptionSuffix;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAutoSettings:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMaskUUID:(id)a3;
@end

@implementation IPAPhotoAdjustment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoSettings, 0);
  objc_storeStrong((id *)&self->_maskUUID, 0);
}

- (void)setAutoSettings:(id)a3
{
}

- (NSDictionary)autoSettings
{
  return self->_autoSettings;
}

- (NSString)maskUUID
{
  return self->_maskUUID;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (id)_debugDescriptionSuffix
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"enabled=%d", self->_enabled);
  v4 = v3;
  if (self->_maskUUID) {
    [v3 appendFormat:@" maskUUID=%@", self->_maskUUID];
  }
  if (self->_autoSettings) {
    [v4 appendFormat:@" autoSettings=<%@:%p count:%lu>", objc_opt_class(), self->_autoSettings, -[NSDictionary count](self->_autoSettings, "count")];
  }
  return v4;
}

- (void)setMaskUUID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  id v12 = v4;
  if (v4 && (uint64_t v6 = [v4 length], v5 = v12, !v6))
  {
    v9 = (IPAPhotoAdjustment *)_PFAssertFailHandler();
    [(IPAPhotoAdjustment *)v9 copyWithZone:v11];
  }
  else
  {
    v7 = (NSString *)[v5 copy];
    maskUUID = self->_maskUUID;
    self->_maskUUID = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IPAPhotoAdjustment;
  id v4 = [(IPAAdjustment *)&v6 copyWithZone:a3];
  *((unsigned char *)v4 + 32) = self->_enabled;
  objc_storeStrong((id *)v4 + 5, self->_maskUUID);
  objc_storeStrong((id *)v4 + 6, self->_autoSettings);
  return v4;
}

@end