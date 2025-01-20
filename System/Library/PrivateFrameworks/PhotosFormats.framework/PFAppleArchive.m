@interface PFAppleArchive
- (BOOL)close:(id *)a3;
- (BOOL)decodeContentOfDirectoryWithError:(id *)a3;
- (BOOL)decodeData:(id *)a3 filename:(id *)a4 error:(id *)a5;
- (BOOL)encodeContentOfDirectoryAtURL:(id)a3 entryPredicate:(id)a4 error:(id *)a5;
- (BOOL)encodeData:(id)a3 filename:(id)a4 error:(id *)a5;
- (BOOL)openForReading:(id *)a3;
- (BOOL)openForWriting:(id *)a3;
- (void)dealloc;
@end

@implementation PFAppleArchive

- (void)dealloc
{
  archiveStream = self->_archiveStream;
  if (archiveStream)
  {
    AAArchiveStreamCancel(archiveStream);
    AAArchiveStreamClose(self->_archiveStream);
  }
  v4.receiver = self;
  v4.super_class = (Class)PFAppleArchive;
  [(PFAppleArchiveStream *)&v4 dealloc];
}

- (BOOL)close:(id *)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  archiveStream = self->_archiveStream;
  if (!archiveStream) {
    _PFAssertFailHandler();
  }
  int v6 = AAArchiveStreamClose(archiveStream);
  if (v6)
  {
    if (a3)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = v6;
      uint64_t v13 = *MEMORY[0x1E4F28228];
      v9 = [NSString stringWithFormat:@"%@", @"Failed to close archive stream"];
      v14[0] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a3 = [v7 errorWithDomain:@"com.apple.PhotosFormats" code:v8 userInfo:v10];
    }
    return 0;
  }
  else
  {
    self->_archiveStream = 0;
    v12.receiver = self;
    v12.super_class = (Class)PFAppleArchive;
    return [(PFAppleArchiveStream *)&v12 close:a3];
  }
}

