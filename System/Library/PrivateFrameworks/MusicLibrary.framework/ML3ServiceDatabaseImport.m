@interface ML3ServiceDatabaseImport
- (ML3Client)client;
- (ML3MediaLibraryWriter)writer;
- (ML3MusicLibrary)library;
- (ML3ServiceDatabaseImport)initWithDatabaseImport:(id)a3 library:(id)a4 writer:(id)a5 client:(id)a6;
@end

@implementation ML3ServiceDatabaseImport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_writer, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (ML3Client)client
{
  return self->_client;
}

- (ML3MediaLibraryWriter)writer
{
  return self->_writer;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (ML3ServiceDatabaseImport)initWithDatabaseImport:(id)a3 library:(id)a4 writer:(id)a5 client:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"ML3ServiceDatabaseImport.m", 21, @"Invalid parameter not satisfying: %@", @"writer" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"ML3ServiceDatabaseImport.m", 20, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"ML3ServiceDatabaseImport.m", 22, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

LABEL_4:
  v15 = (ML3ServiceDatabaseImport *)[v11 _copyWithZone:0 usingConcreteClass:objc_opt_class()];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_library, a4);
    objc_storeStrong((id *)&v15->_writer, a5);
    objc_storeStrong((id *)&v15->_client, a6);
  }

  return v15;
}

@end