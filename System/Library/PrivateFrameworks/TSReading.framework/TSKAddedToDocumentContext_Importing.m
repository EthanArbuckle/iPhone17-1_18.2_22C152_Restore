@interface TSKAddedToDocumentContext_Importing
- (TSKAddedToDocumentContext_Importing)initWithImporterID:(id)a3;
- (id)description;
- (id)importerID;
- (void)dealloc;
@end

@implementation TSKAddedToDocumentContext_Importing

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKAddedToDocumentContext_Importing;
  [(TSKAddedToDocumentContext_Importing *)&v3 dealloc];
}

- (TSKAddedToDocumentContext_Importing)initWithImporterID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSKAddedToDocumentContext_Importing;
  v4 = [(TSKAddedToDocumentContext_Importing *)&v6 init];
  if (v4) {
    v4->mImporterID = (NSString *)a3;
  }
  return v4;
}

- (id)description
{
  return @"Imported";
}

- (id)importerID
{
  return self->mImporterID;
}

@end