- (BOOL)decodeData:(id *)a3 filename:(id *)a4 error:(id *)a5
{
  v89[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
LABEL_59:
  }
    _PFAssertFailHandler();
  archiveStream = self->_archiveStream;
  if (!archiveStream || !self->super._inputStream)
  {
    _PFAssertFailHandler();
    goto LABEL_59;
  }
  AAHeader header = 0;
  int v10 = AAArchiveStreamReadHeader(archiveStream, &header);
  if (v10 < 0)
  {
    if (!a5) {
      goto LABEL_51;
    }
    v51 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = v10;
    uint64_t v88 = *MEMORY[0x1E4F28228];
    v53 = [NSString stringWithFormat:@"%@", @"Failed to read header"];
    v89[0] = v53;
    v54 = (void *)MEMORY[0x1E4F1C9E8];
    v55 = (void **)v89;
    v56 = &v88;
LABEL_39:
    v62 = [v54 dictionaryWithObjects:v55 forKeys:v56 count:1];
    *a5 = [v51 errorWithDomain:@"com.apple.PhotosFormats" code:v52 userInfo:v62];

LABEL_43:
    id v42 = 0;
    goto LABEL_44;
  }
  if (!v10)
  {
    if (!a5) {
      goto LABEL_51;
    }
    v57 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v86 = *MEMORY[0x1E4F28228];
    v58 = [NSString stringWithFormat:@"%@", @"Reached end of archive"];
    v87 = v58;
    v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    v60 = v57;
    uint64_t v61 = 9;
LABEL_42:
    *a5 = [v60 errorWithDomain:@"com.apple.PhotosFormats" code:v61 userInfo:v59];

    goto LABEL_43;
  }
  uint64_t value = 0;
  v11 = header;
  v12.ikey = 5265748;
  uint32_t KeyIndex = AAHeaderGetKeyIndex(header, v12);
  if ((KeyIndex & 0x80000000) != 0)
  {
    int v15 = 0;
LABEL_37:
    if (!a5) {
      goto LABEL_51;
    }
    v51 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = v15;
    uint64_t v84 = *MEMORY[0x1E4F28228];
    v53 = [NSString stringWithFormat:@"%@", @"Missing 'TYP' header field"];
    v85 = v53;
    v54 = (void *)MEMORY[0x1E4F1C9E8];
    v55 = &v85;
    v56 = &v84;
    goto LABEL_39;
  }
  unsigned int FieldUInt = AAHeaderGetFieldUInt(v11, KeyIndex, &value);
  if (FieldUInt <= 1) {
    int v15 = 1;
  }
  else {
    int v15 = FieldUInt;
  }
  if (FieldUInt >= 2) {
    goto LABEL_37;
  }
  if (value != 70)
  {
    if (!a5) {
      goto LABEL_51;
    }
    v63 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v82 = *MEMORY[0x1E4F28228];
    v58 = [NSString stringWithFormat:@"%@", @"Expected 'REG' entry type"];
    v83 = v58;
    v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    v60 = v63;
    uint64_t v61 = 1;
    goto LABEL_42;
  }
  if (!a4) {
    goto LABEL_24;
  }
  size_t length = 0;
  v16 = header;
  v17.ikey = 5521744;
  uint32_t v18 = AAHeaderGetKeyIndex(header, v17);
  if ((v18 & 0x80000000) != 0)
  {
    int v20 = 0;
LABEL_46:
    if (!a5) {
      goto LABEL_43;
    }
    v51 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = v20;
    uint64_t v80 = *MEMORY[0x1E4F28228];
    v53 = [NSString stringWithFormat:@"%@", @"Missing 'PAT' header field"];
    v81 = v53;
    v54 = (void *)MEMORY[0x1E4F1C9E8];
    v55 = &v81;
    v56 = &v80;
    goto LABEL_39;
  }
  unsigned int FieldString = AAHeaderGetFieldString(v16, v18, 0, 0, &length);
  if (FieldString <= 1) {
    int v20 = 1;
  }
  else {
    int v20 = FieldString;
  }
  if (FieldString >= 2) {
    goto LABEL_46;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F1CA58]);
  v22 = (void *)[v21 initWithLength:length + 1];
  v23 = header;
  size_t v24 = length;
  id v25 = v22;
  v26 = (char *)[v25 mutableBytes];
  v27.ikey = 5521744;
  uint32_t v28 = AAHeaderGetKeyIndex(v23, v27);
  if ((v28 & 0x80000000) != 0)
  {
    int v30 = 0;
LABEL_54:
    if (a5)
    {
      v65 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v66 = v30;
      uint64_t v78 = *MEMORY[0x1E4F28228];
      v67 = [NSString stringWithFormat:@"%@", @"Failed to read 'PAT' string"];
      v79 = v67;
      v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      *a5 = [v65 errorWithDomain:@"com.apple.PhotosFormats" code:v66 userInfo:v68];
    }
    goto LABEL_43;
  }
  unsigned int v29 = AAHeaderGetFieldString(v23, v28, v24 + 1, v26, 0);
  if (v29 <= 1) {
    int v30 = 1;
  }
  else {
    int v30 = v29;
  }
  if (v29 >= 2) {
    goto LABEL_54;
  }
  id v31 = [NSString alloc];
  id v32 = v25;
  uint64_t v33 = [v32 bytes];
  *a4 = (id)[v31 initWithBytes:v33 length:length encoding:4];

