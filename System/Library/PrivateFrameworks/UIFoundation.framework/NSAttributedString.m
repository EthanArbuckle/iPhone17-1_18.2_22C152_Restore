@interface NSAttributedString
- (id)_ui_attributedStringScaledByScaleFactor:(id)result;
- (id)_ui_scaledStringWithAttributes:(void *)a3 font:(double)a4 scale:;
@end

@implementation NSAttributedString

NSFont *__87__NSAttributedString_NSExtendedStringDrawing___ui_attributedStringScaledByScaleFactor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  [a2 pointSize];
  result = +[UIFont fontWithDescriptor:size:](NSFont, "fontWithDescriptor:size:", [a2 fontDescriptor], round(v8 * *(double *)(a1 + 40) * 4.0) * 0.25);
  if (result)
  {
    v10 = result;
    v11 = *(void **)(a1 + 32);
    return (NSFont *)objc_msgSend(v11, "addAttribute:value:range:", @"NSFont", v10, a3, a4);
  }
  return result;
}

- (id)_ui_scaledStringWithAttributes:(void *)a3 font:(double)a4 scale:
{
  if (result)
  {
    v6 = result;
    if (a2)
    {
      [a3 pointSize];
      objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(a3, "fontWithSize:", round(v8 * a4 * 4.0) * 0.25), @"NSFont");
      return (id)[v6 string];
    }
    else
    {
      return -[NSAttributedString _ui_attributedStringScaledByScaleFactor:](result, a4);
    }
  }
  return result;
}

id __109__NSAttributedString_NSAttributedStringUIFoundationAdditions__lineBreakByHyphenatingBeforeIndex_withinRange___block_invoke()
{
  uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSHyphenationLanguage");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "preferredLanguages"), "firstObject");
  }
  id result = (id)[MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v0];
  lineBreakByHyphenatingBeforeIndex_withinRange__defaultLocale = (uint64_t)result;
  return result;
}

uint64_t __84__NSAttributedString_NSExtendedStringDrawing__boundingRectWithSize_options_context___block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  boundingRectWithSize_options_context__scaleSingleLineWithHeight = result;
  return result;
}

uint64_t __87__NSAttributedString_NSAttributedStringAttachmentConveniences___sharedAttachmentString__block_invoke()
{
  __int16 v1 = -4;
  return [objc_allocWithZone(NSString) initWithCharacters:&v1 length:1];
}

uint64_t __95__NSAttributedString_NSAttributedStringAttachmentConveniences__attributedStringWithAttachment___block_invoke()
{
  uint64_t result = dyld_program_minos_at_least();
  attributedStringWithAttachment__useInitWithAttachment = result;
  return result;
}

- (id)_ui_attributedStringScaledByScaleFactor:(id)result
{
  if (result)
  {
    v3 = result;
    v4 = (void *)[result mutableCopy];
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "string"), "length");
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87__NSAttributedString_NSExtendedStringDrawing___ui_attributedStringScaledByScaleFactor___block_invoke;
    v6[3] = &unk_1E55C7548;
    *(double *)&v6[5] = a2;
    v6[4] = v4;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", @"NSFont", 0, v5, 0x100000, v6);
    return v4;
  }
  return result;
}

uint64_t __90__NSAttributedString_NSAttributedStringUIFoundationAdditions__containsAttachmentsInRange___block_invoke()
{
  uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSAttributedStringTreatsAdaptiveImageGlyphsAsTextAttachment");
  if (v0) {
    uint64_t result = [v0 BOOLValue];
  }
  else {
    uint64_t result = 1;
  }
  containsAttachmentsInRange__checksImageGlyphs = result;
  return result;
}

uint64_t __87__NSAttributedString_NSAttributedStringUIFoundationAdditions___isAttributedStringAgent__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) _inASA];
    _isAttributedStringAgent_isInAgent = result;
  }
  return result;
}

Class __89__NSAttributedString_NSAttributedStringUIFoundationAdditions__allowedSecureCodingClasses__block_invoke()
{
  id v23 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v23, "initWithObjects:", v22, v21, v20, v19, v18, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  Class Class = objc_getClass("NSFont");
  if (Class) {
    [v10 addObject:Class];
  }
  Class v12 = objc_getClass("NSColor");
  if (v12) {
    [v10 addObject:v12];
  }
  Class v13 = objc_getClass("NSImage");
  if (v13) {
    [v10 addObject:v13];
  }
  Class v14 = objc_getClass("NSImageRep");
  if (v14) {
    [v10 addObject:v14];
  }
  Class v15 = objc_getClass("UIFont");
  if (v15) {
    [v10 addObject:v15];
  }
  Class v16 = objc_getClass("UIColor");
  if (v16) {
    [v10 addObject:v16];
  }
  Class result = objc_getClass("UIImage");
  if (result) {
    Class result = (Class)[v10 addObject:result];
  }
  allowedSecureCodingClasses_allowedClasses = (uint64_t)v10;
  return result;
}

uint64_t __90__NSAttributedString_NSAttributedStringUIFoundationAdditions__containsAttachmentsInRange___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __101__NSAttributedString_NSAttributedStringUIFoundationAdditions__readFromURL_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2;
  if (a2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a2 = [objc_alloc(*(Class *)(a1 + 32)) initWithAttributedString:v6];
    }
    else {
      a2 = 0;
    }
  }
  id v8 = (id)a2;
  if (!a2) {
    a2 = v6;
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, a4);
}

void __102__NSAttributedString_NSAttributedStringUIFoundationAdditions__readFromData_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2;
  if (a2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a2 = [objc_alloc(*(Class *)(a1 + 32)) initWithAttributedString:v6];
    }
    else {
      a2 = 0;
    }
  }
  id v8 = (id)a2;
  if (!a2) {
    a2 = v6;
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, a4);
}

void __103__NSAttributedString_NSExtendedStringDrawing___ui_attributedSubstringFromRange_withTrackingAdjustment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_alloc(NSNumber);
  if (a2) {
    [a2 doubleValue];
  }
  else {
    double v9 = 0.0;
  }
  id v10 = (id)[v8 initWithDouble:v9 + *(double *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", @"NSKern", v10, a3, a4);
}

@end