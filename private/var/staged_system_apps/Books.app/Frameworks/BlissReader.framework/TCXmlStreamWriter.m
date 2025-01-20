@interface TCXmlStreamWriter
+ (BOOL)cleanUpXmlTextWriter:(_xmlTextWriter *)a3;
+ (BOOL)endElementInStream:(_xmlTextWriter *)a3;
+ (BOOL)startElementInStream:(_xmlTextWriter *)a3 name:(id)a4 prefix:(id)a5 ns:(const char *)a6;
+ (BOOL)startPlainElementInStream:(_xmlTextWriter *)a3 name:(id)a4;
+ (BOOL)writeAnchorTargetToStream:(_xmlTextWriter *)a3 name:(id)a4;
+ (BOOL)writeAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5 prefix:(id)a6 ns:(const char *)a7;
+ (BOOL)writeDtdToStream:(_xmlTextWriter *)a3 name:(id)a4 pubid:(id)a5 sysid:(id)a6 subset:(id)a7;
+ (BOOL)writeNamespaceToStream:(_xmlTextWriter *)a3 prefix:(id)a4 uri:(const char *)a5;
+ (BOOL)writePlainAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5;
+ (BOOL)writeStringToStream:(_xmlTextWriter *)a3 text:(id)a4;
+ (_xmlTextWriter)createXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5;
+ (_xmlTextWriter)createXmlTextWriterWithBuffer:(_xmlOutputBuffer *)a3;
+ (_xmlTextWriter)createXmlTextWriterWithContext:(id)a3;
+ (void)resetElementIds;
- (BOOL)contentAdded;
- (BOOL)endElement;
- (BOOL)endElementsToBase;
- (BOOL)startElement:(id)a3 prefix:(id)a4 ns:(const char *)a5;
- (BOOL)startPlainElement:(id)a3;
- (BOOL)writeAnchorTarget:(id)a3;
- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4 prefix:(id)a5 ns:(const char *)a6;
- (BOOL)writeAttribute:(id)a3 content:(id)a4 prefix:(id)a5 ns:(const char *)a6;
- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4 prefix:(id)a5 ns:(const char *)a6;
- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5 prefix:(id)a6 ns:(const char *)a7;
- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4 prefix:(id)a5 ns:(const char *)a6;
- (BOOL)writeDtd:(id)a3 pubid:(id)a4 sysid:(id)a5 subset:(id)a6;
- (BOOL)writeElementId:(id)a3;
- (BOOL)writeNamespace:(id)a3 uri:(const char *)a4;
- (BOOL)writePlainAttribute:(id)a3 BOOLContent:(BOOL)a4;
- (BOOL)writePlainAttribute:(id)a3 content:(id)a4;
- (BOOL)writePlainAttribute:(id)a3 doubleContent:(double)a4;
- (BOOL)writePlainAttribute:(id)a3 enumContent:(int)a4 map:(id)a5;
- (BOOL)writePlainAttribute:(id)a3 intContent:(int64_t)a4;
- (BOOL)writeString:(id)a3;
- (TCXmlStreamWriter)initWithTextWriter:(_xmlTextWriter *)a3;
- (_xmlTextWriter)textWriter;
- (void)dealloc;
@end

@implementation TCXmlStreamWriter