LABEL_24:
  uint64_t offset = 0;
  uint64_t size = 0;
  v34 = header;
  v35.ikey = 5521732;
  uint32_t v36 = AAHeaderGetKeyIndex(header, v35);
  if ((v36 & 0x80000000) != 0)
  {
    int v38 = 0;
    goto LABEL_49;
  }
  unsigned int FieldBlob = AAHeaderGetFieldBlob(v34, v36, &size, &offset);
  if (FieldBlob <= 1) {
    int v38 = 1;
  }
  else {
    int v38 = FieldBlob;
  }
  if (FieldBlob >= 2)
  {
LABEL_49:
    if (a5)
    {
      v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = v38;
      uint64_t v76 = *MEMORY[0x1E4F28228];
      v53 = [NSString stringWithFormat:@"%@", @"Missing 'DAT' header field", offset];
      v77 = v53;
      v54 = (void *)MEMORY[0x1E4F1C9E8];
      v55 = &v77;
      v56 = &v76;
      goto LABEL_39;
    }
LABEL_51:
    id v42 = 0;
    goto LABEL_52;
  }
  id v39 = objc_alloc(MEMORY[0x1E4F1CA58]);
  v40 = (void *)[v39 initWithLength:size];
  v41 = self->_archiveStream;
  id v42 = v40;
  v43 = (void *)[v42 mutableBytes];
  size_t v44 = [v42 length];
  v45.ikey = 5521732;
  int Blob = AAArchiveStreamReadBlob(v41, v45, v43, v44);
  if (!Blob)
  {
    id v42 = v42;
    *a3 = v42;
    LOBYTE(a5) = 1;
    goto LABEL_52;
  }
  if (a5)
  {
    v47 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v48 = Blob;
    uint64_t v74 = *MEMORY[0x1E4F28228];
    v49 = [NSString stringWithFormat:@"%@", @"Failed to read 'DAT' blob", offset];
    v75 = v49;
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    *a5 = [v47 errorWithDomain:@"com.apple.PhotosFormats" code:v48 userInfo:v50];

LABEL_44:
    LOBYTE(a5) = 0;
  }
LABEL_52:
  AAHeaderDestroy(header);

  return (char)a5;
}

- (BOOL)decodeContentOfDirectoryWithError:(id *)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v5 = [(PFAppleArchiveStream *)self archiveURL];
  int v6 = [v5 URLByDeletingLastPathComponent];

  id v7 = v6;
  uint64_t v8 = AAExtractArchiveOutputStreamOpen((const char *)[v7 fileSystemRepresentation], 0, 0, 0, 0);
  ssize_t v9 = AAArchiveStreamProcess(self->_archiveStream, v8, 0, 0, 0, 0);
  ssize_t v10 = v9;
  if (a3 && v9 < 0)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28228];
    AAFieldKey v12 = NSString;
    uint64_t v13 = *__error();
    v14 = __error();
    int v15 = objc_msgSend(v12, "stringWithFormat:", @"Failed to decode directory content archive. Error [%d]: %s", v13, strerror(*v14));
    v27[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    *a3 = [v11 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v16];
  }
  if (v8 && AAArchiveStreamClose(v8))
  {
    if (a3)
    {
      AAFieldKey v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28228];
      uint32_t v18 = NSString;
      uint64_t v19 = *__error();
      int v20 = __error();
      id v21 = objc_msgSend(v18, "stringWithFormat:", @"Failed to close directory content outStream. Error [%d]: %s", v19, strerror(*v20));
      id v25 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      *a3 = [v17 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v22];

      LOBYTE(a3) = 0;
    }
  }
  else
  {
    LOBYTE(a3) = v10 >= 0;
  }

  return (char)a3;
}

