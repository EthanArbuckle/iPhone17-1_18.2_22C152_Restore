@interface MBBackupOperationJournalEnumerator
- (MBBackupOperationJournalEnumerator)initWithFile:(id)a3 domainManager:(id)a4;
- (id)nextObject;
@end

@implementation MBBackupOperationJournalEnumerator

- (MBBackupOperationJournalEnumerator)initWithFile:(id)a3 domainManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v20 = 0;
  v8 = +[NSData dataWithContentsOfFile:v6 options:1 error:&v20];
  id v9 = v20;
  if (!v8)
  {
    id v15 = [objc_alloc((Class)MBException) initWithCode:100, @"Error memory mapping backup operation journal: %@", v9 format];
    goto LABEL_11;
  }
  v10 = +[MBDecoder decoderWithData:v8];
  if ([v10 decodeInt32] != 1835166318)
  {
    id v16 = objc_alloc((Class)MBException);
    CFStringRef v17 = @"Incorrect backup operation journal magic number";
LABEL_10:
    id v15 = objc_msgSend(v16, "initWithCode:format:", 11, v17, v18);
LABEL_11:
    objc_exception_throw(v15);
  }
  [v10 decodeVersion];
  if (v11 != 2.0)
  {
    id v16 = objc_alloc((Class)MBException);
    CFStringRef v17 = @"Incorrect backup operation journal version";
    goto LABEL_10;
  }
  v19.receiver = self;
  v19.super_class = (Class)MBBackupOperationJournalEnumerator;
  v12 = [(MBBackupOperationJournalEnumerator *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_decoder, v10);
    objc_storeStrong((id *)&v13->_domainManager, a4);
  }

  return v13;
}

- (id)nextObject
{
  unint64_t v3 = [(MBDecoder *)self->_decoder offset];
  v4 = [(MBDecoder *)self->_decoder data];
  id v5 = [v4 length];

  if (v3 >= (unint64_t)v5) {
    id v6 = 0;
  }
  else {
    id v6 = [[MBBackupOperation alloc] initWithDecoder:self->_decoder domainManager:self->_domainManager];
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainManager, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
}

@end