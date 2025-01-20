@interface TCBundleResourcePackageEntry
- (TCBundleResourcePackageEntry)initWithZipEntry:(id)a3;
- (_xmlDoc)xmlDocument;
- (id)data;
- (void)dealloc;
@end

@implementation TCBundleResourcePackageEntry

- (TCBundleResourcePackageEntry)initWithZipEntry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCBundleResourcePackageEntry;
  v6 = [(TCBundleResourcePackageEntry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mZipEntry, a3);
  }

  return v7;
}

- (void)dealloc
{
  mXmlDocument = self->mXmlDocument;
  if (mXmlDocument) {
    xmlFreeDoc(mXmlDocument);
  }
  v4.receiver = self;
  v4.super_class = (Class)TCBundleResourcePackageEntry;
  [(TCBundleResourcePackageEntry *)&v4 dealloc];
}

- (id)data
{
  v2 = [(OISFUZipEntry *)self->mZipEntry data];
  return v2;
}

- (_xmlDoc)xmlDocument
{
  if (!self->mXmlDocument) {
    self->mXmlDocument = [(OISFUDataRepresentation *)self->mZipEntry xmlDocument];
  }
  return self->mXmlDocument;
}

- (void).cxx_destruct
{
}

@end