@interface PFXStreamWriter
+ (BOOL)endElementInStream:(_xmlTextWriter *)a3;
+ (BOOL)startElementInStream:(_xmlTextWriter *)a3 name:(id)a4;
+ (BOOL)startElementInStream:(_xmlTextWriter *)a3 name:(id)a4 prefix:(id)a5 ns:(const char *)a6;
+ (BOOL)writeAnchorTargetToStream:(_xmlTextWriter *)a3 name:(id)a4;
+ (BOOL)writeAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5;
+ (BOOL)writeAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5 prefix:(id)a6 ns:(const char *)a7;
+ (BOOL)writeDtdToStream:(_xmlTextWriter *)a3 name:(id)a4 pubid:(id)a5 sysid:(id)a6 subset:(id)a7;
+ (BOOL)writeNamespaceToStream:(_xmlTextWriter *)a3 prefix:(id)a4 uri:(const char *)a5;
+ (BOOL)writeStringToStream:(_xmlTextWriter *)a3 text:(id)a4;
+ (_xmlTextWriter)createXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5;
+ (_xmlTextWriter)createXmlTextWriterWithBuffer:(_xmlOutputBuffer *)a3;
+ (_xmlTextWriter)createXmlTextWriterWithContext:(id)a3;
- (BOOL)contentAdded;
- (BOOL)endElement;
- (BOOL)endElementsToBase;
- (BOOL)startElement:(id)a3;
- (BOOL)startElement:(id)a3 prefix:(id)a4 ns:(const char *)a5;
- (BOOL)writeAnchorTarget:(id)a3;
- (BOOL)writeAttribute:(id)a3 content:(id)a4;
- (BOOL)writeAttribute:(id)a3 content:(id)a4 prefix:(id)a5 ns:(const char *)a6;
- (BOOL)writeDtd:(id)a3 pubid:(id)a4 sysid:(id)a5 subset:(id)a6;
- (BOOL)writeNamespace:(id)a3 uri:(const char *)a4;
- (BOOL)writeString:(id)a3;
- (PFXStreamWriter)initWithTextWriter:(_xmlTextWriter *)a3;
- (_xmlTextWriter)textWriter;
- (void)dealloc;
@end

@implementation PFXStreamWriter

- (PFXStreamWriter)initWithTextWriter:(_xmlTextWriter *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PFXStreamWriter;
  result = [(PFXStreamWriter *)&v5 init];
  if (result)
  {
    result->mStreamAPI = a3;
    result->mCurrentDepth = 0;
    result->mContentAdded = 0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PFXStreamWriter;
  [(PFXStreamWriter *)&v2 dealloc];
}

- (_xmlTextWriter)textWriter
{
  return self->mStreamAPI;
}

- (BOOL)contentAdded
{
  return self->mContentAdded;
}

- (BOOL)startElement:(id)a3
{
  return [(PFXStreamWriter *)self startElement:a3 prefix:0 ns:0];
}

- (BOOL)startElement:(id)a3 prefix:(id)a4 ns:(const char *)a5
{
  BOOL v6 = +[PFXStreamWriter startElementInStream:self->mStreamAPI name:a3 prefix:a4 ns:a5];
  if (v6)
  {
    self->mContentAdded = 1;
    ++self->mCurrentDepth;
  }
  return v6;
}

- (BOOL)endElement
{
  if (self->mCurrentDepth)
  {
    BOOL v3 = +[PFXStreamWriter endElementInStream:self->mStreamAPI];
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

  return +[PFXStreamWriter writeStringToStream:mStreamAPI text:a3];
}

- (BOOL)endElementsToBase
{
  do
    unint64_t mCurrentDepth = self->mCurrentDepth;
  while (mCurrentDepth && [(PFXStreamWriter *)self endElement]);
  return mCurrentDepth == 0;
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4
{
  return [(PFXStreamWriter *)self writeAttribute:a3 content:a4 prefix:0 ns:0];
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4 prefix:(id)a5 ns:(const char *)a6
{
  if (self->mCurrentDepth) {
    return +[PFXStreamWriter writeAttributeToStream:self->mStreamAPI name:a3 content:a4 prefix:a5 ns:a6];
  }
  else {
    return 0;
  }
}

- (BOOL)writeNamespace:(id)a3 uri:(const char *)a4
{
  return +[PFXStreamWriter writeNamespaceToStream:self->mStreamAPI prefix:a3 uri:a4];
}

- (BOOL)writeDtd:(id)a3 pubid:(id)a4 sysid:(id)a5 subset:(id)a6
{
  return +[PFXStreamWriter writeDtdToStream:self->mStreamAPI name:a3 pubid:a4 sysid:a5 subset:a6];
}

- (BOOL)writeAnchorTarget:(id)a3
{
  return +[PFXStreamWriter writeAnchorTargetToStream:self->mStreamAPI name:a3];
}

+ (BOOL)startElementInStream:(_xmlTextWriter *)a3 name:(id)a4
{
  return +[PFXStreamWriter startElementInStream:a3 name:a4 prefix:0 ns:0];
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

+ (BOOL)writeAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5
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
  xmlTextWriterSetIndent(a3, 1);
  int v12 = xmlTextWriterWriteDTD(a3, (const xmlChar *)[a4 UTF8String], (const xmlChar *)[a5 UTF8String], (const xmlChar *)[a6 UTF8String], (const xmlChar *)[a7 UTF8String]);
  if ((v12 & 0x80000000) == 0) {
    xmlTextWriterSetIndent(a3, 0);
  }
  return v12 >= 0;
}

+ (BOOL)writeAnchorTargetToStream:(_xmlTextWriter *)a3 name:(id)a4
{
  if (!+[PFXStreamWriter startElementInStream:name:](PFXStreamWriter, "startElementInStream:name:", a3, @"span")|| !+[PFXStreamWriter writeAttributeToStream:a3 name:@"id" content:a4])
  {
    return 0;
  }

  return +[PFXStreamWriter endElementInStream:a3];
}

+ (_xmlTextWriter)createXmlTextWriterWithContext:(id)a3
{
  xmlOutputBufferPtr IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)sfaxmlNSMutableDataWriteCallback, 0, a3, 0);

  return +[PFXStreamWriter createXmlTextWriterWithBuffer:IO];
}

+ (_xmlTextWriter)createXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5
{
  [a4 beginUnknownSizeEntryWithName:a3 isCompressed:a5];
  xmlOutputBufferPtr IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)&SFUSimpleXmlOutputWriteCallback, (xmlOutputCloseCallback)&SFUSimpleXmlOutputCloseCallback, a4, 0);

  return +[PFXStreamWriter createXmlTextWriterWithBuffer:IO];
}

+ (_xmlTextWriter)createXmlTextWriterWithBuffer:(_xmlOutputBuffer *)a3
{
  return xmlNewTextWriter(a3);
}

@end