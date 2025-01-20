@interface TCXmlEnumMap
- (BOOL)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5 value:(int64_t *)a6;
- (TCXmlEnumMap)initWithDescriptions:(const TCXmlEnumDescription *)a3;
- (int64_t)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5;
- (int64_t)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5 def:(int64_t)a6;
- (void)dealloc;
@end

@implementation TCXmlEnumMap

- (TCXmlEnumMap)initWithDescriptions:(const TCXmlEnumDescription *)a3
{
  Mutable = CFDictionaryCreateMutable(0, 10, &TCXmlStringKeyCallBacks, 0);
  self->mNameToValueMap = Mutable;
  if (Mutable)
  {
    for (i = a3->var1; i; ++a3)
    {
      CFDictionaryAddValue(self->mNameToValueMap, i, (const void *)a3->var0);
      i = a3[1].var1;
    }
  }
  return self;
}

- (void)dealloc
{
  CFRelease(self->mNameToValueMap);
  v3.receiver = self;
  v3.super_class = (Class)TCXmlEnumMap;
  [(TCXmlEnumMap *)&v3 dealloc];
}

- (BOOL)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5 value:(int64_t *)a6
{
  NsProp = xmlGetNsProp(a3, (const xmlChar *)a5, (const xmlChar *)a4);
  if (NsProp)
  {
    value = 0;
    mNameToValueMap = self->mNameToValueMap;
    v11 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
    if (mNameToValueMap && CFDictionaryGetValueIfPresent(mNameToValueMap, NsProp, (const void **)&value))
    {
      *a6 = (int64_t)value;
    }
    else
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Attribute \"%s\" has bad value: %s", a5, NsProp);
      (*v11)(NsProp);
      objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", @"TCXmlException", v12, 0), "raise");
    }
    (*v11)(NsProp);
  }
  return NsProp != 0;
}

- (int64_t)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5
{
  int64_t v7 = 0;
  if (![(TCXmlEnumMap *)self readFromNode:a3 ns:a4 name:a5 value:&v7]) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"TCXmlException", @"Couldn't find attribute: %s", a5);
  }
  return v7;
}

- (int64_t)readFromNode:(_xmlNode *)a3 ns:(const char *)a4 name:(const char *)a5 def:(int64_t)a6
{
  int64_t v8 = 0;
  if ([(TCXmlEnumMap *)self readFromNode:a3 ns:a4 name:a5 value:&v8]) {
    return v8;
  }
  else {
    return a6;
  }
}

@end