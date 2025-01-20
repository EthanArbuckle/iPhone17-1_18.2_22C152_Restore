@interface CRLContainedZipArchive
+ (id)zipArchiveFromEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)isValid;
- (CRLContainedZipArchive)initWithEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5;
- (id)newArchiveReadChannel;
- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (unint64_t)archiveLength;
@end

@implementation CRLContainedZipArchive

+ (id)zipArchiveFromEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_100431898;
  v34 = sub_1004318A8;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100431898;
  v28 = sub_1004318A8;
  id v29 = 0;
  id v12 = [objc_alloc((Class)a1) initWithEntry:v10 zipArchive:v11 options:a5];
  if (v12)
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v14 = dispatch_get_global_queue(0, 0);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1004318B0;
    v20[3] = &unk_1014F9598;
    v22 = &v30;
    v23 = &v24;
    v15 = v13;
    v21 = v15;
    [v12 readArchiveWithQueue:v14 completion:v20];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a6 && !v31[5])
  {
    v16 = (void *)v25[5];
    if (v16)
    {
      *a6 = v16;
    }
    else
    {
      id v17 = +[NSError crl_fileReadUnknownErrorWithUserInfo:0];
      *a6 = v17;
    }
  }
  id v18 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

- (CRLContainedZipArchive)initWithEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  id v12 = 0;
  if (v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLContainedZipArchive;
    dispatch_semaphore_t v13 = [(CRLZipArchive *)&v16 initWithOptions:a5];
    p_isa = (id *)&v13->super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_zipArchive, a4);
      objc_storeStrong(p_isa + 6, a3);
    }
    self = p_isa;
    id v12 = self;
  }

  return v12;
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CRLContainedZipArchive;
  v4 = [(CRLZipArchive *)&v6 readChannelForEntry:a3 validateCRC:0];

  return v4;
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CRLContainedZipArchive;
  v4 = [(CRLZipArchive *)&v6 streamReadChannelForEntry:a3 validateCRC:0];

  return v4;
}

- (unint64_t)archiveLength
{
  return [(CRLZipEntry *)self->_entry size];
}

- (id)newArchiveReadChannel
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isValid
{
  return [(CRLZipArchive *)self->_zipArchive isValid];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);

  objc_storeStrong((id *)&self->_zipArchive, 0);
}

@end