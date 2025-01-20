@interface UITextRange
- (BOOL)_isRanged;
- (BOOL)isEmpty;
- (NSObject)_attachmentRange;
- (UITextPosition)end;
- (UITextPosition)start;
- (UITextRangeImpl)_isImpl;
- (_NSRange)_asNSRangeRelativeToDocument:(id)a3;
- (_NSRange)_asNSRangeRelativeToDocument:(id)a3 relativeToCurrentLine:(BOOL)a4;
- (id)_asNSTextRange;
- (void)_setAttachmentRange:(id)a3;
@end

@implementation UITextRange

- (void).cxx_destruct
{
}

- (BOOL)isEmpty
{
  return 0;
}

- (UITextPosition)start
{
  return 0;
}

- (UITextPosition)end
{
  return 0;
}

- (NSObject)_attachmentRange
{
  return self->_attachmentRange;
}

- (void)_setAttachmentRange:(id)a3
{
}

- (BOOL)_isRanged
{
  return ![(UITextRange *)self isEmpty];
}

- (UITextRangeImpl)_isImpl
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (UITextRangeImpl *)v3;
}

- (_NSRange)_asNSRangeRelativeToDocument:(id)a3
{
  NSUInteger v3 = [(UITextRange *)self _asNSRangeRelativeToDocument:a3 relativeToCurrentLine:0];
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)_asNSRangeRelativeToDocument:(id)a3 relativeToCurrentLine:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 beginningOfDocument];
  if (v4)
  {
    v8 = [v6 tokenizer];

    if (v8)
    {
      v9 = [v6 tokenizer];
      v10 = [(UITextRange *)self start];
      v11 = [v9 positionFromPosition:v10 toBoundary:4 inDirection:1];

      if (v11)
      {
        id v12 = v11;

        v7 = v12;
      }
    }
  }
  v13 = [(UITextRange *)self start];
  uint64_t v14 = [v6 offsetFromPosition:v7 toPosition:v13];

  v15 = [(UITextRange *)self start];
  v16 = [(UITextRange *)self end];
  uint64_t v17 = [v6 offsetFromPosition:v15 toPosition:v16];

  NSUInteger v18 = v14;
  NSUInteger v19 = v17;
  result.length = v19;
  result.location = v18;
  return result;
}

- (id)_asNSTextRange
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(UITextRange *)self start];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(UITextRange *)self start];
    id v6 = [v5 location];

    v7 = [(UITextRange *)self end];
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if (v8)
    {
      v9 = [(UITextRange *)self end];
      v10 = [v9 location];

      v11 = (void *)[objc_alloc((Class)off_1E52D2EF8) initWithLocation:v6 endLocation:v10];
      goto LABEL_15;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v15 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
      v16 = [(UITextRange *)self end];
      int v18 = 138412290;
      NSUInteger v19 = v16;
LABEL_11:

LABEL_12:
      goto LABEL_13;
    }
    uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB259A10) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      v16 = [(UITextRange *)self end];
      int v18 = 138412290;
      NSUInteger v19 = v16;
      goto LABEL_11;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (os_variant_has_internal_diagnostics())
  {
    id v6 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    v13 = [(UITextRange *)self start];
    int v18 = 138412290;
    NSUInteger v19 = v13;
    goto LABEL_7;
  }
  id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB259A08) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v6 = v12;
    v13 = [(UITextRange *)self start];
    int v18 = 138412290;
    NSUInteger v19 = v13;
LABEL_7:

    goto LABEL_13;
  }
LABEL_14:
  v11 = 0;
LABEL_15:
  return v11;
}

@end