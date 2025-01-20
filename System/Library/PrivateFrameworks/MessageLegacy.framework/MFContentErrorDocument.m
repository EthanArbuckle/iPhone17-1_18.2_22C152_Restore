@interface MFContentErrorDocument
- (MFContentErrorDocument)initWithMimePart:(id)a3;
- (NSError)error;
- (NSString)content;
- (void)dealloc;
@end

@implementation MFContentErrorDocument

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFContentErrorDocument;
  [(MFContentErrorDocument *)&v3 dealloc];
}

- (MFContentErrorDocument)initWithMimePart:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFContentErrorDocument.m", 23, @"Invalid parameter not satisfying: %@", @"mimePart");
  }
  v9.receiver = self;
  v9.super_class = (Class)MFContentErrorDocument;
  v5 = [(MFContentErrorDocument *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:MFLookupLocalizedString(@"CANNOT_DECODE_MULTIPART_MESSAGE", @"This message cannot be displayed because of the way it is formatted. Ask the sender to send it again using a different format or email program.\n\n%@/%@", @"Delayed", objc_msgSend(a3, "type"), objc_msgSend(a3, "subtype")];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v5->_error = (NSError *)(id)objc_msgSend(MEMORY[0x1E4F28C58], "mf_decodeFailedErrorWithUserInfo:", v7);
  }
  return v5;
}

- (NSString)content
{
  v2 = [(MFContentErrorDocument *)self error];
  return [(NSError *)v2 localizedDescription];
}

- (NSError)error
{
  return self->_error;
}

@end