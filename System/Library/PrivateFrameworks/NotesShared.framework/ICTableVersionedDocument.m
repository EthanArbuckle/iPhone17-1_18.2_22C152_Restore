@interface ICTableVersionedDocument
+ (unsigned)minimumSupportedVersion;
+ (unsigned)serializationVersion;
- (ICCRDocument)innerTableDocument;
- (ICTable)table;
- (ICTableVersionedDocument)initWithColumnCount:(unint64_t)a3 rowCount:(unint64_t)a4 replicaID:(id)a5;
- (id)serializeCurrentVersion:(unsigned int *)a3;
- (unint64_t)mergeWithTableVersionedDocument:(id)a3;
- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4;
- (void)setTable:(id)a3;
@end

@implementation ICTableVersionedDocument

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

- (ICTableVersionedDocument)initWithColumnCount:(unint64_t)a3 rowCount:(unint64_t)a4 replicaID:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)ICTableVersionedDocument;
  v7 = [(ICTTVersionedDocument *)&v15 initWithData:0 replicaID:a5];
  if (v7)
  {
    if (a3)
    {
      uint64_t v8 = 0;
      do
      {
        v9 = [(ICTableVersionedDocument *)v7 table];
        id v10 = (id)[v9 insertColumnAtIndex:v8];

        ++v8;
      }
      while (a3 != v8);
    }
    if (a4)
    {
      uint64_t v11 = 0;
      do
      {
        v12 = [(ICTableVersionedDocument *)v7 table];
        id v13 = (id)[v12 insertRowAtIndex:v11];

        ++v11;
      }
      while (a4 != v11);
    }
  }
  return v7;
}

- (unint64_t)mergeWithTableVersionedDocument:(id)a3
{
  id v4 = a3;
  v5 = [(ICTableVersionedDocument *)self innerTableDocument];
  v6 = [v4 innerTableDocument];

  uint64_t v7 = [v5 mergeWithDocument:v6];
  unint64_t v8 = 1;
  if (v7 != 1) {
    unint64_t v8 = 2;
  }
  if (v7) {
    return v8;
  }
  else {
    return 0;
  }
}

- (ICCRDocument)innerTableDocument
{
  v2 = [(ICTableVersionedDocument *)self table];
  v3 = [v2 document];

  return (ICCRDocument *)v3;
}

- (ICTable)table
{
  table = self->_table;
  if (!table)
  {
    id v4 = [ICCRTTCompatibleDocument alloc];
    v5 = [(ICTTVersionedDocument *)self replicaID];
    v6 = [(ICCRDocument *)v4 initWithReplica:v5];
    innerTableDocument = self->_innerTableDocument;
    self->_innerTableDocument = v6;

    unint64_t v8 = [(CRTable *)[ICTable alloc] initWithDocument:self->_innerTableDocument];
    v9 = self->_table;
    self->_table = v8;

    [(ICCRDocument *)self->_innerTableDocument setRootObject:self->_table];
    table = self->_table;
  }
  return table;
}

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  id v5 = a4;
  v6 = [(ICTTVersionedDocument *)self replicaID];
  id obj = +[ICCRCoderUnarchiver decodedDocumentFromData:v5 replica:v6];

  uint64_t v7 = obj;
  if (obj)
  {
    innerTableDocument = self->_innerTableDocument;
    if (innerTableDocument)
    {
      [(ICCRDocument *)innerTableDocument mergeWithDocument:obj];
    }
    else
    {
      objc_storeStrong((id *)&self->_innerTableDocument, obj);
      v9 = [(ICCRDocument *)self->_innerTableDocument rootObject];
      table = self->_table;
      self->_table = v9;
    }
    uint64_t v7 = obj;
  }
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  if (a3) {
    *a3 = [(id)objc_opt_class() serializationVersion];
  }
  innerTableDocument = self->_innerTableDocument;
  return [(ICCRDocument *)innerTableDocument archivedData];
}

- (void)setTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_innerTableDocument, 0);
}

@end