- (BOOL)encodeContentOfDirectoryAtURL:(id)a3 entryPredicate:(id)a4 error:(id *)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!self->_archiveStream || !self->super._outputStream) {
    _PFAssertFailHandler();
  }
  ssize_t v10 = v9;
  int v38 = self;
  id v39 = (id)MEMORY[0x1A6259AE0](v10);
  id v40 = v8;
  id v11 = v40;
  AAFieldKey v12 = (const char *)[v11 fileSystemRepresentation];
  if (v10) {
    uint64_t v13 = PFAppleArchiveEntryMessageProc;
  }
  else {
    uint64_t v13 = 0;
  }
  if (v10) {
    v14 = &v38;
  }
  else {
    v14 = 0;
  }
  int v15 = AAPathListCreateWithDirectoryContents(v12, 0, v14, (AAEntryMessageProc)v13, 0, 0);
  if (v15)
  {
    v16 = AAFieldKeySetCreateWithString("TYP,PAT,LNK,DEV,DAT,MOD,FLG,MTM,BTM,CTM,ACL");
    if (v16)
    {
      int v17 = AAArchiveStreamWritePathList(self->_archiveStream, v15, v16, (const char *)[v11 fileSystemRepresentation], 0, 0, 0, 0);
      BOOL v18 = v17 == 0;
      if (a5 && v17)
      {
        uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v45 = *MEMORY[0x1E4F28228];
        int v20 = NSString;
        uint64_t v21 = *__error();
        v22 = __error();
        v23 = objc_msgSend(v20, "stringWithFormat:", @"Failed to create the archive for the directory contents. Error [%d]: %s", v21, strerror(*v22));
        v46[0] = v23;
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
        *a5 = [v19 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v24];
      }
      AAFieldKeySetDestroy(v16);
    }
    else
    {
      if (a5)
      {
        id v31 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v43 = *MEMORY[0x1E4F28228];
        id v32 = NSString;
        uint64_t v33 = *__error();
        v34 = __error();
        AAFieldKey v35 = objc_msgSend(v32, "stringWithFormat:", @"Failed to create the field key set for directory contents. Error [%d]: %s", v33, strerror(*v34));
        size_t v44 = v35;
        uint32_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        *a5 = [v31 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v36];
      }
      BOOL v18 = 0;
    }
    AAPathListDestroy(v15);
  }
  else
  {
    if (a5)
    {
      id v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28228];
      uint64_t v26 = NSString;
      uint64_t v27 = *__error();
      uint32_t v28 = __error();
      unsigned int v29 = objc_msgSend(v26, "stringWithFormat:", @"Failed to create the path list for directory contents. Error [%d]: %s", v27, strerror(*v28));
      id v42 = v29;
      int v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      *a5 = [v25 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v30];
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)encodeData:(id)a3 filename:(id)a4 error:(id *)a5
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_28;
  }
  ssize_t v10 = v9;
  if (!v9) {
    goto LABEL_29;
  }
  if (!self->_archiveStream || !self->super._outputStream)
  {
    _PFAssertFailHandler();
LABEL_28:
    _PFAssertFailHandler();
LABEL_29:
    _PFAssertFailHandler();
  }
  id v11 = AAHeaderCreate();
  AAFieldKey v12 = v11;
  if (!v11)
  {
    if (!a5) {
      goto LABEL_26;
    }
    unsigned int v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28228];
    int v30 = [NSString stringWithFormat:@"%@", @"Failed to create header"];
    v51[0] = v30;
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    id v32 = v29;
    uint64_t v33 = 8;
