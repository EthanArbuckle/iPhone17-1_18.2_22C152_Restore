@interface TCDumpBlob
- (TCDumpBlob)initWithSize_:(unint64_t)a3;
- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5;
@end

@implementation TCDumpBlob

- (TCDumpBlob)initWithSize_:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TCDumpBlob;
  result = [(TCDumpType *)&v5 init];
  if (result) {
    result->mSize = a3;
  }
  return result;
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t mSize = self->mSize;
  if (mSize)
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = mSize - v6;
      if (v7 >= 0x10) {
        size_t v8 = 16;
      }
      else {
        size_t v8 = v7;
      }
      if (fread(__ptr, 1uLL, v8, a3) != v8)
      {
        v9 = [NSString stringWithUTF8String:"-[TCDumpBlob fromBinary:toXml:state:]"];
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Common/Utilities/TCDump.mm"];
        +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:487 isFatal:0 description:"Unexpected number of bytes read"];

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      v11 = xmlNewNode(0, (const xmlChar *)"row");
      xmlAddChild(a4, v11);
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"%04lX", v6);
      sfaxmlSetNSStringNoNsProp(v11, (const xmlChar *)"offset", v26);
      if (v8)
      {
        v12 = __ptr;
        v13 = __str;
        size_t v14 = 49;
        do
        {
          int v15 = *v12++;
          snprintf(v13, v14, "%02X ", v15);
          v14 -= 3;
          v13 += 3;
        }
        while (3 * v8 + v14 != 49);
      }
      __str[3 * v8 + 2] = 0;
      v16 = (void *)[[NSString alloc] initWithUTF8String:__str];
      sfaxmlSetNSStringNoNsProp(v11, (const xmlChar *)"hex", v16);
      if (v8)
      {
        v17 = v27;
        v18 = __ptr;
        size_t v19 = v8;
        do
        {
          int v21 = *v18++;
          char v20 = v21;
          if ((v21 - 127) < 0xFFFFFFA1) {
            char v20 = 46;
          }
          *v17++ = v20;
          --v19;
        }
        while (v19);
      }
      v27[v8] = 0;
      v22 = (void *)[[NSString alloc] initWithUTF8String:v27];
      sfaxmlSetNSStringNoNsProp(v11, (const xmlChar *)"chars", v22);

      v6 += v8;
      unint64_t mSize = self->mSize;
    }
    while (v6 < mSize);
  }
}

@end