- (TCXmlStreamWriter)initWithTextWriter:(_xmlTextWriter *)a3
{
  v4 = [(TCXmlStreamWriter *)self init];
  v5 = v4;
  if (v4)
  {
    v4->mStreamAPI = a3;
    v4->mCurrentDepth = 0;
    v4->mContentAdded = 0;
    v4->mAddedIds = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TCXmlStreamWriter;
  [(TCXmlStreamWriter *)&v3 dealloc];
}

+ (void)resetElementIds
{
  dword_5737B0 = 0;
}

- (_xmlTextWriter)textWriter
{
  return self->mStreamAPI;
}

- (BOOL)contentAdded
{
  return self->mContentAdded;
}

- (BOOL)startElement:(id)a3 prefix:(id)a4 ns:(const char *)a5
{
  BOOL v6 = +[TCXmlStreamWriter startElementInStream:self->mStreamAPI name:a3 prefix:a4 ns:a5];
  if (v6)
  {
    self->mContentAdded = 1;
    ++self->mCurrentDepth;
  }
  return v6;
}

- (BOOL)startPlainElement:(id)a3
{
  return [(TCXmlStreamWriter *)self startElement:a3 prefix:0 ns:0];
}

- (BOOL)endElement
{
  if (self->mCurrentDepth)
  {
    BOOL v3 = +[TCXmlStreamWriter endElementInStream:self->mStreamAPI];
    if (v3)
    {
      --self->mCurrentDepth;
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)writeString:(id)a3
{
  if (self->mContentAdded)
  {
    char v5 = 1;
  }
  else if (a3)
  {
    char v5 = [a3 length] != 0;
  }
  else
  {
    char v5 = 0;
  }
  self->mContentAdded = v5;
  mStreamAPI = self->mStreamAPI;

  return +[TCXmlStreamWriter writeStringToStream:mStreamAPI text:a3];
}

- (BOOL)endElementsToBase
{
  do
    unsigned int mCurrentDepth = self->mCurrentDepth;
  while (mCurrentDepth && [(TCXmlStreamWriter *)self endElement]);
  return mCurrentDepth == 0;
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4 prefix:(id)a5 ns:(const char *)a6
{
  if (!self->mCurrentDepth) {
    return 0;
  }
  if (a4) {
    CFStringRef v8 = (const __CFString *)a4;
  }
  else {
    CFStringRef v8 = &stru_46D7E8;
  }
  return +[TCXmlStreamWriter writeAttributeToStream:self->mStreamAPI name:a3 content:v8 prefix:a5 ns:a6];
}

- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4 prefix:(id)a5 ns:(const char *)a6
{
  v10 = TCXmlStringForInt(a4);

  return [(TCXmlStreamWriter *)self writeAttribute:a3 content:v10 prefix:a5 ns:a6];
}

- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4 prefix:(id)a5 ns:(const char *)a6
{
  CFStringRef v10 = TCXmlStringForBool(a4);

  return [(TCXmlStreamWriter *)self writeAttribute:a3 content:v10 prefix:a5 ns:a6];
}

- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5 prefix:(id)a6 ns:(const char *)a7
{
  id v11 = TCXmlStringForEnum(*(uint64_t *)&a4, a5);

  return [(TCXmlStreamWriter *)self writeAttribute:a3 content:v11 prefix:a6 ns:a7];
}

- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4 prefix:(id)a5 ns:(const char *)a6
{
  CFStringRef v10 = TCXmlStringForDouble(a4);

  return [(TCXmlStreamWriter *)self writeAttribute:a3 content:v10 prefix:a5 ns:a6];
}

- (BOOL)writePlainAttribute:(id)a3 content:(id)a4
{
  return [(TCXmlStreamWriter *)self writeAttribute:a3 content:a4 prefix:0 ns:0];
}

- (BOOL)writePlainAttribute:(id)a3 intContent:(int64_t)a4
{
  return [(TCXmlStreamWriter *)self writeAttribute:a3 intContent:a4 prefix:0 ns:0];
}

- (BOOL)writePlainAttribute:(id)a3 BOOLContent:(BOOL)a4
{
  return [(TCXmlStreamWriter *)self writeAttribute:a3 BOOLContent:a4 prefix:0 ns:0];
}

- (BOOL)writePlainAttribute:(id)a3 enumContent:(int)a4 map:(id)a5
{
  return [(TCXmlStreamWriter *)self writeAttribute:a3 enumContent:*(void *)&a4 map:a5 prefix:0 ns:0];
}

- (BOOL)writePlainAttribute:(id)a3 doubleContent:(double)a4
{
  return [(TCXmlStreamWriter *)self writeAttribute:a3 doubleContent:0 prefix:0 ns:a4];
}

- (BOOL)writeElementId:(id)a3
{
  BOOL v3 = (NSString *)a3;
  if (!a3) {
    BOOL v3 = +[NSString stringWithFormat:@"b%d", ++dword_5737B0];
  }

  return [(TCXmlStreamWriter *)self writePlainAttribute:@"id" content:v3];
}

- (BOOL)writeNamespace:(id)a3 uri:(const char *)a4
{
  return +[TCXmlStreamWriter writeNamespaceToStream:self->mStreamAPI prefix:a3 uri:a4];
}

- (BOOL)writeDtd:(id)a3 pubid:(id)a4 sysid:(id)a5 subset:(id)a6
{
  return +[TCXmlStreamWriter writeDtdToStream:self->mStreamAPI name:a3 pubid:a4 sysid:a5 subset:a6];
}

- (BOOL)writeAnchorTarget:(id)a3
{
  return +[TCXmlStreamWriter writeAnchorTargetToStream:self->mStreamAPI name:a3];
}

+ (BOOL)startPlainElementInStream:(_xmlTextWriter *)a3 name:(id)a4
{
  return +[TCXmlStreamWriter startElementInStream:a3 name:a4 prefix:0 ns:0];
}

+ (BOOL)startElementInStream:(_xmlTextWriter *)a3 name:(id)a4 prefix:(id)a5 ns:(const char *)a6
{
  return xmlTextWriterStartElementNS(a3, (const xmlChar *)[a5 UTF8String], (const xmlChar *)[a4 UTF8String], (const xmlChar *)a6) >= 0;
}

+ (BOOL)endElementInStream:(_xmlTextWriter *)a3
{
  return xmlTextWriterEndElement(a3) >= 0;
}

+ (BOOL)writeStringToStream:(_xmlTextWriter *)a3 text:(id)a4
{
  return xmlTextWriterWriteString(a3, (const xmlChar *)[a4 UTF8String]) >= 0;
}

+ (BOOL)writePlainAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5
{
  return xmlTextWriterWriteAttribute(a3, (const xmlChar *)[a4 UTF8String], (const xmlChar *)[a5 UTF8String]) >= 0;
}

+ (BOOL)writeAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5 prefix:(id)a6 ns:(const char *)a7
{
  return xmlTextWriterWriteAttributeNS(a3, (const xmlChar *)[a6 UTF8String], (const xmlChar *)[a4 UTF8String], (const xmlChar *)a7, (const xmlChar *)[a5 UTF8String]);
}

+ (BOOL)writeNamespaceToStream:(_xmlTextWriter *)a3 prefix:(id)a4 uri:(const char *)a5
{
  if (a4) {
    v7 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"xmlns:%@", a4];
  }
  else {
    v7 = @"xmlns";
  }
  int v8 = xmlTextWriterWriteAttribute(a3, (const xmlChar *)[(__CFString *)v7 UTF8String], (const xmlChar *)a5);

  return v8 >= 0;
}

+ (BOOL)writeDtdToStream:(_xmlTextWriter *)a3 name:(id)a4 pubid:(id)a5 sysid:(id)a6 subset:(id)a7
{
  LODWORD(a7) = xmlTextWriterWriteDTD(a3, (const xmlChar *)[a4 UTF8String], (const xmlChar *)[a5 UTF8String], (const xmlChar *)[a6 UTF8String], (const xmlChar *)[a7 UTF8String]);
  xmlTextWriterSetIndent(a3, 0);
  return (int)a7 >= 0;
}

+ (BOOL)writeAnchorTargetToStream:(_xmlTextWriter *)a3 name:(id)a4
{
  return +[TCXmlStreamWriter startPlainElementInStream:name:](TCXmlStreamWriter, "startPlainElementInStream:name:", a3, @"span")&& +[TCXmlStreamWriter writePlainAttributeToStream:name:content:](TCXmlStreamWriter, "writePlainAttributeToStream:name:content:", a3, @"id", a4)&& +[TCXmlStreamWriter endElementInStream:a3];
}

+ (_xmlTextWriter)createXmlTextWriterWithContext:(id)a3
{
  xmlOutputBufferPtr IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)sfaxmlNSMutableDataWriteCallback, 0, a3, 0);

  return +[TCXmlStreamWriter createXmlTextWriterWithBuffer:IO];
}

+ (_xmlTextWriter)createXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5
{
  [a4 beginUnknownSizeEntryWithName:a3 isCompressed:a5];
  xmlOutputBufferPtr IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)&SFUSimpleXmlOutputWriteCallback, (xmlOutputCloseCallback)&SFUSimpleXmlOutputCloseCallback, a4, 0);

  return +[TCXmlStreamWriter createXmlTextWriterWithBuffer:IO];
}

+ (_xmlTextWriter)createXmlTextWriterWithBuffer:(_xmlOutputBuffer *)a3
{
  BOOL v3 = xmlNewTextWriter(a3);
  if (v3) {
    +[TCXmlStreamWriter writeStringToStream:v3 text:@"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>"];
  }
  return v3;
}

+ (BOOL)cleanUpXmlTextWriter:(_xmlTextWriter *)a3
{
  int v4 = xmlTextWriterEndDocument(a3);
  int v5 = xmlTextWriterFlush(a3) | v4;
  xmlFreeTextWriter(a3);
  return v5 >= 0;
}

@end