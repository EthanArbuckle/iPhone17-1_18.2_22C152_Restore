@interface ICTTAttachment
+ (BOOL)isAttachment:(id)a3 equalToModelComparable:(id)a4;
+ (BOOL)isInlineAttachment:(id)a3;
+ (BOOL)typeUTIIsInlineAttachment:(id)a3;
- (BOOL)_isEmojiImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToModelComparable:(id)a3;
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (NSString)attachmentIdentifier;
- (NSString)attachmentUTI;
- (NSString)description;
- (id)adaptiveImageGlyph;
- (id)attachmentInContext:(id)a3;
- (id)fileType;
- (id)inlineAttachmentInContext:(id)a3;
- (int64_t)standaloneAlignment;
- (void)_isEmojiImage;
- (void)setAttachmentIdentifier:(id)a3;
- (void)setAttachmentUTI:(id)a3;
@end

@implementation ICTTAttachment

+ (BOOL)isInlineAttachment:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 fileType];
  }
  else {
  v5 = [v4 attachmentUTI];
  }

  char v6 = [a1 typeUTIIsInlineAttachment:v5];
  return v6;
}

- (NSString)attachmentUTI
{
  return self->_attachmentUTI;
}

+ (BOOL)typeUTIIsInlineAttachment:(id)a3
{
  return [a3 hasPrefix:@"com.apple.notes.inlinetextattachment"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = ICProtocolCast();
  if (v5) {
    BOOL v6 = [(ICTTAttachment *)self isEqualToModelComparable:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToModelComparable:(id)a3
{
  return +[ICTTAttachment isAttachment:self equalToModelComparable:a3];
}

+ (BOOL)isAttachment:(id)a3 equalToModelComparable:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 attachmentIdentifier];
  if ([v5 conformsToProtocol:&unk_1F1F80810])
  {
    uint64_t v7 = [v5 attachmentIdentifier];
    v8 = (void *)v7;
    char v9 = 0;
    if (v6 && v7) {
      char v9 = [v6 isEqualToString:v7];
    }
  }
  else
  {
    v8 = 0;
    char v9 = 0;
  }

  return v9;
}

- (NSString)attachmentIdentifier
{
  return self->_attachmentIdentifier;
}

- (void)setAttachmentUTI:(id)a3
{
}

- (void)setAttachmentIdentifier:(id)a3
{
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  BOOL v6 = [(ICTTAttachment *)self attachmentUTI];
  uint64_t v7 = [(ICTTAttachment *)self attachmentIdentifier];
  v8 = [v3 stringWithFormat:@"<%@: %p, attachmentUTI: %@, attachmentIdentifier: %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (id)attachmentInContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTTAttachment *)self attachmentIdentifier];
  BOOL v6 = +[ICBaseAttachment attachmentWithIdentifier:v5 context:v4];

  return v6;
}

- (id)inlineAttachmentInContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTTAttachment *)self attachmentIdentifier];
  BOOL v6 = +[ICBaseAttachment attachmentWithIdentifier:v5 context:v4];

  return v6;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (id)fileType
{
  return (id)[(id)*MEMORY[0x1E4F44378] identifier];
}

- (int64_t)standaloneAlignment
{
  return 1;
}

- (BOOL)_isEmojiImage
{
  v2 = os_log_create("com.apple.notes", "SimulatedCrash");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    -[ICTTAttachment _isEmojiImage](v2);
  }

  return 0;
}

- (id)adaptiveImageGlyph
{
  v2 = os_log_create("com.apple.notes", "SimulatedCrash");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    -[ICTTAttachment _isEmojiImage](v2);
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentUTI, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
}

- (void)_isEmojiImage
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C3A61000, log, OS_LOG_TYPE_FAULT, "Unexpected ICTTAttachment found in text storage", v1, 2u);
}

@end