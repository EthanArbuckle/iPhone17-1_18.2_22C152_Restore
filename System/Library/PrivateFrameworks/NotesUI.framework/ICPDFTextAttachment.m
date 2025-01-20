@interface ICPDFTextAttachment
- (ICPDFEncryptionStateChecker)encryptionStateChecker;
- (id)supportedPresentationSizes;
- (signed)effectiveAttachmentViewSizeForTextContainer:(id)a3;
- (void)setEncryptionStateChecker:(id)a3;
@end

@implementation ICPDFTextAttachment

- (id)supportedPresentationSizes
{
  if (supportedPresentationSizes_onceToken_1 != -1) {
    dispatch_once(&supportedPresentationSizes_onceToken_1, &__block_literal_global_19);
  }
  v2 = (void *)supportedPresentationSizes_supportedSizes_1;
  return v2;
}

void __49__ICPDFTextAttachment_supportedPresentationSizes__block_invoke()
{
  v0 = (void *)supportedPresentationSizes_supportedSizes_1;
  supportedPresentationSizes_supportedSizes_1 = (uint64_t)&unk_1F09A3F50;
}

- (ICPDFEncryptionStateChecker)encryptionStateChecker
{
  if (!self->_encryptionStateChecker)
  {
    v3 = [(ICAbstractTextAttachment *)self attachment];
    int v4 = [v3 attachmentType];

    if (v4 == 6)
    {
      v5 = [(ICAbstractTextAttachment *)self attachment];
      v6 = [v5 media];
      v7 = [v6 mediaURL];

      if (v7)
      {
        v8 = [[ICPDFEncryptionStateChecker alloc] initWithPDFURL:v7];
        encryptionStateChecker = self->_encryptionStateChecker;
        self->_encryptionStateChecker = v8;
      }
    }
  }
  v10 = self->_encryptionStateChecker;
  return v10;
}

- (signed)effectiveAttachmentViewSizeForTextContainer:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ICPDFTextAttachment;
  unsigned int v4 = [(ICBaseTextAttachment *)&v11 effectiveAttachmentViewSizeForTextContainer:a3];
  if (v4 != 1)
  {
    v5 = [(ICAbstractTextAttachment *)self attachment];
    v6 = [v5 attachmentModel];
    char v7 = [v6 hasPreviews];

    if ((v7 & 1) == 0)
    {
      v8 = [(ICPDFTextAttachment *)self encryptionStateChecker];
      uint64_t v9 = [v8 encryptionState];

      if (v9 != 2) {
        LOWORD(v4) = 1;
      }
    }
  }
  return v4;
}

- (void)setEncryptionStateChecker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end