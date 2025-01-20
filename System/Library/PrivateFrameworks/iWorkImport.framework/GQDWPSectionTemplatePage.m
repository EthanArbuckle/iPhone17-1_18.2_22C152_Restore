@interface GQDWPSectionTemplatePage
+ (const)stateForReading;
- (__CFString)footerIdentifier;
- (__CFString)headerIdentifier;
- (void)dealloc;
@end

@implementation GQDWPSectionTemplatePage

- (void)dealloc
{
  mHeaderIdentifier = self->mHeaderIdentifier;
  if (mHeaderIdentifier) {
    CFRelease(mHeaderIdentifier);
  }
  mFooterIdentifier = self->mFooterIdentifier;
  if (mFooterIdentifier) {
    CFRelease(mFooterIdentifier);
  }
  v5.receiver = self;
  v5.super_class = (Class)GQDWPSectionTemplatePage;
  [(GQDWPSectionTemplatePage *)&v5 dealloc];
}

- (__CFString)headerIdentifier
{
  return self->mHeaderIdentifier;
}

- (__CFString)footerIdentifier
{
  return self->mFooterIdentifier;
}

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A3708;
}

@end