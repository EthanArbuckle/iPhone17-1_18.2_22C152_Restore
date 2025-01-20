@interface ICTTOrderedSetVersionedDocument
+ (unsigned)minimumSupportedVersion;
+ (unsigned)serializationVersion;
- (ICCRDocument)document;
- (ICCROrderedSet)orderedSet;
- (id)serializeCurrentVersion:(unsigned int *)a3;
- (unint64_t)mergeWithOrderedSetVersionedDocument:(id)a3;
- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4;
- (void)setOrderedSet:(id)a3;
@end

@implementation ICTTOrderedSetVersionedDocument

- (ICCROrderedSet)orderedSet
{
  orderedSet = self->_orderedSet;
  if (!orderedSet)
  {
    v4 = [ICCRDocument alloc];
    v5 = [(ICTTVersionedDocument *)self replicaID];
    v6 = [(ICCRDocument *)v4 initWithReplica:v5];
    document = self->_document;
    self->_document = v6;

    v8 = objc_alloc_init(ICCROrderedSet);
    v9 = self->_orderedSet;
    self->_orderedSet = v8;

    [(ICCRDocument *)self->_document setRootObject:self->_orderedSet];
    orderedSet = self->_orderedSet;
  }
  return orderedSet;
}

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

- (unint64_t)mergeWithOrderedSetVersionedDocument:(id)a3
{
  id v4 = a3;
  v5 = [(ICTTOrderedSetVersionedDocument *)self orderedSet];
  v6 = [v5 allObjects];

  v7 = [(ICTTOrderedSetVersionedDocument *)self document];
  v8 = [v4 document];
  [v7 mergeWithDocument:v8];

  v9 = [(ICTTOrderedSetVersionedDocument *)self orderedSet];
  v10 = [v9 allObjects];

  v13.receiver = self;
  v13.super_class = (Class)ICTTOrderedSetVersionedDocument;
  [(ICTTVersionedDocument *)&v13 mergeWithVersionedDocument:v4];

  if ([v10 isEqualToArray:v6]) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = 2;
  }

  return v11;
}

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  id v5 = a4;
  v6 = [(ICTTVersionedDocument *)self replicaID];
  id obj = +[ICCRCoderUnarchiver decodedDocumentFromData:v5 replica:v6];

  v7 = obj;
  if (obj)
  {
    if (self->_document)
    {
      [(ICCRDocument *)self->_document mergeWithDocument:obj];
    }
    else
    {
      objc_storeStrong((id *)&self->_document, obj);
      v8 = [obj rootObject];
      orderedSet = self->_orderedSet;
      self->_orderedSet = v8;
    }
    v7 = obj;
  }
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  if (a3) {
    *a3 = [(id)objc_opt_class() serializationVersion];
  }
  document = self->_document;
  return [(ICCRDocument *)document archivedData];
}

- (void)setOrderedSet:(id)a3
{
}

- (ICCRDocument)document
{
  return (ICCRDocument *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_orderedSet, 0);
}

@end