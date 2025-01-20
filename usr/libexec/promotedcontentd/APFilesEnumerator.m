@interface APFilesEnumerator
- (APFilesEnumerator)initWithObjectsIterator:(id)a3 fileManager:(id)a4 extension:(id)a5;
- (APStorageManager)fileManager;
- (NSString)extension;
- (id)nextObject;
- (id)objectsIterator;
@end

@implementation APFilesEnumerator

- (APFilesEnumerator)initWithObjectsIterator:(id)a3 fileManager:(id)a4 extension:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(APFilesEnumerator *)self init];
  if (v11)
  {
    v12 = (NSString *)[v10 copy];
    extension = v11->_extension;
    v11->_extension = v12;

    id v14 = [v8 copy];
    id objectsIterator = v11->_objectsIterator;
    v11->_id objectsIterator = v14;

    objc_storeStrong((id *)&v11->_fileManager, a4);
  }

  return v11;
}

- (id)nextObject
{
  v3 = [(APFilesEnumerator *)self objectsIterator];
  v4 = v3[2]();

  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_9;
  }
  while (1)
  {
    uint64_t v5 = [(APFilesEnumerator *)self extension];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 pathExtension];
      id v8 = [(APFilesEnumerator *)self extension];
      unsigned __int8 v9 = [v7 isEqualToString:v8];

      if ((v9 & 1) == 0) {
        goto LABEL_6;
      }
    }
    id v10 = sub_100175A00((uint64_t)APFileNameConverter, v4, 0);
    if ([v10 length]) {
      break;
    }

LABEL_6:
    v11 = [(APFilesEnumerator *)self objectsIterator];
    uint64_t v12 = v11[2]();

    v4 = (void *)v12;
    if (!v12) {
      goto LABEL_7;
    }
  }
  id v14 = [APFileSystemItemInfo alloc];
  v15 = [(APFilesEnumerator *)self fileManager];
  v13 = sub_100175CDC((id *)&v14->super.isa, v10, v4, v15);

LABEL_9:

  return v13;
}

- (id)objectsIterator
{
  return self->_objectsIterator;
}

- (NSString)extension
{
  return self->_extension;
}

- (APStorageManager)fileManager
{
  return self->_fileManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong(&self->_objectsIterator, 0);
}

@end