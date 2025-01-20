@interface PFXString
- (BOOL)isEqual:(id)a3;
- (NSString)nsString;
- (PFXString)initWithXmlString:(const char *)a3;
- (const)cString;
- (const)xmlString;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation PFXString

- (PFXString)initWithXmlString:(const char *)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PFXString;
    v4 = [(PFXString *)&v6 init];
    if (v4) {
      v4->mXmlString = (char *)xmlStrdup((const xmlChar *)a3);
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  free(self->mXmlString);
  self->mXmlString = 0;

  self->mNSString = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFXString;
  [(PFXString *)&v3 dealloc];
}

- (NSString)nsString
{
  result = self->mNSString;
  if (!result)
  {
    result = (NSString *)[objc_alloc((Class)NSString) initWithUTF8String:self->mXmlString];
    self->mNSString = result;
  }
  return result;
}

- (const)xmlString
{
  return self->mXmlString;
}

- (const)cString
{
  return self->mXmlString;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  return v5 == objc_opt_class() && xmlStrEqual((const xmlChar *)self->mXmlString, *((const xmlChar **)a3 + 1)) != 0;
}

- (unint64_t)hash
{
  return [self->mNSString hash];
}

@end