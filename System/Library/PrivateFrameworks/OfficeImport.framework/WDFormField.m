@interface WDFormField
- (BOOL)linkAbsolute;
- (BOOL)linkSpecifyingNamedLocation;
- (WDFormField)initWithParagraph:(id)a3;
- (id)URI;
- (id)description;
- (id)dosName;
- (id)macName;
- (id)namedLocation;
- (int)runType;
- (unsigned)position;
- (void)setDosName:(id)a3;
- (void)setLinkAbsolute:(BOOL)a3;
- (void)setLinkSpecifyingNamedLocation:(BOOL)a3;
- (void)setMacName:(id)a3;
- (void)setNamedLocation:(id)a3;
- (void)setPosition:(unsigned int)a3;
- (void)setURI:(id)a3;
@end

@implementation WDFormField

- (WDFormField)initWithParagraph:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDFormField;
  return [(WDRun *)&v4 initWithParagraph:a3];
}

- (unsigned)position
{
  return self->mPosition;
}

- (void)setPosition:(unsigned int)a3
{
  self->mPosition = a3;
}

- (BOOL)linkAbsolute
{
  return self->mLinkAbsolute;
}

- (void)setLinkAbsolute:(BOOL)a3
{
  self->mLinkAbsolute = a3;
}

- (BOOL)linkSpecifyingNamedLocation
{
  return self->mLinkSpecifyingNamedLocation;
}

- (void)setLinkSpecifyingNamedLocation:(BOOL)a3
{
  self->mLinkSpecifyingNamedLocation = a3;
}

- (id)namedLocation
{
  return self->mNamedLocation;
}

- (void)setNamedLocation:(id)a3
{
}

- (id)URI
{
  return self->mURI;
}

- (void)setURI:(id)a3
{
}

- (id)macName
{
  return self->mMacName;
}

- (void)setMacName:(id)a3
{
}

- (id)dosName
{
  return self->mDosName;
}

- (void)setDosName:(id)a3
{
}

- (int)runType
{
  return 16;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDFormField;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDosName, 0);
  objc_storeStrong((id *)&self->mMacName, 0);
  objc_storeStrong((id *)&self->mURI, 0);
  objc_storeStrong((id *)&self->mNamedLocation, 0);
}

@end