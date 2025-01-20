@interface MFContentErrorDocument
- (MFContentErrorDocument)initWithMimePart:(id)a3;
- (NSError)error;
- (NSString)content;
@end

@implementation MFContentErrorDocument

- (MFContentErrorDocument)initWithMimePart:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MFContentErrorDocument.m", 16, @"Invalid parameter not satisfying: %@", @"mimePart" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)MFContentErrorDocument;
  v6 = [(MFContentErrorDocument *)&v18 init];
  if (v6)
  {
    v7 = NSString;
    v8 = MFLookupLocalizedString(@"CANNOT_DECODE_MULTIPART_MESSAGE", @"This message cannot be displayed because of the way it is formatted. Ask the sender to send it again using a different format or email program.\n\n%@/%@", @"Delayed");
    v9 = [v5 type];
    v10 = [v5 subtype];
    v11 = objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);

    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = v11;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v14 = objc_msgSend(v12, "mf_decodeFailedErrorWithUserInfo:", v13);

    error = v6->_error;
    v6->_error = (NSError *)v14;
  }
  return v6;
}

- (NSString)content
{
  v2 = [(MFContentErrorDocument *)self error];
  v3 = [v2 localizedDescription];

  return (NSString *)v3;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end