@interface GQDTBooleanCell
- (BOOL)BOOLValue;
- (__CFString)createStringValue;
- (void)setProcessorBundle:(__CFBundle *)a3;
@end

@implementation GQDTBooleanCell

- (BOOL)BOOLValue
{
  return self->super.mValue > 0.0;
}

- (__CFString)createStringValue
{
  unsigned int v3 = [(GQDTBooleanCell *)self BOOLValue];
  mProcessorBundle = self->mProcessorBundle;
  if (v3) {
    CFStringRef v5 = @"TRUE";
  }
  else {
    CFStringRef v5 = @"FALSE";
  }
  return (__CFString *)CFBundleCopyLocalizedString(mProcessorBundle, v5, v5, 0);
}

- (void)setProcessorBundle:(__CFBundle *)a3
{
  self->mProcessorBundle = a3;
}

@end