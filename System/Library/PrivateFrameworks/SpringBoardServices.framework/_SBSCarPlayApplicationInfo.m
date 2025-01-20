@interface _SBSCarPlayApplicationInfo
- (NSData)iconImageData;
- (NSString)localizedDisplayName;
- (double)iconImageScale;
- (void)setIconImageData:(id)a3;
- (void)setIconImageScale:(double)a3;
- (void)setLocalizedDisplayName:(id)a3;
@end

@implementation _SBSCarPlayApplicationInfo

- (NSData)iconImageData
{
  return self->_iconImageData;
}

- (void)setIconImageData:(id)a3
{
}

- (double)iconImageScale
{
  return self->_iconImageScale;
}

- (void)setIconImageScale:(double)a3
{
  self->_iconImageScale = a3;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_iconImageData, 0);
}

@end