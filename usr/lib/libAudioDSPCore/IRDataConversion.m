@interface IRDataConversion
+ (id)convertIRDataToNSDictionary:(id)a3;
@end

@implementation IRDataConversion

+ (id)convertIRDataToNSDictionary:(id)a3
{
  v3 = (applesauce::CF::DataRef *)a3;
  if ([(applesauce::CF::DataRef *)v3 length])
  {
    applesauce::CF::DataRef::from_ns_noexcept(v3, &v23);
    CFURLRef v4 = CFURLCreateWithBytes(0, (const UInt8 *)"temp", 4, 0, 0);
    CFURLRef v5 = v4;
    CFURLRef v22 = v4;
    if (!v4)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x21D48F410](exception, "Could not construct");
    }
    CFRetain(v4);
    CFTypeRef cf = v5;
    IR::IRDataAttributes::IRDataAttributes((uint64_t)v17, &cf, 0, 0, 2, 0.0);
    if (cf) {
      CFRelease(cf);
    }
    int v18 = 2;
    v6 = v23;
    if (v23) {
      CFRetain(v23);
    }
    uint64_t v13 = 0;
    CFTypeRef v14 = v6;
    __p = 0;
    v12 = 0;
    IR::IRData::IRData(&v15, v17, &v14, &__p);
    if (__p)
    {
      v12 = __p;
      operator delete(__p);
    }
    if (v14) {
      CFRelease(v14);
    }
    DictionaryIRData = (void *)IR::IRData::createDictionaryIRData((IR::IRData *)&v15, (const IR::IRData *)1, v7);
    IR::IRData::~IRData(&v15);
    if (v21) {
      CFRelease(v21);
    }
    if (v20) {
      CFRelease(v20);
    }
    if (v19) {
      CFRelease(v19);
    }
    if (v17[0]) {
      CFRelease(v17[0]);
    }
    CFRelease(v5);
    if (v23) {
      CFRelease(v23);
    }
  }
  else
  {
    DictionaryIRData = 0;
  }

  return DictionaryIRData;
}

@end