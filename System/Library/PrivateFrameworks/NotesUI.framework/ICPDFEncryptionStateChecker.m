@interface ICPDFEncryptionStateChecker
- (ICPDFEncryptionStateChecker)initWithPDFURL:(id)a3;
- (NSURL)pdfURL;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)encryptionState;
- (void)setEncryptionState:(unint64_t)a3;
@end

@implementation ICPDFEncryptionStateChecker

- (ICPDFEncryptionStateChecker)initWithPDFURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPDFEncryptionStateChecker;
  v5 = [(ICPDFEncryptionStateChecker *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    pdfURL = v5->_pdfURL;
    v5->_pdfURL = (NSURL *)v6;
  }
  return v5;
}

- (unint64_t)encryptionState
{
  if (!self->_encryptionState)
  {
    v3 = [(ICPDFEncryptionStateChecker *)self pdfURL];

    if (v3)
    {
      CFURLRef v4 = [(ICPDFEncryptionStateChecker *)self pdfURL];
      v5 = CGPDFDocumentCreateWithURL(v4);

      if (v5)
      {
        if (CGPDFDocumentIsEncrypted(v5)) {
          uint64_t v6 = 1;
        }
        else {
          uint64_t v6 = 2;
        }
        [(ICPDFEncryptionStateChecker *)self setEncryptionState:v6];
        CGPDFDocumentRelease(v5);
      }
    }
  }
  return self->_encryptionState;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFURLRef v4 = +[ICPDFEncryptionStateChecker allocWithZone:a3];
  v5 = [(ICPDFEncryptionStateChecker *)self pdfURL];
  uint64_t v6 = [(ICPDFEncryptionStateChecker *)v4 initWithPDFURL:v5];

  [(ICPDFEncryptionStateChecker *)v6 setEncryptionState:self->_encryptionState];
  return v6;
}

- (NSURL)pdfURL
{
  return self->_pdfURL;
}

- (void)setEncryptionState:(unint64_t)a3
{
  self->_encryptionState = a3;
}

- (void).cxx_destruct
{
}

@end