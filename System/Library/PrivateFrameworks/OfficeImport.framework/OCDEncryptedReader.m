@interface OCDEncryptedReader
- (BOOL)retainDecryptorWithErrorCode:(int *)a3;
- (OCCDecryptor)decryptor;
- (id)defaultPassphrase;
- (void)useUnencryptedDocument;
@end

@implementation OCDEncryptedReader

- (void)useUnencryptedDocument
{
  mDecryptor = self->mDecryptor;
  if (mDecryptor)
  {
    if (![(OCCDecryptor *)mDecryptor decrypt]) {
      +[TCMessageException raise:TCDecryptionFailedMessage];
    }
    [(OCDEncryptedReader *)self restartReaderToUseDecryptedDocument];
  }
}

- (BOOL)retainDecryptorWithErrorCode:(int *)a3
{
  *a3 = 8012;
  return 0;
}

- (OCCDecryptor)decryptor
{
  return self->mDecryptor;
}

- (void).cxx_destruct
{
}

- (id)defaultPassphrase
{
  return 0;
}

@end