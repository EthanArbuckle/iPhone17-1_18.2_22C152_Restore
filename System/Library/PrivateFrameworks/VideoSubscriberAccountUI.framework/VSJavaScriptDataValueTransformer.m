@interface VSJavaScriptDataValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation VSJavaScriptDataValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  if ([v3 isString])
  {
    v4 = [v3 toString];
    if (!v4
      || (v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v4 options:0]) == 0)
    {
      v5 = [v4 dataUsingEncoding:4];
    }
  }
  else
  {
    v6 = [v3 context];
    v7 = (const OpaqueJSContext *)[v6 JSGlobalContextRef];

    v8 = (OpaqueJSValue *)[v3 JSValueRef];
    v5 = 0;
    if (JSValueGetTypedArrayType(v7, v8, 0) == kJSTypedArrayTypeArrayBuffer)
    {
      if (JSValueIsObject(v7, v8))
      {
        size_t ArrayBufferByteLength = JSObjectGetArrayBufferByteLength(v7, v8, 0);
        v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", JSObjectGetArrayBufferBytesPtr(v7, v8, 0), ArrayBufferByteLength);
      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 object];

    id v3 = (id)v4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [MEMORY[0x263F10378] currentContext];
    v6 = [v3 base64EncodedStringWithOptions:0];
    v7 = [MEMORY[0x263F10390] valueWithObject:v6 inContext:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end