LABEL_25:
    *a5 = [v32 errorWithDomain:@"com.apple.PhotosFormats" code:v33 userInfo:v31];

    LOBYTE(a5) = 0;
    goto LABEL_26;
  }
  v13.ikey = 5265748;
  int v14 = AAHeaderSetFieldUInt(v11, 0xFFFFFFFF, v13, 0x46uLL);
  if (v14 < 0)
  {
    if (!a5) {
      goto LABEL_26;
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = v14;
    uint64_t v48 = *MEMORY[0x1E4F28228];
    int v30 = [NSString stringWithFormat:@"%@", @"Failed to set 'TYP' header field"];
    v49 = v30;
    uint32_t v36 = (void *)MEMORY[0x1E4F1C9E8];
    v37 = &v49;
    int v38 = &v48;
    goto LABEL_24;
  }
  int v15 = (const char *)[v10 fileSystemRepresentation];
  size_t v16 = strlen(v15);
  v17.ikey = 5521744;
  int v18 = AAHeaderSetFieldString(v12, 0xFFFFFFFF, v17, v15, v16);
  if (v18 < 0)
  {
    if (!a5) {
      goto LABEL_26;
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = v18;
    uint64_t v46 = *MEMORY[0x1E4F28228];
    int v30 = [NSString stringWithFormat:@"%@", @"Failed to set 'PAT' header field"];
    v47 = v30;
    uint32_t v36 = (void *)MEMORY[0x1E4F1C9E8];
    v37 = &v47;
    int v38 = &v46;
    goto LABEL_24;
  }
  uint64_t v19 = [v8 length];
  v20.ikey = 5521732;
  int v21 = AAHeaderSetFieldBlob(v12, 0xFFFFFFFF, v20, v19);
  if (v21 < 0)
  {
    if (!a5) {
      goto LABEL_26;
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = v21;
    uint64_t v44 = *MEMORY[0x1E4F28228];
    int v30 = [NSString stringWithFormat:@"%@", @"Failed to set 'DAT' header field"];
    uint64_t v45 = v30;
    uint32_t v36 = (void *)MEMORY[0x1E4F1C9E8];
    v37 = &v45;
    int v38 = &v44;
    goto LABEL_24;
  }
  int v22 = AAArchiveStreamWriteHeader(self->_archiveStream, v12);
  if (v22 < 0)
  {
    if (!a5) {
      goto LABEL_26;
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = v22;
    uint64_t v42 = *MEMORY[0x1E4F28228];
    int v30 = [NSString stringWithFormat:@"%@", @"Failed to write header"];
    uint64_t v43 = v30;
    uint32_t v36 = (void *)MEMORY[0x1E4F1C9E8];
    v37 = &v43;
    int v38 = &v42;
    goto LABEL_24;
  }
  archiveStream = self->_archiveStream;
  id v24 = v8;
  id v25 = (const void *)[v24 bytes];
  size_t v26 = [v24 length];
  v27.ikey = 5521732;
  int v28 = AAArchiveStreamWriteBlob(archiveStream, v27, v25, v26);
  if (v28 < 0)
  {
    if (!a5) {
      goto LABEL_26;
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = v28;
    int v30 = [NSString stringWithFormat:@"%@", @"Failed to write 'DAT' blob", *MEMORY[0x1E4F28228]];
    uint64_t v41 = v30;
    uint32_t v36 = (void *)MEMORY[0x1E4F1C9E8];
    v37 = &v41;
    int v38 = &v40;
LABEL_24:
    id v31 = [v36 dictionaryWithObjects:v37 forKeys:v38 count:1];
    id v32 = v34;
    uint64_t v33 = v35;
    goto LABEL_25;
  }
  LOBYTE(a5) = 1;
LABEL_26:
  AAHeaderDestroy(v12);

  return (char)a5;
}

- (BOOL)openForReading:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (self->_archiveStream) {
    _PFAssertFailHandler();
  }
  v11.receiver = self;
  v11.super_class = (Class)PFAppleArchive;
  BOOL v5 = -[PFAppleArchiveStream openForReading:](&v11, sel_openForReading_);
  if (v5)
  {
    int v6 = AADecodeArchiveInputStreamOpen([(PFAppleArchiveStream *)self _byteStreamToBeReadByArchiveDecodingStream], 0, 0, 0, 0);
    self->_archiveStream = v6;
    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (a3)
      {
        id v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F28228];
        id v8 = [NSString stringWithFormat:@"%@", @"Failed to open archive stream"];
        v13[0] = v8;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
        *a3 = [v7 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v9];
      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)openForWriting:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (self->_archiveStream) {
    _PFAssertFailHandler();
  }
  v11.receiver = self;
  v11.super_class = (Class)PFAppleArchive;
  BOOL v5 = -[PFAppleArchiveStream openForWriting:](&v11, sel_openForWriting_);
  if (v5)
  {
    int v6 = AAEncodeArchiveOutputStreamOpen([(PFAppleArchiveStream *)self _byteStreamToBeTargetedByArchiveEncodingStream], 0, 0, 0, 0);
    self->_archiveStream = v6;
    LOBYTE(v5) = v6 != 0;
    if (a3)
    {
      if (!v6)
      {
        id v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F28228];
        id v8 = [NSString stringWithFormat:@"%@", @"Failed to open archive stream"];
        v13[0] = v8;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
        *a3 = [v7 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v9];

        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

@end